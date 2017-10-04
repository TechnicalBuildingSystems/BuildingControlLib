within BuildingControlLib.BuildingControl.VDI3813.Sources.Sunshade;
model PrescribedCMD_S
  "Model to interface Modelica Standard Library and CommandActuateSunshade"
  extends Interfaces.Partial.PartialSource;
 Modelica.Blocks.Interfaces.BooleanInput u
  annotation (Placement(transformation(extent={{-140,    -60},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
 BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade.CommandActuateSunshadeOutput
    CMD annotation (Placement(transformation(extent={{40,-60},{78,-20}}),
        iconTransformation(extent={{40,-60},{78,-20}})));
equation
 u = CMD.commandActuateSunshade;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
end PrescribedCMD_S;
