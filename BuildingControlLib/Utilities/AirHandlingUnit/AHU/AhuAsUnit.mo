within BuildingControlLib.Utilities.AirHandlingUnit.AHU;
model AhuAsUnit
  "Air handling unit with heating coil, cooling coil and economizer, control signals as in and Outputs"

  extends AirHandlingUnit.AHU.BaseClasses.partialAHU;
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
    annotation (Placement(transformation(extent={{326,188},{348,210}})));
  Buildings.Fluid.FixedResistances.PressureDrop       fil(
    m_flow_nominal=m_flow_nominal,
    redeclare package Medium = MediumA,
    dp_nominal=200 + 200 + 100,
    from_dp=false,
    linearized=false) "Filter"
    annotation (Placement(transformation(extent={{516,124},{536,144}})));
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
    annotation (Placement(transformation(extent={{554,118},{574,138}})));
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
    annotation (Placement(transformation(extent={{666,138},{646,118}})));
  Buildings.Fluid.FixedResistances.PressureDrop       dpSupDuc(
    m_flow_nominal=m_flow_nominal,
    redeclare package Medium = MediumA,
    dp_nominal=20) "Pressure drop for supply duct"
    annotation (Placement(transformation(extent={{876,124},{896,144}})));
  Buildings.Fluid.FixedResistances.PressureDrop       dpRetDuc(
    m_flow_nominal=m_flow_nominal,
    redeclare package Medium = MediumA,
    dp_nominal=20) "Pressure drop for return duct"
    annotation (Placement(transformation(extent={{1024,284},{1004,304}})));
  Buildings.Fluid.Movers.SpeedControlled_y fanSup(
    redeclare package Medium = MediumA,
    tau=60,
    per(pressure(V_flow={0,m_flow_nominal/1.2*2}, dp={850,0})),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial) "Supply air fan"
    annotation (Placement(transformation(extent={{756,124},{776,144}})));
  Buildings.Fluid.Movers.SpeedControlled_y fanRet(
    redeclare package Medium = MediumA,
    tau=60,
    per(pressure(V_flow=m_flow_nominal/1.2*{0,2}, dp=1.5*110*{2,0})),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial) "Return air fan"
    annotation (Placement(transformation(extent={{766,284},{746,304}})));
  Buildings.Fluid.Sources.FixedBoundary sinHea(
    redeclare package Medium = MediumW,
    p=300000,
    T=318.15,
    nPorts=1) "Sink for heating coil" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={546,54})));
  Buildings.Fluid.Sources.FixedBoundary sinCoo(
    redeclare package Medium = MediumW,
    p=300000,
    T=285.15,
    nPorts=1) "Sink for cooling coil" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={646,54})));
  Modelica.Blocks.Routing.RealPassThrough TOut(y(
      final quantity="ThermodynamicTemperature",
      final unit="K",
      displayUnit="degC",
      min=0))
    annotation (Placement(transformation(extent={{324,144},{344,164}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort TSup(redeclare package Medium =
        MediumA, m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{786,124},{806,144}})));
  Buildings.Fluid.Sensors.RelativePressure dpRetFan(
      redeclare package Medium = MediumA) "Pressure difference over return fan"
                                            annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={776,224})));
  Buildings.Fluid.Sensors.VolumeFlowRate senSupFlo(redeclare package Medium =
        MediumA, m_flow_nominal=m_flow_nominal)
    "Sensor for supply fan flow rate"
    annotation (Placement(transformation(extent={{816,124},{836,144}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort TCoiHeaOut(redeclare package
      Medium = MediumA, m_flow_nominal=m_flow_nominal)
    "Heating coil outlet temperature"
    annotation (Placement(transformation(extent={{604,124},{624,144}})));
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
        origin={686,94})));
  Buildings.Fluid.Sources.FixedBoundary souCoo(
    nPorts=1,
    redeclare package Medium = MediumW,
    p=3E5 + 12000,
    T=279.15) "Source for cooling coil" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={686,54})));
  Buildings.Fluid.Sensors.TemperatureTwoPort TRet(redeclare package Medium =
        MediumA, m_flow_nominal=m_flow_nominal) "Return air temperature sensor"
    annotation (Placement(transformation(extent={{516,284},{496,304}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort TMix(redeclare package Medium =
        MediumA, m_flow_nominal=m_flow_nominal) "Mixed air temperature sensor"
    annotation (Placement(transformation(extent={{486,124},{506,144}})));
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
        origin={586,94})));
  Buildings.Fluid.Sources.FixedBoundary souHea(
    nPorts=1,
    redeclare package Medium = MediumW,
    p(displayUnit="Pa") = 300000 + 12000,
    T=318.15) "Source for heating coil" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={586,54})));
  Buildings.Fluid.Actuators.Dampers.MixingBox eco(
    redeclare package Medium = MediumA,
    mOut_flow_nominal=m_flow_nominal,
    mRec_flow_nominal=m_flow_nominal,
    mExh_flow_nominal=m_flow_nominal,
    dpOut_nominal=10,
    dpRec_nominal=10,
    dpExh_nominal=10) "Economizer"
    annotation (Placement(transformation(extent={{416,240},{470,186}})));
  Buildings.Fluid.Sensors.VolumeFlowRate VOut1(redeclare package Medium =
        MediumA, m_flow_nominal=m_flow_nominal) "Outside air volume flow rate"
    annotation (Placement(transformation(extent={{376,186},{398,208}})));
  Buildings.Fluid.Sensors.VolumeFlowRate senRetFlo(redeclare package Medium =
        MediumA, m_flow_nominal=m_flow_nominal)
    "Sensor for return fan flow rate"
    annotation (Placement(transformation(extent={{836,284},{816,304}})));
  Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(filNam=
        "modelica://Buildings/Resources/weatherdata/USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.mos")
    annotation (Placement(transformation(extent={{224,224},{244,244}})));
  Buildings.BoundaryConditions.WeatherData.Bus weaBus "Weather Data Bus"
    annotation (Placement(transformation(extent={{50,30},{70,50}}),
        iconTransformation(extent={{50,30},{70,50}})));

  Buildings.Fluid.Sources.Boundary_pT bouRet(redeclare package Medium =
        MediumA, nPorts=1) "Boundary condition of return air" annotation (
      Placement(transformation(
        extent={{-21,-20},{21,20}},
        rotation=180,
        origin={1075,294})));
  Buildings.Fluid.Sources.Boundary_pT bouSupOut(redeclare package Medium =
        MediumA, nPorts=1) "Boundary condition of supply air Input"
    annotation (Placement(transformation(
        extent={{-22,-19},{22,19}},
        rotation=180,
        origin={1074,135})));
