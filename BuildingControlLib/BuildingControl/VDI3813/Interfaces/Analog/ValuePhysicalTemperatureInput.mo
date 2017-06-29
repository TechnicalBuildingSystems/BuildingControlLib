within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Analog;
connector ValuePhysicalTemperatureInput
  "Input connector of ValuePhysicalTemperature"
 extends Partial.PartialPhysicalInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.Analog.ValuePhysicalTemperature
  valuePhysicalTemperature;
end ValuePhysicalTemperatureInput;
