within BuildingControlLib.BuildingControl.VDI3813.Sources.Analog;
model PrescribedT
  "Model to interface Modelica Standard Library and ValuePhysicalTemperature"
  extends Interfaces.Partial.PartialSource;
 Modelica.Blocks.Interfaces.RealInput u
  annotation (Placement(transformation(extent={{-140,    -60},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
 BuildingControlLib.BuildingControl.VDI3813.Interfaces.Analog.ValuePhysicalTemperatureOutput
 T annotation (Placement(transformation(extent={{100,-20},{138,20}})));
equation
 u = T.valuePhysicalTemperature;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end PrescribedT;
