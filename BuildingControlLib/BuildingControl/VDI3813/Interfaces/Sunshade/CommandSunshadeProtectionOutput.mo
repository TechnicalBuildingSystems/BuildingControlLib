within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade;
connector CommandSunshadeProtectionOutput
  "Output connector of CommandSunshadeProtection"
 extends Partial.PartialOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.Sunshade.CommandSunshadeProtectionPos
 commandSunshadeProtectionPos;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.Sunshade.CommandSunshadeProtectionSlatAngle
 commandSunshadeProtectionSlatAngle;
end CommandSunshadeProtectionOutput;
