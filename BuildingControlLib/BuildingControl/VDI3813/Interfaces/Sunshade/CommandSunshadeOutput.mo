within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade;
connector CommandSunshadeOutput "Output connector of CommandSunshade"
 extends Partial.PartialOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.Sunshade.CommandSunshadePos
 commandSunshadePos;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.Sunshade.CommandSunshadeSlatAngle
 commandSunshadeSlatAngle;
end CommandSunshadeOutput;
