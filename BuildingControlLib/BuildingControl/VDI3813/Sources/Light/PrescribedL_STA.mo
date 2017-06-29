within BuildingControlLib.BuildingControl.VDI3813.Sources.Light;
model PrescribedL_STA
  "Model to interface Modelica Standard Library and StatusLight"
  extends Interfaces.Partial.PartialSource;
 Modelica.Blocks.Interfaces.RealInput u
  annotation (Placement(transformation(extent={{-140,    -60},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
 BuildingControlLib.BuildingControl.VDI3813.Interfaces.Light.StatusLightOutput
 L_STA annotation (Placement(transformation(extent={{100,-20},{138,20}})));
equation
 u = L_STA.statusLight;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end PrescribedL_STA;
