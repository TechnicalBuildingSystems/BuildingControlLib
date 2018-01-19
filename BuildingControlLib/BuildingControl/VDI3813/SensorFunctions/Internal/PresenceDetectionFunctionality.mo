within BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Internal;
block PresenceDetectionFunctionality
  "Algorithm model to provide functionality of PresenceDetection"

  extends
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.Partial.PartialFunctionality;

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Connectors
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.PhysicalBooleanInput P
    "Physical signal of presence detection(true = presence detected / false = no presence detected)."
    annotation (Placement(transformation(extent={{-20,80},{20,120}}),
        iconTransformation(extent={{-20,80},{20,120}})));

  BuildingControlLib.BuildingControl.VDI3813.Interfaces.BooleanOutput P_AUTO
    "Boolean presence state in a room which comes from a sensor(true = occupied / false = unoccupied)."
    annotation (Placement(transformation(extent={{100,-20},{160,20}}),
        iconTransformation(extent={{100,-20},{160,20}})));
  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Parameter definition
  parameter Modelica.SIunits.Time PAR_HOLD = 500
    "Holding time of presence state after a detection in seconds (i.e. 500 results in of presence activation after detection)";
  parameter Boolean holdingActive = false
    "Flag for the presence holding process (true = holding is activated / false = holding is deactivated)";

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Components

  Modelica.StateGraph.InitialStep initialStep(nIn = 1, nOut = 1)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-70,90})));
  Modelica.StateGraph.StepWithSignal holdingIsActive
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},
        rotation=270,
        origin={2,-48})));
  Modelica.StateGraph.StepWithSignal holdingNotActive
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-38,-48})));
  Modelica.StateGraph.Transition t1(condition = not holdingActive and P)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-38,-18})));
  Modelica.StateGraph.Transition t3(
    waitTime = PAR_HOLD,
    enableTimer = true,
    condition = not P) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={2,-78})));
  Modelica.StateGraph.Transition t2(condition = holdingActive and P)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={2,-18})));
  Modelica.StateGraph.Transition t4(
    waitTime = PAR_HOLD,
    enableTimer = false,
    condition = not P) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-38,-78})));
  inner Modelica.StateGraph.StateGraphRoot stateGraphRoot
    annotation (Placement(transformation(extent={{68,66},{88,86}})));
  Modelica.StateGraph.StepWithSignal evaluateHoldingActive(nIn = 3, nOut = 2)
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-20,32})));
  Modelica.StateGraph.Transition t5(condition = true) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-70,72})));
  Modelica.Blocks.MathBoolean.Or or1(nu = 3)
    annotation (Placement(transformation(extent={{26,-36},{38,-24}})));
  Modelica.Blocks.Logical.Not not1
    annotation (Placement(transformation(extent={{0,20},{20,40}})));
equation
  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Connection equations
  connect(t1.outPort, holdingNotActive.inPort[1]) annotation (Line(
      points={{-38,-19.5},{-38,-37}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(t2.outPort, holdingIsActive.inPort[1]) annotation (Line(
      points={{2,-19.5},{2,-37}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(t3.inPort, holdingIsActive.outPort[1]) annotation (Line(
      points={{2,-74},{2,-58.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(t4.inPort, holdingNotActive.outPort[1]) annotation (Line(
      points={{-38,-74},{-38,-58.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(initialStep.outPort[1], t5.inPort) annotation (Line(
      points={{-70,79.5},{-70,76}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(evaluateHoldingActive.outPort[1], t1.inPort) annotation (Line(
      points={{-20.25,21.5},{-20.25,2},{-38,2},{-38,-14}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(evaluateHoldingActive.outPort[2], t2.inPort) annotation (Line(
      points={{-19.75,21.5},{-19.75,12},{-20,12},{-20,2},{2,2},{2,-14}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(t5.outPort, evaluateHoldingActive.inPort[1]) annotation (Line(
      points={{-70,70.5},{-70,60},{-20,60},{-20,43},{-20.6667,43}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(t4.outPort, evaluateHoldingActive.inPort[2]) annotation (Line(
      points={{-38,-79.5},{-38,-94},{-74,-94},{-74,60},{-20,60},{-20,43}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(t3.outPort, evaluateHoldingActive.inPort[3]) annotation (Line(
      points={{2,-79.5},{2,-96},{40,-96},{40,60},{-20,60},{-20,43},{-19.3333,43}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(or1.u[1], holdingIsActive.active) annotation (Line(
      points={{26,-27.2},{18,-27.2},{18,-48},{13,-48}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(holdingNotActive.active, or1.u[2]) annotation (Line(
      points={{-27,-48},{-22,-48},{-22,12},{18,12},{18,-30},{26,-30}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(evaluateHoldingActive.active, not1.u) annotation (Line(
      points={{-9,32},{-6,32},{-6,30},{-2,30}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(not1.y, or1.u[3]) annotation (Line(
      points={{21,30},{24,30},{24,-32.8},{26,-32.8}},
      color={255,0,255},
      smooth=Smooth.None));
  //connect(or1.y, P_AUTO.y);
  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Output value
  connect(or1.y, P_AUTO) annotation (Line(points={{38.9,-30},{74,-30},{74,0},{130,
          0}}, color={255,0,255}));
   annotation (preferredView="info",Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),           Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Documentation(info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Block that implements the functionality of &QUOT;Presence detection&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.2, p. 10-11]</a>. </p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p>&QUOT;The sensor function <i>Presence detection</i> (RA-FL section 2, column 1, see Section 7.3, Bild 61; informative function block Figure 3) automatically detects the presence of persons in the room and passes the output information of either the &ldquo;present&rdquo; or the &ldquo;absent&rdquo; state to those application functions whose response is determined by the room occupancy state. Due to the use in connection with lighting functions, the output information must be generated without any delay when the status of the evaluation unit changes.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.2, p. 10-11]</a></p>

</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end PresenceDetectionFunctionality;
