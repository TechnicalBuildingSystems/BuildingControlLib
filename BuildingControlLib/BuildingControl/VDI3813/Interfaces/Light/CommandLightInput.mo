within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Light;
connector CommandLightInput "Input connector of CommandLight"
 extends Partial.PartialInput;
 input BuildingControlLib.BuildingControl.VDI3813.Types.Light.CommandLight
  commandLight;
end CommandLightInput;
