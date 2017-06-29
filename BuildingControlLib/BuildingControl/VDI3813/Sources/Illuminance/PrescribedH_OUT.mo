within BuildingControlLib.BuildingControl.VDI3813.Sources.Illuminance;
model PrescribedH_OUT
  "Model to interface Modelica Standard Library and ValueIlluminanceOutdoor"
  extends Interfaces.Partial.PartialSource;
 Modelica.Blocks.Interfaces.RealInput u
  annotation (Placement(transformation(extent={{-140,    -60},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
 BuildingControlLib.BuildingControl.VDI3813.Interfaces.Illuminance.ValueIlluminanceOutdoorOutput
 H_OUT annotation (Placement(transformation(extent={{100,-20},{138,20}})));
equation
 u = H_OUT.valueIlluminanceOutdoor;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end PrescribedH_OUT;
