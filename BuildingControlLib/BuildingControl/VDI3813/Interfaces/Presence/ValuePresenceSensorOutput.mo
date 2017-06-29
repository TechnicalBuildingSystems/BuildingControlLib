within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Presence;
connector ValuePresenceSensorOutput "Output connector of ValuePresenceSensor"
 extends Partial.PartialOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.Presence.ValuePresenceSensor
 valuePresenceSensor;
end ValuePresenceSensorOutput;
