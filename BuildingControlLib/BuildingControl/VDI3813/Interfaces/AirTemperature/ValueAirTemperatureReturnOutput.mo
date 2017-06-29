within BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature;
connector ValueAirTemperatureReturnOutput
  "Output connector of ValueAirTemperatureReturn"
extends Partial.PartialOutput;
output
    BuildingControlLib.BuildingControl.VDI3813.Types.AirTemperature.ValueAirTemperatureReturn
valueAirTemperatureReturn;
end ValueAirTemperatureReturnOutput;
