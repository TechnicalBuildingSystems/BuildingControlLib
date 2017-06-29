within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade;
connector CommandActuateSunshadeInput
  "Input connector of CommandActuateSunshade"
 extends Partial.PartialPhysicalInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.Sunshade.CommandActuateSunshade
  commandActuateSunshade;
end CommandActuateSunshadeInput;
