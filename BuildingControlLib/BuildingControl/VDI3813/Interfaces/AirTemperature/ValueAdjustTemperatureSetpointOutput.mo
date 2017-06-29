within BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature;
connector ValueAdjustTemperatureSetpointOutput
  "Output connector of ValueAdjustTemperatureSetpoint"
 extends Partial.PartialOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.AirTemperature.ValueAdjustTemperatureSetpoint
 valueAdjustTemperatureSetpoint;
end ValueAdjustTemperatureSetpointOutput;
