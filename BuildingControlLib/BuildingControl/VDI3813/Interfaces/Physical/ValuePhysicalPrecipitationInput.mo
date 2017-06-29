within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Physical;
connector ValuePhysicalPrecipitationInput
  "Input connector of ValuePhysicalPrecipitation"
 extends Partial.PartialPhysicalInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.Physical.ValuePhysicalPrecipitation
  valuePhysicalPrecipitation;
end ValuePhysicalPrecipitationInput;
