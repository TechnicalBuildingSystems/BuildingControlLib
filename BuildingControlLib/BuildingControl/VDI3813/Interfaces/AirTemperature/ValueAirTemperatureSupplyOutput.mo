within BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature;
connector ValueAirTemperatureSupplyOutput
  "Output connector of ValueAirTemperatureSupply"
 extends Partial.PartialOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.AirTemperature.ValueAirTemperatureSupply
 valueAirTemperatureSupply;
end ValueAirTemperatureSupplyOutput;
