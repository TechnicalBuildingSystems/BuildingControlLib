within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Physical;
connector ValuePhysicalBinaryOutput "Output connector of ValuePhysicalBinary"
 extends Partial.PartialPhysicalOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.Physical.ValuePhysicalBinary
 valuePhysicalBinary;
end ValuePhysicalBinaryOutput;
