within BuildingControlLib.Utilities.AirHandlingUnit.AHU;
model AirHandlingUnitBuildings
  "Air handling unit with heating coil, cooling coil and economizer. Control from Buildings library."
  replaceable package MediumA =
      Buildings.Media.Air(T_default=293.15);
  package MediumW = Buildings.Media.Water "Medium model for water";

  parameter Modelica.SIunits.Volume VRooCor=2698 "Room volume corridor";
  parameter Modelica.SIunits.Volume VRooSou=568.77 "Room volume south";
  parameter Modelica.SIunits.Volume VRooNor=568.77 "Room volume north";
  parameter Modelica.SIunits.Volume VRooEas=360.08 "Room volume east";
  parameter Modelica.SIunits.Volume VRooWes=360.08 "Room volume west";

  constant Real conv=1.2/3600 "Conversion factor for nominal mass flow rate";
  parameter Modelica.SIunits.MassFlowRate m0_flow_cor=6*VRooCor*conv
    "Design mass flow rate core";
  parameter Modelica.SIunits.MassFlowRate m0_flow_sou=7*VRooSou*conv
    "Design mass flow rate perimeter 1";
  parameter Modelica.SIunits.MassFlowRate m0_flow_eas=10*VRooEas*conv
    "Design mass flow rate perimeter 2";
  parameter Modelica.SIunits.MassFlowRate m0_flow_nor=7*VRooNor*conv
    "Design mass flow rate perimeter 3";
  parameter Modelica.SIunits.MassFlowRate m0_flow_wes=10*VRooWes*conv
    "Design mass flow rate perimeter 4";
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal=m0_flow_cor +
      m0_flow_sou + m0_flow_eas + m0_flow_nor + m0_flow_wes
    "Nominal mass flow rate";
   parameter Modelica.SIunits.Angle lat=41.98*3.14159/180 "Latitude";
  Buildings.Fluid.Sources.Outside amb(redeclare package Medium = MediumA,
      nPorts=2) "Ambient conditions"
    annotation (Placement(transformation(extent={{424,182},{446,204}})));
  Buildings.Fluid.FixedResistances.PressureDrop       fil(
    m_flow_nominal=m_flow_nominal,
    redeclare package Medium = MediumA,
    dp_nominal=200 + 200 + 100,
    from_dp=false,
    linearized=false) "Filter"
    annotation (Placement(transformation(extent={{614,118},{634,138}})));
  Buildings.Fluid.HeatExchangers.DryEffectivenessNTU heaCoi(
    redeclare package Medium1 = MediumA,
    redeclare package Medium2 = MediumW,
    m1_flow_nominal=m_flow_nominal,
    allowFlowReversal2=false,
    m2_flow_nominal=m_flow_nominal*1000*(10 - (-20))/4200/10,
    configuration=Buildings.Fluid.Types.HeatExchangerConfiguration.CounterFlow,
    Q_flow_nominal=m_flow_nominal*1006*(16.7 - 8.5),
    dp1_nominal=0,
    dp2_nominal=0,
    T_a1_nominal=281.65,
    T_a2_nominal=323.15) "Heating coil"
    annotation (Placement(transformation(extent={{652,112},{672,132}})));
  Buildings.Fluid.HeatExchangers.WetCoilCounterFlow cooCoi(
    UA_nominal=m_flow_nominal*1000*15/
        Buildings.Fluid.HeatExchangers.BaseClasses.lmtd(
        T_a1=26.2,
        T_b1=12.8,
        T_a2=6,
        T_b2=16),
    redeclare package Medium1 = MediumW,
    redeclare package Medium2 = MediumA,
    m1_flow_nominal=m_flow_nominal*1000*15/4200/10,
    m2_flow_nominal=m_flow_nominal,
    dp2_nominal=0,
    dp1_nominal=0,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial) "Cooling coil"
    annotation (Placement(transformation(extent={{764,132},{744,112}})));
  Buildings.Fluid.FixedResistances.PressureDrop       dpSupDuc(
    m_flow_nominal=m_flow_nominal,
    redeclare package Medium = MediumA,
    dp_nominal=20) "Pressure drop for supply duct"
    annotation (Placement(transformation(extent={{974,118},{994,138}})));
  Buildings.Fluid.FixedResistances.PressureDrop       dpRetDuc(
    m_flow_nominal=m_flow_nominal,
    redeclare package Medium = MediumA,
    dp_nominal=20) "Pressure drop for return duct"
    annotation (Placement(transformation(extent={{994,278},{974,298}})));
  Buildings.Fluid.Movers.SpeedControlled_y fanSup(
    redeclare package Medium = MediumA,
    tau=60,
    per(pressure(V_flow={0,m_flow_nominal/1.2*2}, dp={850,0})),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial) "Supply air fan"
    annotation (Placement(transformation(extent={{854,118},{874,138}})));
  Buildings.Fluid.Movers.SpeedControlled_y fanRet(
    redeclare package Medium = MediumA,
    tau=60,
    per(pressure(V_flow=m_flow_nominal/1.2*{0,2}, dp=1.5*110*{2,0})),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial) "Return air fan"
    annotation (Placement(transformation(extent={{864,278},{844,298}})));
  Buildings.Fluid.Sources.FixedBoundary sinHea(
    redeclare package Medium = MediumW,
    p=300000,
    T=318.15,
    nPorts=1) "Sink for heating coil" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={644,48})));
  Buildings.Fluid.Sources.FixedBoundary sinCoo(
    redeclare package Medium = MediumW,
    p=300000,
    T=285.15,
    nPorts=1) "Sink for cooling coil" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={744,48})));
  Modelica.Blocks.Routing.RealPassThrough TOut(y(
      final quantity="ThermodynamicTemperature",
      final unit="K",
      displayUnit="degC",
      min=0))
    annotation (Placement(transformation(extent={{254,306},{274,326}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort TSup(redeclare package Medium =
        MediumA, m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{884,118},{904,138}})));
  Modelica.Blocks.Sources.Constant TSupSetHea(y(
      final quantity="ThermodynamicTemperature",
      final unit="K",
      displayUnit="degC",
      min=0), k=273.15 + 10) "Supply air temperature setpoint for heating"
    annotation (Placement(transformation(extent={{454,-2},{474,18}})));
  Buildings.Controls.Continuous.LimPID heaCoiCon(
    yMax=1,
    yMin=0,
    Td=60,
    initType=Modelica.Blocks.Types.InitPID.InitialState,
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    Ti=600,
    k=0.01) "Controller for heating coil"
    annotation (Placement(transformation(extent={{554,-2},{574,18}})));
  Buildings.Controls.Continuous.LimPID cooCoiCon(
    reverseAction=true,
    Td=60,
    initType=Modelica.Blocks.Types.InitPID.InitialState,
    yMax=1,
    yMin=0,
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    Ti=600,
    k=0.01) "Controller for cooling coil"
    annotation (Placement(transformation(extent={{554,-42},{574,-22}})));
  Buildings.Fluid.Sensors.RelativePressure dpRetFan(
      redeclare package Medium = MediumA) "Pressure difference over return fan"
                                            annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={874,218})));
  Buildings.Examples.VAVReheat.Controls.FanVFD conFanSup(xSet_nominal(
        displayUnit="Pa") = 410, r_N_min=0.2) "Controller for fan"
    annotation (Placement(transformation(extent={{794,168},{814,188}})));
  Buildings.Fluid.Sensors.VolumeFlowRate senSupFlo(redeclare package Medium =
        MediumA, m_flow_nominal=m_flow_nominal)
    "Sensor for supply fan flow rate"
    annotation (Placement(transformation(extent={{914,118},{934,138}})));
  Buildings.Controls.SetPoints.OccupancySchedule occSch(occupancy=3600*{6,19})
    "Occupancy schedule"
    annotation (Placement(transformation(extent={{236,-52},{256,-32}})));
  Buildings.Examples.VAVReheat.Controls.ModeSelector modeSelector
    annotation (Placement(transformation(extent={{442,-56},{462,-36}})));
  Buildings.Examples.VAVReheat.Controls.ControlBus controlBus
    annotation (Placement(transformation(extent={{304,-102},{324,-82}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort TCoiHeaOut(redeclare package
      Medium = MediumA, m_flow_nominal=m_flow_nominal)
    "Heating coil outlet temperature"
    annotation (Placement(transformation(extent={{688,118},{708,138}})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear valCoo(
    redeclare package Medium = MediumW,
    CvData=Buildings.Fluid.Types.CvTypes.OpPoint,
    m_flow_nominal=m_flow_nominal*1000*15/4200/10,
    dpValve_nominal=6000,
    from_dp=true,
    dpFixed_nominal=6000) "Cooling coil valve"
                                       annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={784,88})));
  Buildings.Fluid.Sources.FixedBoundary souCoo(
    nPorts=1,
    redeclare package Medium = MediumW,
    p=3E5 + 12000,
    T=279.15) "Source for cooling coil" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={784,48})));
  Buildings.Examples.VAVReheat.Controls.Economizer conEco(
    dT=1,
    VOut_flow_min=0.3*m_flow_nominal/1.2,
    Ti=600,
    k=0.1) "Controller for economizer"
    annotation (Placement(transformation(extent={{474,308},{494,328}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort TRet(redeclare package Medium =
        MediumA, m_flow_nominal=m_flow_nominal) "Return air temperature sensor"
    annotation (Placement(transformation(extent={{654,278},{634,298}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort TMix(redeclare package Medium =
        MediumA, m_flow_nominal=m_flow_nominal) "Mixed air temperature sensor"
    annotation (Placement(transformation(extent={{584,118},{604,138}})));
  Buildings.Examples.VAVReheat.Controls.RoomTemperatureSetpoint TSetRoo
    annotation (Placement(transformation(extent={{254,-108},{274,-88}})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear valHea(
    redeclare package Medium = MediumW,
    CvData=Buildings.Fluid.Types.CvTypes.OpPoint,
    dpValve_nominal=6000,
    m_flow_nominal=m_flow_nominal*1000*40/4200/10,
    from_dp=true,
    dpFixed_nominal=6000) "Heating coil valve"
                                       annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={684,88})));
  Buildings.Fluid.Sources.FixedBoundary souHea(
    nPorts=1,
    redeclare package Medium = MediumW,
    p(displayUnit="Pa") = 300000 + 12000,
    T=318.15) "Source for heating coil" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={684,48})));
  Buildings.Fluid.Actuators.Dampers.MixingBox eco(
    redeclare package Medium = MediumA,
    mOut_flow_nominal=m_flow_nominal,
    mRec_flow_nominal=m_flow_nominal,
    mExh_flow_nominal=m_flow_nominal,
    dpOut_nominal=10,
    dpRec_nominal=10,
    dpExh_nominal=10) "Economizer"
    annotation (Placement(transformation(extent={{514,234},{568,180}})));
  Buildings.Fluid.Sensors.VolumeFlowRate VOut1(redeclare package Medium =
        MediumA, m_flow_nominal=m_flow_nominal) "Outside air volume flow rate"
    annotation (Placement(transformation(extent={{474,180},{496,202}})));
  Buildings.Examples.VAVReheat.Controls.DuctStaticPressureSetpoint pSetDuc(
    nin=5,
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    pMin=50) "Duct static pressure setpoint"
    annotation (Placement(transformation(extent={{714,168},{734,188}})));
  Buildings.Examples.VAVReheat.Controls.FanVFD conFanRet(xSet_nominal(
        displayUnit="m3/s") = m_flow_nominal/1.2, r_N_min=0.2)
    "Controller for fan"
    annotation (Placement(transformation(extent={{794,308},{814,328}})));
  Buildings.Fluid.Sensors.VolumeFlowRate senRetFlo(redeclare package Medium =
        MediumA, m_flow_nominal=m_flow_nominal)
    "Sensor for return fan flow rate"
    annotation (Placement(transformation(extent={{934,278},{914,298}})));
  Buildings.Examples.VAVReheat.Controls.CoolingCoilTemperatureSetpoint TSetCoo
    "Setpoint for cooling coil"
    annotation (Placement(transformation(extent={{504,-42},{524,-22}})));
  Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(filNam=
        "modelica://Buildings/Resources/weatherdata/USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.mos")
    annotation (Placement(transformation(extent={{164,338},{184,358}})));
  Buildings.BoundaryConditions.WeatherData.Bus weaBus "Weather Data Bus"
    annotation (Placement(transformation(extent={{194,338},{214,358}})));

  Buildings.Fluid.Sources.Boundary_pT bouRet(redeclare package Medium =
        MediumA, nPorts=1) "Boundary condition of return air" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={1094,288})));
  Buildings.Fluid.Sources.Boundary_pT bouSupOut(redeclare package Medium =
        MediumA, nPorts=1) "Boundary condition of supply air Input"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={1096,128})));
  Modelica.Blocks.Sources.Constant const(k=5)
    annotation (Placement(transformation(extent={{642,178},{662,198}})));
