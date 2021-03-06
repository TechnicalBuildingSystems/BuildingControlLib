within BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions;
package Internal "Algorithm models that implement the functionality of the application functions"
  extends Modelica.Icons.InternalPackage;








  block AutomaticSolarControlFunctionality
    "Model to provide functionality of AutomaticSolarControl"
    extends Interfaces.Partial.PartialFunctionality;
    /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
    // Parameter
    parameter Modelica.SIunits.Illuminance PAR_H_ACT = 11000
      "Threshold value of outdoor illuminance in lux for sunblind activation.";
    parameter Modelica.SIunits.Illuminance PAR_H_DEA = 10000
      "Threshold value of outdoor illuminance in lux for sunblind deactivation.";
    parameter Modelica.SIunits.Time PAR_TI = 300 "Hysteresis time for activation in seconds.";
    parameter Real[2] PAR_S_ACT = {1,0}
      "Setpoints for sun shade position and slat angle (in percent and degree) when high illuminance is.";
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
  Modelica.StateGraph.Transition t2(
      enableTimer=true,
      waitTime=PAR_TI,
    condition=H_OUT >= PAR_H_ACT)
                   annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-16,-30})));
  Modelica.StateGraph.Transition t3(condition=B_ON ==
        false) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-2,-74})));
  Modelica.StateGraph.Transition t7(
      enableTimer=true,
      waitTime=PAR_TI,
    condition=H_OUT <= PAR_H_DEA)
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

    sunShadeUtility posOperating(               valFalse(y = 0), valTrue(y=-1))
      annotation (Placement(transformation(extent={{40,60},{60,80}})));
    sunShadeUtility posDeactivated(valTrue(y = PAR_S_DEA[1]),valFalse(y = 0))
      annotation (Placement(transformation(extent={{40,0},{60,20}})));
      sunShadeUtility posActivated(valTrue(y = PAR_S_ACT[1]),valFalse(y = 0))
      annotation (Placement(transformation(extent={{40,-60},{60,-40}})));

    sunShadeUtility angDeactivated(valTrue(y = PAR_S_DEA[2]),valFalse(y = 0))
      annotation (Placement(transformation(extent={{60,-20},{80,0}})));
    sunShadeUtility angActivated(valTrue(y = PAR_S_ACT[2]),valFalse(y = 0))
      annotation (Placement(transformation(extent={{60,-80},{80,-60}})));
    sunShadeUtility angOperating(valTrue(y = 0),valFalse(y = 0))
      annotation (Placement(transformation(extent={{60,40},{80,60}})));
  equation

  connect(s0.outPort[1], t0.inPort) annotation (Line(points={{-73.5,80},{-73.5,80},
            {-64,80}},             color={0,0,0}));
    connect(t2.outPort, Activated.inPort[1]) annotation (Line(points={{-16,
          -31.5},{-16,-31.5},{-16,-34},{-44,-34},{-50,-34},{-50,-39}},
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
          120,-70},{120,-65.3333}},   color={0,0,127}));
    connect(posActivated.y, sunshadePosition.u[1]) annotation (Line(points={{61,-50},
          {61,-38},{94,-38},{94,50},{120,50},{120,54.6667}},        color={0,0,
            127}));
    connect(angOperating.y, slatAngle.u[2]) annotation (Line(points={{81,50},{84,
            50},{84,48},{88,48},{88,-70},{120,-70}}, color={0,0,127}));
    connect(posOperating.y, sunshadePosition.u[2]) annotation (Line(points={{61,
            70},{94,70},{94,50},{120,50}}, color={0,0,127}));
    connect(angDeactivated.y, slatAngle.u[3]) annotation (Line(points={{81,-10},
          {84,-10},{84,-10},{88,-10},{88,-74.6667},{120,-74.6667}},  color={0,0,
            127}));
    connect(posDeactivated.y, sunshadePosition.u[3]) annotation (Line(points={{61,10},
          {94,10},{94,45.3333},{120,45.3333}},       color={0,0,127}));
    connect(Deactivated.active, posDeactivated.u) annotation (Line(points={{-39,0},
            {20,0},{20,10},{38,10}}, color={255,0,255}));
    connect(Deactivated.active, angDeactivated.u) annotation (Line(points={{-39,0},
            {20,0},{20,-10},{58,-10}}, color={255,0,255}));
    connect(Idle.active, posOperating.u) annotation (Line(points={{-39,50},{20,50},
            {20,70},{30,70},{38,70}}, color={255,0,255}));
    connect(Idle.active, angOperating.u)
      annotation (Line(points={{-39,50},{58,50}}, color={255,0,255}));
    connect(t0.outPort, Idle.inPort[1]) annotation (Line(points={{-58.5,80},{
          -50,80},{-50,61},{-50.6667,61}},
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
          150,50},{150,5},{170,5}}, color={0,0,127}));
  connect(slatAngle.y, S_AUTO[2]) annotation (Line(points={{141.7,-70},{152,-70},
          {152,15},{170,15}}, color={0,0,127}));
    annotation (preferedView="Info",Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),                  Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
