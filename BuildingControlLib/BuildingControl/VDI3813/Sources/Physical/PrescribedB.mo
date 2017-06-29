within BuildingControlLib.BuildingControl.VDI3813.Sources.Physical;
model PrescribedB
  "Model to interface Modelica Standard Library and ValuePhysicalBinary"
  extends Interfaces.Partial.PartialSource;
 Modelica.Blocks.Interfaces.BooleanInput u
  annotation (Placement(transformation(extent={{-140,-40},{-60,40}}),     iconTransformation(extent={{-100,0},
            {-60,40}})));
 BuildingControlLib.BuildingControl.VDI3813.Interfaces.Physical.ValuePhysicalBinaryOutput
 B annotation (Placement(transformation(extent={{82,-20},{120,20}})));
equation
 u = B.valuePhysicalBinary;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end PrescribedB;
