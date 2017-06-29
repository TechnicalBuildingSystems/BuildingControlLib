within BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirQuality;
connector ValueAirQualityInput "Input connector of ValueAirQuality"
 extends Partial.PartialInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.AirQuality.ValueAirQuality
  valueAirQuality;
end ValueAirQualityInput;
