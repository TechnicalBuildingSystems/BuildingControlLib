within BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature;
connector SetpointHeatCoolEnergyModesOutput
  "Output connector of SetpointHeatCoolEnergyModes"
 extends Partial.PartialOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.AirTemperature.SetpointHeatCoolEnergyModes
 setpointHeatCoolEnergyModes[8];
end SetpointHeatCoolEnergyModesOutput;
