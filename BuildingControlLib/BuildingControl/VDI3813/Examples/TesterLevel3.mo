within BuildingControlLib.BuildingControl.VDI3813.Examples;
model TesterLevel3
  "Example with SunshadeActuator, PriorityControl, and Window sensor"
    extends Modelica.Icons.Example;
  /* ******************************** */
  // VDI 3813 functions
  ActuatorFunctions.SunshadeActuator sunshadeActuator
    annotation (Placement(transformation(extent={{-100,160},{-60,200}})));
  ApplicationFunctions.Sunshading.PriorityControl priorityControl(
    PAR_PRIO_S_PROT=Types.EnumerationTypes.PAR_PRIO.highest,
    PAR_PRIO_S_MAINT=Types.EnumerationTypes.PAR_PRIO.high,
    PAR_PRIO_S_MAN=Types.EnumerationTypes.PAR_PRIO.medium,
    PAR_PRIO_S_AUTO=Types.EnumerationTypes.PAR_PRIO.low)
    annotation (Placement(transformation(extent={{-160,160},{-120,200}})));
 SensorFunctions.WindowMonitoring                         windowMonitoring
    annotation (Placement(transformation(extent={{-220,300},{-200,320}})));

  /* ******************************** */
  // Boundary conditions for testing
  Sensors.SensorM                         sensorM
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-90,230})));
  Modelica.Blocks.Interaction.Show.BooleanValue booleanValue annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-90,262})));
  Modelica.Blocks.Sources.Step sourceS_PROT_Pos(
    height=-2,
    offset=1,
    startTime=10)
    annotation (Placement(transformation(extent={{-284,280},{-264,300}})));

  Modelica.Blocks.Sources.Constant sourceS_PROT_Angle(k=10)
    annotation (Placement(transformation(extent={{-260,260},{-240,280}})));
  Modelica.Blocks.Sources.Step sourceS_MAINT_Pos(
    height=-2,
    offset=1,
    startTime=20)
    annotation (Placement(transformation(extent={{-284,240},{-264,260}})));
  Modelica.Blocks.Sources.Constant sourceS_MAINT_Angle(k=20)
    annotation (Placement(transformation(extent={{-260,220},{-240,240}})));
    Modelica.Blocks.Sources.Step sourceS_MAN_Pos(
    height=-2,
    offset=1,
    startTime=30)
    annotation (Placement(transformation(extent={{-282,200},{-262,220}})));
  Modelica.Blocks.Sources.Constant sourceS_MAN_Angle(k=30)
    annotation (Placement(transformation(extent={{-260,180},{-240,200}})));
    Modelica.Blocks.Sources.Step sourceS_AUTO_Pos(
    height=-2,
    offset=1,
    startTime=50)
    annotation (Placement(transformation(extent={{-284,118},{-264,138}})));
  Modelica.Blocks.Sources.Constant sourceS_AUTO_Angle(k=50)
    annotation (Placement(transformation(extent={{-260,100},{-240,120}})));
  Sources.Sunshade.PrescribedS_PROT prescribedS_PROT
    annotation (Placement(transformation(extent={{-220,260},{-200,280}})));
  Sources.Sunshade.PrescribedS_MAINT prescribedS_MAINT
    annotation (Placement(transformation(extent={{-220,220},{-200,240}})));
  Sources.Sunshade.PrescribedS_MAN prescribedS_MAN
    annotation (Placement(transformation(extent={{-220,180},{-200,200}})));
  Sources.Sunshade.PrescribedS_AUTO prescribedS_AUTO
    annotation (Placement(transformation(extent={{-220,100},{-200,120}})));
    Modelica.Blocks.Sources.Step sourceS_MAN_Pos1(
    height=-2,
    offset=1,
    startTime=40)
    annotation (Placement(transformation(extent={{-284,158},{-264,178}})));
  Modelica.Blocks.Sources.Constant sourceS_MAN_Angle1(k=40)
    annotation (Placement(transformation(extent={{-260,140},{-240,160}})));
  Sources.Sunshade.PrescribedS_MAN prescribedS_MAN1
    annotation (Placement(transformation(extent={{-220,140},{-200,160}})));

  Sources.Physical.PrescribedB                         prescribedB1
    annotation (Placement(transformation(extent={{-260,300},{-240,320}})));
  Modelica.Blocks.Sources.BooleanStep sourceWindowMonitoring(startTime=5,
      startValue=false)
    "Boundary condition for window detector, if false then window is open"
    annotation (Placement(transformation(extent={{-310,300},{-290,320}})));
