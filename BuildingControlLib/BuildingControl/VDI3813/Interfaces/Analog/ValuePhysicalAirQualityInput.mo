within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Analog;
connector ValuePhysicalAirQualityInput
  "Input connector of ValuePhysicalAirQuality"
 extends Partial.PartialPhysicalInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.Analog.ValuePhysicalAirQuality
  valuePhysicalAirQuality;
end ValuePhysicalAirQualityInput;
