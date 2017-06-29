within BuildingControlLib.BuildingControl.VDI3813.Sources.Binary;
model PrescribedR_ACT
  "Model to interface Modelica Standard Library and ValuePrecipitation"
  extends Interfaces.Partial.PartialSource;
 Modelica.Blocks.Interfaces.BooleanInput u
  annotation (Placement(transformation(extent={{-140,    -60},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
 BuildingControlLib.BuildingControl.VDI3813.Interfaces.Binary.ValuePrecipitationOutput
 R_ACT annotation (Placement(transformation(extent={{100,-20},{138,20}})));
equation
 u = R_ACT.valuePrecipitation;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end PrescribedR_ACT;
