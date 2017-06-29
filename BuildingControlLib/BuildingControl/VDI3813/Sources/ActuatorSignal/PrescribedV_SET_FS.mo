within BuildingControlLib.BuildingControl.VDI3813.Sources.ActuatorSignal;
model PrescribedV_SET_FS
  "Model to interface Modelica Standard Library and CommandActuatorSignalFanSpeed"
  extends Interfaces.Partial.PartialSource;
 Modelica.Blocks.Interfaces.RealInput u
  annotation (Placement(transformation(extent={{-140,    -60},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
 BuildingControlLib.BuildingControl.VDI3813.Interfaces.ActuatorSignal.CommandActuatorSignalFanSpeedOutput
 V_SET_FS annotation (Placement(transformation(extent={{100,-20},{138,20}})));
equation
 u = V_SET_FS.commandActuatorSignalFanSpeed;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end PrescribedV_SET_FS;
