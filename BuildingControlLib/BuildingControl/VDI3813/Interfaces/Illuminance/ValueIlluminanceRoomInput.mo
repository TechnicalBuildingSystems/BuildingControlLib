within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Illuminance;
connector ValueIlluminanceRoomInput "Input connector of ValueIlluminanceRoom"
 extends Partial.PartialInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.Illuminance.ValueIlluminanceRoom
  valueIlluminanceRoom;
end ValueIlluminanceRoomInput;
