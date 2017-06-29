within BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature;
connector StatusAirTemperatureOutput "Output connector of StatusAirTemperature"
 extends Partial.PartialOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.AirTemperature.StatusAirTemperature
 statusAirTemperature;
end StatusAirTemperatureOutput;
