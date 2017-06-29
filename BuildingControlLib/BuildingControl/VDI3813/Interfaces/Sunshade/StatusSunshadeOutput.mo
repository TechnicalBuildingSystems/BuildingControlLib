within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade;
connector StatusSunshadeOutput "Output connector of StatusSunshade"
 extends Partial.PartialOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.Sunshade.StatusSunshadePos
 statusSunshadePos;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.Sunshade.StatusSunshadeSlatAngle
 statusSunshadeSlatAngle;
end StatusSunshadeOutput;
