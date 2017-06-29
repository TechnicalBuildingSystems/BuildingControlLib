within BuildingControlLib.BuildingControl.VDI3813.Sources.AirTemperature;
model PrescribedT_SUPPLY
  "Model to interface Modelica Standard Library and ValueAirTemperatureSupply"
  extends Interfaces.Partial.PartialSource;
 Modelica.Blocks.Interfaces.RealInput u
  annotation (Placement(transformation(extent={{-140,    -60},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
 BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature.ValueAirTemperatureSupplyOutput
 T_SUPPLY annotation (Placement(transformation(extent={{100,-20},{138,20}})));
equation
 u = T_SUPPLY.valueAirTemperatureSupply;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end PrescribedT_SUPPLY;
