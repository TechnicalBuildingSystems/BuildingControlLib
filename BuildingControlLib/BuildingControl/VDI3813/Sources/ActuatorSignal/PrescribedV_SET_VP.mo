within BuildingControlLib.BuildingControl.VDI3813.Sources.ActuatorSignal;
model PrescribedV_SET_VP
  "Model to interface Modelica Standard Library and CommandActuatorSignalValvePosition"
  extends Interfaces.Partial.PartialSource;
 Modelica.Blocks.Interfaces.RealInput u
  annotation (Placement(transformation(extent={{-140,    -60},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
 BuildingControlLib.BuildingControl.VDI3813.Interfaces.ActuatorSignal.CommandActuatorSignalValvePositionOutput
 V_SET_VP annotation (Placement(transformation(extent={{100,-20},{138,20}})));
equation
 u = V_SET_VP.commandActuatorSignalValvePosition;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end PrescribedV_SET_VP;
