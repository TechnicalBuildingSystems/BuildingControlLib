within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Presence;
connector ValuePresenceSensorOutput "Boolean presence state in a room which comes from a sensor(true = occupied / false = unoccupied)"
 extends Partial.PartialOutput;
 output Boolean valuePresenceSensor;
end ValuePresenceSensorOutput;
