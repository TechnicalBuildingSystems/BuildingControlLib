within BuildingControlLib.BuildingControl.VDI3813.Examples;
model TesterSunshadeActuatorSzenario
  "Model for testing the functionality of  SunshadeActuator"
  import BuildingControlLib;
  extends Modelica.Icons.Example;
  BuildingControlLib.Utilities.Rooms.Room_withSunshade room_withSunshade
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={34,140})));
  Modelica.Blocks.Sources.BooleanPulse sunshadeTrigger(width=50, period=3600)
    "Open and closes sunshade of room. if true sunshade reduces irradiation i.e. deployed"
    annotation (Placement(transformation(extent={{-140,144},{-120,164}})));
  BuildingControl.VDI3813.OperatorAndDisplayFunctions.ActuateSunshade
    actuateSunshade
    annotation (Placement(transformation(extent={{-138,98},{-88,124}})));
  BuildingControl.VDI3813.ActuatorFunctions.SunshadeActuator sunshadeActuator
    annotation (Placement(transformation(extent={{20,81},{64,109}})));
  BuildingControl.VDI3813.Sensors.SensorM sensorM
    annotation (Placement(transformation(extent={{-8,130},{12,150}})));
  Sources.Sunshade.PrescribedCMD_S prescribedCMD_S
    annotation (Placement(transformation(extent={{-100,144},{-80,164}})));
  ApplicationFunctions.Sunshading.PriorityControl priorityControl
    annotation (Placement(transformation(extent={{-42,-62},{38,-2}})));
  Modelica.Blocks.Sources.Constant S_PROT_Pos(k=-1)
    annotation (Placement(transformation(extent={{-240,90},{-220,110}})));
  Modelica.Blocks.Sources.BooleanConstant B_WINDOW
    "Constant source for window state in rooms (true = closed/ window is blocked , false = open/window is free"
    annotation (Placement(transformation(extent={{-240,124},{-220,144}})));
  Modelica.Blocks.Sources.Constant S_PROT_Angle(k=10)
    annotation (Placement(transformation(extent={{-216,72},{-196,92}})));
  Modelica.Blocks.Sources.Constant S_MAINT_Pos(k=-1)
    annotation (Placement(transformation(extent={{-240,52},{-220,72}})));
  Modelica.Blocks.Sources.Constant S_MAINT_Angle(k=20)
    annotation (Placement(transformation(extent={{-218,36},{-198,56}})));
    Modelica.Blocks.Sources.Constant S_AUTO_Pos(k=0.4)
    annotation (Placement(transformation(extent={{-238,-54},{-218,-34}})));
  Modelica.Blocks.Sources.Constant S_AUTO_Angle(k=40)
    annotation (Placement(transformation(extent={{-212,-76},{-192,-56}})));
  Sources.Binary.PrescribedB_WINDOW prescribedB_WINDOW
    annotation (Placement(transformation(extent={{-200,124},{-180,144}})));
  Sources.Sunshade.PrescribedS_PROT prescribedS_PROT
    annotation (Placement(transformation(extent={{-180,62},{-160,82}})));
  Sources.Sunshade.PrescribedS_MAINT prescribedS_MAINT
    annotation (Placement(transformation(extent={{-182,24},{-162,44}})));
  Sources.Sunshade.PrescribedS_AUTO prescribedS_AUTO
    annotation (Placement(transformation(extent={{-178,-60},{-158,-40}})));
equation
  connect(sensorM.y, room_withSunshade.uOperateSunblind) annotation (Line(
      points={{14,140},{25,140}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(sunshadeActuator.S_STA, actuateSunshade.S_STA) annotation (Line(
      points={{70.6,95},{80,95},{80,180},{-156,180},{-156,110},{-144,110},{-144,
          111},{-130.5,111}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));

  connect(sensorM.M, sunshadeActuator.M) annotation (Line(
      points={{-8,140},{-22,140},{-22,120},{41.78,120},{41.78,109.14}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(sunshadeTrigger.y, prescribedCMD_S.u) annotation (Line(
      points={{-119,154},{-98,154}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(actuateSunshade.CMD, prescribedCMD_S.CMD) annotation (Line(
      points={{-113,124},{-113,132},{-60,132},{-60,150},{-84.1,150}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(actuateSunshade.S_MAN, priorityControl.S_MAN) annotation (Line(
      points={{-80.5,111},{-80.5,110},{-80,110},{-80,90},{-88,90},{-88,-44},{
          -38,-44}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(priorityControl.S_SET, sunshadeActuator.S_SET) annotation (Line(
      points={{46,-32},{46,16},{0,16},{0,95},{26.6,95}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedB_WINDOW.u,B_WINDOW. y) annotation (Line(
      points={{-198,134},{-219,134}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(prescribedB_WINDOW.B_WINDOW, priorityControl.B_WINDOW) annotation (Line(
      points={{-178.1,134},{-156,134},{-156,-17},{-38,-17}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedS_PROT.S_PROT, priorityControl.S_PROT) annotation (Line(
      points={{-158.1,72},{-144,72},{-144,-26},{-38,-26}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedS_PROT.u[1],S_PROT_Pos. y) annotation (Line(
      points={{-178,71},{-184,71},{-184,72},{-190,72},{-190,100},{-219,100}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prescribedS_PROT.u[2],S_PROT_Angle. y) annotation (Line(
      points={{-178,73},{-190,73},{-190,82},{-195,82}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prescribedS_MAINT.S_MAINT, priorityControl.S_MAINT) annotation (
      Line(
      points={{-160.1,34},{-146,34},{-146,-35},{-38,-35}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedS_AUTO.S_AUTO, priorityControl.S_AUTO) annotation (Line(
      points={{-156.1,-50},{-142,-50},{-142,-53},{-38,-53}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(S_MAINT_Pos.y,prescribedS_MAINT. u[1]) annotation (Line(
      points={{-219,62},{-190,62},{-190,32},{-186,32},{-186,33},{-180,33}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(S_MAINT_Angle.y,prescribedS_MAINT. u[2]) annotation (Line(
      points={{-197,46},{-198,46},{-198,35},{-180,35}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(S_AUTO_Pos.y,prescribedS_AUTO. u[1]) annotation (Line(
      points={{-217,-44},{-182,-44},{-182,-51},{-176,-51}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(S_AUTO_Angle.y,prescribedS_AUTO. u[2]) annotation (Line(
      points={{-191,-66},{-182,-66},{-182,-49},{-176,-49}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (preferredView="info",Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics),
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