equation
  connect(fil.port_b, heaCoi.port_a1) annotation (Line(
      points={{634,128},{652,128}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(TSupSetHea.y, heaCoiCon.u_s) annotation (Line(
      points={{475,8},{552,8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(fanRet.port_a, dpRetFan.port_b) annotation (Line(
      points={{864,288},{874,288},{874,228}},
      color={0,0,0},
      smooth=Smooth.None,
      pattern=LinePattern.Dot));
  connect(fanSup.port_b, dpRetFan.port_a) annotation (Line(
      points={{874,128},{874,208}},
      color={0,0,0},
      smooth=Smooth.None,
      pattern=LinePattern.Dot));
  connect(senSupFlo.port_b, dpSupDuc.port_a) annotation (Line(
      points={{934,128},{974,128}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(controlBus, modeSelector.cb) annotation (Line(
      points={{314,-92},{482,-92},{482,-39.1818},{445.182,-39.1818}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(occSch.tNexOcc, controlBus.dTNexOcc) annotation (Line(
      points={{257,-36},{314,-36},{314,-92}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(TOut.y, controlBus.TOut) annotation (Line(
      points={{275,316},{314,316},{314,-92}},
      color={255,213,170},
      smooth=Smooth.None,
      thickness=0.5),      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(occSch.occupied, controlBus.occupied) annotation (Line(
      points={{257,-48},{314,-48},{314,-92}},
      color={255,0,255},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(controlBus, conFanSup.controlBus) annotation (Line(
      points={{314,-92},{834,-92},{834,196},{797,196},{797,186}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(valCoo.port_a, souCoo.ports[1]) annotation (Line(
      points={{784,78},{784,58}},
      color={0,127,0},
      smooth=Smooth.None,
      thickness=0.5));
  connect(TRet.T, conEco.TRet) annotation (Line(
      points={{644,299},{644,340},{462,340},{462,325.333},{472.667,325.333}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(TMix.T, conEco.TMix) annotation (Line(
      points={{594,139},{594,336},{464,336},{464,321.333},{472.667,321.333}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(conEco.TSupHeaSet, TSupSetHea.y) annotation (Line(
      points={{472.667,313.333},{410,313.333},{410,48},{494,48},{494,8},{475,8}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(controlBus, conEco.controlBus) annotation (Line(
      points={{314,-92},{314,288},{478,288},{478,318.667}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(TSetRoo.controlBus, controlBus) annotation (Line(
      points={{266,-92},{314,-92}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(TSup.port_a, fanSup.port_b) annotation (Line(
      points={{884,128},{874,128}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(TSup.port_b, senSupFlo.port_a) annotation (Line(
      points={{904,128},{914,128}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(fil.port_a, TMix.port_b) annotation (Line(
      points={{614,128},{604,128}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(conFanSup.y, fanSup.y) annotation (Line(
      points={{815,178},{863.8,178},{863.8,140}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(TCoiHeaOut.T, heaCoiCon.u_m) annotation (Line(
      points={{698,139},{698,148},{714,148},{714,-12},{564,-12},{564,-4}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(souHea.ports[1], valHea.port_a) annotation (Line(
      points={{684,58},{684,78}},
      color={0,127,0},
      smooth=Smooth.None,
      thickness=0.5));
  connect(heaCoiCon.y, valHea.y) annotation (Line(
      points={{575,8},{662,8},{662,88},{672,88}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(valHea.port_b, heaCoi.port_a2) annotation (Line(
      points={{684,98},{684,116},{672,116}},
      color={0,127,0},
      smooth=Smooth.None,
      thickness=0.5));
  connect(heaCoi.port_b2, sinHea.ports[1]) annotation (Line(
      points={{652,116},{644,116},{644,58}},
      color={0,127,0},
      smooth=Smooth.None,
      thickness=0.5));
  connect(cooCoiCon.y, valCoo.y) annotation (Line(
      points={{575,-32},{764,-32},{764,88},{772,88}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(eco.port_Exh, amb.ports[1]) annotation (Line(
      points={{514,223.2},{454,223.2},{454,195.2},{446,195.2}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(amb.ports[2], VOut1.port_a) annotation (Line(
      points={{446,190.8},{460,190.8},{460,191},{474,191}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(VOut1.port_b, eco.port_Out) annotation (Line(
      points={{496,191},{504,191},{504,190.8},{514,190.8}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(dpRetFan.p_rel, conFanSup.u_m) annotation (Line(
      points={{865,218},{844,218},{844,158},{804,158},{804,166}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(eco.port_Sup, TMix.port_a) annotation (Line(
      points={{568,190.8},{578,190.8},{578,128},{584,128}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(pSetDuc.y, conFanSup.u) annotation (Line(
      points={{735,178},{792,178}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(heaCoi.port_b1, TCoiHeaOut.port_a) annotation (Line(
      points={{672,128},{688,128}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(controlBus, conFanRet.controlBus) annotation (Line(
      points={{314,-92},{834,-92},{834,336},{797,336},{797,326}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(senSupFlo.V_flow, conFanRet.u) annotation (Line(
      points={{924,139},{924,258},{754,258},{754,318},{792,318}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(senRetFlo.port_b, fanRet.port_a) annotation (Line(
      points={{914,288},{864,288}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(senRetFlo.V_flow, conFanRet.u_m) annotation (Line(
      points={{924,299},{924,302},{804,302},{804,306}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(conFanRet.y, fanRet.y) annotation (Line(
      points={{815,318},{854.2,318},{854.2,300}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(dpRetDuc.port_b, senRetFlo.port_a) annotation (Line(
      points={{974,288},{934,288}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(TRet.port_b, eco.port_Ret) annotation (Line(
      points={{634,288},{578,288},{578,222},{568,222},{568,223.2}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(TRet.port_a, fanRet.port_b) annotation (Line(
      points={{654,288},{844,288}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(TCoiHeaOut.port_b, cooCoi.port_a2) annotation (Line(
      points={{708,128},{744,128}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(valCoo.port_b, cooCoi.port_a1) annotation (Line(
      points={{784,98},{784,116},{764,116}},
      color={0,127,0},
      smooth=Smooth.None,
      thickness=0.5));
  connect(cooCoi.port_b1, sinCoo.ports[1]) annotation (Line(
      points={{744,116},{742,116},{742,58},{744,58}},
      color={0,127,0},
      smooth=Smooth.None,
      thickness=0.5));
  connect(TSetCoo.TSet, cooCoiCon.u_s) annotation (Line(
      points={{525,-32},{552,-32}},
      color={0,0,0},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(TSetCoo.TSet, conEco.TSupCooSet) annotation (Line(
      points={{525,-32},{534,-32},{534,54},{418,54},{418,309.333},{472.667,
          309.333}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(TSupSetHea.y, TSetCoo.TSetHea) annotation (Line(
      points={{475,8},{494,8},{494,-32},{502,-32}},
      color={0,0,0},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(modeSelector.cb, TSetCoo.controlBus) annotation (Line(
      points={{445.182,-39.1818},{482,-39.1818},{482,-40},{512.2,-40}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(conEco.VOut_flow, VOut1.V_flow) annotation (Line(
      points={{472.667,317.333},{464,317.333},{464,248},{485,248},{485,203.1}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(weaDat.weaBus, weaBus) annotation (Line(
      points={{184,348},{204,348}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(weaBus.TDryBul, TOut.u) annotation (Line(
      points={{204,348},{228,348},{228,316},{252,316}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(amb.weaBus, weaBus) annotation (Line(
      points={{424,193.22},{204,193.22},{204,348}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(weaBus.TDryBul, pSetDuc.TOut) annotation (Line(
      points={{204,348},{704,348},{704,186},{712,186}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(TSup.T, cooCoiCon.u_m) annotation (Line(
      points={{894,139},{894,148},{910,148},{910,-52},{564,-52},{564,-44}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(cooCoi.port_b2, fanSup.port_a) annotation (Line(
      points={{764,128},{854,128}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(conEco.yOA, eco.y) annotation (Line(
      points={{494.667,320},{504,320},{504,148},{541,148},{541,174.6}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(dpRetDuc.port_a, bouRet.ports[1]) annotation (Line(
      points={{994,288},{1084,288}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dpSupDuc.port_b, bouSupOut.ports[1]) annotation (Line(
      points={{994,128},{1086,128}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const.y, pSetDuc.u[1]) annotation (Line(
      points={{663,188},{688,188},{688,176.4},{712,176.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, pSetDuc.u[2]) annotation (Line(
      points={{663,188},{688,188},{688,177.2},{712,177.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, pSetDuc.u[3]) annotation (Line(
      points={{663,188},{688,188},{688,178},{712,178}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, pSetDuc.u[4]) annotation (Line(
      points={{663,188},{686,188},{686,178.8},{712,178.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, pSetDuc.u[5]) annotation (Line(
      points={{663,188},{688,188},{688,179.6},{712,179.6}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-400,-400},{1400,
            600}}),      graphics),
    Documentation(info="<html>
<p>
This model consist of an HVAC system, a building envelope model and a model
for air flow through building leakage and through open doors based
on wind pressure and flow imbalance of the HVAC system.
</p>
<p>
The HVAC system is a variable air volume (VAV) flow system with economizer
and a heating and cooling coil in the air handler unit. There is also a
reheat coil and an air damper in each of the five zone inlet branches.
The figure below shows the schematic diagram of the HVAC system
</p>
<p align=\"center\">
<img alt=\"image\" src=\"modelica://Buildings/Resources/Images/Examples/VAVReheat/vavSchematics.png\" border=\"1\"/>
</p>
<p>
The control is an implementation of the control sequence
<i>VAV 2A2-21232</i> of the Sequences of Operation for
Common HVAC Systems (ASHRAE, 2006). In this control sequence, the
supply fan speed is regulated based on the duct static pressure.
The return fan controller tracks the supply fan air flow rate
reduced by a fixed offset. The duct static pressure is adjusted
so that at least one VAV damper is 90% open. The economizer dampers
are modulated to track the setpoint for the mixed air dry bulb temperature.
Priority is given to maintain a minimum outside air volume flow rate.
In each zone, the VAV damper is adjusted to meet the room temperature
setpoint for cooling, or fully opened during heating.
The room temperature setpoint for heating is tracked by varying
the water flow rate through the reheat coil. There is also a
finite state machine that transitions the mode of operation of
the HVAC system between the modes
<i>occupied</i>, <i>unoccupied off</i>, <i>unoccupied night set back</i>,
<i>unoccupied warm-up</i> and <i>unoccupied pre-cool</i>.
In the VAV model, all air flows are computed based on the
duct static pressure distribution and the performance curves of the fans.
Local loop control is implemented using proportional and proportional-integral
controllers, while the supervisory control is implemented
using a finite state machine.
</p>
<p>
To model the heat transfer through the building envelope,
a model of five interconnected rooms is used.
The five room model is representative of one floor of the
new construction medium office building for Chicago, IL,
as described in the set of DOE Commercial Building Benchmarks
(Deru et al, 2009). There are four perimeter zones and one core zone.
The envelope thermal properties meet ASHRAE Standard 90.1-2004.
The thermal room model computes transient heat conduction through
walls, floors and ceilings and long-wave radiative heat exchange between
surfaces. The convective heat transfer coefficient is computed based
on the temperature difference between the surface and the room air.
There is also a layer-by-layer short-wave radiation,
long-wave radiation, convection and conduction heat transfer model for the
windows. The model is similar to the
Window 5 model and described in TARCOG 2006.
</p>
<p>
Each thermal zone can have air flow from the HVAC system, through leakages of the building envelope (except for the core zone) and through bi-directional air exchange through open doors that connect adjacent zones. The bi-directional air exchange is modeled based on the differences in static pressure between adjacent rooms at a reference height plus the difference in static pressure across the door height as a function of the difference in air density.
There is also wind pressure acting on each facade. The wind pressure is a function
of the wind speed and wind direction. Therefore, infiltration is a function of the
flow imbalance of the HVAC system and of the wind conditions.
</p>
<h4>References</h4>
<p>
ASHRAE.
<i>Sequences of Operation for Common HVAC Systems</i>.
ASHRAE, Atlanta, GA, 2006.
</p>
<p>
Deru M., K. Field, D. Studer, K. Benne, B. Griffith, P. Torcellini,
 M. Halverson, D. Winiarski, B. Liu, M. Rosenberg, J. Huang, M. Yazdanian, and D. Crawley.
<i>DOE commercial building research benchmarks for commercial buildings</i>.
Technical report, U.S. Department of Energy, Energy Efficiency and
Renewable Energy, Office of Building Technologies, Washington, DC, 2009.
</p>
<p>
TARCOG 2006: Carli, Inc., TARCOG: Mathematical models for calculation
of thermal performance of glazing systems with our without
shading devices, Technical Report, Oct. 17, 2006.
</p>
</html>", revisions="<html>
<ul>
<li>
May 19, 2016, by Michael Wetter:<br/>
Changed chilled water supply temperature to <i>6&circ;C</i>.
This is
for <a href=\"https://github.com/iea-annex60/modelica-annex60/issues/509\">#509</a>.
</li>
<li>
April 26, 2016, by Michael Wetter:<br/>
Changed controller for freeze protection as the old implementation closed
the outdoor air damper during summer.
This is
for <a href=\"https://github.com/iea-annex60/modelica-annex60/issues/511\">#511</a>.
</li>
<li>
January 22, 2016, by Michael Wetter:<br/>
Corrected type declaration of pressure difference.
This is
for <a href=\"https://github.com/iea-annex60/modelica-annex60/issues/404\">#404</a>.
</li>
<li>
September 24, 2015 by Michael Wetter:<br/>
Set default temperature for medium to avoid conflicting
start values for alias variables of the temperature
of the building and the ambient air.
This is for
<a href=\"https://github.com/lbl-srg/modelica-buildings/issues/426\">issue 426</a>.
</li>
</ul>
</html>"),
__Dymola_Commands(file="modelica://Buildings/Resources/Scripts/Dymola/Examples/VAVReheat/ClosedLoop.mos"
        "Simulate and plot"),
    experiment(
      StopTime=172800,
      Interval=60,
      Tolerance=1e-006,
      __Dymola_Algorithm="Radau"),
    __Dymola_experimentSetupOutput);
end AirHandlingUnitBuildings;
