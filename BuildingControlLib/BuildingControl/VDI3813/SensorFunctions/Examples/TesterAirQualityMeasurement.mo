within BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Examples;
model TesterAirQualityMeasurement
  "Model for testing the functionality of AirQualityMeasurement"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Pulse pulse(amplitude = 1, offset = 0, period = 300, startTime = 0, width = 50)
    annotation (Placement(transformation(extent={{-100,40},{-80,62}})));
  Sources.Analog.PrescribedQ
    prescribedPhysicalAirQuality
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
  AirQualityMeasurement airQualityMeasurement
    annotation (Placement(transformation(extent={{-64,-22},{2,4}})));
equation
  connect(pulse.y, prescribedPhysicalAirQuality.u) annotation (Line(
      points={{-79,51},{-66.5,51},{-66.5,50},{-58,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(airQualityMeasurement.Q, prescribedPhysicalAirQuality.Q)
    annotation (Line(
      points={{-31,4},{-30,4},{-30,50},{-38.1,50}},
      color={0,0,0},
      smooth=Smooth.None));
      annotation ( preferredView="info", experiment(StartTime=0, StopTime=1000, Interval=1, Tolerance=1e-6),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}),  graphics),
    __Dymola_experimentSetupOutput,
    Documentation(info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Simulation to check the behaviour of the function model of &QUOT;Air quality measurement&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.7, p. 15]</a>. </p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p>&QUOT;The sensor function <i>Air quality measurement</i> (RAFL section 2, column 6; informative function block Figure 8) provides information allowing conclusions to be drawn about the air quality in a room.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.7, p. 15]</a></p>
<p>Because the specification of the air quality signal is indefinite, in this case a value between 0 and 1 had been chosen to represent the air quality, whereas the value 0 stands for the worst quality and 1 for the best quality.</p>
<h4><span style=\"color:#008000\">Concept</span></h4>
<p>The simulation contains a pulse signal source to imitate an air quality sensor. The signal is passed to a converter for changing the signal type from Modelica standard type to VDI 3813 semantic type. From there the signal goes to the air quality measurement function. Because the parameter slope = 1 and y intercept = 0 the output should show the same pulse curve as the input pulse.</p>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));

end TesterAirQualityMeasurement;
