within BuildingControlLib.BuildingControl.VDI3813.Sources.Angle;
model PrescribedA_SUN_AZ
  "Model to interface Modelica Standard Library and ValueAngleSunAzimuth"
  extends Interfaces.Partial.PartialSource;
 Modelica.Blocks.Interfaces.RealInput u
  annotation (Placement(transformation(extent={{-140,    -60},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
 BuildingControlLib.BuildingControl.VDI3813.Interfaces.Angle.ValueAngleSunAzimuthOutput
 A_SUN_AZ annotation (Placement(transformation(extent={{100,-20},{138,20}})));
equation
 u = A_SUN_AZ.valueAngleSunAzimuth;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end PrescribedA_SUN_AZ;
