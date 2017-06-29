within BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature;
connector SetpointHeatCoolEnergyModesInput
  "Input connector of SetpointHeatCoolEnergyModes"
 extends Partial.PartialInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.AirTemperature.SetpointHeatCoolEnergyModes
  setpointHeatCoolEnergyModes[8];
end SetpointHeatCoolEnergyModesInput;
