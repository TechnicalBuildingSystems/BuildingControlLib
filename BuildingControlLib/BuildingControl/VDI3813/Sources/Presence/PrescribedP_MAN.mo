within BuildingControlLib.BuildingControl.VDI3813.Sources.Presence;
model PrescribedP_MAN
  "Model to interface Modelica Standard Library and ValuePresenceOperator"
  extends Interfaces.Partial.PartialSource;
 Modelica.Blocks.Interfaces.BooleanInput u
  annotation (Placement(transformation(extent={{-140,    -60},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.Presence.CommandPresenceOperatorOutput
    P_MAN annotation (Placement(transformation(extent={{100,-20},{138,20}})));
equation
 u = P_MAN.valuePresenceOperator;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end PrescribedP_MAN;
