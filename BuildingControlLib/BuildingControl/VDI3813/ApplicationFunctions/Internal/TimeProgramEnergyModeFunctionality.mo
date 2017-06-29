within BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Internal;
block TimeProgramEnergyModeFunctionality
  "Time program functionality based on Modelica.Blocks.TimeTable"
      extends
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.Partial.PartialFunctionality;

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Connector
  Interfaces.Time.ValueCurrentTimeAndDateInput D_ACT
    "Input connector of ValueCurrentTimeAndDate" annotation (Placement(transformation(extent={{-100,20},{-60,60}})));
  Interfaces.EnergyMode.CommandEnergyModeTimeScheduleOutput M_BMS
    "Output connector of CommandEnergyModeTimeSchedule" annotation (
      Placement(transformation(extent={{100,20},{140,60}}), iconTransformation(
          extent={{100,20},{140,60}})));

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Components
  Nonstandardized.Schedules.ScheduleWeekly weeklySchedule(
    offset=offset,
    startTime=startTimeWSCH,
    inputIntervalsAndValue=PAR_WSCH)
    annotation (Placement(transformation(extent={{-80,-80},{-60,-60}})));
  Nonstandardized.Schedules.ScheduleDaily exceptionSchedule(
    offset=offset,
    startTime=startTimeESCH,
    inputIntervalsAndValue=PAR_ESCH)
    annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));
  Nonstandardized.Schedules.ScheduleYearly exceptionCalendar(
    offset=offset,
    startTime=startTimeCAL,
    inputIntervalsAndValue=PAR_CAL)
    annotation (Placement(transformation(extent={{-80,-50},{-60,-30}})));

      Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=-1)
    annotation (Placement(transformation(extent={{-40,-50},{-20,-30}})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{0,-50},{20,-30}})));
  Modelica.Blocks.Math.RealToInteger realToInteger
    annotation (Placement(transformation(extent={{40,-50},{60,-30}})));
  Sources.EnergyMode.PrescribedM_BMS prescribedM_BMS annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={70,10})));
  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Parameter
  parameter Real offset[:]={0.0} "Offset of  output signal";
  parameter Real startTimeWSCH[5] = {0,0,0,0,3.0}
    "Array with start time and value format: {{days,hours,minutes,seconds,startValue}}";
  parameter Real PAR_WSCH[:,5] = {
            weeklySchedule.startTime,
            {0,7,30,0,3.0},
            {0,7,30,0,2.0},
            {0,8,0,0,2.0},
            {0,8,0,0,1.0},
            {0,18,0,0,1.0},
            {0,18,0,0,3.0},
            {1,7,30,0,3.0},
            {1,7,30,0,2.0},
            {1,8,0,0,2.0},
            {1,8,0,0,1.0},
            {1,18,0,0,1.0},
            {1,18,0,0,3.0},
            {2,7,30,0,3.0},
            {2,7,30,0,2.0},
            {2,8,0,0,2.0},
            {2,8,0,0,1.0},
            {2,18,0,0,1.0},
            {2,18,0,0,3.0},
            {3,7,30,0,3.0},
            {3,7,30,0,2.0},
            {3,8,0,0,2.0},
            {3,8,0,0,1.0},
            {3,18,0,0,1.0},
            {3,18,0,0,3.0},
            {4,7,30,0,3.0},
            {4,7,30,0,2.0},
            {4,8,0,0,2.0},
            {4,8,0,0,1.0},
            {4,18,0,0,1.0},
            {4,18,0,0,3.0},
            weeklySchedule.endValue}
    "Time/value pairs of weekly schedule in regular operation. Format: {{days,hours,minutes,seconds,value}}. Need to leave endValue parameter as last item. Discontinuities allowed by introducing values in table twice ";

  parameter Real startTimeESCH[5] = {0,0,0,0,3.0}
    "Array with start time and value format: {{days,hours,minutes,seconds,startValue}}";
  parameter Real PAR_ESCH[:,5] = {
            exceptionSchedule.startTime,
            {0,9,30,0,3.0},
            {0,9,30,0,2.0},
            {0,10,0,0,2.0},
            {0,10,0,0,1.0},
            {0,13,0,0,1.0},
            {0,13,0,0,3.0},
            exceptionSchedule.endValue}
    "Time/value pairs of exception schedule. Format: {{days,hours,minutes,seconds,value}}. Need to leave endValue parameter as last item. Discontinuities allowed by introducing values in table twice ";

 parameter Real startTimeCAL[5] = {0,0,0,0,-1.0}
    "Array with start time and value format: {{days,hours,minutes,seconds,startValue}}";
  parameter Real PAR_CAL[:,5] = {
            exceptionCalendar.startTime,
            {5,0,0,0,-1.0},
            {5,0,0,0,1.0},
            {6,0,0,0,1.0},
            {6,0,0,0,-1.0},
            exceptionCalendar.endValue}
    "Time/value pairs of of yearly exception calendar. Format: {{days,hours,minutes,seconds,value}}. Need to leave endValue parameter as last item. Discontinuities allowed by introducing values in table twice ";

