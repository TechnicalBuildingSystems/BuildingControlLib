within BuildingControlLib.BuildingControl.VDI3813.Sensors;
model SensorT_ROOM
  "Model to interface ValueAirTemperatureRoom and Modelica Standard Library"
  extends Interfaces.Partial.PartialSensor;
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(extent={{100,-40},
            {180,40}}), iconTransformation(extent={{100,-60},{140,-20}})));

  Interfaces.AirTemperature.ValueAirTemperatureRoomInput T_ROOM annotation (
      Placement(transformation(extent={{-100,-20},{-60,20}}),iconTransformation(
          extent={{-100,-20},{-60,20}})));
equation
T_ROOM.valueAirTemperatureRoom = y;
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
end SensorT_ROOM;
