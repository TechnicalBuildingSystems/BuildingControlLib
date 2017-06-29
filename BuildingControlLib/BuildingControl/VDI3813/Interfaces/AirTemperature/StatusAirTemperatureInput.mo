within BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature;
connector StatusAirTemperatureInput "Input connector of StatusAirTemperature"
 extends Partial.PartialInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.AirTemperature.StatusAirTemperature
  statusAirTemperature;
end StatusAirTemperatureInput;
