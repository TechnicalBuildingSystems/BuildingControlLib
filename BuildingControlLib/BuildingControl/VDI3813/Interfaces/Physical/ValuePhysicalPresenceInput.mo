within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Physical;
connector ValuePhysicalPresenceInput "Physical signal of presence detection(true = presence detected/false = no presence detected"
 extends Partial.PartialPhysicalInput;
 input Boolean valuePhysicalPresence;
end ValuePhysicalPresenceInput;
