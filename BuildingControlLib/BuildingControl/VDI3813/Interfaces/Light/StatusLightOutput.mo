within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Light;
connector StatusLightOutput "Output connector of StatusLight"
 extends Partial.PartialOutput;
 output BuildingControlLib.BuildingControl.VDI3813.Types.Light.StatusLight
 statusLight;
end StatusLightOutput;
