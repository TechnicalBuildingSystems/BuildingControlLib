within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade;
connector CommandSunshadeManualInput "Input connector of CommandSunshadeManual"
 extends Partial.PartialInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.Sunshade.CommandSunshadeManualPos
  commandSunshadeManualPos;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.Sunshade.CommandSunshadeManualSlatAngle
  commandSunshadeManualSlatAngle;
end CommandSunshadeManualInput;
