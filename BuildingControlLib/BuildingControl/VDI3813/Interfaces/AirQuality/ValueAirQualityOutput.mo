within BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirQuality;
connector ValueAirQualityOutput "Output connector of ValueAirQuality"
 extends Partial.PartialOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.AirQuality.ValueAirQuality
 valueAirQuality;
end ValueAirQualityOutput;
