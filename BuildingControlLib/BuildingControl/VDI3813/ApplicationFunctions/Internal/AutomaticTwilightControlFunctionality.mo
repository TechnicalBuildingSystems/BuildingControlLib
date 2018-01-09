within BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Internal;
block AutomaticTwilightControlFunctionality
  "Functionality model to provide functionality of AutomaticTwilightControl"
  extends Interfaces.Partial.PartialFunctionality;

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Parameter
  parameter Modelica.SIunits.Illuminance PAR_H_ACT = 100
    "Sunset threshold value of outdoor illuminance in lux for sunblind activation.";
  parameter Modelica.SIunits.Illuminance PAR_H_DEA = 200
    "Sunrise threshold value of outdoor illuminance in lux for sunblind deactivation.";
  parameter Modelica.SIunits.Time PAR_TI = 300 "Hysteresis time for twilight recognition in seconds.";
  parameter Real[2] PAR_S_ACT = {1,0}
    "Setpoints for sun shade position and slat angle (in percent and degree) when sunset detected.";
  parameter Real[2] PAR_S_DEA = {0,30}
    "Setpoints for sun shade position and slat angle (in percent and degree) when sunrise detected.";

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Connectors
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.BooleanInput B_ON "Command to switch the function on or off (true == on / false == off)."
      annotation (Placement(transformation(extent={{-220,60},{-200,80}}),
          iconTransformation(extent={{-100,40},{-60,60}})));
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealInput
      H_OUT "Measured outdoor illuminance in lux." annotation (Placement(transformation(extent={{-220,20},
          {-200,40}}),
          iconTransformation(extent={{-100,0},{-60,20}})));
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealOutput[2]
      S_AUTO "New sunshade position." annotation (Placement(transformation(extent={{160,0},
          {180,20}}),
          iconTransformation(extent={{100,-10},{140,10}})));

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Components

Modelica.StateGraph.InitialStep s0
  annotation (Placement(transformation(extent={{-94,70},{-74,90}})));
inner Modelica.StateGraph.StateGraphRoot stateGraphRoot
  annotation (Placement(transformation(extent={{120,120},{140,140}})));
Modelica.StateGraph.Transition t0
  annotation (Placement(transformation(extent={{-70,70},{-50,90}})));
Modelica.Blocks.Math.MultiSum sunshadePosition(nu=3)
  annotation (Placement(transformation(extent={{120,40},{140,60}})));
Modelica.Blocks.Math.MultiSum slatAngle(nu=3)
  annotation (Placement(transformation(extent={{120,-80},{140,-60}})));
Modelica.StateGraph.Transition t1(condition=B_ON)
  annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=-90,
      origin={-54,30})));
Modelica.StateGraph.Transition t2(condition=H_OUT <=
      PAR_H_ACT,
    enableTimer=true,
    waitTime=PAR_TI)
                 annotation (Placement(transformation(
      extent={{-10,10},{10,-10}},
      rotation=270,
      origin={-16,-30})));
Modelica.StateGraph.Transition t3(condition=B_ON ==
      false) annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=90,
      origin={-2,-74})));
Modelica.StateGraph.Transition t7(condition=H_OUT >=
      PAR_H_DEA,
    enableTimer=true,
    waitTime=PAR_TI)
                 annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=90,
      origin={-90,-22})));
Modelica.StateGraph.Transition t6(condition=B_ON ==
      false) annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=90,
      origin={-12,32})));
  Modelica.StateGraph.StepWithSignal Idle(nOut=1, nIn=3) annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-50,50})));
  Modelica.StateGraph.StepWithSignal Deactivated(nIn=2, nOut=2) annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-50,0})));
  Modelica.StateGraph.StepWithSignal Activated(nIn=1, nOut=2) annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-50,-50})));

  sunShadeUtility posIdle(valFalse(y=0), valTrue(y=-1))
    annotation (Placement(transformation(extent={{40,60},{60,80}})));
  sunShadeUtility posDeactivated(valTrue(y = PAR_S_DEA[1]),valFalse(y = 0))
    annotation (Placement(transformation(extent={{40,0},{60,20}})));
    sunShadeUtility posActivated(valTrue(y = PAR_S_ACT[1]),valFalse(y = 0))
    annotation (Placement(transformation(extent={{40,-60},{60,-40}})));

  sunShadeUtility angDeactivated(valTrue(y = PAR_S_DEA[2]),valFalse(y = 0))
    annotation (Placement(transformation(extent={{60,-20},{80,0}})));
  sunShadeUtility angActivated(valTrue(y = PAR_S_ACT[2]),valFalse(y = 0))
    annotation (Placement(transformation(extent={{60,-80},{80,-60}})));
  sunShadeUtility angIdle(valTrue(y=0), valFalse(y=0))
    annotation (Placement(transformation(extent={{60,40},{80,60}})));
