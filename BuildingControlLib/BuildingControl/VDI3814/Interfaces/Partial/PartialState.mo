within BuildingControlLib.BuildingControl.VDI3814.Interfaces.Partial;
partial model PartialState "Superclass for VDI 3814-6 states"

    Modelica.StateGraph.StepWithSignal
                              state(                        nIn = nIn,
    nOut=1)
    annotation (Placement(transformation(extent={{-31,-31},{31,31}},
        rotation=270,
        origin={-1,-39})));
  Modelica.StateGraph.TransitionWithSignal
                                  transitions[ nIn]
    annotation (Placement(transformation(extent={{21,-21},{-21,21}},
        rotation=90,
        origin={1,49})));

  /* ***   ***   ***   ***   ***   ***   ***   ***   ***   */
  // Connectors
      Modelica.Blocks.Interfaces.BooleanInput u[ nIn]  annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={60,104}), iconTransformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={58,96})));
  Modelica.StateGraph.Interfaces.Step_out           outPort
    "Port for zero, one, or more output transitions"
    annotation (Placement(transformation(extent={{-28,-122},{72,-92}}),
        iconTransformation(extent={{50,-100},{72,-92}})));
  Modelica.StateGraph.Interfaces.Transition_in           inPort[ nIn]
    "Array of input ports to transitions"
    annotation (Placement(transformation(extent={{-17,-17},{17,17}},
        rotation=270,
        origin={0,100})));

  /* ***   ***   ***   ***   ***   ***   ***   ***   ***   */
  // Parameters
    parameter Integer nIn = 2 "Number of incoming transitions";
    parameter Integer nNumbering = 11 "Consecutive numbering of state";
equation
for i in 1:nIn loop
  connect(transitions[i].outPort,state. inPort[i]) annotation (Line(
    points={{1,45.85},{1,-4.9},{-1,-4.9}},
    color={0,0,0},
    smooth=Smooth.None));
  connect(transitions[i].condition, u[i]) annotation (Line(
    points={{26.2,49},{60.375,49},{60.375,104},{60,104}},
    color={255,0,255},
    smooth=Smooth.None));
  connect(inPort[i],transitions [i].inPort) annotation (Line(
    points={{0,100},{0,57.4},{1,57.4}},
    color={0,0,0},
    smooth=Smooth.None));
end for;

  connect(state.outPort[1], outPort) annotation (Line(
      points={{-1,-71.55},{-1,-93.325},{22,-93.325},{22,-107}},
      color={0,0,0},
      smooth=Smooth.None));
annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}),      graphics), Icon(coordinateSystem(
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
