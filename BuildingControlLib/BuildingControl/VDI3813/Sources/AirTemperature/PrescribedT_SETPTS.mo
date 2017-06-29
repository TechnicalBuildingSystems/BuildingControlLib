within BuildingControlLib.BuildingControl.VDI3813.Sources.AirTemperature;
model PrescribedT_SETPTS
  "Model to interface Modelica Standard Library and SetpointHeatCoolEnergyModes"
  extends Interfaces.Partial.PartialSource;
 Modelica.Blocks.Interfaces.RealInput u[8]
  annotation (Placement(transformation(extent={{-140,    -60},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
 BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature.SetpointHeatCoolEnergyModesOutput
 T_SETPTS annotation (Placement(transformation(extent={{100,-20},{138,20}})));
equation
 for i in 1:8 loop
 u[i] = T_SETPTS.setpointHeatCoolEnergyModes[i];
 end for;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
end PrescribedT_SETPTS;
