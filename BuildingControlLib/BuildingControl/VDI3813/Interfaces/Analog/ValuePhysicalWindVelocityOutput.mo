within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Analog;
connector ValuePhysicalWindVelocityOutput
  "Output connector of ValuePhysicalWindVelocity"
 extends Partial.PartialPhysicalOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.Analog.ValuePhysicalWindVelocity
 valuePhysicalWindVelocity;
end ValuePhysicalWindVelocityOutput;
