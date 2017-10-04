within BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Examples;
model TesterPresenceDetection
  "Model for testing the functionality of PresenceDetection"
  extends Modelica.Icons.Example;
  PresenceDetection presenceDetection(holdingActive=true)
    "Function Presence detection holding is activated"
    annotation (Placement(transformation(extent={{0,-20},{80,40}})));
  Sources.Physical.PrescribedP prescribedP
    "converter from MSL Boolean to prescribed P"
    annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
  Modelica.Blocks.Sources.BooleanTable sourceP(startValue=true, table={0,250,
        400}) annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
  PresenceDetection presenceDetection1(holdingActive=false)
    "Function Presence detection holding is deactivated"
    annotation (Placement(transformation(extent={{0,-100},{80,-40}})));
equation
  connect(prescribedP.P, presenceDetection.P) annotation (Line(
      points={{-19.9,50},{40,50},{40,40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(sourceP.y, prescribedP.u) annotation (Line(
      points={{-59,50},{-48,50},{-48,52},{-38,52}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(presenceDetection1.P, prescribedP.P) annotation (Line(
      points={{40,-40},{40,-30},{-12,-30},{-12,50},{-19.9,50}},
      color={0,0,0},
      smooth=Smooth.None));
      annotation ( preferredView="info", experiment(StopTime=1000),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}),  graphics),
    __Dymola_experimentSetupOutput,
    Documentation(info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Simulation to check the behaviour of the function model of &QUOT;Presence detection&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.2, p. 10-11]</a>.</p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p>&QUOT;The sensor function <i>Presence detection</i> (RA-FL section 2, column 1, see Section 7.3, Bild 61; informative function block Figure 3) automatically detects the presence of persons in the room and passes the output information of either the &ldquo;present&rdquo; or the &ldquo;absent&rdquo; state to those application functions whose response is determined by the room occupancy state. Due to the use in connection with lighting functions, the output information must be generated without any delay when the status of the evaluation unit changes.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.2, p. 10-11]</a></p>
<h4><span style=\"color:#008000\">Concept</span></h4>
<p>The simulation contains a boolean signal source to imitate a presence sensor. The signal is passed to a converter for changing the signal type from Modelica standard type to VDI 3813 semantic type. From there the signal goes to two presence detection functions. The holding of the presence state is activated in one of the functions and deactivated in the other. If there is an input pulse that is shorter than the holding time, one output should follow the input without time delay, the other output should stay in the &QUOT;presence detected&QUOT; state as long as the holding time.</p>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));

end TesterPresenceDetection;
