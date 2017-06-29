within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade;
connector CommandSunshadeMaintenanceInput
  "Input connector of CommandSunshadeMaintenance"
 extends Partial.PartialInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.Sunshade.CommandSunshadeMaintenancePos
  commandSunshadeMaintenancePos;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.Sunshade.CommandSunshadeMaintenanceSlatAngle
  commandSunshadeMaintenanceSlatAngle;
end CommandSunshadeMaintenanceInput;