equation

connect(s0.outPort[1], t0.inPort) annotation (Line(points={{-73.5,80},{-73.5,80},
          {-64,80}},             color={0,0,0}));
  connect(t2.outPort, Activated.inPort[1]) annotation (Line(points={{-16,-31.5},
          {-16,-31.5},{-16,-34},{-44,-34},{-44,-34},{-50,-34},{-50,-39}},
                                            color={0,0,0}));
  connect(Activated.outPort[1], t3.inPort) annotation (Line(points={{-50.25,-60.5},
          {-50.25,-60},{-50,-60},{-50,-80},{-50,-92},{-2,-92},{-2,-78}},color={
          0,0,0}));
  connect(Activated.outPort[2], t7.inPort) annotation (Line(points={{-49.75,-60.5},
          {-49.75,-60},{-50,-60},{-50,-64},{-90,-64},{-90,-26}},        color={
          0,0,0}));
  connect(Activated.active, angActivated.u) annotation (Line(points={{-39,-50},{
          20,-50},{20,-70},{58,-70}},           color={255,0,255}));
  connect(Activated.active, posActivated.u)
    annotation (Line(points={{-39,-50},{-39,-50},{38,-50}},
                                                  color={255,0,255}));
  connect(angActivated.y, slatAngle.u[1]) annotation (Line(points={{81,-70},{
          120,-70},{120,-65.3333}}, color={0,0,127}));
  connect(posActivated.y, sunshadePosition.u[1]) annotation (Line(points={{61,-50},
          {61,-38},{94,-38},{94,50},{120,50},{120,54.6667}},      color={0,0,
          127}));
  connect(angIdle.y, slatAngle.u[2]) annotation (Line(points={{81,50},{84,50},{
          84,48},{88,48},{88,-70},{120,-70}}, color={0,0,127}));
  connect(posIdle.y, sunshadePosition.u[2]) annotation (Line(points={{61,70},{
          94,70},{94,50},{120,50}}, color={0,0,127}));
  connect(angDeactivated.y, slatAngle.u[3]) annotation (Line(points={{81,-10},{
          84,-10},{84,-10},{88,-10},{88,-74.6667},{120,-74.6667}}, color={0,0,
          127}));
  connect(posDeactivated.y, sunshadePosition.u[3]) annotation (Line(points={{61,10},
          {94,10},{94,45.3333},{120,45.3333}},     color={0,0,127}));
  connect(Deactivated.active, posDeactivated.u) annotation (Line(points={{-39,0},
          {20,0},{20,10},{38,10}}, color={255,0,255}));
  connect(Deactivated.active, angDeactivated.u) annotation (Line(points={{-39,0},
          {20,0},{20,-10},{58,-10}}, color={255,0,255}));
  connect(Idle.active, posIdle.u) annotation (Line(points={{-39,50},{20,50},{20,
          70},{30,70},{38,70}}, color={255,0,255}));
  connect(Idle.active, angIdle.u)
    annotation (Line(points={{-39,50},{58,50}}, color={255,0,255}));
  connect(t0.outPort, Idle.inPort[1]) annotation (Line(points={{-58.5,80},{-50,
          80},{-50,61},{-50.6667,61}},
                                   color={0,0,0}));
  connect(t6.outPort, Idle.inPort[2]) annotation (Line(points={{-12,33.5},{-12,33.5},
          {-12,80},{-50,80},{-50,61}}, color={0,0,0}));
  connect(t3.outPort, Idle.inPort[3]) annotation (Line(points={{-2,-72.5},{-2,
          -58},{8,-58},{8,-34},{8,80},{-50,80},{-50,62},{-49.3333,62},{-49.3333,
          61}},
        color={0,0,0}));
  connect(t1.inPort, Idle.outPort[1]) annotation (Line(points={{-54,34},{-52,34},
          {-52,39.5},{-50,39.5}}, color={0,0,0}));
  connect(t1.outPort, Deactivated.inPort[1]) annotation (Line(points={{-54,28.5},
          {-54,28.5},{-54,20},{-50,20},{-50,11},{-50.5,11}}, color={0,0,0}));
  connect(t7.outPort, Deactivated.inPort[2]) annotation (Line(points={{-90,-20.5},
          {-90,-20.5},{-90,14},{-50,14},{-50,12},{-49.5,12},{-49.5,11}}, color={
          0,0,0}));
  connect(Deactivated.outPort[1], t6.inPort) annotation (Line(points={{-50.25,-10.5},
          {-50,-10.5},{-50,-16},{-12,-16},{-12,2},{-12,28}}, color={0,0,0}));
  connect(Deactivated.outPort[2], t2.inPort) annotation (Line(points={{-49.75,-10.5},
          {-50,-10.5},{-50,-26},{-16,-26}}, color={0,0,0}));
  connect(sunshadePosition.y, S_AUTO[1]) annotation (Line(points={{141.7,50},{
          152,50},{152,5},{170,5}}, color={0,0,127}));
  connect(slatAngle.y, S_AUTO[2]) annotation (Line(points={{141.7,-70},{152,-70},
          {152,15},{170,15}}, color={0,0,127}));
  annotation (preferedView="Info",Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
          -100},{100,100}})),                  Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
