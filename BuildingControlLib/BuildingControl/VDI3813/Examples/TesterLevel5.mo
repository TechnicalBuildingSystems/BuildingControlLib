within BuildingControlLib.BuildingControl.VDI3813.Examples;
model TesterLevel5
  "Example to test functionality considering input from window opening and user control"
  extends Modelica.Icons.Example;
// VDI 3813 lib
    BuildingControl.VDI3813.ApplicationFunctions.RoomClimate.EnergyModeSelection
    energyModeSelection
    annotation (Placement(transformation(extent={{-20,40},{20,80}})));
  BuildingControl.VDI3813.ApplicationFunctions.Basic.TimeProgram.TimeProgramEnergyMode
    timeProgramEnergyMode(offset = offset,
                       startTimeWSCH = startTimeWSCH,
                       startTimeESCH = startTimeESCH,
                       startTimeCAL = startTimeCAL,
                       PAR_ESCH = PAR_ESCH,
                       PAR_WSCH = PAR_WSCH,
                       PAR_CAL = PAR_CAL)
    annotation (Placement(transformation(extent={{-100,-20},{-60,20}})));
  BuildingControl.VDI3813.ApplicationFunctions.RoomClimate.FunctionSelection
    functionSelection
    annotation (Placement(transformation(extent={{-100,40},{-60,80}})));
      BuildingControl.VDI3813.SensorFunctions.PresenceDetection presenceDetection
    annotation (Placement(transformation(extent={{-160,234},{-140,254}})));
  BuildingControl.VDI3813.SensorFunctions.AirTemperatureMeasurementFunctions.AirTemperatureMeasurementRoom
    airTemperatureMeasurementRoom
    annotation (Placement(transformation(extent={{-160,260},{-140,280}})));
  BuildingControl.VDI3813.SensorFunctions.WindowMonitoring windowMonitoring
    annotation (Placement(transformation(extent={{-160,178},{-140,198}})));
  BuildingControl.VDI3813.SensorFunctions.AirTemperatureMeasurementFunctions.AirTemperatureMeasurementOutdoor
    airTemperatureMeasurementOutdoor
    annotation (Placement(transformation(extent={{-160,150},{-140,170}})));
  BuildingControl.VDI3813.SensorFunctions.DewpointMonitoring dewpointMonitoring
    annotation (Placement(transformation(extent={{-160,120},{-140,140}})));

      BuildingControl.VDI3813.ApplicationFunctions.Basic.OccupancyEvaluation
    occupancyEvaluation
    annotation (Placement(transformation(extent={{-100,260},{-60,300}})));
  BuildingControl.VDI3813.ApplicationFunctions.RoomClimate.SetpointCalculation
    setpointCalculation
    annotation (Placement(transformation(extent={{-100,100},{-60,140}})));
  BuildingControl.VDI3813.OperatorAndDisplayFunctions.AdjustTemperatureSetpoint
    adjustTemperatureSetpoint
    annotation (Placement(transformation(extent={{-160,64},{-140,84}})));
  // Other

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
    BuildingControl.VDI3813.Sources.Time.PrescribedD_ACT prescribedD_ACT
    annotation (Placement(transformation(extent={{-160,-20},{-140,0}})));
      BuildingControl.VDI3813.Sources.AirTemperature.PrescribedT_BMS
    prescribedT_BMS
    annotation (Placement(transformation(extent={{-160,40},{-140,60}})));
      Sources.ControlFunction.PrescribedF_BMS_AirTemperature prescribedF_BMS
    annotation (Placement(transformation(extent={{-160,10},{-140,30}})));
          parameter Integer nF_BMS = 1
    "Number of changes in control function type";
      BuildingControl.VDI3813.Sources.Presence.PrescribedP_MAN prescribedP_MAN
    annotation (Placement(transformation(extent={{-160,294},{-140,314}})));
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

  BuildingControl.VDI3813.Sources.AirTemperature.PrescribedCMD_T
    prescribedCMD_T
    annotation (Placement(transformation(extent={{-202,76},{-182,96}})));
  Modelica.Blocks.Sources.Constant sourceUserSetpoint(k=0)
    annotation (Placement(transformation(extent={{-226,76},{-206,96}})));

  Modelica.Blocks.Sources.Constant sourceT_BMS(k=0)
    "Boundary condition to set T_BMS i.e. relative change of temperature setpoint from BMS system in Kelvin"
    annotation (Placement(transformation(extent={{-198,42},{-178,62}})));

  Modelica.Blocks.Sources.BooleanConstant sourceP_MAN(k=true)
    annotation (Placement(transformation(extent={{-248,300},{-228,320}})));
  BuildingControl.VDI3813.Sources.AirTemperature.PrescribedT_STA
    prescribedT_STA
    annotation (Placement(transformation(extent={{-234,40},{-214,60}})));
    Modelica.Blocks.Sources.IntegerStep SourceF_BMS[nF_BMS](
    height={3},
    offset={0},
    startTime={0})                                   annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-224,20})));
  Modelica.Blocks.MathInteger.Sum sumF_BMS(nu=nF_BMS) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-186,20})));

  Modelica.Blocks.Sources.Constant sourceD_ACT(k=200)
    annotation (Placement(transformation(extent={{-196,-20},{-176,0}})));
  Modelica.Blocks.Sources.Constant sourceT_ROOM(k=273.15 + 15)
    "Boundary condition defining the room air temperature"
    annotation (Placement(transformation(extent={{-230,264},{-210,284}})));
