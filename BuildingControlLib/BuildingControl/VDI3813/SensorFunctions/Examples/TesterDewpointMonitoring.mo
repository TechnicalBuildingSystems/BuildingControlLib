within BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Examples;
model TesterDewpointMonitoring
  "Model for testing the functionality of DewpointMonitoring"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.BooleanPulse sourceDewpoint(period=1)
    annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
  Sources.Physical.PrescribedB prescribedB
    annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
  DewpointMonitoring dewpointMonitoring
    annotation (Placement(transformation(extent={{-36,-40},{36,0}})));
equation
  connect(prescribedB.u, sourceDewpoint.y) annotation (Line(
      points={{-38,52},{-48,52},{-48,50},{-59,50}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(prescribedB.B, dewpointMonitoring.B) annotation (Line(
      points={{-19.9,50},{0.35,50},{0.35,0},{0,0}},
      color={0,0,0},
      smooth=Smooth.None));
      annotation (preferredView="info", experiment(
        __Dymola_NumberOfIntervals=10),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics),
    __Dymola_experimentSetupOutput,
    Documentation(info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Simulation to check the behaviour of the function model of &QUOT;Dewpoint monitoring&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.4, p. 12-13]</a>.</p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p>&QUOT;The sensor function <i>Dewpoint monitoring</i> (RA-FL section 2, column 3; informative function block Figure 5) provides information on the risk of dew formation at the measuring site in terms of the states &ldquo;dewpoint reached&rdquo; or &ldquo;dewpoint not reached&rdquo;.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.4, p. 12-13]</a>.</p>
<p>The calibration parameter PAR_CAL is used to choose the right contact logic.</p>
<p>By default PAR_CAL ist true which leads to a positive logic. That means if dewpoint limit is reached B is true and B_DEW is set to true. If dewpoint limit is not reached B is false and B_DEW is set to false.</p>
<p>If PAR_CAL is set to false the logic is complementary/inverted. If dewpoint limit is reached B is false and B_DEW is set to true etc..</p>
<h4><span style=\"color:#008000\">Concept</span></h4>
<p>The simulation contains a boolean signal source to imitate a sensor. The signal is passed to a converter for changing the signal type from Modelica standard type to VDI 3813 semantic type. From there the signal goes to the sensor function, which converts the measured signal to an output signal depending on the chosen parameters of the function.</p>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end TesterDewpointMonitoring;
