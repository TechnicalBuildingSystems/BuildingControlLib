within BuildingControlLib.BuildingControl.VDI3813.Sources.Presence;
model PrescribedP_ACT
  "Model to interface Modelica Standard Library and ValuePresenceEvaluation"
  extends Interfaces.Partial.PartialSource;
 Modelica.Blocks.Interfaces.BooleanInput u
  annotation (Placement(transformation(extent={{-140,    -60},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
 BuildingControlLib.BuildingControl.VDI3813.Interfaces.Presence.ValuePresenceEvaluationOutput
 P_ACT annotation (Placement(transformation(extent={{100,-20},{138,20}})));
equation
 u = P_ACT.valuePresenceEvaluation;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end PrescribedP_ACT;
