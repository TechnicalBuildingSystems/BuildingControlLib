within BuildingControlLib.BuildingControl.VDI3813.Sources.AirTemperature;
model PrescribedVAL_T
  "Model to interface Modelica Standard Library and ValueAdjustTemperatureSetpoint"
  extends Interfaces.Partial.PartialSource;
 Modelica.Blocks.Interfaces.RealInput u
  annotation (Placement(transformation(extent={{-140,    -60},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
 BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature.ValueAdjustTemperatureSetpointOutput
 VAL_T annotation (Placement(transformation(extent={{100,-20},{138,20}})));
equation
 u = VAL_T.valueAdjustTemperatureSetpoint;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end PrescribedVAL_T;
