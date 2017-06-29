within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade;
connector StatusSunshadeInput "Input connector of StatusSunshade"
 extends Partial.PartialInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.Sunshade.StatusSunshadePos
  statusSunshadePos;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.Sunshade.StatusSunshadeSlatAngle
  statusSunshadeSlatAngle;
end StatusSunshadeInput;
