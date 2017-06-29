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

  Sources.Binary.PrescribedB_WINDOW prescribedB_WINDOW
    annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
  Sources.Sunshade.PrescribedS_PROT prescribedS_PROT
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  Sources.Sunshade.PrescribedS_MAINT prescribedS_MAINT
    annotation (Placement(transformation(extent={{-40,-20},{-20,0}})));
  Sources.Sunshade.PrescribedS_MAN prescribedS_MAN
    annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
  Sources.Sunshade.PrescribedS_AUTO prescribedS_AUTO
    annotation (Placement(transformation(extent={{-40,-100},{-20,-80}})));
equation
  connect(prescribedB_WINDOW.u, B_WINDOW.y) annotation (Line(
      points={{-38,70},{-59,70}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(prescribedB_WINDOW.B_WINDOW, priorityControl.B_WINDOW) annotation (Line(
      points={{-18.1,70},{-10,70},{-10,48.5},{5.6,48.5}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedS_PROT.S_PROT, priorityControl.S_PROT) annotation (Line(
      points={{-18.1,30},{-10,30},{-10,18.8},{5.6,18.8}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedS_PROT.u[1], S_PROT_Pos.y) annotation (Line(
      points={{-38,29},{-40,29},{-40,30},{-50,30},{-50,50},{-99,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prescribedS_PROT.u[2], S_PROT_Angle.y) annotation (Line(
      points={{-38,31},{-38,31},{-38,30},{-59,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prescribedS_MAINT.S_MAINT, priorityControl.S_MAINT) annotation (
      Line(
      points={{-18.1,-10},{-6,-10},{-6,-10.9},{5.6,-10.9}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedS_AUTO.S_AUTO, priorityControl.S_AUTO) annotation (Line(
      points={{-18.1,-90},{-10,-90},{-10,-70.3},{5.6,-70.3}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(S_MAINT_Pos.y, prescribedS_MAINT.u[1]) annotation (Line(
      points={{-99,10},{-50,10},{-50,-10},{-38,-10},{-38,-11}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(S_MAINT_Angle.y, prescribedS_MAINT.u[2]) annotation (Line(
      points={{-59,-10},{-38,-10},{-38,-10},{-38,-10},{-38,-10},{-38,-9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(S_MAN_Pos.y, prescribedS_MAN.u[1]) annotation (Line(
      points={{-99,-30},{-50,-30},{-50,-50},{-38,-50},{-38,-51}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(S_MAN_Angle.y, prescribedS_MAN.u[2]) annotation (Line(
      points={{-59,-50},{-38,-50},{-38,-50},{-38,-50},{-38,-50},{-38,-49}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(S_AUTO_Pos.y, prescribedS_AUTO.u[1]) annotation (Line(
      points={{-99,-70},{-50,-70},{-50,-90},{-38,-90},{-38,-91}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(S_AUTO_Angle.y, prescribedS_AUTO.u[2]) annotation (Line(
      points={{-57,-90},{-40,-90},{-40,-90},{-40,-90},{-40,-89},{-38,-89}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(priorityControl.S_MAN, prescribedS_MAN.S_MAN) annotation (Line(
      points={{5.6,-40.6},{-10.5,-40.6},{-10.5,-50},{-18.1,-50}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
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
