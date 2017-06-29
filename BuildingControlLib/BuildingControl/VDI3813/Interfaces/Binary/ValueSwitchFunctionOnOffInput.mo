within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Binary;
connector ValueSwitchFunctionOnOffInput
  "Input connector of ValueSwitchFunctionOnOff"
 extends Partial.PartialInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.Binary.ValueSwitchFunctionOnOff
  valueSwitchFunctionOnOff;
end ValueSwitchFunctionOnOffInput;
