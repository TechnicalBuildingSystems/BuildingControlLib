within BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature;
connector CommandAdjustTemperatureSetpointInput
  "Input connector of CommandAdjustTemperatureSetpoint"
 extends Partial.PartialPhysicalInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.AirTemperature.CommandAdjustTemperatureSetpoint
  commandAdjustTemperatureSetpoint;
end CommandAdjustTemperatureSetpointInput;
