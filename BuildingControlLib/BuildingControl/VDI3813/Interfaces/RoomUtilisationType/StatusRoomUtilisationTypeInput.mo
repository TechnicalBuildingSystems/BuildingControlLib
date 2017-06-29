within BuildingControlLib.BuildingControl.VDI3813.Interfaces.RoomUtilisationType;
connector StatusRoomUtilisationTypeInput
  "Input connector of StatusRoomUtilisationType"
 extends Partial.PartialInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.RoomUtilisationType.StatusRoomUtilisationType
  statusRoomUtilisationType;
end StatusRoomUtilisationTypeInput;
