within BuildingControlLib.BuildingControl.VDI3813.Interfaces.EnergyMode;
connector CommandEnergyModeTimeScheduleInput
  "Input connector of CommandEnergyModeTimeSchedule"
 extends Partial.PartialInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.EnergyMode.CommandEnergyModeTimeSchedule
  commandEnergyModeTimeSchedule;
end CommandEnergyModeTimeScheduleInput;
