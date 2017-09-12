within BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Examples;
model TesterWindowMonitoring
  "Model for testing the functionality of WindowMonitoring"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.BooleanPulse sourceWindow(period=1)
    annotation (Placement(transformation(extent={{-70,2},{-50,22}})));
  WindowMonitoring windowMonitoring
    annotation (Placement(transformation(extent={{-34,-52},{38,-6}})));
  Sources.Physical.PrescribedB prescribedB
    annotation (Placement(transformation(extent={{-34,0},{-14,20}})));
equation
  connect(prescribedB.u, sourceWindow.y) annotation (Line(
      points={{-32,12},{-49,12}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(prescribedB.B, windowMonitoring.B) annotation (Line(
      points={{-13.9,10},{2.35,10},{2.35,-6},{2,-6}},
      color={0,0,0},
      smooth=Smooth.None));
      annotation ( preferredView="info", experiment(
        __Dymola_NumberOfIntervals=10),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}),  graphics),
    __Dymola_experimentSetupOutput,
    Documentation(info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Simulation to check the behaviour of the function model of &QUOT;Window monitoring&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.3, p. 11-12]. </a></p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p>&QUOT;The sensor function <i>Window monitoring</i> (RA-FL section 2, column 2; informative function block Figure 4) provides information on the open/closed state of, e. g., a window casement, a sash, a group of casements, etc., in terms of the binary states &ldquo;open &rdquo; or &ldquo;closed &rdquo;.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.3, p. 11-12]</a></p>
<p>The calibration parameter PAR_CAL is used to choose the right contact logic.</p>
<p>By default PAR_CAL ist true which leads to a negative logic. That means if the window is closed B is true and B_WINDOW is set to true. If the window&nbsp;is open B is false and B_WINDOW is set to false.</p>
<p>If PAR_CAL is set to false the logic is complementary/inverted. If the window is closed B is false and B_WINDOW is set to true etc..</p>
<h4><span style=\"color:#008000\">Concept</span></h4>
<p>The simulation contains a boolean signal source to immitate a window sensor. The signal is passed to a converter for changing the signal type from Modelica standard type to VDI 3813 semantic type. From there the signal goes to the window monitoring function, which converts the measured signal to an output signal depending on the choosen parameters of the function. By default the negative logic is activated. A closed window is represented by true signal of the source which leads to a false signal of the window monitoring. For an open window everything is complementary.</p>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
algorithm
when terminal() then
  assert( windowMonitoring.B_WINDOW.valueWindow == true, "ERROR") ;
end when;
end TesterWindowMonitoring;
