within BuildingControlLib.BuildingControl.Nonstandardized.Examples;
model TestSchedules "Tester for schedule blocks"
    extends Modelica.Icons.Example;

  Schedules.ScheduleDaily scheduleDaily(
    startTime={0,0,0,0,1.0},
    offset={0.0},
    inputIntervalsAndValue={scheduleDaily.startTime,{0,8,11,0,1.0},{0,8,11,0,
        1.5},{0,11,11,0,1.5},{0,11,11,0,1.0},scheduleDaily.endValue})
    annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
  Schedules.ScheduleWeekly scheduleWeekly(
    startTime={0,0,0,0,2.0},
    offset={0.0},
    inputIntervalsAndValue={scheduleWeekly.startTime,{0,8,11,0,2.0},{0,8,11,0,
        2.5},{0,11,11,0,2.5},{0,11,11,0,2.0},{1,8,11,0,2.0},{1,8,11,0,2.5},{1,
        11,11,0,2.5},{1,11,11,0,2.0},{2,8,11,0,2.0},{2,8,11,0,2.5},{2,11,11,0,
        2.5},{2,11,11,0,2.0},{3,8,11,0,2.0},{3,8,11,0,2.5},{3,11,11,0,2.5},{3,
        11,11,0,2.0},{4,8,11,0,2.0},{4,8,11,0,2.5},{4,11,11,0,2.5},{4,11,11,0,
        2.0},scheduleWeekly.endValue})
    annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
  Schedules.ScheduleYearly scheduleYearly(
    startTime={0,0,0,0,3.0},
    offset={0.0},
    inputIntervalsAndValue={scheduleYearly.startTime,{315,8,11,0,3.0},{315,8,11,
        0,3.5},{315,11,11,0,3.5},{315,11,11,0,3.0},scheduleYearly.endValue})
    annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
  Schedules.ScheduleArbitrary scheduleArbitrary(
    startTime={0,0,0,0,4.0},
    offset={0.0},
    inputIntervalsAndValue={scheduleArbitrary.startTime,{1,8,11,0,4.0},{1,8,11,
        0,4.5},{1,11,11,0,4.5},{1,11,11,0,4.0},scheduleArbitrary.endValue})
    annotation (Placement(transformation(extent={{-60,-80},{-40,-60}})));

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics),
    experiment(StopTime=1.2096e+006, Interval=1),
    __Dymola_experimentSetupOutput,
    Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
end TestSchedules;