",          info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<p>Block that implements functionality of &QUOT;Automatic solar control&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.14, p. 53 - 55]</a>. </p>
<h4><span style=\"color: #008000\">Functional Description</span></h4>
<p>&QUOT;The <i>Automatic solar control</i> (RA-FL section 6, column 13; informative function block Figure 35) prevents user discomfort due to exposure to high-intensity sunrays by moving the sunshade to a defined fixed anti-glare position as soon as the daylight exceeds a defined illuminance. With fading brightness, the sunshade is moved to a parking position. To this end, the application function processes the input information about the illuminance measured on the facade, as provided by the sensor function <i>Brightness measurement</i>, and generates actuating information for assigned actuator functions of the type <i>Sunshade actuator</i>.&QUOT;<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.14, p. 53 - 55]</a></p>
<p><br><br><b>Fig. 1: </b>UML activity diagram of the application function <i>Automatic solar control,</i><a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.17, p. 59 - 61]</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/docUMLAkt_AutomaticSolarControl.PNG\"/> </p></td>
</tr>
</table>
</html>"),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
  end AutomaticSolarControlFunctionality;




block WeatherProtectionFunctionality
  "Algorithm model to provide functionality of WeatherProtection"
    extends Interfaces.Partial.PartialFunctionality;
  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Parameter
  parameter Modelica.SIunits.Velocity PAR_WIND = 0
    "Threshold for critical wind velocity.";
  parameter   Modelica.SIunits.Temp_K PAR_FROST = 1
    "Threshold for critical temperatures before icing.";
  parameter Modelica.SIunits.Time PAR_DEICE = 3600
    "Protection time for the sunshade de-icing after cold temperatures and rain.";
  parameter Real[2] PAR_PROT = {1,0}
    "Sunshade position in protection mode.";

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Connectors

  Interfaces.RealInput W_ACT
    "Measured wind velocity in m/s." annotation (Placement(transformation(
          extent={{-200,60},{-180,80}}),iconTransformation(extent={{-100,20},{-60,
            60}})));
  Interfaces.RealInput T_OUT
    "Measured outdoor air temperature in Kelvin." annotation (Placement(
        transformation(extent={{-200,20},{-180,40}}),iconTransformation(extent={
            {-100,-20},{-60,20}})));
  Interfaces.BooleanInput R_ACT "Measured precipitation."
    annotation (Placement(transformation(extent={{-200,-20},{-180,0}}),
        iconTransformation(extent={{-100,-60},{-60,-20}})));
  Interfaces.RealOutput[2] S_PROT
    "New sunshade position." annotation (Placement(transformation(extent={{200,20},
            {220,40}}),iconTransformation(extent={{100,-20},{140,20}})));

  inner Modelica.StateGraph.StateGraphRoot stateGraphRoot
    annotation (Placement(transformation(extent={{180,100},{200,120}})));
  Modelica.StateGraph.InitialStep s0
    annotation (Placement(transformation(extent={{-220,100},{-200,120}})));
  Modelica.StateGraph.Transition t0
    annotation (Placement(transformation(extent={{-180,100},{-160,120}})));
  Modelica.Blocks.Math.MultiSum sunshadePosition(nu=5)
    annotation (Placement(transformation(extent={{140,60},{160,80}})));
  Modelica.Blocks.Math.MultiSum slatAngle(nu=5)
    annotation (Placement(transformation(extent={{140,-60},{160,-40}})));
  Modelica.StateGraph.StepWithSignal s1(nOut=2, nIn=4) annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-90,90})));
  Modelica.StateGraph.Transition t1(condition=W_ACT >=
        PAR_WIND) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-90,70})));
  Modelica.StateGraph.StepWithSignal s2 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-90,50})));
  Modelica.StateGraph.Transition t3(condition=R_ACT)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,30})));
  Modelica.StateGraph.StepWithSignal s3(nOut=2) annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-50,10})));
  Modelica.StateGraph.Transition t2(condition=W_ACT <=
        PAR_WIND) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-90,30})));
  Modelica.StateGraph.Transition t5(condition=T_OUT
         <= PAR_FROST) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,-10})));
  Modelica.StateGraph.StepWithSignal s4(nIn=2) annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-50,-30})));
  sunshadeUtilityInactiveShade sunshadeUtilityInactiveShade1
    annotation (Placement(transformation(extent={{40,80},{60,100}})));
  sunshadeUtilityNeutralSlat sunshadeUtilityNeutralSlat1
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  sunshadeUtilityOpenSlat sunshadeUtilityOpenSlat1
    annotation (Placement(transformation(extent={{60,20},{80,40}})));
  sunshadeUtilityOpenShade sunshadeUtilityOpenShade1
    annotation (Placement(transformation(extent={{40,40},{60,60}})));
  sunshadeUtilityInactiveShade sunshadeUtilityInactiveShade2
    annotation (Placement(transformation(extent={{40,0},{60,20}})));
  sunshadeUtilityNeutralSlat sunshadeUtilityNeutralSlat2
    annotation (Placement(transformation(extent={{60,-20},{80,0}})));
  sunshadeUtilityOpenShade sunshadeUtilityOpenShade2
    annotation (Placement(transformation(extent={{40,-40},{60,-20}})));
  sunshadeUtilityOpenSlat sunshadeUtilityOpenSlat2
    annotation (Placement(transformation(extent={{60,-60},{80,-40}})));
  Modelica.StateGraph.Transition t4(condition=R_ACT == false)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-90,-10})));
  Modelica.StateGraph.Transition t6(condition=T_OUT
         >= PAR_FROST) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,-50})));
  Modelica.StateGraph.StepWithSignal s5(nOut=2) annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-50,-70})));
  Modelica.StateGraph.Transition t8(condition=T_OUT
         <= PAR_FROST) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,-90})));
  Modelica.StateGraph.Transition t7(enableTimer=true, waitTime=PAR_DEICE)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-90,-90})));
  sunshadeUtilityOpenShade sunshadeUtilityOpenShade3
    annotation (Placement(transformation(extent={{40,-80},{60,-60}})));
  sunshadeUtilityOpenSlat sunshadeUtilityOpenSlat3
    annotation (Placement(transformation(extent={{60,-100},{80,-80}})));