equation
  connect(sensorM.M, sunshadeActuator.M) annotation (Line(
      points={{-90,220},{-86,220},{-86,216},{-80,216},{-80,200.2},{-80.2,200.2}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(booleanValue.activePort, sensorM.y) annotation (Line(
      points={{-90,250.5},{-90,242}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(prescribedS_PROT.S_PROT,priorityControl. S_PROT) annotation (Line(
      points={{-198.1,270},{-180,270},{-180,184},{-158,184}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedS_PROT.u[1], sourceS_PROT_Pos.y) annotation (Line(
      points={{-218,269},{-228,269},{-228,290},{-263,290}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prescribedS_PROT.u[2], sourceS_PROT_Angle.y) annotation (Line(
      points={{-218,271},{-214,271},{-214,270},{-239,270}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prescribedS_MAINT.S_MAINT,priorityControl. S_MAINT) annotation (
      Line(
      points={{-198.1,230},{-180,230},{-180,178},{-158,178}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedS_AUTO.S_AUTO,priorityControl. S_AUTO) annotation (Line(
      points={{-198.1,110},{-180,110},{-180,166},{-158,166}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(sourceS_MAINT_Pos.y, prescribedS_MAINT.u[1]) annotation (Line(
      points={{-263,250},{-228,250},{-228,229},{-218,229}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceS_MAINT_Angle.y, prescribedS_MAINT.u[2]) annotation (Line(
      points={{-239,230},{-222,230},{-222,231},{-218,231}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceS_MAN_Pos.y, prescribedS_MAN.u[1]) annotation (Line(
      points={{-261,210},{-230,210},{-230,189},{-218,189}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceS_MAN_Angle.y, prescribedS_MAN.u[2]) annotation (Line(
      points={{-239,190},{-216.5,190},{-216.5,191},{-218,191}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceS_AUTO_Pos.y, prescribedS_AUTO.u[1]) annotation (Line(
      points={{-263,128},{-230,128},{-230,109},{-218,109}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceS_AUTO_Angle.y, prescribedS_AUTO.u[2]) annotation (Line(
      points={{-239,110},{-222,110},{-222,111},{-218,111}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(sourceS_MAN_Pos1.y, prescribedS_MAN1.u[1]) annotation (Line(
      points={{-263,168},{-230,168},{-230,149},{-218,149}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceS_MAN_Angle1.y, prescribedS_MAN1.u[2]) annotation (Line(
      points={{-239,150},{-216.5,150},{-216.5,151},{-218,151}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prescribedS_MAN.S_MAN,priorityControl. S_MAN[1]) annotation (Line(
      points={{-198.1,190},{-180,190},{-180,172},{-158,172}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedS_MAN1.S_MAN,priorityControl. S_MAN[2]) annotation (Line(
      points={{-198.1,150},{-180,150},{-180,172},{-158,172}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(priorityControl.S_SET, sunshadeActuator.S_SET) annotation (Line(
      points={{-116,180},{-94,180}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedB1.B,windowMonitoring. B) annotation (Line(
      points={{-239.9,310},{-238,310},{-238,322},{-206,322},{-206,320},{-210,
          320}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(sourceWindowMonitoring.y, prescribedB1.u) annotation (Line(
      points={{-289,310},{-274,310},{-274,312},{-258,312}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(windowMonitoring.B_WINDOW, priorityControl.B_WINDOW) annotation (Line(
      points={{-197,310},{-180,310},{-180,190},{-158,190}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  annotation (preferredView="info",
Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
          preserveAspectRatio=false), graphics), Icon(coordinateSystem(extent={{-100,
            -100},{100,100}})),
    experiment(StopTime=100, __Dymola_NumberOfIntervals=100),
    __Dymola_experimentSetupOutput,
    Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end TesterLevel3;
