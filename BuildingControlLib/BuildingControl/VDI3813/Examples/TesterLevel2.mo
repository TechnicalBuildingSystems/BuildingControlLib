within BuildingControlLib.BuildingControl.VDI3813.Examples;
model TesterLevel2 "Example with SunshadeActuator and PriorityControl"
    extends Modelica.Icons.Example;
  /* ******************************** */
  // VDI 3813 functions
  ActuatorFunctions.SunshadeActuator sunshadeActuator
    annotation (Placement(transformation(extent={{70,-24},{110,16}})));
  ApplicationFunctions.Sunshading.PriorityControl
                             priorityControl
    annotation (Placement(transformation(extent={{10,-24},{50,16}})));

  /* ******************************** */
  // Boundary conditions for testing
  Sensors.SensorM                         sensorM
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={94,34})));
  Modelica.Blocks.Interaction.Show.BooleanValue booleanValue annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={94,62})));
  Modelica.Blocks.Sources.Step sourceS_PROT_Pos(
    height=-2,
    offset=1,
    startTime=10)
    annotation (Placement(transformation(extent={{-114,76},{-94,96}})));

  Modelica.Blocks.Sources.BooleanStep     sourceB_WINDOW(startTime=60,
      startValue=true)
    "Constant source for window state in rooms (true = closed/ window is blocked , false = open/window is free"
    annotation (Placement(transformation(extent={{-90,96},{-70,116}})));
  Modelica.Blocks.Sources.Constant sourceS_PROT_Angle(k=10)
    annotation (Placement(transformation(extent={{-90,56},{-70,76}})));
  Modelica.Blocks.Sources.Step sourceS_MAINT_Pos(
    height=-2,
    offset=1,
    startTime=20)
    annotation (Placement(transformation(extent={{-114,36},{-94,56}})));
  Modelica.Blocks.Sources.Constant sourceS_MAINT_Angle(k=20)
    annotation (Placement(transformation(extent={{-90,16},{-70,36}})));
    Modelica.Blocks.Sources.Step sourceS_MAN_Pos(
    height=-2,
    offset=1,
    startTime=30)
    annotation (Placement(transformation(extent={{-112,-4},{-92,16}})));
  Modelica.Blocks.Sources.Constant sourceS_MAN_Angle(k=30)
    annotation (Placement(transformation(extent={{-90,-24},{-70,-4}})));
    Modelica.Blocks.Sources.Step sourceS_AUTO_Pos(
    height=-2,
    offset=1,
    startTime=50)
    annotation (Placement(transformation(extent={{-114,-86},{-94,-66}})));
  Modelica.Blocks.Sources.Constant sourceS_AUTO_Angle(k=50)
    annotation (Placement(transformation(extent={{-90,-104},{-70,-84}})));
  Sources.Binary.PrescribedB_WINDOW prescribedB_WINDOW
    annotation (Placement(transformation(extent={{-50,96},{-30,116}})));
  Sources.Sunshade.PrescribedS_PROT prescribedS_PROT
    annotation (Placement(transformation(extent={{-50,56},{-30,76}})));
  Sources.Sunshade.PrescribedS_MAINT prescribedS_MAINT
    annotation (Placement(transformation(extent={{-50,16},{-30,36}})));
  Sources.Sunshade.PrescribedS_MAN prescribedS_MAN
    annotation (Placement(transformation(extent={{-50,-24},{-30,-4}})));
  Sources.Sunshade.PrescribedS_AUTO prescribedS_AUTO
    annotation (Placement(transformation(extent={{-50,-104},{-30,-84}})));
    Modelica.Blocks.Sources.Step sourceS_MAN_Pos1(
    height=-2,
    offset=1,
    startTime=40)
    annotation (Placement(transformation(extent={{-114,-46},{-94,-26}})));
  Modelica.Blocks.Sources.Constant sourceS_MAN_Angle1(k=40)
    annotation (Placement(transformation(extent={{-90,-64},{-70,-44}})));
  Sources.Sunshade.PrescribedS_MAN prescribedS_MAN1
    annotation (Placement(transformation(extent={{-50,-64},{-30,-44}})));
equation
  connect(sensorM.M, sunshadeActuator.M) annotation (Line(
      points={{94,24},{92,24},{92,16.2},{89.8,16.2}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(booleanValue.activePort, sensorM.y) annotation (Line(
      points={{94,50.5},{94,46}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(prescribedB_WINDOW.u, sourceB_WINDOW.y) annotation (Line(
      points={{-48,106},{-69,106}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(prescribedB_WINDOW.B_WINDOW,priorityControl. B_WINDOW) annotation (Line(
      points={{-28.1,106},{-10,106},{-10,6},{12,6}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedS_PROT.S_PROT,priorityControl. S_PROT) annotation (Line(
      points={{-28.1,66},{-10,66},{-10,0},{12,0}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedS_PROT.u[1], sourceS_PROT_Pos.y) annotation (Line(
      points={{-48,65},{-58,65},{-58,86},{-93,86}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prescribedS_PROT.u[2], sourceS_PROT_Angle.y) annotation (Line(
      points={{-48,67},{-44,67},{-44,66},{-69,66}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prescribedS_MAINT.S_MAINT,priorityControl. S_MAINT) annotation (
      Line(
      points={{-28.1,26},{-10,26},{-10,-6},{12,-6}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedS_AUTO.S_AUTO,priorityControl. S_AUTO) annotation (Line(
      points={{-28.1,-94},{-10,-94},{-10,-18},{12,-18}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(sourceS_MAINT_Pos.y, prescribedS_MAINT.u[1]) annotation (Line(
      points={{-93,46},{-58,46},{-58,25},{-48,25}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceS_MAINT_Angle.y, prescribedS_MAINT.u[2]) annotation (Line(
      points={{-69,26},{-52,26},{-52,27},{-48,27}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceS_MAN_Pos.y, prescribedS_MAN.u[1]) annotation (Line(
      points={{-91,6},{-60,6},{-60,-15},{-48,-15}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceS_MAN_Angle.y, prescribedS_MAN.u[2]) annotation (Line(
      points={{-69,-14},{-46.5,-14},{-46.5,-13},{-48,-13}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceS_AUTO_Pos.y, prescribedS_AUTO.u[1]) annotation (Line(
      points={{-93,-76},{-60,-76},{-60,-95},{-48,-95}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceS_AUTO_Angle.y, prescribedS_AUTO.u[2]) annotation (Line(
      points={{-69,-94},{-52,-94},{-52,-93},{-48,-93}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(sourceS_MAN_Pos1.y, prescribedS_MAN1.u[1]) annotation (Line(
      points={{-93,-36},{-60,-36},{-60,-55},{-48,-55}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceS_MAN_Angle1.y, prescribedS_MAN1.u[2]) annotation (Line(
      points={{-69,-54},{-46.5,-54},{-46.5,-53},{-48,-53}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prescribedS_MAN.S_MAN,priorityControl. S_MAN[1]) annotation (Line(
      points={{-28.1,-14},{0,-14},{0,-12},{12,-12}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedS_MAN1.S_MAN,priorityControl. S_MAN[2]) annotation (Line(
      points={{-28.1,-54},{-10,-54},{-10,-12},{12,-12}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(priorityControl.S_SET, sunshadeActuator.S_SET) annotation (Line(
      points={{54,-4},{76,-4}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  annotation (preferredView="info",Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
          preserveAspectRatio=false), graphics), Icon(coordinateSystem(extent={{-100,
            -100},{100,100}})),
    experiment(StopTime=70, Interval=1),
    __Dymola_experimentSetupOutput,
    Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end TesterLevel2;
