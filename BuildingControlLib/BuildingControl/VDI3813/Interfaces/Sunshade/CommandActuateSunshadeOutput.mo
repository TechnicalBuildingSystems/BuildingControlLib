within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade;
connector CommandActuateSunshadeOutput
  "Output connector of CommandActuateSunshade"
 extends Partial.PartialPhysicalOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.Sunshade.CommandActuateSunshade
 commandActuateSunshade;
end CommandActuateSunshadeOutput;
