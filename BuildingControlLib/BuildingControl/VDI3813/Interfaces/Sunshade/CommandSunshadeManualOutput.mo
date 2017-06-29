within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade;
connector CommandSunshadeManualOutput
  "Output connector of CommandSunshadeManual"
 extends Partial.PartialOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.Sunshade.CommandSunshadeManualPos
 commandSunshadeManualPos;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.Sunshade.CommandSunshadeManualSlatAngle
 commandSunshadeManualSlatAngle;
end CommandSunshadeManualOutput;
