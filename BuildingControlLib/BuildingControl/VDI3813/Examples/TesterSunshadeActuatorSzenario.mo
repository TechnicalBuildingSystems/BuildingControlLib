within BuildingControlLib.BuildingControl.VDI3813.Examples;
model TesterSunshadeActuatorSzenario
  "Model for testing the functionality of  SunshadeActuator"
  import BuildingControlLib;
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.BooleanPulse sunshadeTrigger(width=50, period=3600)
    "Open and closes sunshade of room. if true sunshade reduces irradiation i.e. deployed"
    annotation (Placement(transformation(extent={{-76,2},{-56,22}})));
  BuildingControl.VDI3813.OperatorAndDisplayFunctions.ActuateSunshade
    actuateSunshade
    annotation (Placement(transformation(extent={{-78,-30},{-28,-4}})));
  BuildingControl.VDI3813.ActuatorFunctions.SunshadeActuator sunshadeActuator
    annotation (Placement(transformation(extent={{32,37},{76,65}})));
  ApplicationFunctions.Sunshading.PriorityControl priorityControl
    annotation (Placement(transformation(extent={{0,-30},{80,30}})));
  Modelica.Blocks.Sources.Constant S_PROT_Pos(k=-1)
    annotation (Placement(transformation(extent={{-80,38},{-60,58}})));
  Modelica.Blocks.Sources.BooleanConstant B_WINDOW
    "Constant source for window state in rooms (true = closed/ window is blocked , false = open/window is free"
    annotation (Placement(transformation(extent={{-30,46},{-10,66}})));
  Modelica.Blocks.Sources.Constant S_PROT_Angle(k=10)
    annotation (Placement(transformation(extent={{-40,6},{-20,26}})));
  Modelica.Blocks.Sources.Constant S_MAINT_Pos(k=-1)
    annotation (Placement(transformation(extent={{-68,-62},{-48,-42}})));
  Modelica.Blocks.Sources.Constant S_MAINT_Angle(k=20)
    annotation (Placement(transformation(extent={{-34,-62},{-14,-42}})));
    Modelica.Blocks.Sources.Constant S_AUTO_Pos(k=0.4)
    annotation (Placement(transformation(extent={{-70,-94},{-50,-74}})));
  Modelica.Blocks.Sources.Constant S_AUTO_Angle(k=40)
    annotation (Placement(transformation(extent={{-36,-94},{-16,-74}})));
  BuildingControlLib.Utilities.Rooms.RoomSunshade roomSunshade
    annotation (Placement(transformation(extent={{74,78},{94,98}})));
equation
  connect(sunshadeActuator.S_STA, actuateSunshade.S_STA) annotation (Line(
      points={{82.6,51},{88,51},{88,72},{-84,72},{-84,-17},{-70.5,-17}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));

  connect(actuateSunshade.S_MAN, priorityControl.S_MAN) annotation (Line(
      points={{-20.5,-17},{-20.5,-12},{4,-12}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(priorityControl.S_SET, sunshadeActuator.S_SET) annotation (Line(
      points={{88,0},{88,34},{18,34},{18,51},{38.6,51}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(sunshadeTrigger.y, actuateSunshade.CMD) annotation (Line(points={{-55,
          12},{-52,12},{-52,-4},{-53,-4}}, color={255,0,255}));
  connect(S_AUTO_Pos.y, priorityControl.S_AUTO[1]) annotation (Line(points={{
          -49,-84},{-44,-84},{-44,-68},{-4,-68},{-4,-22.5},{4,-22.5}}, color={0,
          0,127}));
  connect(S_AUTO_Angle.y, priorityControl.S_AUTO[2]) annotation (Line(points={{
          -15,-84},{-8,-84},{-8,-19.5},{4,-19.5}}, color={0,0,127}));
  connect(S_MAINT_Angle.y, priorityControl.S_MAINT[2]) annotation (Line(points=
          {{-13,-52},{-10,-52},{-10,-1.5},{4,-1.5}}, color={0,0,127}));
  connect(S_MAINT_Pos.y, priorityControl.S_MAINT[1]) annotation (Line(points={{
          -47,-52},{-40,-52},{-40,-36},{-14,-36},{-14,-4.5},{4,-4.5}}, color={0,
          0,127}));
  connect(B_WINDOW.y, priorityControl.B_WINDOW) annotation (Line(points={{-9,56},
          {-4,56},{-4,15},{4,15}}, color={255,0,255}));
  connect(S_PROT_Angle.y, priorityControl.S_PROT[2]) annotation (Line(points={{
          -19,16},{-8,16},{-8,7.5},{4,7.5}}, color={0,0,127}));
  connect(S_PROT_Pos.y, priorityControl.S_PROT[1]) annotation (Line(points={{
          -59,48},{-38,48},{-38,34},{-12,34},{-12,4.5},{4,4.5}}, color={0,0,127}));
  connect(roomSunshade.uSunblind, sunshadeActuator.M) annotation (Line(points={
          {75,83},{75,83.5},{53.78,83.5},{53.78,65.14}}, color={255,0,255}));
  annotation (preferredView="info",Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),
    experiment(StopTime=86400, Interval=60),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Block that implements the functionality of &QUOT;Sunshade actuator&QUOT; from VDI 3813 [1, section 6.2.3, p. 20 - 21]. </p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p>&QUOT;Sunshade actuators position shading devices based on input information received from, e. g., weather protection, application (e. g. anti-glare) and operator functions. Each protective element is represented as a <i>Sunshade actuator</i> function (RA-FL section 3, column 2; informative function block Figure 13). The sunshade must be controllable by percent for the position (open position = 0 &percnt;; closed position = 100 &percnt;) and additionally, in the case of adjustable slats, by degrees of slat tilt (e. g. slat angles between &ndash;80&deg; and 40&deg;), i. e. the actuator function must be capable of moving the sunshade to any mechanically reachable position. The maximum and minimum slat angles and the total runtime of the sunshade must be adjustable. The current shade position and slat tilt are available as output information for display functions. It must be ensured that the response time of the actuator following receipt of input information for positioning is less than 200 ms so as to avoid any delay perceivable to the operator. For a definite position to be assumed in case of voltage recovery, parameterisation of this position value is required. The function is allocated to the room shell (fixed rooms) or the segment shell (flexible room layout).&QUOT; [1, section 6.2.3, p. 20 - 21]</p>
<h4><span style=\"color:#008000\">Concept</span></h4>
<p>The simulation contains a boolean signal source to imitate a sensor. The signal is passed to a converter for changing the signal type from Modelica standard type to VDI 3813 semantic type. From there the signal goes to the sensor function, which converts the measured signal to an output signal depending on the chosen parameters of the function.</p>
<p><br><b><font style=\"color: #008000; \">References</font></b> </p>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"><tr>
<td><p>[1]</p></td>
<td><p>VDI 3813-2 - Geb&auml;udeautomation (GA) - Blatt 2: Raumautomationsfunktionen (RA-Funktionen). Beuth Verlag GmbH, Berlin, 2011. - Reproduced with the permission of the Verein Deutscher Ingenieure e.V.</p></td>
</tr>
</table>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
end TesterSunshadeActuatorSzenario;
