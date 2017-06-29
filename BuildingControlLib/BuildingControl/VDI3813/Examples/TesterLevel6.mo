within BuildingControlLib.BuildingControl.VDI3813.Examples;
model TesterLevel6
  "Example to test functionality considering input from window opening and user control"
  extends Modelica.Icons.Example;
// VDI 3813 lib
    BuildingControl.VDI3813.ApplicationFunctions.RoomClimate.EnergyModeSelection
    energyModeSelection
    annotation (Placement(transformation(extent={{-40,40},{0,80}})));
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
    annotation (Placement(transformation(extent={{-160,330},{-140,350}})));
  BuildingControl.VDI3813.SensorFunctions.AirTemperatureMeasurementFunctions.AirTemperatureMeasurementRoom
    airTemperatureMeasurementRoom
    annotation (Placement(transformation(extent={{-160,356},{-140,376}})));
  BuildingControl.VDI3813.SensorFunctions.WindowMonitoring windowMonitoring
    annotation (Placement(transformation(extent={{-160,178},{-140,198}})));
  BuildingControl.VDI3813.SensorFunctions.AirTemperatureMeasurementFunctions.AirTemperatureMeasurementOutdoor
    airTemperatureMeasurementOutdoor
    annotation (Placement(transformation(extent={{-160,150},{-140,170}})));
  BuildingControl.VDI3813.SensorFunctions.DewpointMonitoring dewpointMonitoring
    annotation (Placement(transformation(extent={{-160,120},{-140,140}})));

      BuildingControl.VDI3813.ApplicationFunctions.Basic.OccupancyEvaluation
    occupancyEvaluation
    annotation (Placement(transformation(extent={{-100,220},{-60,260}})));
  BuildingControl.VDI3813.ApplicationFunctions.RoomClimate.SetpointCalculation
    setpointCalculation
    annotation (Placement(transformation(extent={{-100,100},{-60,140}})));
  BuildingControl.VDI3813.OperatorAndDisplayFunctions.AdjustTemperatureSetpoint
    adjustTemperatureSetpoint
    annotation (Placement(transformation(extent={{-160,64},{-140,84}})));
      OperatorAndDisplayFunctions.ActuateSunshade actuateSunshade
    annotation (Placement(transformation(extent={{-160,90},{-140,110}})));
      ApplicationFunctions.Sunshading.PriorityControl priorityControl
    annotation (Placement(transformation(extent={{-100,160},{-60,200}})));
  // Other

  BuildingControl.VDI3813.Sources.Analog.PrescribedT prescribedT
    annotation (Placement(transformation(extent={{-200,360},{-180,380}})));
  BuildingControl.VDI3813.Sources.Analog.PrescribedT prescribedT1
    annotation (Placement(transformation(extent={{-200,154},{-180,174}})));
  BuildingControl.VDI3813.Sources.Physical.PrescribedB prescribedB
    annotation (Placement(transformation(extent={{-200,124},{-180,144}})));
  BuildingControl.VDI3813.Sources.Physical.PrescribedP prescribedP
    annotation (Placement(transformation(extent={{-200,334},{-180,354}})));
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
    annotation (Placement(transformation(extent={{-160,390},{-140,410}})));
  Modelica.Blocks.Sources.Constant sourceAirTempOut(k=273.15 + 10)
    annotation (Placement(transformation(extent={{-226,154},{-206,174}})));
  Modelica.Blocks.Sources.BooleanStep     sourceP(startValue=false)
    "Source to define detection of a person in a room"
    annotation (Placement(transformation(extent={{-250,334},{-230,354}})));
  Modelica.Blocks.Sources.BooleanStep     sourceWindow(startValue=true,
      startTime=50)
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
    annotation (Placement(transformation(extent={{-248,396},{-228,416}})));
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
    annotation (Placement(transformation(extent={{-230,360},{-210,380}})));
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

  Sources.Sunshade.PrescribedCMD_S prescribedCMD_S1
    annotation (Placement(transformation(extent={{-200,100},{-180,120}})));
  Modelica.Blocks.Sources.BooleanStep sourceCMD_S(startTime=10, startValue=false)
    "Source of sunshade command from user"
    annotation (Placement(transformation(extent={{-252,96},{-232,116}})));

  ActuatorFunctions.SunshadeActuator sunshadeActuator
    annotation (Placement(transformation(extent={{-40,160},{0,200}})));
  Modelica.Blocks.Sources.Step sourceS_PROT_Pos(
    height=-2,
    offset=1,
    startTime=0)
    annotation (Placement(transformation(extent={{-254,306},{-234,326}})));
  Modelica.Blocks.Sources.Constant sourceS_PROT_Angle(k=10)
    annotation (Placement(transformation(extent={{-226,300},{-206,320}})));
  Modelica.Blocks.Sources.Step sourceS_MAINT_Pos(
    height=-2,
    offset=1,
    startTime=0)
    annotation (Placement(transformation(extent={{-254,276},{-234,296}})));
  Modelica.Blocks.Sources.Constant sourceS_MAINT_Angle(k=20)
    annotation (Placement(transformation(extent={{-228,270},{-208,290}})));
  Sources.Sunshade.PrescribedS_PROT prescribedS_PROT
    annotation (Placement(transformation(extent={{-200,300},{-180,320}})));
  Sources.Sunshade.PrescribedS_MAINT prescribedS_MAINT
    annotation (Placement(transformation(extent={{-200,276},{-180,296}})));
    Modelica.Blocks.Sources.Step sourceS_AUTO_Pos(
    height=-2,
    offset=1,
    startTime=50)
    annotation (Placement(transformation(extent={{-254,246},{-234,266}})));
  Modelica.Blocks.Sources.Constant sourceS_AUTO_Angle(k=50)
    annotation (Placement(transformation(extent={{-226,238},{-206,258}})));
  Sources.Sunshade.PrescribedS_AUTO prescribedS_AUTO
    annotation (Placement(transformation(extent={{-200,248},{-180,268}})));
    Modelica.Blocks.Sources.Step sourceS_MAN_Pos1(
    height=-2,
    offset=1,
    startTime=0)
    annotation (Placement(transformation(extent={{-254,216},{-234,236}})));
  Modelica.Blocks.Sources.Constant sourceS_MAN_Angle1(k=40)
    annotation (Placement(transformation(extent={{-226,208},{-206,228}})));
  Sources.Sunshade.PrescribedS_MAN prescribedS_MAN1
    annotation (Placement(transformation(extent={{-200,220},{-180,240}})));
