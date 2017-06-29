within BuildingControlLib.BuildingControl.VDI3813.Sources.Physical;
model PrescribedR
  "Model to interface Modelica Standard Library and ValuePhysicalPrecipitation"
  extends Interfaces.Partial.PartialSource;
 Modelica.Blocks.Interfaces.BooleanInput u
  annotation (Placement(transformation(extent={{-140,-40},{-60,40}}),     iconTransformation(extent={{-100,0},
            {-60,40}})));
 BuildingControlLib.BuildingControl.VDI3813.Interfaces.Physical.ValuePhysicalPrecipitationOutput
 R annotation (Placement(transformation(extent={{80,-20},{118,20}})));
equation
 u = R.valuePhysicalPrecipitation;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end PrescribedR;
