within BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature;
connector SetpointAirTemperatureUserInput
  "Input connector of SetpointAirTemperatureUser"
 extends Partial.PartialInput;
  input
    BuildingControlLib.BuildingControl.VDI3813.Types.AirTemperature.SetpointAirTemperatureUser
    setpointAirTemperatureUser;
end SetpointAirTemperatureUserInput;
