within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Physical;
connector ValuePhysicalPrecipitationOutput
  "Output connector of ValuePhysicalPrecipitation"
 extends Partial.PartialPhysicalOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.Physical.ValuePhysicalPrecipitation
 valuePhysicalPrecipitation;
end ValuePhysicalPrecipitationOutput;
