within BuildingControlLib.BuildingControl.VDI3813.Sensors;
model SensorM
  "Model to interface CommandPhysicalMotorControlRelay and Modelica Standard Library"
  extends Interfaces.Partial.PartialSensor;
  Modelica.Blocks.Interfaces.BooleanOutput y annotation (Placement(transformation(extent={{100,-40},
            {180,40}}), iconTransformation(extent={{100,-20},{140,20}})));

  Interfaces.Binary.CommandPhysicalMotorControlRelayInput M annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-100,0})));
equation
  M.commandPhysicalMotorControlRelay = y;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),                                                                  graphics), Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}),
        graphics),
    Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
end SensorM;
