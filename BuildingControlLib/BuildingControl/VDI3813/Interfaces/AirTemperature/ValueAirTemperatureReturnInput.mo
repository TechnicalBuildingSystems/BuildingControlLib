within BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature;
connector ValueAirTemperatureReturnInput
  "Input connector of ValueAirTemperatureReturn"
 extends Partial.PartialInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.AirTemperature.ValueAirTemperatureReturn
  valueAirTemperatureReturn;
end ValueAirTemperatureReturnInput;
