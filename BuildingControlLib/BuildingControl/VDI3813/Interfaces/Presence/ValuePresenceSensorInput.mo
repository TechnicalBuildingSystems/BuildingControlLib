within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Presence;
connector ValuePresenceSensorInput "Boolean presence state in a room which comes from a sensor(true = occupied / false = unoccupied)"
 extends Partial.PartialInput;
 input Boolean valuePresenceSensor;
end ValuePresenceSensorInput;
