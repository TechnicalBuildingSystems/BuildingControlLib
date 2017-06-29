within BuildingControlLib.BuildingControl.VDI3813.Examples;
model TesterActuateSunshadeSzenario2
  "Model for testing the functionality of  ActuateSunshade"
  import BuildingControlLib;
  extends Modelica.Icons.Example;
  BuildingControlLib.Utilities.Rooms.Room_withSunshadeLowOrder
    room_withSunshade annotation (Placement(transformation(
        extent={{-21,-23},{21,23}},
        rotation=90,
        origin={55,127})));
  Modelica.Blocks.Sources.BooleanPulse sunshadeTrigger(width=50, period=3600)
    "Open and closes sunshade of room. if true sunshade reduces irradiation i.e. deployed"
    annotation (Placement(transformation(extent={{-80,118},{-58,140}})));
  BuildingControl.VDI3813.OperatorAndDisplayFunctions.ActuateSunshade
    actuateSunshade
    annotation (Placement(transformation(extent={{-96,8},{-28,48}})));
  BuildingControl.VDI3813.ActuatorFunctions.SunshadeActuator sunshadeActuator
    annotation (Placement(transformation(extent={{4,8},{70,47}})));
  BuildingControl.VDI3813.Sensors.SensorM sensorM
    annotation (Placement(transformation(extent={{-25,-13},{25,13}},
        rotation=90,
        origin={21,85})));
  Sources.Sunshade.PrescribedCMD_S prescribedCMD_S
    annotation (Placement(transformation(extent={{-24,-13},{24,13}},
        rotation=270,
        origin={-53,84})));
  ApplicationFunctions.Sunshading.PriorityControl priorityControl
    annotation (Placement(transformation(extent={{-84,-62},{70,-2}})));
  Modelica.Blocks.Sources.Constant S_PROT_Pos(k=-1)
    annotation (Placement(transformation(extent={{-200,80},{-180,100}})));
  Modelica.Blocks.Sources.BooleanConstant B_WINDOW
    "Constant source for window state in rooms (true = closed/ window is blocked , false = open/window is free"
    annotation (Placement(transformation(extent={{-200,160},{-180,180}})));
  Modelica.Blocks.Sources.Constant S_PROT_Angle(k=10)
    annotation (Placement(transformation(extent={{-200,120},{-180,140}})));
  Modelica.Blocks.Sources.Constant S_MAINT_Pos(k=-1)
    annotation (Placement(transformation(extent={{-200,0},{-180,20}})));
  Modelica.Blocks.Sources.Constant S_MAINT_Angle(k=20)
    annotation (Placement(transformation(extent={{-200,40},{-180,60}})));
    Modelica.Blocks.Sources.Constant S_AUTO_Pos(k=-1)
    annotation (Placement(transformation(extent={{-200,-80},{-180,-60}})));
  Modelica.Blocks.Sources.Constant S_AUTO_Angle(k=40)
    annotation (Placement(transformation(extent={{-200,-40},{-180,-20}})));
  Sources.Binary.PrescribedB_WINDOW prescribedB_WINDOW
    annotation (Placement(transformation(extent={{-160,160},{-140,180}})));
  Sources.Sunshade.PrescribedS_PROT prescribedS_PROT
    annotation (Placement(transformation(extent={{-160,100},{-140,120}})));
  Sources.Sunshade.PrescribedS_MAINT prescribedS_MAINT
    annotation (Placement(transformation(extent={{-160,20},{-140,40}})));
  Sources.Sunshade.PrescribedS_AUTO prescribedS_AUTO
    annotation (Placement(transformation(extent={{-160,-60},{-140,-40}})));