equation
  connect(fil.port_b, heaCoi.port_a1) annotation (Line(
      points={{536,134},{554,134}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(fanRet.port_a, dpRetFan.port_b) annotation (Line(
      points={{766,294},{776,294},{776,234}},
      color={0,0,0},
      smooth=Smooth.None,
      pattern=LinePattern.Dot));
  connect(fanSup.port_b, dpRetFan.port_a) annotation (Line(
      points={{776,134},{776,214}},
      color={0,0,0},
      smooth=Smooth.None,
      pattern=LinePattern.Dot));
  connect(senSupFlo.port_b, dpSupDuc.port_a) annotation (Line(
      points={{836,134},{876,134}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(valCoo.port_a, souCoo.ports[1]) annotation (Line(
      points={{686,84},{686,64}},
      color={0,127,0},
      smooth=Smooth.None,
      thickness=0.5));
  connect(TSup.port_a, fanSup.port_b) annotation (Line(
      points={{786,134},{776,134}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(TSup.port_b, senSupFlo.port_a) annotation (Line(
      points={{806,134},{816,134}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(fil.port_a, TMix.port_b) annotation (Line(
      points={{516,134},{506,134}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(souHea.ports[1], valHea.port_a) annotation (Line(
      points={{586,64},{586,84}},
      color={0,127,0},
      smooth=Smooth.None,
      thickness=0.5));
  connect(valHea.port_b, heaCoi.port_a2) annotation (Line(
      points={{586,104},{586,122},{574,122}},
      color={0,127,0},
      smooth=Smooth.None,
      thickness=0.5));
  connect(heaCoi.port_b2, sinHea.ports[1]) annotation (Line(
      points={{554,122},{546,122},{546,64}},
      color={0,127,0},
      smooth=Smooth.None,
      thickness=0.5));
  connect(eco.port_Exh, amb.ports[1]) annotation (Line(
      points={{416,229.2},{356,229.2},{356,201.2},{348,201.2}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(amb.ports[2], VOut1.port_a) annotation (Line(
      points={{348,196.8},{362,196.8},{362,197},{376,197}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(VOut1.port_b, eco.port_Out) annotation (Line(
      points={{398,197},{406,197},{406,196.8},{416,196.8}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(eco.port_Sup, TMix.port_a) annotation (Line(
      points={{470,196.8},{480,196.8},{480,134},{486,134}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(heaCoi.port_b1, TCoiHeaOut.port_a) annotation (Line(
      points={{574,134},{604,134}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(senRetFlo.port_b, fanRet.port_a) annotation (Line(
      points={{816,294},{766,294}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(dpRetDuc.port_b, senRetFlo.port_a) annotation (Line(
      points={{1004,294},{836,294}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(TRet.port_b, eco.port_Ret) annotation (Line(
      points={{496,294},{480,294},{480,228},{470,228},{470,229.2}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(TRet.port_a, fanRet.port_b) annotation (Line(
      points={{516,294},{746,294}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(TCoiHeaOut.port_b, cooCoi.port_a2) annotation (Line(
      points={{624,134},{646,134}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(valCoo.port_b, cooCoi.port_a1) annotation (Line(
      points={{686,104},{686,122},{666,122}},
      color={0,127,0},
      smooth=Smooth.None,
      thickness=0.5));
  connect(cooCoi.port_b1, sinCoo.ports[1]) annotation (Line(
      points={{646,122},{644,122},{644,64},{646,64}},
      color={0,127,0},
      smooth=Smooth.None,
      thickness=0.5));
  connect(weaDat.weaBus, weaBus) annotation (Line(
      points={{244,234},{258,234},{258,40},{60,40}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(weaBus.TDryBul, TOut.u) annotation (Line(
      points={{60,40},{272,40},{272,154},{322,154}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(amb.weaBus, weaBus) annotation (Line(
      points={{326,199.22},{60,199.22},{60,40}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(cooCoi.port_b2, fanSup.port_a) annotation (Line(
      points={{666,134},{756,134}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(dpRetDuc.port_a, bouRet.ports[1]) annotation (Line(
      points={{1024,294},{1054,294}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dpSupDuc.port_b, bouSupOut.ports[1]) annotation (Line(
      points={{896,134},{942,134},{942,135},{1052,135}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(nomRetFanCtrl, fanRet.y) annotation (Line(
      points={{70,100},{70,266},{112,266},{112,436},{754,436},{754,306},{756.2,306}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(nomFanSupCtrl, fanSup.y) annotation (Line(
      points={{70,-100},{731,-100},{731,146},{765.8,146}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(valCoo.y, yCooVlv) annotation (Line(
      points={{674,94},{666,94},{666,-100},{218,-100},{218,-100},{368,-100},{368,
          -100},{30,-100},{30,-100}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(valHea.y, yHeaVlv) annotation (Line(
      points={{574,94},{550,94},{550,-100},{548,-100},{548,-100},{-10,-100}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(yMixBoxDmp, eco.y) annotation (Line(
      points={{-50,-100},{442,-100},{442,180.6},{443,180.6}},
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
      StopTime=604800,
      Interval=60,
      Tolerance=1e-006,
      __Dymola_Algorithm="Radau"),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics));
end AhuAsUnit;
