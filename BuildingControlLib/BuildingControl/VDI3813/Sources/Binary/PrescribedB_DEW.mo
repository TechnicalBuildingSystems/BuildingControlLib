within BuildingControlLib.BuildingControl.VDI3813.Sources.Binary;
model PrescribedB_DEW
  "Model to interface Modelica Standard Library and ValueDewpoint"
  extends Interfaces.Partial.PartialSource;
 Modelica.Blocks.Interfaces.BooleanInput u
  annotation (Placement(transformation(extent={{-140,    -60},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
 BuildingControlLib.BuildingControl.VDI3813.Interfaces.Binary.ValueDewpointOutput
 B_DEW annotation (Placement(transformation(extent={{100,-20},{138,20}})));
equation
 u = B_DEW.valueDewpoint;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end PrescribedB_DEW;