equation
  connect(sensorM.y, room_withSunshade.uOperateSunblind) annotation (Line(
      points={{21,115},{22,115},{22,127},{34.3,127}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(sunshadeActuator.S_STA, actuateSunshade.S_STA) annotation (Line(
      points={{79.9,27.5},{82,27.5},{82,166},{-100,166},{-100,28},{-85.8,28}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));

  connect(sensorM.M, sunshadeActuator.M) annotation (Line(
      points={{21,60},{22,60},{22,54},{36.67,54},{36.67,47.195}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(sunshadeTrigger.y, prescribedCMD_S.u) annotation (Line(
      points={{-56.9,129},{-52,129},{-52,103.2},{-53,103.2}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(actuateSunshade.CMD, prescribedCMD_S.CMD) annotation (Line(
      points={{-62,48},{-62,62},{-58.2,62},{-58.2,69.84}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(actuateSunshade.S_MAN, priorityControl.S_MAN) annotation (Line(
      points={{-17.8,28},{-17.8,6},{-94,6},{-94,-44},{-76.3,-44}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(priorityControl.S_SET, sunshadeActuator.S_SET) annotation (Line(
      points={{85.4,-32},{85.4,6},{0,6},{0,27.5},{13.9,27.5}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedB_WINDOW.u,B_WINDOW. y) annotation (Line(
      points={{-158,170},{-179,170}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(prescribedB_WINDOW.B_WINDOW, priorityControl.B_WINDOW) annotation (Line(
      points={{-138.1,170},{-110,170},{-110,-17},{-76.3,-17}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedS_PROT.S_PROT, priorityControl.S_PROT) annotation (Line(
      points={{-138.1,110},{-120,110},{-120,-26},{-76.3,-26}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedS_PROT.u[1],S_PROT_Pos. y) annotation (Line(
      points={{-158,109},{-168,109},{-168,90},{-179,90}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prescribedS_PROT.u[2],S_PROT_Angle. y) annotation (Line(
      points={{-158,111},{-168,111},{-168,130},{-179,130}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prescribedS_MAINT.S_MAINT, priorityControl.S_MAINT) annotation (
      Line(
      points={{-138.1,30},{-130,30},{-130,-35},{-76.3,-35}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedS_AUTO.S_AUTO, priorityControl.S_AUTO) annotation (Line(
      points={{-138.1,-50},{-140,-50},{-140,-53},{-76.3,-53}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(S_MAINT_Pos.y,prescribedS_MAINT. u[1]) annotation (Line(
      points={{-179,10},{-168,10},{-168,28},{-158,28},{-158,29}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(S_MAINT_Angle.y,prescribedS_MAINT. u[2]) annotation (Line(
      points={{-179,50},{-168,50},{-168,32},{-158,32},{-158,31}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(S_AUTO_Pos.y,prescribedS_AUTO. u[1]) annotation (Line(
      points={{-179,-70},{-170,-70},{-170,-51},{-158,-51}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(S_AUTO_Angle.y,prescribedS_AUTO. u[2]) annotation (Line(
      points={{-179,-30},{-170,-30},{-170,-49},{-158,-49}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (preferredView="info",Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics),
    experiment(StopTime=86400, Interval=60),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Block that implements function &QUOT;Actuate sunshade&QUOT; from VDI 3813 [1, section 6.4.3, p. 26 - 27]. </p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p>&QUOT;The operator function<i> Actuate sunshade</i> (RA-FL section 5, column 2; informative function block Figure 17) converts a manual actuation to output information which is then available as input information to the application functions. The following mode of pushbutton actuation has proven useful for positioning: Brief actuation of the button (leading and trailing edges following in immediate succession) generates output information on the relative change of slat angle depending on the parameterisation of the sensor. In contrast, depressing the button for a longer time generates output information regarding the rising or descending of the sunshade. Operator control actions using different operating devices may differ from the mode of functioning described for pushbuttons. However, they must in principle be capable of generating the same output information.&QUOT; [1, section 6.4.3, p. 26 - 27]</p>
<h4><span style=\"color:#008000\">Concept</span></h4>
<p><br>BLABLABLABLABLA</p>
<p><b><font style=\"color: #008000; \">References</font></b> </p>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"><tr>
<td><p>[1]</p></td>
<td><p>VDI 3813-2 - Geb&auml;udeautomation (GA) - Blatt 2: Raumautomationsfunktionen (RA-Funktionen). Beuth Verlag GmbH, Berlin, 2011. </p></td>
</tr>
</table>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end TesterActuateSunshadeSzenario2;