equation

  connect(s0.outPort[1], t0.inPort) annotation (Line(points={{-199.5,110},{-186,
          110},{-174,110}}, color={0,0,0}));
  connect(t0.outPort, s1.inPort[1]) annotation (Line(points={{-168.5,110},{-90,
          110},{-90,100},{-90,101},{-90.75,101}}, color={0,0,0}));
  connect(s1.outPort[1], t1.inPort) annotation (Line(points={{-90.25,79.5},{-90,
          79.5},{-90,74}}, color={0,0,0}));
  connect(t1.outPort, s2.inPort[1])
    annotation (Line(points={{-90,68.5},{-90,61}}, color={0,0,0}));
  connect(s2.outPort[1], t2.inPort)
    annotation (Line(points={{-90,39.5},{-90,36.75},{-90,34}}, color={0,0,0}));
  connect(t2.outPort, s1.inPort[2]) annotation (Line(points={{-90,28.5},{-90,20},
          {-120,20},{-120,110},{-90.25,110},{-90.25,101}}, color={0,0,0}));
  connect(s3.inPort[1], t3.outPort)
    annotation (Line(points={{-50,21},{-50,21},{-50,28.5}}, color={0,0,0}));
  connect(s3.outPort[1], t5.inPort) annotation (Line(points={{-50.25,-0.5},{-50,
          -3.25},{-50,-6}}, color={0,0,0}));
  connect(t5.outPort, s4.inPort[1]) annotation (Line(points={{-50,-11.5},{-50,
          -16},{-50,-19},{-50.5,-19}}, color={0,0,0}));
  connect(s1.active, sunshadeUtilityInactiveShade1.u)
    annotation (Line(points={{-79,90},{-20,90},{38,90}}, color={255,0,255}));
  connect(s1.active, sunshadeUtilityNeutralSlat1.u) annotation (Line(points={{
          -79,90},{0,90},{0,70},{58,70}}, color={255,0,255}));
  connect(s2.active, sunshadeUtilityOpenShade1.u)
    annotation (Line(points={{-79,50},{38,50},{38,50}}, color={255,0,255}));
  connect(s2.active, sunshadeUtilityOpenSlat1.u) annotation (Line(points={{-79,
          50},{0,50},{0,30},{58,30}}, color={255,0,255}));
  connect(s3.active, sunshadeUtilityInactiveShade2.u)
    annotation (Line(points={{-39,10},{38,10}}, color={255,0,255}));
  connect(s3.active, sunshadeUtilityNeutralSlat2.u) annotation (Line(points={{
          -39,10},{0,10},{0,-10},{58,-10}}, color={255,0,255}));
  connect(s4.active, sunshadeUtilityOpenShade2.u)
    annotation (Line(points={{-39,-30},{38,-30}}, color={255,0,255}));
  connect(s4.active, sunshadeUtilityOpenSlat2.u) annotation (Line(points={{-39,
          -30},{0,-30},{0,-50},{58,-50}}, color={255,0,255}));
  connect(t3.inPort, s1.outPort[2]) annotation (Line(points={{-50,34},{-50,34},
          {-50,78},{-50,79.5},{-70,79.5},{-89.75,79.5}}, color={0,0,0}));
  connect(t4.inPort, s3.outPort[2]) annotation (Line(points={{-90,-6},{-90,-6},
          {-90,-0.5},{-49.75,-0.5}}, color={0,0,0}));
  connect(t4.outPort, s1.inPort[3]) annotation (Line(points={{-90,-11.5},{-90,
          -20},{-120,-20},{-120,110},{-89.75,110},{-89.75,101}}, color={0,0,0}));
  connect(s4.outPort[1], t6.inPort) annotation (Line(points={{-50,-40.5},{-50,
          -43.25},{-50,-46}}, color={0,0,0}));
  connect(t6.outPort, s5.inPort[1])
    annotation (Line(points={{-50,-51.5},{-50,-59}}, color={0,0,0}));
  connect(s5.outPort[1], t8.inPort) annotation (Line(points={{-50.25,-80.5},{
          -50,-83.25},{-50,-86}}, color={0,0,0}));
  connect(s5.outPort[2], t7.inPort) annotation (Line(points={{-49.75,-80.5},{
          -70,-80.5},{-90,-80.5},{-90,-82},{-90,-86}}, color={0,0,0}));
  connect(s5.active, sunshadeUtilityOpenShade3.u)
    annotation (Line(points={{-39,-70},{0,-70},{38,-70}}, color={255,0,255}));
  connect(s5.active, sunshadeUtilityOpenSlat3.u) annotation (Line(points={{-39,
          -70},{0,-70},{0,-90},{58,-90}}, color={255,0,255}));
  connect(t7.outPort, s1.inPort[4]) annotation (Line(points={{-90,-91.5},{-90,
          -100},{-120,-100},{-120,110},{-89.25,110},{-89.25,101}}, color={0,0,0}));
  connect(t8.outPort, s4.inPort[2]) annotation (Line(points={{-50,-91.5},{-50,
          -100},{-20,-100},{-20,-16},{-49.5,-16},{-49.5,-19}}, color={0,0,0}));
  connect(sunshadeUtilityInactiveShade1.y, sunshadePosition.u[1]) annotation (
      Line(points={{61,90},{100,90},{100,75.6},{140,75.6}}, color={0,0,127}));
  connect(sunshadeUtilityOpenShade1.y, sunshadePosition.u[2]) annotation (Line(
        points={{61,50},{100,50},{100,72.8},{140,72.8}}, color={0,0,127}));
  connect(sunshadeUtilityInactiveShade2.y, sunshadePosition.u[3]) annotation (
      Line(points={{61,10},{100,10},{100,70},{140,70}}, color={0,0,127}));
  connect(sunshadeUtilityOpenShade2.y, sunshadePosition.u[4]) annotation (Line(
        points={{61,-30},{100,-30},{100,67.2},{140,67.2}}, color={0,0,127}));
  connect(sunshadeUtilityOpenShade3.y, sunshadePosition.u[5]) annotation (Line(
        points={{61,-70},{100,-70},{100,64.4},{140,64.4}}, color={0,0,127}));
  connect(sunshadeUtilityNeutralSlat1.y, slatAngle.u[1]) annotation (Line(
        points={{81,70},{110,70},{110,-44.4},{140,-44.4}}, color={0,0,127}));
  connect(sunshadeUtilityOpenSlat3.y, slatAngle.u[2]) annotation (Line(points={
          {81,-90},{110,-90},{110,-47.2},{140,-47.2}}, color={0,0,127}));
  connect(sunshadeUtilityOpenSlat2.y, slatAngle.u[3]) annotation (Line(points={
          {81,-50},{110,-50},{110,-50},{140,-50}}, color={0,0,127}));
  connect(sunshadeUtilityNeutralSlat2.y, slatAngle.u[4]) annotation (Line(
        points={{81,-10},{110,-10},{110,-52.8},{140,-52.8}}, color={0,0,127}));
  connect(sunshadeUtilityOpenSlat1.y, slatAngle.u[5]) annotation (Line(points={
          {81,30},{110,30},{110,-55.6},{140,-55.6}}, color={0,0,127}));
  connect(sunshadePosition.y, S_PROT[1]) annotation (Line(points={{161.7,70},{
          174,70},{174,25},{210,25}}, color={0,0,127}));
  connect(slatAngle.y, S_PROT[2]) annotation (Line(points={{161.7,-50},{174,-50},
          {174,35},{210,35}}, color={0,0,127}));
  annotation (preferedView="Info",Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),           Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
",        info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<p>Block that implements functionality of &QUOT;Weather protection&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.18, p. 61 - 63]</a>. </p>
<h4><span style=\"color: #008000\">Functional Description</span></h4>
<p>&QUOT;The function <i>Weather protection</i> (RA-FL section 6, column 17; informative function block Figure 39) prevents damage to external sunshading equipment due to wind, rain or icing. Whereas wind velocity and rain are measured directly by means of sensors, the icing hazard is predicted indirectly through evaluation of precipitation in combination with the outdoor temperature. To this end, the application function processes the input information from the sensor functions <i>Wind velocity measurement</i>, <i>Temperature measurement</i> and <i>Precipitation detection</i> and, in case of a damage hazard, generates a positioning command for the application function <i>Priority control</i> of the sunshade.&QUOT;<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.18, p. 61 - 63]</a></p>
<p><br><b>Fig. 1: </b>UML activity diagram of the application function <i>Weather protection, </i><a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.19, p. 63 - 65]</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/docUMLAkt_WeatherProtection.PNG\"/> </p></td>
</tr>
</table>
</html>"));
end WeatherProtectionFunctionality;








  annotation(preferedView="Info", Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
end Internal;
