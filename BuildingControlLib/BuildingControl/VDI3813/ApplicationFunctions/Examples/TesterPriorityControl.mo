within BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Examples;
model TesterPriorityControl
  "Model for testing the functionality of PriorityControl"
  extends Modelica.Icons.Example;

  Modelica.Blocks.Sources.Step     S_PROT_Pos(
    startTime=200,
    height=-1.2,
    offset=0.2)
    annotation (Placement(transformation(extent={{-120,40},{-100,60}})));
  Sunshading.PriorityControl priorityControl
    annotation (Placement(transformation(extent={{0,-100},{112,98}})));
  Modelica.Blocks.Sources.BooleanStep     B_WINDOW(startTime=100)
    "Constant source for window state in rooms (true = closed/ window is blocked , false = open/window is free"
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Modelica.Blocks.Sources.Constant S_PROT_Angle(k=10)
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));

  Modelica.Blocks.Sources.Step     S_MAINT_Pos(
    height=-1.3,
    offset=0.3,
    startTime=300)
    annotation (Placement(transformation(extent={{-120,0},{-100,20}})));
  Modelica.Blocks.Sources.Constant S_MAINT_Angle(k=20)
    annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));

    Modelica.Blocks.Sources.Step     S_MAN_Pos(
    startTime=400,
    height=-1.4,
    offset=0.4)
    annotation (Placement(transformation(extent={{-120,-40},{-100,-20}})));
  Modelica.Blocks.Sources.Constant S_MAN_Angle(k=30)
    annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));

    Modelica.Blocks.Sources.Step     S_AUTO_Pos(
    height=-1.5,
    offset=0.5,
    startTime=500)
    annotation (Placement(transformation(extent={{-120,-80},{-100,-60}})));
  Modelica.Blocks.Sources.Constant S_AUTO_Angle(k=40)
    annotation (Placement(transformation(extent={{-78,-100},{-58,-80}})));

equation

  connect(B_WINDOW.y, priorityControl.B_WINDOW) annotation (Line(points={{-59,
          70},{-28,70},{-28,48.5},{5.6,48.5}}, color={255,0,255}));
  connect(S_PROT_Pos.y, priorityControl.S_PROT[1]) annotation (Line(points={{
          -99,50},{-48,50},{-48,13.85},{5.6,13.85}}, color={0,0,127}));
  connect(S_PROT_Angle.y, priorityControl.S_PROT[2]) annotation (Line(points={{
          -59,30},{-28,30},{-28,23.75},{5.6,23.75}}, color={0,0,127}));
  connect(S_MAINT_Pos.y, priorityControl.S_MAINT[1]) annotation (Line(points={{
          -99,10},{-48,10},{-48,-15.85},{5.6,-15.85}}, color={0,0,127}));
  connect(S_MAINT_Angle.y, priorityControl.S_MAINT[2]) annotation (Line(points=
          {{-59,-10},{5.6,-10},{5.6,-5.95}}, color={0,0,127}));
  connect(S_MAN_Pos.y, priorityControl.S_MAN[1]) annotation (Line(points={{-99,
          -30},{-48,-30},{-48,-45.55},{5.6,-45.55}}, color={0,0,127}));
  connect(S_MAN_Angle.y, priorityControl.S_MAN[2]) annotation (Line(points={{
          -59,-50},{-30,-50},{-30,-35.65},{5.6,-35.65}}, color={0,0,127}));
  connect(S_AUTO_Pos.y, priorityControl.S_AUTO[1]) annotation (Line(points={{
          -99,-70},{5.6,-70},{5.6,-75.25}}, color={0,0,127}));
  connect(S_AUTO_Angle.y, priorityControl.S_AUTO[2]) annotation (Line(points={{
          -57,-90},{-28,-90},{-28,-65.35},{5.6,-65.35}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),                                                                               Icon(
        coordinateSystem(extent={{-100,-100},{100,100}})),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput,preferedView="Info",
    Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
", info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Block that implements functionality of &QUOT;Priority control&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.12, p. 49 - 51]</a>. </p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p>&QUOT;The function<i> Occupancy evaluation</i> (RA-FL section 6, column 1; informative function block Figure 23) evaluates the output information received from <i>Presence detection</i> and from operator functions (<i>Signal presence</i>) in order to determine the occupancy state in a room for all further application functions. Various options of room check-in and check-out can thus be implemented.&QUOT;<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.12, p. 49 - 51]</a></p>
<h4><span style=\"color:#008000\">Concept</span></h4>
<p></p>
</html>"));
end TesterPriorityControl;
