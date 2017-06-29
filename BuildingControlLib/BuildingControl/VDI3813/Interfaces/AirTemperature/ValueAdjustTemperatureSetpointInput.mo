within BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature;
connector ValueAdjustTemperatureSetpointInput
  "Input connector of ValueAdjustTemperatureSetpoint"
 extends Partial.PartialInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.AirTemperature.ValueAdjustTemperatureSetpoint
  valueAdjustTemperatureSetpoint;
end ValueAdjustTemperatureSetpointInput;
