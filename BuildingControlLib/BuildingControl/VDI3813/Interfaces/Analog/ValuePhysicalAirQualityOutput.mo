within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Analog;
connector ValuePhysicalAirQualityOutput
  "Output connector of ValuePhysicalAirQuality"
 extends Partial.PartialPhysicalOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.Analog.ValuePhysicalAirQuality
 valuePhysicalAirQuality;
end ValuePhysicalAirQualityOutput;
