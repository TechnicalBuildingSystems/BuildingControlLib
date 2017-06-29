within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Binary;
connector ValuePrecipitationInput "Input connector of ValuePrecipitation"
 extends Partial.PartialInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.Binary.ValuePrecipitation
  valuePrecipitation;
end ValuePrecipitationInput;
