within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Presence;
connector ValuePresenceSensorInput "Input connector of ValuePresenceSensor"
 extends Partial.PartialInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.Presence.ValuePresenceSensor
  valuePresenceSensor;
end ValuePresenceSensorInput;