equation
    for j in 1:nF_BMS loop
    connect(SourceF_BMS[j].y, sumF_BMS.u[j]) annotation (Line(
        points={{-213,20},{-192,20}},
        color={255,127,0},
        smooth=Smooth.None));
  end for;

  connect(prescribedT.T, airTemperatureMeasurementRoom.T) annotation (Line(
      points={{-178.1,370},{-178,370},{-178,380},{-152,380},{-152,378},{-150,378},
          {-150,376}},
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
      points={{-179.9,344},{-178,344},{-178,354},{-146,354},{-146,350},{-150,
          350}},
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
      points={{-229,344},{-214,344},{-214,346},{-198,346}},
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
      points={{-137,340},{-110,340},{-110,248},{-98,248},{-98,248},{-96,248},{-96,
          248.2},{-95.8,248.2}},
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
      points={{-138.1,400},{-110,400},{-110,236.2},{-95.8,236.2}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(sourceP_MAN.y, prescribedP_MAN.u) annotation (Line(
      points={{-227,406},{-178,406},{-178,400},{-158,400}},
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
      points={{-56,8},{-50,8},{-50,68},{-36,68}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(windowMonitoring.B_WINDOW, energyModeSelection.B_WINDOW) annotation (
      Line(
      points={{-137,188},{-110,188},{-110,-26},{-50,-26},{-50,60},{-36,60}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(occupancyEvaluation.P_ACT, energyModeSelection.P_ACT) annotation (
      Line(
      points={{-56,248},{-50,248},{-50,52},{-36,52}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(airTemperatureMeasurementRoom.T_ROOM, functionSelection.T_ROOM)
    annotation (Line(
      points={{-137,366},{-110,366},{-110,50},{-110,50},{-110,52},{-96,52},{-96,
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
      points={{-54.6,120},{-50,120},{-50,-26},{-110,-26},{-110,44},{-96,44}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(sourceT_ROOM.y, prescribedT.u) annotation (Line(
      points={{-209,370},{-198,370}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prescribedT_STA.u, sourceT_ROOM.y) annotation (Line(
      points={{-232,50},{-268,50},{-268,388},{-204,388},{-204,370},{-209,370}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(sourceCMD_S.y, prescribedCMD_S1.u) annotation (Line(
      points={{-231,106},{-216,106},{-216,110},{-198,110}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(actuateSunshade.CMD, prescribedCMD_S1.CMD) annotation (Line(
      points={{-150,110},{-150,110},{-150,116},{-168,116},{-168,106},{-184.1,106}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(sunshadeActuator.S_SET, priorityControl.S_SET) annotation (Line(
      points={{-34,180},{-56,180}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(sunshadeActuator.S_STA, actuateSunshade.S_STA) annotation (Line(
      points={{6,180},{10,180},{10,-26},{-110,-26},{-110,88},{-168,88},{-168,100},
          {-157,100}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(actuateSunshade.S_MAN, priorityControl.S_MAN[1]) annotation (Line(
      points={{-137,100},{-110,100},{-110,172},{-98,172}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(priorityControl.B_WINDOW, windowMonitoring.B_WINDOW) annotation (Line(
      points={{-98,190},{-110,190},{-110,188},{-137,188}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedS_PROT.S_PROT,priorityControl. S_PROT) annotation (Line(
      points={{-178.1,310},{-110,310},{-110,184},{-98,184}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedS_PROT.u[1],sourceS_PROT_Pos. y) annotation (Line(
      points={{-198,309},{-202,309},{-202,326},{-232,326},{-232,316},{-233,316}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prescribedS_PROT.u[2],sourceS_PROT_Angle. y) annotation (Line(
      points={{-198,311},{-202,311},{-202,310},{-205,310}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prescribedS_MAINT.S_MAINT,priorityControl. S_MAINT) annotation (
      Line(
      points={{-178.1,286},{-110,286},{-110,178},{-98,178}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(sourceS_MAINT_Pos.y,prescribedS_MAINT. u[1]) annotation (Line(
      points={{-233,286},{-230,286},{-230,294},{-202,294},{-202,285},{-198,285}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceS_MAINT_Angle.y,prescribedS_MAINT. u[2]) annotation (Line(
      points={{-207,280},{-202,280},{-202,287},{-198,287}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prescribedS_AUTO.S_AUTO,priorityControl. S_AUTO) annotation (Line(
      points={{-178.1,258},{-110,258},{-110,166},{-98,166}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(sourceS_AUTO_Pos.y,prescribedS_AUTO. u[1]) annotation (Line(
      points={{-233,256},{-230,256},{-230,264},{-202,264},{-202,257},{-198,257}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceS_AUTO_Angle.y,prescribedS_AUTO. u[2]) annotation (Line(
      points={{-205,248},{-202,248},{-202,259},{-198,259}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceS_MAN_Pos1.y,prescribedS_MAN1. u[1]) annotation (Line(
      points={{-233,226},{-232,226},{-232,234},{-202,234},{-202,229},{-198,229}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceS_MAN_Angle1.y,prescribedS_MAN1. u[2]) annotation (Line(
      points={{-205,218},{-202,218},{-202,231},{-198,231}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prescribedS_MAN1.S_MAN, priorityControl.S_MAN[2]) annotation (Line(
      points={{-178.1,230},{-110,230},{-110,172},{-98,172}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  annotation (preferredView="info",
Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),      graphics), Icon(coordinateSystem(extent={{-100,
            -100},{100,100}})),
    experiment(StopTime=100, Interval=1),
    __Dymola_experimentSetupOutput,
    Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end TesterLevel6;
