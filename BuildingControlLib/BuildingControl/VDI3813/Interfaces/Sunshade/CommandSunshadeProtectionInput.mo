within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade;
connector CommandSunshadeProtectionInput
  "Input connector of CommandSunshadeProtection"
 extends Partial.PartialInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.Sunshade.CommandSunshadeProtectionPos
  commandSunshadeProtectionPos;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.Sunshade.CommandSunshadeProtectionSlatAngle
  commandSunshadeProtectionSlatAngle;
end CommandSunshadeProtectionInput;
