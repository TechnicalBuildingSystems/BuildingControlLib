within BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Examples;
model TesterWindVelocityMeasurement
  "Model for testing the functionality of WindVelocityMeasurement"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Pulse pulse(period=100)
    annotation (Placement(transformation(extent={{-100,40},{-80,62}})));
  WindVelocityMeasurement windVelocityMeasurement
    annotation (Placement(transformation(extent={{-38,0},{42,30}})));
equation
  connect(pulse.y, windVelocityMeasurement.W) annotation (Line(points={{-79,51},
          {2,51},{2,48},{2,48},{2,30},{2,30}}, color={0,0,127}));
      annotation (preferredView="info",experiment(StopTime=1000, Interval=1),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}})),
    __Dymola_experimentSetupOutput,
    Documentation(info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Simulation to check the behaviour of the function model of &QUOT;Wind velocity measurement&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.8, p. 16]</a>.</p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p>&QUOT;The sensor function <i>Wind velocity measurement</i> (RA-FL section 2, column 7; informative function block Figure 9) provides information about the flow velocity of outdoor air at the measuring site (e. g. a building facade). This information is used to protect, e. g. particularly external sunshades from damage due to wind conditions.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.8, p. 16]</a></p>
<h4><span style=\"color:#008000\">Concept</span></h4>
<p>The simulation contains a pulse signal source to imitate wind velocity sensor. The signal is passed to a converter for changing the signal type from Modelica standard type to VDI 3813 semantic type. From there the signal goes to the wind velocity measurement function. Because the parameter slope = 1 and y intercept = 0 the output should show the same pulse curve as the input pulse.</p>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end TesterWindVelocityMeasurement;
