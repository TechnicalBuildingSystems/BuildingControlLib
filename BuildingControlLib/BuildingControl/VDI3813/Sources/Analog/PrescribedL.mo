within BuildingControlLib.BuildingControl.VDI3813.Sources.Analog;
model PrescribedL
  "Model to interface Modelica Standard Library and CommandPhysicalLightControl"
  extends Interfaces.Partial.PartialSource;
 Modelica.Blocks.Interfaces.RealInput u
  annotation (Placement(transformation(extent={{-140,    -60},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
 BuildingControlLib.BuildingControl.VDI3813.Interfaces.Analog.CommandPhysicalLightControlOutput
 L annotation (Placement(transformation(extent={{100,-20},{138,20}})));
equation
 u = L.commandPhysicalLightControl;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end PrescribedL;
