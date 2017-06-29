within BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature;
connector SetpointAirTemperatureOperatorOutput
  "Output connector of SetpointAirTemperatureOperator"
 extends Partial.PartialOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.AirTemperature.SetpointAirTemperatureOperator
 setpointAirTemperatureOperator;
end SetpointAirTemperatureOperatorOutput;
