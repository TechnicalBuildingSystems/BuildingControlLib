within BuildingControlLib.BuildingControl.VDI3814.Interfaces;
partial model PartialState "Class for VDI 3814-6 states"

  Modelica.StateGraph.StepWithSignal
    state(
      nIn = nIn,
      nOut = nOut)
    annotation (Placement(transformation(extent={{-20,20},{20,-20}},
        rotation=270,
        origin={0,-40})));
  Modelica.StateGraph.TransitionWithSignal
    transitions[ nIn]
    annotation (Placement(transformation(extent={{21,-21},{-21,21}},
        rotation=90,
        origin={0,49})));

  /* ***   ***   ***   ***   ***   ***   ***   ***   ***   */
  // Connectors
  Modelica.Blocks.Interfaces.BooleanInput u[ nIn]
    "Input for conditions of transitions"                                                annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={60,104}), iconTransformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={60,106})));
   Modelica.Blocks.Interfaces.BooleanOutput active
    "Boolean output indicating activitiy of state"                                                annotation (Placement(
        transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},
            {120,10}})));
  Modelica.StateGraph.Interfaces.Step_out outPort[ nOut]
    "Port for one, or more output transitions"
    annotation (Placement(transformation(extent={{-88,-126},{12,-96}}),
        iconTransformation(extent={{-10,-104},{12,-96}})));
  Modelica.StateGraph.Interfaces.Transition_in inPort[ nIn]
    "Array of input ports to transitions"
    annotation (Placement(transformation(extent={{-17,-17},{17,17}},
        rotation=270,
        origin={0,100}), iconTransformation(
        extent={{-17,-17},{17,17}},
        rotation=270,
        origin={0,118})));

  /* ***   ***   ***   ***   ***   ***   ***   ***   ***   */
  // Parameters
    parameter Integer nIn = 2 "Number of incoming transitions";
    parameter Integer nOut = 2 "Number of outgoing transitions";
    parameter Integer nNumbering = 11 "Consecutive numbering of state";

equation
  // connect block input, transitions and state inputs
  for i in 1:nIn loop
  connect(inPort[i],transitions [i].inPort) annotation (Line(
    points={{0,100},{0,57.4},{5.55112e-016,57.4}},
    color={0,0,0},
    smooth=Smooth.None));
  connect(transitions[i].outPort,state.inPort[i]) annotation (Line(
    points={{-2.22045e-016,45.85},{-2.22045e-016,-18},{3.9968e-015,-18}},
    color={0,0,0},
    smooth=Smooth.None));
  connect(transitions[i].condition, u[i]) annotation (Line(
    points={{25.2,49},{60.375,49},{60.375,104},{60,104}},
    color={255,0,255},
    smooth=Smooth.None));

end for;
for j in 1:nOut loop
    connect(state.outPort[j], outPort[j]) annotation (Line(
      points={{-3.88578e-015,-61},{-3.88578e-015,-93.325},{-38,-93.325},{-38,
            -111}},
      color={0,0,0},
      smooth=Smooth.None));
end for;

  connect(state.active, active) annotation (Line(
      points={{22,-40},{68.55,-40},{68.55,0},{110,0}},
      color={255,0,255},
      smooth=Smooth.None));
annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),graphics), Icon(coordinateSystem(
        preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
      Rectangle(
        extent={{-100,100},{100,-100}},
        lineColor={0,0,0},
        fillColor=DynamicSelect({255,255,255}, if state.active > 0.5 then {0,255,0}
               else {255,255,255}),
        fillPattern=FillPattern.Solid,
        lineThickness=1),
      Line(
        points={{-100,-66},{100,-66}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None),
      Text(
          extent={{-22,-76},{26,-90}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="%nNumbering"),
      Text(
        extent={{-66,36},{74,-10}},
        lineColor={0,0,0},
        lineThickness=1,
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid,
          textString="%name")}),
    Documentation(revisions="<html>
<ul>
<li>November 11, 2017&nbsp; by Georg Ferdinand Schneider:<br>Implemented.</li>
</ul>
</html>"));
end PartialState;
