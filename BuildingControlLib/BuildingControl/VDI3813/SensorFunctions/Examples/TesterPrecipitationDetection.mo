within BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Examples;
model TesterPrecipitationDetection
  "Model for testing the functionality of PrecipitationDetection"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.BooleanPulse booleanPulse(period=100)
    annotation (Placement(transformation(extent={{-92,22},{-72,42}})));
  PrecipitationDetection precipitationDetection
    annotation (Placement(transformation(extent={{-32,-20},{50,8}})));
  Sources.Physical.PrescribedR
    prescribedPhysicalPrecipitation
    annotation (Placement(transformation(extent={{-58,20},{-38,40}})));
equation
  connect(prescribedPhysicalPrecipitation.u, booleanPulse.y) annotation (Line(
      points={{-56,32},{-71,32}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(prescribedPhysicalPrecipitation.R, precipitationDetection.R)
    annotation (Line(
      points={{-38.1,30},{9,30},{9,8}},
      color={0,0,0},
      smooth=Smooth.None));
      annotation (preferredView="info",experiment(StopTime=1000, Interval=1),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}),      graphics),
    __Dymola_experimentSetupOutput,
    Documentation(info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Simulation to check the behaviour of the function model of&QUOT;Precipitation detection&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.9, p. 17]. </a></p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p>&QUOT;The sensor function <i>Precipitation detection</i> (RA-FL section 2, column 8; informative function block Figure 10) provides information on rain, snow or other forms of precipitation. This information is used, e. g., as input information for protection functions of the sunshade or for the closing of window casements.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.9, p. 17]</a></p>
<p>The calibration parameter PAR_CAL is used to choose the right contact logic.</p>
<p>By default PAR_CAL ist true which leads to a positive logic. That means if precipitation&nbsp; is detected R is true and R_ACT is set to true. If no&nbsp;precipitation&nbsp;is detected R is false and R_ACT is set to false.</p>
<p>If PAR_CAL is set to false the logic is complementary/inverted. If precipitation is detected R is false and R_ACT is set to true etc..</p>
<h4><span style=\"color:#008000\">Concept</span></h4>
<p>The simulation contains a boolean signal source to immitate a precipitation sensor. The signal is passed to a converter for changing the signal type from Modelica standard type to VDI 3813 semantic type. From there the signal goes to the sensor function, which converts the measured signal to an output signal. Because the positive logic has been choosen, the form of the output signal should be similar to the boolean input pulse. </p>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));

end TesterPrecipitationDetection;
