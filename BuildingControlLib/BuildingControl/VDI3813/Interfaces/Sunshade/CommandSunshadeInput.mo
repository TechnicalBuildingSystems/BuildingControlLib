within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade;
connector CommandSunshadeInput "Input connector of CommandSunshade"
 extends Partial.PartialInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.Sunshade.CommandSunshadePos
  commandSunshadePos;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.Sunshade.CommandSunshadeSlatAngle
  commandSunshadeSlatAngle;
end CommandSunshadeInput;
