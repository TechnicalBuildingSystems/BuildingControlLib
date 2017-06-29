within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Light;
connector CommandLightOutput "Output connector of CommandLight"
 extends Partial.PartialOutput;
 output BuildingControlLib.BuildingControl.VDI3813.Types.Light.CommandLight
 commandLight;
end CommandLightOutput;