equation
  connect(realToInteger.y,prescribedM_BMS. u) annotation (Line(
      points={{61,-40},{66,-40},{66,2}},
      color={255,127,0},
      smooth=Smooth.None));
  connect(greaterThreshold.u, exceptionCalendar.y) annotation (Line(
      points={{-42,-40},{-59,-40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(realToInteger.u, switch1.y) annotation (Line(
      points={{38,-40},{21,-40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch1.u2, greaterThreshold.y) annotation (Line(
      points={{-2,-40},{-19,-40}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(weeklySchedule.y, switch1.u3) annotation (Line(
      points={{-59,-70},{-10,-70},{-10,-48},{-2,-48}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(exceptionSchedule.y, switch1.u1) annotation (Line(
      points={{-59,-10},{-10,-10},{-10,-32},{-2,-32}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(prescribedM_BMS.M_BMS, M_BMS) annotation (Line(
      points={{74,21.9},{74,21.9},{74,32},{100,32},{100,40},{120,40}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  annotation (preferedView="Info",experiment(StopTime=1.2096e+006, Interval=1000),
      __Dymola_experimentSetupOutput,
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
",        info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<p>Block that implements functionality of &QUOT;Time program&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.4, p. 35 - 37]</a>. </p>
<h4><span style=\"color: #008000\">Functional Description</span></h4>
<p>&QUOT;The function <i>Time program</i> (RA-FL section 6, column 3; informative function block Figure 25) allows time-controlled generation of output information, thus influencing or controlling application functions or actuator functions.The time program contains the time and date functions as well as calendar entries including exception days (e. g. holidays). The respective switching operations are generated via a default week schedule and exception day schedules with switching point/value pairs. Such a time program can be implemented and maintained either directly via an interaction interface, or it is transferred by a management communication function to an operating device or external system.&QUOT;<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.4, p. 35 - 37]</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><br><b>Fig. 1: </b>UML activity diagram of the application function <i>Time program, </i><a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.4, p. 35 - 37]</a></p><p><img src=\"modelica://BuildingControlLib/Resources/Images/docUMLAkt_TimeProgram.PNG\"/> </p></td>
</tr>
</table>
<p><br><br><br><br><br><br><br><b><span style=\"color: #008000;\">Input Variables</span></b></p>
<p><b>Tab . 1: </b>The following table presents the input variables of the function as specified in the standard. </p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Datatype VDI3813</h4></p></td>
<td><p align=\"center\"><h4>Semantic data type</h4></p></td>
<td><p align=\"center\"><h4>Signal flow direction</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>D_ACT</p></td>
<td valign=\"top\"><p>Time</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Time.ValueCurrentTimeAndDateInput\">ValueCurrentTimeAndDate</a> </p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Current date and time.</p></td>
</tr>
</table>
<p><br><br><br><br><br><br><b><span style=\"color: #008000;\">Output Variables</span></b></p>
<p><b>Tab . 2: </b>The following table presents the output variables of the function as specified in the standard. </p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Datatype VDI3813</h4></p></td>
<td><p align=\"center\"><h4>Semantic data type</h4></p></td>
<td><p align=\"center\"><h4>Signal flow direction</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>M_BMS</p></td>
<td valign=\"top\"><p>Mode</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.EnergyMode.CommandEnergyModeTimeScheduleOutput\">CommandEnergyModeTimeSchedule</a> </p></td>
<td valign=\"top\"><p>Output</p></td>
<td valign=\"top\"><p>Valid energy mode for the current time (defined in schedules by operator).</p></td>
</tr>
</table>
<p><br><br><br><br><br><br><b><span style=\"color: #008000;\">Parameters</span></b> </p>
<p><b>Tab . 3: </b>The following table presents the parameter of the function .</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_WSCH</p></td>
<td valign=\"top\"><p>Time / value&nbsp;pairs&nbsp;of&nbsp;weekly&nbsp;schedule&nbsp;in&nbsp;regular&nbsp;operation.&nbsp;Format:&nbsp;{{days,hours,minutes,seconds,value}}.&nbsp;</p><p>Need&nbsp;to&nbsp;leave&nbsp;endValue&nbsp;parameter&nbsp;as&nbsp;last&nbsp;item.&nbsp;Discontinuities&nbsp;allowed&nbsp;by&nbsp;introducing&nbsp;values&nbsp;in&nbsp;table&nbsp;twice.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_ESCH</p></td>
<td valign=\"top\"><p>Time/value&nbsp;pairs&nbsp;of&nbsp;exception&nbsp;schedule.&nbsp;Format:&nbsp;{{days,hours,minutes,seconds,value}}.&nbsp;</p><p>Need&nbsp;to&nbsp;leave&nbsp;endValue&nbsp;parameter&nbsp;as&nbsp;last&nbsp;item.&nbsp;Discontinuities&nbsp;allowed&nbsp;by&nbsp;introducing&nbsp;values&nbsp;in&nbsp;table&nbsp;twice.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_CAL</p></td>
<td valign=\"top\"><p>Time/value&nbsp;pairs&nbsp;of&nbsp;of&nbsp;yearly&nbsp;exception&nbsp;calendar.&nbsp;Format:&nbsp;{{days,hours,minutes,seconds,value}}.&nbsp;</p><p>Need&nbsp;to&nbsp;leave&nbsp;endValue&nbsp;parameter&nbsp;as&nbsp;last&nbsp;item.&nbsp;Discontinuities&nbsp;allowed&nbsp;by&nbsp;introducing&nbsp;values&nbsp;in&nbsp;table&nbsp;twice.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>startTimeWSCH</p></td>
<td valign=\"top\"><p>Array&nbsp;with&nbsp;start&nbsp;time&nbsp;and&nbsp;value&nbsp;format:&nbsp;{{days,hours,minutes,seconds,startValue}}.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>startTimeESCH</p></td>
<td valign=\"top\"><p>Array&nbsp;with&nbsp;start&nbsp;time&nbsp;and&nbsp;value&nbsp;format:&nbsp;{{days,hours,minutes,seconds,startValue}}.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>startTimeCAL</p></td>
<td valign=\"top\"><p>Array&nbsp;with&nbsp;start&nbsp;time&nbsp;and&nbsp;value&nbsp;format:&nbsp;{{days,hours,minutes,seconds,startValue}}.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>offset</p></td>
<td valign=\"top\"><p>Offset&nbsp;of&nbsp;&nbsp;output&nbsp;signal.</p></td>
</tr>
</table>
</html>"));
end TimeProgramEnergyModeFunctionality;
