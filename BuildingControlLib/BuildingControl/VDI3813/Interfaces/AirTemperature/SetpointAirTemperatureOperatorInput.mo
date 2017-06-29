within BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature;
connector SetpointAirTemperatureOperatorInput
  "Input connector of SetpointAirTemperatureOperator"
 extends Partial.PartialInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.AirTemperature.SetpointAirTemperatureOperator
  setpointAirTemperatureOperator;
end SetpointAirTemperatureOperatorInput;
