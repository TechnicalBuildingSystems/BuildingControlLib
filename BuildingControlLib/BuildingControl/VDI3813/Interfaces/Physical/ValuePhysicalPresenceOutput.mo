within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Physical;
connector ValuePhysicalPresenceOutput
  "Output connector of ValuePhysicalPresence"
 extends Partial.PartialPhysicalOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.Physical.ValuePhysicalPresence
 valuePhysicalPresence;
end ValuePhysicalPresenceOutput;
