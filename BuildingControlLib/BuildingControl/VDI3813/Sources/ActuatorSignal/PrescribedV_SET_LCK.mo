within BuildingControlLib.BuildingControl.VDI3813.Sources.ActuatorSignal;
model PrescribedV_SET_LCK
  "Model to interface Modelica Standard Library and CommandActuatorSignalLockValvePosition"
  extends Interfaces.Partial.PartialSource;
 Modelica.Blocks.Interfaces.RealInput u
  annotation (Placement(transformation(extent={{-140,    -60},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
 Interfaces.ActuatorSignal.CommandActuatorSignalLockValvePositionOutput V_SET_LCK
    annotation (Placement(transformation(extent={{100,-20},{138,20}})));
equation
 u = V_SET_LCK.commandActuatorSignalLockValvePosition;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end PrescribedV_SET_LCK;
