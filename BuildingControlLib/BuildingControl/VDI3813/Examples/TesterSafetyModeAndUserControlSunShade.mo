within BuildingControlLib.BuildingControl.VDI3813.Examples;
model TesterSafetyModeAndUserControlSunShade
  "Example to test functionality considering input from window opening and user control"
  extends Modelica.Icons.Example;

  BuildingControl.VDI3813.SensorFunctions.PresenceDetection presenceDetection
    annotation (Placement(transformation(extent={{-160,234},{-140,254}})));
  BuildingControl.VDI3813.SensorFunctions.AirTemperatureMeasurementFunctions.AirTemperatureMeasurementRoom
    airTemperatureMeasurementRoom
    annotation (Placement(transformation(extent={{-160,260},{-140,280}})));
  BuildingControl.VDI3813.SensorFunctions.BrightnessMeasurementFunctions.BrightnessMeasurementOutdoor
    brightnessMeasurementOutdoor
    annotation (Placement(transformation(extent={{-160,206},{-140,226}})));
  BuildingControl.VDI3813.SensorFunctions.WindowMonitoring windowMonitoring
    annotation (Placement(transformation(extent={{-160,178},{-140,198}})));
  BuildingControl.VDI3813.SensorFunctions.AirTemperatureMeasurementFunctions.AirTemperatureMeasurementOutdoor
    airTemperatureMeasurementOutdoor
    annotation (Placement(transformation(extent={{-160,150},{-140,170}})));
  BuildingControl.VDI3813.SensorFunctions.DewpointMonitoring dewpointMonitoring
    annotation (Placement(transformation(extent={{-160,120},{-140,140}})));
  BuildingControl.VDI3813.Sources.Analog.PrescribedH prescribedH
    annotation (Placement(transformation(extent={{-200,214},{-180,234}})));
  BuildingControl.VDI3813.Sources.Analog.PrescribedT prescribedT
    annotation (Placement(transformation(extent={{-200,264},{-180,284}})));
  BuildingControl.VDI3813.Sources.Analog.PrescribedT prescribedT1
    annotation (Placement(transformation(extent={{-200,154},{-180,174}})));
  BuildingControl.VDI3813.Sources.Physical.PrescribedB prescribedB
    annotation (Placement(transformation(extent={{-200,124},{-180,144}})));
  BuildingControl.VDI3813.Sources.Physical.PrescribedP prescribedP
    annotation (Placement(transformation(extent={{-200,238},{-180,258}})));
  BuildingControl.VDI3813.Sources.Physical.PrescribedB prescribedB1
    annotation (Placement(transformation(extent={{-200,184},{-180,204}})));
  Modelica.Blocks.Sources.Constant sourceBrightnessMeasurementOutdoor(k=100000)
    annotation (Placement(transformation(extent={{-228,214},{-208,234}})));
  Modelica.Blocks.Sources.Constant sourceAirTempOut(k=273.15 + 10)
    annotation (Placement(transformation(extent={{-226,154},{-206,174}})));
  Modelica.Blocks.Sources.BooleanStep     sourceP(startValue=false)
    "Source to define detection of a person in a room"
    annotation (Placement(transformation(extent={{-250,238},{-230,258}})));
  Modelica.Blocks.Sources.BooleanStep     sourceWindow(startValue=true)
    "Boundary condition for window detector, if false then window is open"
    annotation (Placement(transformation(extent={{-246,184},{-226,204}})));
  Modelica.Blocks.Sources.BooleanStep     sourceDewpoint(startValue=true)
    annotation (Placement(transformation(extent={{-244,124},{-224,144}})));
  BuildingControl.VDI3813.ApplicationFunctions.Basic.OccupancyEvaluation
    occupancyEvaluation
    annotation (Placement(transformation(extent={{-100,254},{-60,294}})));
  BuildingControl.VDI3813.ApplicationFunctions.RoomClimate.SetpointCalculation
    setpointCalculation
    annotation (Placement(transformation(extent={{-100,100},{-60,140}})));
  BuildingControl.VDI3813.OperatorAndDisplayFunctions.AdjustTemperatureSetpoint
    adjustTemperatureSetpoint
    annotation (Placement(transformation(extent={{-160,64},{-140,84}})));
  BuildingControl.VDI3813.OperatorAndDisplayFunctions.ActuateSunshade
    actuateSunshade
    annotation (Placement(transformation(extent={{-160,92},{-140,112}})));
  BuildingControl.VDI3813.Sources.AirTemperature.PrescribedCMD_T
    prescribedCMD_T
    annotation (Placement(transformation(extent={{-200,76},{-180,96}})));
  BuildingControl.VDI3813.Sources.Sunshade.PrescribedCMD_S prescribedCMD_S
    annotation (Placement(transformation(extent={{-200,100},{-180,120}})));
  Modelica.Blocks.Sources.Constant sourceUserSetpoint(k=0)
    annotation (Placement(transformation(extent={{-226,76},{-206,96}})));
  BuildingControl.VDI3813.Sources.AirTemperature.PrescribedT_BMS
    prescribedT_BMS
    annotation (Placement(transformation(extent={{-160,40},{-140,60}})));
  Modelica.Blocks.Sources.Constant sourceT_BMS(k=0)
    "Boundary condition to set T_BMS i.e. relative change of temperature setpoint from BMS system in Kelvin"
    annotation (Placement(transformation(extent={{-198,42},{-178,62}})));
  BuildingControl.VDI3813.Sources.Presence.PrescribedP_MAN prescribedP_MAN
    annotation (Placement(transformation(extent={{-160,294},{-140,314}})));
  Modelica.Blocks.Sources.BooleanConstant sourceP_MAN(k=true)
    annotation (Placement(transformation(extent={{-252,300},{-232,320}})));
  BuildingControl.VDI3813.Sources.AirTemperature.PrescribedT_STA
    prescribedT_STA
    annotation (Placement(transformation(extent={{-234,40},{-214,60}})));
  BuildingControl.VDI3813.ApplicationFunctions.RoomClimate.EnergyModeSelection
    energyModeSelection
    annotation (Placement(transformation(extent={{-20,40},{20,80}})));
  BuildingControl.VDI3813.ApplicationFunctions.Basic.TimeProgram.TimeProgramEnergyMode
    timeProgramEnergyMode
    annotation (Placement(transformation(extent={{-100,-20},{-60,20}})));
  BuildingControl.VDI3813.ApplicationFunctions.RoomClimate.FunctionSelection
    functionSelection
    annotation (Placement(transformation(extent={{-100,40},{-60,80}})));
  Sources.ControlFunction.PrescribedF_BMS_AirTemperature prescribedF_BMS
    annotation (Placement(transformation(extent={{-160,10},{-140,30}})));
          parameter Integer nF_BMS = 11
    "Number of changes in control function type";
    Modelica.Blocks.Sources.IntegerStep SourceF_BMS[nF_BMS](
    startTime={10,20,30,40,50,60,80,90,100,110,120},
    height={0,0,0,0,0,0,0,0,0,0,0},
    offset={3,0,0,0,0,0,0,0,0,0,0})                  annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-224,20})));
  Modelica.Blocks.MathInteger.Sum sumF_BMS(nu=nF_BMS) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-186,20})));

  BuildingControl.VDI3813.Sources.Time.PrescribedD_ACT prescribedD_ACT
    annotation (Placement(transformation(extent={{-160,-20},{-140,0}})));
  Modelica.Blocks.Sources.Constant sourceD_ACT(k=200)
    annotation (Placement(transformation(extent={{-196,-20},{-176,0}})));
  BuildingControl.VDI3813.ApplicationFunctions.Sunshading.AutomaticThermalControl
    automaticThermalControl
    annotation (Placement(transformation(extent={{-20,180},{20,220}})));
  BuildingControl.VDI3813.ApplicationFunctions.Sunshading.PriorityControl
    priorityControl
    annotation (Placement(transformation(extent={{-100,180},{-60,220}})));
  BuildingControl.VDI3813.Sources.Sunshade.PrescribedS_PROT prescribedS_PROT
    annotation (Placement(transformation(extent={{-160,346},{-140,366}})));
  BuildingControl.VDI3813.Sources.Sunshade.PrescribedS_MAINT prescribedS_MAINT
    annotation (Placement(transformation(extent={{-160,320},{-140,340}})));
  BuildingControl.VDI3813.Sources.Sunshade.PrescribedS_AUTO prescribedS_AUTO
    annotation (Placement(transformation(extent={{-160,370},{-140,390}})));
  Modelica.Blocks.Sources.Constant sourceS_XXXPos(k=-1)
    "Set to inactive the following inputs: S_AUTO, S_PROT, S_MAINT"
    annotation (Placement(transformation(extent={{-220,360},{-200,380}})));
  Modelica.Blocks.Sources.Constant sourceS_XXXAngle(k=0)
    "Source for angle of not considered sunshade angle S_AUTO, S_PROT, S_MAINT"
    annotation (Placement(transformation(extent={{-220,328},{-200,348}})));
  BuildingControl.VDI3813.ActuatorFunctions.SunshadeActuator sunshadeActuator
    annotation (Placement(transformation(extent={{-20,241},{18,280}})));
  ApplicationFunctions.RoomClimate.TemperatureControl temperatureControlValve
    annotation (Placement(transformation(extent={{-20,120},{20,160}})));
  ActuatorFunctions.ControlDriveActuator.ControlDriveActuatorValvePosition
                                                      controlDriveActuator
    annotation (Placement(transformation(extent={{60,120},{100,160}})));
  Modelica.Blocks.Sources.Constant sourceT_ROOM(k=273.15 + 15)
    "Boundary condition defining the room air temperature"
    annotation (Placement(transformation(extent={{-230,264},{-210,284}})));
  Modelica.Blocks.Sources.BooleanStep sourceCMD(startTime=10, startValue=true)
    "Command to deploy or not deploy the sunshade, if true then sunshade up"
    annotation (Placement(transformation(extent={{-252,96},{-232,116}})));

  Sources.ActuatorSignal.PrescribedV_STA_FS prescribedV_STA_VP annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-150,-50})));
  Modelica.Blocks.Sources.Constant SourceV_STA_VP(k=0) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-190,-50})));
