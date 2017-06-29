within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Analog;
connector CommandPhysicalLightControlOutput
  "Output connector of CommandPhysicalLightControl"
 extends Partial.PartialPhysicalOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.Analog.CommandPhysicalLightControl
 commandPhysicalLightControl;
end CommandPhysicalLightControlOutput;
