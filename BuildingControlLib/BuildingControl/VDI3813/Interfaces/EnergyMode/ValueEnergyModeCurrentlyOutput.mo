within BuildingControlLib.BuildingControl.VDI3813.Interfaces.EnergyMode;
connector ValueEnergyModeCurrentlyOutput
  "Output connector of ValueEnergyModeCurrently"
 extends Partial.PartialOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.EnergyMode.ValueEnergyModeCurrently
 valueEnergyModeCurrently;
end ValueEnergyModeCurrentlyOutput;
