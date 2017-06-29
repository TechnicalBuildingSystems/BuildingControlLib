within BuildingControlLib.BuildingControl.VDI3813.Sources.Sunshade;
model PrescribedVAL_S
  "Model to interface Modelica Standard Library and ValueActuateSunshade"
  extends Interfaces.Partial.PartialSource;
 Modelica.Blocks.Interfaces.BooleanInput u
  annotation (Placement(transformation(extent={{-140,    -60},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
 BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade.ValueActuateSunshadeOutput
 VAL_S annotation (Placement(transformation(extent={{100,-20},{138,20}})));
equation
 u = VAL_S.valueActuateSunshade;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end PrescribedVAL_S;
