within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Physical;
connector ValuePhysicalPresenceInput "Input connector of ValuePhysicalPresence"
 extends Partial.PartialPhysicalInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.Physical.ValuePhysicalPresence
  valuePhysicalPresence;
end ValuePhysicalPresenceInput;
