within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Binary;
connector ValuePrecipitationOutput "Output connector of ValuePrecipitation"
 extends Partial.PartialOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.Binary.ValuePrecipitation
 valuePrecipitation;
end ValuePrecipitationOutput;
