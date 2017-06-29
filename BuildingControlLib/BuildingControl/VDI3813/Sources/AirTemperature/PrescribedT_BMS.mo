within BuildingControlLib.BuildingControl.VDI3813.Sources.AirTemperature;
model PrescribedT_BMS
  "Model to interface Modelica Standard Library and SetpointAirTemperatureOperator"
  extends Interfaces.Partial.PartialSource;
 Modelica.Blocks.Interfaces.RealInput u
  annotation (Placement(transformation(extent={{-140,    -60},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
 BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature.SetpointAirTemperatureOperatorOutput
 T_BMS annotation (Placement(transformation(extent={{100,-20},{138,20}})));
equation
 u = T_BMS.setpointAirTemperatureOperator;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end PrescribedT_BMS;
