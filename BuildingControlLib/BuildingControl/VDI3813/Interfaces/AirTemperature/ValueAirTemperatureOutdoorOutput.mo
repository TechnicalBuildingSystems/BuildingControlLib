within BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature;
connector ValueAirTemperatureOutdoorOutput
  "Output connector of ValueAirTemperatureOutdoor"
 extends Partial.PartialOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.AirTemperature.ValueAirTemperatureOutdoor
 valueAirTemperatureOutdoor;
end ValueAirTemperatureOutdoorOutput;
