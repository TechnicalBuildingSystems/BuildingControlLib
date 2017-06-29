within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Light;
connector StatusLightInput "Input connector of StatusLight"
 extends Partial.PartialInput;
 input BuildingControlLib.BuildingControl.VDI3813.Types.Light.StatusLight
  statusLight;
end StatusLightInput;
