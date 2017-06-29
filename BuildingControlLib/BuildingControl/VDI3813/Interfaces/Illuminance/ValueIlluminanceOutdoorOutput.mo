within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Illuminance;
connector ValueIlluminanceOutdoorOutput
  "Output connector of ValueIlluminanceOutdoor"
 extends Partial.PartialOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.Illuminance.ValueIlluminanceOutdoor
 valueIlluminanceOutdoor;
end ValueIlluminanceOutdoorOutput;
