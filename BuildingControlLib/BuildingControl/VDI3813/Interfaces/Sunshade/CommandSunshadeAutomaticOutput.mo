within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade;
connector CommandSunshadeAutomaticOutput
  "Output connector of CommandSunshadeAutomatic"
 extends Partial.PartialOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.Sunshade.CommandSunshadeAutomaticPos
 commandSunshadeAutomaticPos;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.Sunshade.CommandSunshadeAutomaticSlatAngle
 commandSunshadeAutomaticSlatAngle;
end CommandSunshadeAutomaticOutput;
