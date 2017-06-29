within BuildingControlLib.BuildingControl.VDI3813.Sensors;
model SensorV_SET_VP
  "Model to interface CommandActuatorSignalValvePosition and Modelica Standard Library"
  extends Interfaces.Partial.PartialSensor;
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(extent={{100,-40},
            {180,40}}), iconTransformation(extent={{100,-60},{140,-20}})));

  Interfaces.ActuatorSignal.CommandActuatorSignalValvePositionInput V_SET_VP
    annotation (Placement(transformation(extent={{-100,-20},{-60,20}})));
equation
V_SET_VP.commandActuatorSignalValvePosition = y;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}),                                                                        graphics), Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}),
        graphics),
    Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
end SensorV_SET_VP;
