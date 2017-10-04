within BuildingControlLib.BuildingControl.VDI3813.Sources.Sunshade;
model PrescribedS_SET
  "Model to interface Modelica Standard Library and CommandSunshade"
  extends Interfaces.Partial.PartialSource;
 Modelica.Blocks.Interfaces.RealInput u[2]
  annotation (Placement(transformation(extent={{-140,    -60},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
 BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade.CommandSunshadeOutput
 S_SET annotation (Placement(transformation(extent={{100,-20},{138,20}})));
equation
 u[1] = S_SET.commandSunshadePos;
 u[2] = S_SET.commandSunshadeSlatAngle;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end PrescribedS_SET;
