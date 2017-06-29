within BuildingControlLib.BuildingControl.VDI3813.Sources.Binary;
model PrescribedB_WINDOW
  "Model to interface Modelica Standard Library and ValueWindow"
  extends Interfaces.Partial.PartialSource;
 Modelica.Blocks.Interfaces.BooleanInput u
  annotation (Placement(transformation(extent={{-140,    -60},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
 BuildingControlLib.BuildingControl.VDI3813.Interfaces.Binary.ValueWindowOutput
 B_WINDOW annotation (Placement(transformation(extent={{100,-20},{138,20}})));
equation
 u = B_WINDOW.valueWindow;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end PrescribedB_WINDOW;
