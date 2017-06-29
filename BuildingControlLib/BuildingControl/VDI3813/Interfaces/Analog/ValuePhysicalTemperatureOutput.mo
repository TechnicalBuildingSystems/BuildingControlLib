within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Analog;
connector ValuePhysicalTemperatureOutput
  "Output connector of ValuePhysicalTemperature"
 extends Partial.PartialPhysicalOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.Analog.ValuePhysicalTemperature
 valuePhysicalTemperature;
end ValuePhysicalTemperatureOutput;
