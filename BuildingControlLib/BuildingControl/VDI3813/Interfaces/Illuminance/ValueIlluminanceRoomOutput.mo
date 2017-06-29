within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Illuminance;
connector ValueIlluminanceRoomOutput "Output connector of ValueIlluminanceRoom"
 extends Partial.PartialOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.Illuminance.ValueIlluminanceRoom
 valueIlluminanceRoom;
end ValueIlluminanceRoomOutput;
