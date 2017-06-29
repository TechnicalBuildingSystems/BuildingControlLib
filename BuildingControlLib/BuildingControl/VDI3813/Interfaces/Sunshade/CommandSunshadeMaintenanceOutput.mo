within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade;
connector CommandSunshadeMaintenanceOutput
  "Output connector of CommandSunshadeMaintenance"
 extends Partial.PartialOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.Sunshade.CommandSunshadeMaintenancePos
 commandSunshadeMaintenancePos;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.Sunshade.CommandSunshadeMaintenanceSlatAngle
 commandSunshadeMaintenanceSlatAngle;
end CommandSunshadeMaintenanceOutput;
