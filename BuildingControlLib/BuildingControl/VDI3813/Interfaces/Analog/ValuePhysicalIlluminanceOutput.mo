within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Analog;
connector ValuePhysicalIlluminanceOutput
  "Output connector of ValuePhysicalIlluminance"
 extends Partial.PartialPhysicalOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.Analog.ValuePhysicalIlluminance
 valuePhysicalIlluminance;
end ValuePhysicalIlluminanceOutput;
