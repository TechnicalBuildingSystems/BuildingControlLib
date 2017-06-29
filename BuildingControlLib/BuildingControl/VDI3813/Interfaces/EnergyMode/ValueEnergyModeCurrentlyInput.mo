within BuildingControlLib.BuildingControl.VDI3813.Interfaces.EnergyMode;
connector ValueEnergyModeCurrentlyInput
  "Input connector of ValueEnergyModeCurrently"
 extends Partial.PartialInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.EnergyMode.ValueEnergyModeCurrently
  valueEnergyModeCurrently;
end ValueEnergyModeCurrentlyInput;
