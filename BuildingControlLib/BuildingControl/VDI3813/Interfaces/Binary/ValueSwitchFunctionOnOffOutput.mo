within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Binary;
connector ValueSwitchFunctionOnOffOutput
  "Output connector of ValueSwitchFunctionOnOff"
 extends Partial.PartialOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.Binary.ValueSwitchFunctionOnOff
 valueSwitchFunctionOnOff;
end ValueSwitchFunctionOnOffOutput;
