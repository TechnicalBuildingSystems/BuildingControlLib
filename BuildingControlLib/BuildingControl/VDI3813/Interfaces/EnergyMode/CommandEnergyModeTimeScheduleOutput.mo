within BuildingControlLib.BuildingControl.VDI3813.Interfaces.EnergyMode;
connector CommandEnergyModeTimeScheduleOutput
  "Output connector of CommandEnergyModeTimeSchedule"
 extends Partial.PartialOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.EnergyMode.CommandEnergyModeTimeSchedule
 commandEnergyModeTimeSchedule;
end CommandEnergyModeTimeScheduleOutput;
