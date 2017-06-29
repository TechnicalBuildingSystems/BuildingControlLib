within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade;
connector CommandSunshadeAutomaticInput
  "Input connector of CommandSunshadeAutomatic"
 extends Partial.PartialInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.Sunshade.CommandSunshadeAutomaticPos
  commandSunshadeAutomaticPos;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.Sunshade.CommandSunshadeAutomaticSlatAngle
  commandSunshadeAutomaticSlatAngle;
end CommandSunshadeAutomaticInput;
