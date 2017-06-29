within BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature;
connector ValueAirTemperatureSupplyInput
  "Input connector of ValueAirTemperatureSupply"
 extends Partial.PartialInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.AirTemperature.ValueAirTemperatureSupply
  valueAirTemperatureSupply;
end ValueAirTemperatureSupplyInput;