",        info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<p>Block that implements functionality of &QUOT;Automatic twilight control&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.13, p. 51 - 53]</a>. </p>
<h4><span style=\"color: #008000\">Functional Description</span></h4>
<p>&QUOT;The function <i>Automatic twilight control</i> (RA-FL section 6, column 12; informative function block Figure 34) allows sunshading equipment to be positioned in accordance with outdoor brightness. For instance, it allows the closing of the sunshade during night hours in order to, reduce cooling down via the windows or reduce light emission by the building. To this end, the application function processes the input information about the illuminance outside the building, originating from the sensor function <i>Brightness measurement</i>, and generates actuating information for assigned actuator functions of the type <i>Sunshade actuator</i>.&QUOT;<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.13, p. 51 - 53]</a></p>
<p><br><br><b>Fig. 1: </b>UML activity diagram of the application function <i>Automatic twilight control,</i><a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.17, p. 59 - 61]</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/docUMLAkt_AutomaticTwilightControl.PNG\"/> </p></td>
</tr>
</table>
<p><br><h4><span style=\"color: #008000\">Input Variables</span></h4></p>
<p>The following table presents the input variables of the function as specified in the standard. </p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Datatype VDI3813</h4></p></td>
<td><p align=\"center\"><h4>Semantic data type</h4></p></td>
<td><p align=\"center\"><h4>Signal flow direction</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>B_ON</p></td>
<td valign=\"top\"><p>Binary</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Binary.ValueSwitchFunctionOnOffInput\">ValueSwitchFunctionOnOff</a> </p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Command to switch the function on or off (true == on / false == off).</p></td>
</tr>
<tr>
<td valign=\"top\"><p>H_OUT</p></td>
<td valign=\"top\"><p>Illuminance</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Illuminance.ValueIlluminanceOutdoorInput\">ValueIlluminanceOutdoor</a></p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Measured outdoor illuminance in lux.</p></td>
</tr>
</table>
<p><br><h4><span style=\"color: #008000\">Output Variables</span></h4></p>
<p>The following table presents the output variables of the function as specified in the standard.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Datatype VDI3813</h4></p></td>
<td><p align=\"center\"><h4>Semantic data type</h4></p></td>
<td><p align=\"center\"><h4>Signal flow direction</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>S_AUTO</p></td>
<td valign=\"top\"><p>Sunshade</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade.CommandSunshadeAutomaticOutput\">CommandSunshadeAutomatic</a> </p></td>
<td valign=\"top\"><p>Output</p></td>
<td valign=\"top\"><p>New sunshade position.</p></td>
</tr>
</table>
<p><br><br><b><span style=\"color: #008000;\">Parameters</span></b> </p>
<p>The following table presents the parameter of the function as specified in the standard.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_H_ACT</p></td>
<td valign=\"top\"><p>Sunset&nbsp;threshold&nbsp;value&nbsp;of&nbsp;outdoor&nbsp;illuminance&nbsp;in&nbsp;lux for sunblind activation.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_H_DEA</p></td>
<td valign=\"top\"><p>Sunrise&nbsp;threshold&nbsp;value&nbsp;of&nbsp;outdoor&nbsp;illuminance&nbsp;in&nbsp;lux&nbsp;for&nbsp;sunblind&nbsp;deactivation.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_TI</p></td>
<td valign=\"top\"><p>Hysteresis&nbsp;time&nbsp;for&nbsp;twilight&nbsp;recognition&nbsp;in&nbsp;seconds.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_S_ACT</p></td>
<td valign=\"top\"><p>Setpoints&nbsp;for&nbsp;sun&nbsp;shade&nbsp;position&nbsp;and&nbsp;slat&nbsp;angle&nbsp;(in&nbsp;percent&nbsp;and&nbsp;degree)&nbsp;when&nbsp;sunset&nbsp;detected.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_S_DEA</p></td>
<td valign=\"top\"><p>Setpoints&nbsp;for&nbsp;sun&nbsp;shade&nbsp;position&nbsp;and&nbsp;slat&nbsp;angle&nbsp;(in&nbsp;percent&nbsp;and&nbsp;degree)&nbsp;when&nbsp;sunrise&nbsp;detected.</p></td>
</tr>
</table>
</html>"),
  Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
end AutomaticTwilightControlFunctionality;
