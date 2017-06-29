within BuildingControlLib.BuildingControl.VDI3813.Sources.Light;
model PrescribedL_SET
  "Model to interface Modelica Standard Library and CommandLight"
  extends Interfaces.Partial.PartialSource;
 Modelica.Blocks.Interfaces.RealInput u
  annotation (Placement(transformation(extent={{-140,    -60},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
 BuildingControlLib.BuildingControl.VDI3813.Interfaces.Light.CommandLightOutput
 L_SET annotation (Placement(transformation(extent={{100,-20},{138,20}})));
equation
 u = L_SET.commandLight;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end PrescribedL_SET;
