within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Analog;
connector CommandPhysicalLightControlInput
  "Input connector of CommandPhysicalLightControl"
 extends Partial.PartialPhysicalInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.Analog.CommandPhysicalLightControl
  commandPhysicalLightControl;
end CommandPhysicalLightControlInput;
