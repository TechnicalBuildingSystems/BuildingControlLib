within BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature;
connector SetpointAirTemperatureUserOutput
  "Output connector of SetpointAirTemperatureUser"
 extends Partial.PartialOutput;
    output
    BuildingControlLib.BuildingControl.VDI3813.Types.AirTemperature.SetpointAirTemperatureUser
      setpointAirTemperatureUser;
end SetpointAirTemperatureUserOutput;