equation
    for j in 1:nF_BMS loop
    connect(SourceF_BMS[j].y, sumF_BMS.u[j]) annotation (Line(
        points={{-213,20},{-192,20}},
        color={255,127,0},
        smooth=Smooth.None));
  end for;

  connect(brightnessMeasurementOutdoor.H, prescribedH.H) annotation (Line(
      points={{-150,226},{-150,230},{-178.1,230},{-178.1,224}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(prescribedT.T, airTemperatureMeasurementRoom.T) annotation (Line(
      points={{-178.1,274},{-178,274},{-178,284},{-152,284},{-152,282},{-150,
          282},{-150,280}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(prescribedT1.T, airTemperatureMeasurementOutdoor.T) annotation (Line(
      points={{-178.1,164},{-178,164},{-178,174},{-146,174},{-146,170},{-150,
          170}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(prescribedB.B, dewpointMonitoring.B) annotation (Line(
      points={{-179.9,134},{-176,134},{-176,144},{-146,144},{-146,140},{-150,
          140}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(prescribedP.P, presenceDetection.P) annotation (Line(
      points={{-179.9,248},{-178,248},{-178,258},{-146,258},{-146,254},{-150,
          254}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(prescribedB1.B, windowMonitoring.B) annotation (Line(
      points={{-179.9,194},{-178,194},{-178,204},{-146,204},{-146,198},{-150,
          198}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(sourceAirTempOut.y, prescribedT1.u) annotation (Line(
      points={{-205,164},{-198,164}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceBrightnessMeasurementOutdoor.y, prescribedH.u) annotation (Line(
      points={{-207,224},{-198,224}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceP.y, prescribedP.u) annotation (Line(
      points={{-229,248},{-214,248},{-214,250},{-198,250}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(sourceWindow.y, prescribedB1.u) annotation (Line(
      points={{-225,194},{-212,194},{-212,196},{-198,196}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(sourceDewpoint.y, prescribedB.u) annotation (Line(
      points={{-223,134},{-210,134},{-210,136},{-198,136}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(presenceDetection.P_AUTO, occupancyEvaluation.P_AUTO) annotation (
      Line(
      points={{-137,244},{-116,244},{-116,282},{-106,282},{-106,282.2},{-95.8,282.2}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedCMD_T.CMD_T, adjustTemperatureSetpoint.CMD) annotation (
      Line(
      points={{-178.1,86},{-146,86},{-146,84.1},{-150,84.1}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(prescribedCMD_S.CMD, actuateSunshade.CMD) annotation (Line(
      points={{-184.1,106},{-172,106},{-172,114},{-150,114},{-150,112}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(sourceUserSetpoint.y, prescribedCMD_T.u) annotation (Line(
      points={{-205,86},{-198,86}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(airTemperatureMeasurementOutdoor.T_OUT, setpointCalculation.T_OUT)
    annotation (Line(
      points={{-137,160},{-116,160},{-116,104.2},{-94.8,104.2}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(setpointCalculation.T_BMS, prescribedT_BMS.T_BMS) annotation (Line(
      points={{-94.8,128},{-116,128},{-116,50},{-138.1,50}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(sourceT_BMS.y, prescribedT_BMS.u) annotation (Line(
      points={{-177,52},{-168,52},{-168,50},{-158,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(adjustTemperatureSetpoint.T_SETPT, setpointCalculation.T_SETPT)
    annotation (Line(
      points={{-137,74},{-116,74},{-116,116},{-94.4,116}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedP_MAN.P_MAN, occupancyEvaluation.P_MAN) annotation (Line(
      points={{-138.1,304},{-116,304},{-116,270.2},{-95.8,270.2}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(sourceP_MAN.y, prescribedP_MAN.u) annotation (Line(
      points={{-231,310},{-178,310},{-178,304},{-158,304}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(prescribedT_STA.T_STA, adjustTemperatureSetpoint.T_STA) annotation (
      Line(
      points={{-212.1,50},{-208,50},{-208,68},{-168,68},{-168,74},{-157,74}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));

  connect(timeProgramEnergyMode.M_BMS, energyModeSelection.M_BMS) annotation (
      Line(
      points={{-56,8},{-40,8},{-40,68},{-16,68}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(windowMonitoring.B_WINDOW, energyModeSelection.B_WINDOW) annotation (
      Line(
      points={{-137,188},{-116,188},{-116,28},{-40,28},{-40,60},{-16,60}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(occupancyEvaluation.P_ACT, energyModeSelection.P_ACT) annotation (
      Line(
      points={{-56,282},{-40,282},{-40,52},{-16,52}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(airTemperatureMeasurementRoom.T_ROOM, functionSelection.T_ROOM)
    annotation (Line(
      points={{-137,270},{-116,270},{-116,52},{-96,52},{-96,52}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(dewpointMonitoring.B_DEW, functionSelection.B_DEW) annotation (Line(
      points={{-137,130},{-116,130},{-116,60},{-96,60}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedF_BMS.F_BMS, functionSelection.F_BMS) annotation (Line(
      points={{-138.1,20},{-116,20},{-116,68},{-96,68}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(sumF_BMS.y, prescribedF_BMS.u) annotation (Line(
      points={{-179.1,20},{-158,20}},
      color={255,127,0},
      smooth=Smooth.None));
  connect(prescribedD_ACT.D_ACT, timeProgramEnergyMode.D_ACT) annotation (Line(
      points={{-138.1,-10},{-130,-10},{-130,8},{-96,8}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(sourceD_ACT.y, prescribedD_ACT.u) annotation (Line(
      points={{-175,-10},{-158,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(setpointCalculation.T_SETPTS, functionSelection.T_SETPTS) annotation (
     Line(
      points={{-54.6,120},{-40,120},{-40,28},{-116,28},{-116,44},{-96,44}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(setpointCalculation.T_SETPTS, automaticThermalControl.T_SETPTS)
    annotation (Line(
      points={{-54.6,120},{-40,120},{-40,186},{-16,186}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(airTemperatureMeasurementRoom.T_ROOM, automaticThermalControl.T_ROOM)
    annotation (Line(
      points={{-137,270},{-116,270},{-116,28},{-40,28},{-40,194},{-16,194}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(brightnessMeasurementOutdoor.H_OUT, automaticThermalControl.H_OUT)
    annotation (Line(
      points={{-137,216},{-116,216},{-116,28},{-40,28},{-40,202},{-16,202}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(occupancyEvaluation.P_ACT, automaticThermalControl.P_ACT) annotation (
     Line(
      points={{-56,282},{-40,282},{-40,210},{-16,210}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(windowMonitoring.B_WINDOW, priorityControl.B_WINDOW) annotation (Line(
      points={{-137,188},{-116,188},{-116,210},{-98,210}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedS_MAINT.S_MAINT, priorityControl.S_MAINT) annotation (Line(
      points={{-138.1,330},{-116,330},{-116,198},{-98,198}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedS_PROT.S_PROT, priorityControl.S_PROT) annotation (Line(
      points={{-138.1,356},{-116,356},{-116,204},{-98,204}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedS_AUTO.S_AUTO, priorityControl.S_AUTO) annotation (Line(
      points={{-138.1,380},{-116,380},{-116,186},{-98,186}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(sourceS_XXXAngle.y, prescribedS_PROT.u[2]) annotation (Line(
      points={{-199,338},{-180,338},{-180,357},{-158,357}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceS_XXXAngle.y, prescribedS_MAINT.u[2]) annotation (Line(
      points={{-199,338},{-180,338},{-180,331},{-158,331}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceS_XXXAngle.y, prescribedS_AUTO.u[2]) annotation (Line(
      points={{-199,338},{-180,338},{-180,381},{-158,381}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceS_XXXPos.y, prescribedS_AUTO.u[1]) annotation (Line(
      points={{-199,370},{-180,370},{-180,379},{-158,379}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceS_XXXPos.y, prescribedS_PROT.u[1]) annotation (Line(
      points={{-199,370},{-180,370},{-180,355},{-158,355}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceS_XXXPos.y, prescribedS_MAINT.u[1]) annotation (Line(
      points={{-199,370},{-180,370},{-180,329},{-158,329}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sunshadeActuator.S_SET, priorityControl.S_SET) annotation (Line(
      points={{-14.3,260.5},{-39.7,260.5},{-39.7,200},{-56,200}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(sunshadeActuator.S_STA, actuateSunshade.S_STA) annotation (Line(
      points={{23.7,260.5},{42,260.5},{42,28},{-116,28},{-116,118},{-166,118},{
          -166,102},{-157,102}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(setpointCalculation.T_SETPTS, temperatureControlValve.T_SETPS)
    annotation (Line(
      points={{-54.6,120},{-40,120},{-40,138},{-15.8,138}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(airTemperatureMeasurementRoom.T_ROOM, temperatureControlValve.T_ROOM)
    annotation (Line(
      points={{-137,270},{-116,270},{-116,28},{-40,28},{-40,142},{-30,142},{-30,
          142},{-16,142}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(energyModeSelection.M_ACT, temperatureControlValve.M_ACT) annotation (
     Line(
      points={{24,60},{42,60},{42,28},{-40,28},{-40,146},{-16,146}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(functionSelection.F_ACT, temperatureControlValve.F_ACT) annotation (
      Line(
      points={{-58,60},{-40,60},{-40,150},{-16,150}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(sourceT_ROOM.y, prescribedT.u) annotation (Line(
      points={{-209,274},{-198,274}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prescribedT_STA.u, sourceT_ROOM.y) annotation (Line(
      points={{-232,50},{-268,50},{-268,292},{-204,292},{-204,274},{-209,274}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(sourceCMD.y, prescribedCMD_S.u) annotation (Line(
      points={{-231,106},{-216,106},{-216,110},{-198,110}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(temperatureControlValve.V_SET_VP, controlDriveActuator.V_SET_VP)
    annotation (Line(
      points={{24,148},{44,148},{44,140},{66,140}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(actuateSunshade.S_MAN, priorityControl.S_MAN[2]) annotation (Line(
      points={{-137,102},{-116,102},{-116,192},{-98,192}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(automaticThermalControl.S_MAN, priorityControl.S_MAN[1]) annotation (
      Line(
      points={{24,200},{42,200},{42,28},{-116,28},{-116,192},{-98,192}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(SourceV_STA_VP.y, prescribedV_STA_VP.u) annotation (Line(
      points={{-179,-50},{-179,-50.05},{-158,-50.05},{-158,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prescribedV_STA_VP.V_STA_FS, temperatureControlValve.V_STA_FS)
    annotation (Line(
      points={{-138.1,-50},{-116,-50},{-116,28},{-40,28},{-40,134},{-15.8,134}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));

  annotation (preferredView="info",Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),      graphics), Icon(coordinateSystem(extent={{-100,
            -100},{100,100}})),
    Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end TesterSafetyModeAndUserControlSunShade;