/***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Parameter
  parameter Real offset[:]={0.0} "Offset of  output signal";
  parameter Real startTimeWSCH[5] = {0,0,0,0,2.0}
    "Array with start time and value format: {{days,hours,minutes,seconds,startValue}}";
  parameter Real PAR_WSCH[:,5] = {
            timeProgramEnergyMode.functionality.weeklySchedule.startTime,
            timeProgramEnergyMode.functionality.weeklySchedule.endValue}
    "Time/value pairs of weekly schedule in regular operation. Format: {{days,hours,minutes,seconds,value}}. Need to leave endValue parameter as last item. Discontinuities allowed by introducing values in table twice ";

  parameter Real startTimeESCH[5] = {0,0,0,0,3.0}
    "Array with start time and value format: {{days,hours,minutes,seconds,startValue}}";
  parameter Real PAR_ESCH[:,5] = {
            timeProgramEnergyMode.functionality.exceptionSchedule.startTime,
            {0,9,30,0,3.0},
            {0,9,30,0,2.0},
            {0,10,0,0,2.0},
            {0,10,0,0,1.0},
            {0,13,0,0,1.0},
            {0,13,0,0,3.0},
            timeProgramEnergyMode.functionality.exceptionSchedule.endValue}
    "Time/value pairs of exception schedule. Format: {{days,hours,minutes,seconds,value}}. Need to leave endValue parameter as last item. Discontinuities allowed by introducing values in table twice ";

 parameter Real startTimeCAL[5] = {0,0,0,0,-1.0}
    "Array with start time and value format: {{days,hours,minutes,seconds,startValue}}";
  parameter Real PAR_CAL[:,5] = {
            timeProgramEnergyMode.functionality.exceptionCalendar.startTime,
            {5,0,0,0,-1.0},
            {5,0,0,0,1.0},
            {6,0,0,0,1.0},
            {6,0,0,0,-1.0},
            timeProgramEnergyMode.functionality.exceptionCalendar.endValue}
    "Time/value pairs of of yearly exception calendar. Format: {{days,hours,minutes,seconds,value}}. Need to leave endValue parameter as last item. Discontinuities allowed by introducing values in table twice ";
equation
    for j in 1:nF_BMS loop
    connect(SourceF_BMS[j].y, sumF_BMS.u[j]) annotation (Line(
        points={{-213,20},{-192,20}},
        color={255,127,0},
        smooth=Smooth.None));
  end for;

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
      points={{-137,244},{-110,244},{-110,288},{-100,288},{-100,288.2},{-95.8,
          288.2}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedCMD_T.CMD_T, adjustTemperatureSetpoint.CMD) annotation (
      Line(
      points={{-180.1,86},{-146,86},{-146,84.1},{-150,84.1}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(sourceUserSetpoint.y, prescribedCMD_T.u) annotation (Line(
      points={{-205,86},{-200,86}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(airTemperatureMeasurementOutdoor.T_OUT, setpointCalculation.T_OUT)
    annotation (Line(
      points={{-137,160},{-110,160},{-110,104.2},{-94.8,104.2}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(setpointCalculation.T_BMS, prescribedT_BMS.T_BMS) annotation (Line(
      points={{-94.8,128},{-110,128},{-110,50},{-138.1,50}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(sourceT_BMS.y, prescribedT_BMS.u) annotation (Line(
      points={{-177,52},{-168,52},{-168,50},{-158,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(adjustTemperatureSetpoint.T_SETPT, setpointCalculation.T_SETPT)
    annotation (Line(
      points={{-137,74},{-110,74},{-110,116},{-94.4,116}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedP_MAN.P_MAN, occupancyEvaluation.P_MAN) annotation (Line(
      points={{-138.1,304},{-110,304},{-110,276.2},{-95.8,276.2}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(sourceP_MAN.y, prescribedP_MAN.u) annotation (Line(
      points={{-227,310},{-178,310},{-178,304},{-158,304}},
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
      points={{-137,188},{-110,188},{-110,-26},{-40,-26},{-40,60},{-16,60}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(occupancyEvaluation.P_ACT, energyModeSelection.P_ACT) annotation (
      Line(
      points={{-56,288},{-40,288},{-40,52},{-16,52}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(airTemperatureMeasurementRoom.T_ROOM, functionSelection.T_ROOM)
    annotation (Line(
      points={{-137,270},{-110,270},{-110,52},{-100,52},{-100,52},{-96,52},{-96,
          52}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(dewpointMonitoring.B_DEW, functionSelection.B_DEW) annotation (Line(
      points={{-137,130},{-110,130},{-110,60},{-96,60}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedF_BMS.F_BMS, functionSelection.F_BMS) annotation (Line(
      points={{-138.1,20},{-110,20},{-110,68},{-96,68}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(sumF_BMS.y, prescribedF_BMS.u) annotation (Line(
      points={{-179.1,20},{-158,20}},
      color={255,127,0},
      smooth=Smooth.None));
  connect(prescribedD_ACT.D_ACT, timeProgramEnergyMode.D_ACT) annotation (Line(
      points={{-138.1,-10},{-110,-10},{-110,8},{-96,8}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(sourceD_ACT.y, prescribedD_ACT.u) annotation (Line(
      points={{-175,-10},{-158,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(setpointCalculation.T_SETPTS, functionSelection.T_SETPTS) annotation (
     Line(
      points={{-54.6,120},{-40,120},{-40,60},{-40,60},{-40,-26},{-110,-26},{-110,
          44},{-96,44}},
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

  annotation (preferredView="info",Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),      graphics), Icon(coordinateSystem(extent={{-100,
            -100},{100,100}})),
    experiment(StopTime=100, Interval=1),
    __Dymola_experimentSetupOutput,
    Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end TesterLevel5;
