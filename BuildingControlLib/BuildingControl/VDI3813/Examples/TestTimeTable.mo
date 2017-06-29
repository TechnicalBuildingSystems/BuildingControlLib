within BuildingControlLib.BuildingControl.VDI3813.Examples;
model TestTimeTable "TODO"

    extends Modelica.Icons.Example;

  // periodic table for a weekly schedule
  parameter Real startTime[1,5] = {{0,0,0,0,0.0}}
    "Array with start time and value format: {{days,hours,minutes,seconds,startValue}}";
  parameter Real endValue[5] = {8,0,0,0,startTime[1,5]}
    "Array with start time and value format: {{days,hours,minutes,seconds,startValue}}";
  parameter Real inputIntervalsAndValue[:,5] = {
                            {1,7,30,11,0.0},
                            {1,7,30,11,1.0},
                            {1,18,30,11,1.0},
                            {1,18,30,11,0.0},
                            endValue}
    "Array with hours. Format: {{days,hours,minutes,seconds,value}}. Need to leave endValue parameter as last item. Discontinuities allowed by introducing values in table twice ";

  parameter Modelica.SIunits.Conversions.NonSIunits.Time_hour nSecondsPerDay = 24*nSecondsPerMinute*nSecondsPerMinute
    "Numbers of hours for one day";
  parameter Modelica.SIunits.Conversions.NonSIunits.Time_minute nSecondsPerHour = nSecondsPerMinute*60
    "Numbers of minutes for one hour";
  parameter Modelica.SIunits.Time nSecondsPerMinute = 60
    "Numbers of seconds for one minute";
  parameter Real table[:,:] = {{inputIntervalsAndValue[i,1]*nSecondsPerDay + inputIntervalsAndValue[i,2]*nSecondsPerHour + inputIntervalsAndValue[i,3]*nSecondsPerMinute + inputIntervalsAndValue[i,4],  inputIntervalsAndValue[i,5]}  for i in 1:size(inputIntervalsAndValue,1)};

          Modelica.Blocks.Sources.CombiTimeTable weeklySchedule(
          offset = {startTime[1,5]},
          startTime = startTime[1,1]*nSecondsPerDay + startTime[1,2]*nSecondsPerHour + startTime[1,3]*nSecondsPerMinute + startTime[1,4],
          table = table,
    extrapolation = Modelica.Blocks.Types.Extrapolation.Periodic,
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));

  annotation (experiment(StopTime=1.2096e+006, Interval=1000),
      __Dymola_experimentSetupOutput,
    Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"),  preferredView="info");
end TestTimeTable;
