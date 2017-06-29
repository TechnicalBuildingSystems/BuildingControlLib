within BuildingControlLib.BuildingControl.VDI3813.Examples;
model TesterLevel4 "TODO"

    extends Modelica.Icons.Example;

  /* ******************************** */
  // VDI 3813 functions
  ActuatorFunctions.SunshadeActuator sunshadeActuator
    annotation (Placement(transformation(extent={{-60,180},{-20,220}})));
  ApplicationFunctions.Sunshading.PriorityControl priorityControl(
    PAR_PRIO_S_PROT=Types.EnumerationTypes.PAR_PRIO.highest,
    PAR_PRIO_S_MAINT=Types.EnumerationTypes.PAR_PRIO.high,
    PAR_PRIO_S_MAN=Types.EnumerationTypes.PAR_PRIO.medium,
    PAR_PRIO_S_AUTO=Types.EnumerationTypes.PAR_PRIO.low)
    annotation (Placement(transformation(extent={{-120,180},{-80,220}})));
 SensorFunctions.WindowMonitoring                         windowMonitoring
    annotation (Placement(transformation(extent={{-180,300},{-140,340}})));
  OperatorAndDisplayFunctions.ActuateSunshade actuateSunshade
    annotation (Placement(transformation(extent={{-178,180},{-140,220}})));
  /* ******************************** */
  // Boundary conditions for testing
  Sensors.SensorM                         sensorM
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-36,238})));
  Modelica.Blocks.Interaction.Show.BooleanValue booleanValue annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-36,266})));
  Modelica.Blocks.Sources.Constant
                               sourceS_PROT_Pos(k=-1)
    annotation (Placement(transformation(extent={{-284,280},{-264,300}})));

  Modelica.Blocks.Sources.Constant sourceS_PROT_Angle(k=10)
    annotation (Placement(transformation(extent={{-260,260},{-240,280}})));
  Modelica.Blocks.Sources.Constant
                               sourceS_MAINT_Pos(k=-1)
    annotation (Placement(transformation(extent={{-284,240},{-264,260}})));
  Modelica.Blocks.Sources.Constant sourceS_MAINT_Angle(k=20)
    annotation (Placement(transformation(extent={{-260,220},{-240,240}})));
    Modelica.Blocks.Sources.Constant
                                 sourceS_AUTO_Pos(k=0.5)
    annotation (Placement(transformation(extent={{-284,118},{-264,138}})));
  Modelica.Blocks.Sources.Constant sourceS_AUTO_Angle(k=50)
    annotation (Placement(transformation(extent={{-260,100},{-240,120}})));
  Sources.Sunshade.PrescribedS_PROT prescribedS_PROT
    annotation (Placement(transformation(extent={{-220,260},{-200,280}})));
  Sources.Sunshade.PrescribedS_MAINT prescribedS_MAINT
    annotation (Placement(transformation(extent={{-220,220},{-200,240}})));
  Sources.Sunshade.PrescribedS_AUTO prescribedS_AUTO
    annotation (Placement(transformation(extent={{-220,100},{-200,120}})));
    Modelica.Blocks.Sources.Constant
                                 sourceS_MAN_Pos1(k=-1)
    annotation (Placement(transformation(extent={{-284,158},{-264,178}})));
  Modelica.Blocks.Sources.Constant sourceS_MAN_Angle1(k=40)
    annotation (Placement(transformation(extent={{-260,140},{-240,160}})));
  Sources.Sunshade.PrescribedS_MAN prescribedS_MAN1
    annotation (Placement(transformation(extent={{-220,140},{-200,160}})));

  Sources.Physical.PrescribedB                         prescribedB1
    annotation (Placement(transformation(extent={{-220,298},{-200,318}})));
  Modelica.Blocks.Sources.BooleanStep sourceWindowMonitoring(
      startValue=false, startTime=0)
    "Boundary condition for window detector, if false then window is open"
    annotation (Placement(transformation(extent={{-260,300},{-240,320}})));

  Sources.Sunshade.PrescribedCMD_S                         prescribedCMD_S
    annotation (Placement(transformation(extent={{-220,180},{-200,200}})));
  Modelica.Blocks.Sources.BooleanPulse sourceCMD(
    width=50,
    period=10,
    startTime=10)
    "Command to deploy or not deploy the sunshade, if true then sunshade up"
    annotation (Placement(transformation(extent={{-260,180},{-240,200}})));
equation
  connect(sensorM.M, sunshadeActuator.M) annotation (Line(
      points={{-36,228},{-38,228},{-38,220.2},{-40.2,220.2}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(booleanValue.activePort, sensorM.y) annotation (Line(
      points={{-36,254.5},{-36,250}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(prescribedS_PROT.S_PROT,priorityControl. S_PROT) annotation (Line(
      points={{-198.1,270},{-130,270},{-130,204},{-118,204}},
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
      points={{-198.1,230},{-130,230},{-130,198},{-118,198}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedS_AUTO.S_AUTO,priorityControl. S_AUTO) annotation (Line(
      points={{-198.1,110},{-130,110},{-130,186},{-118,186}},
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
  connect(prescribedS_MAN1.S_MAN,priorityControl. S_MAN[2]) annotation (Line(
      points={{-198.1,150},{-130,150},{-130,192},{-118,192}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(priorityControl.S_SET, sunshadeActuator.S_SET) annotation (Line(
      points={{-76,200},{-54,200}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedB1.B,windowMonitoring. B) annotation (Line(
      points={{-199.9,308},{-190,308},{-190,346},{-160,346},{-160,340},{-160,
          340}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(sourceWindowMonitoring.y, prescribedB1.u) annotation (Line(
      points={{-239,310},{-228,310},{-228,310},{-218,310}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(windowMonitoring.B_WINDOW, priorityControl.B_WINDOW) annotation (Line(
      points={{-134,320},{-130,320},{-130,210},{-118,210}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(sourceCMD.y,prescribedCMD_S. u) annotation (Line(
      points={{-239,190},{-218,190}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(actuateSunshade.S_MAN, priorityControl.S_MAN[1]) annotation (Line(
      points={{-134.3,200},{-130,200},{-130,192},{-118,192}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedCMD_S.CMD, actuateSunshade.CMD) annotation (Line(
      points={{-204.1,186},{-196,186},{-196,208},{-184,208},{-184,224},{-170,
          224},{-170,220},{-159,220}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(sunshadeActuator.S_STA, actuateSunshade.S_STA) annotation (Line(
      points={{-14,200},{8,200},{8,110},{-130,110},{-130,168},{-190,168},{-190,
          200},{-172.3,200}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  annotation (preferredView="info",Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
          preserveAspectRatio=false), graphics), Icon(coordinateSystem(extent={{-100,
            -100},{100,100}})),
    experiment(StopTime=60, Interval=1),
    __Dymola_experimentSetupOutput,
    Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
end TesterLevel4;
