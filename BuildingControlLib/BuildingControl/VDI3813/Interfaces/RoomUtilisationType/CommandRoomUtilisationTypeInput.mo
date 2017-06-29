within BuildingControlLib.BuildingControl.VDI3813.Interfaces.RoomUtilisationType;
connector CommandRoomUtilisationTypeInput
  "Input connector of CommandRoomUtilisationType"
 extends Partial.PartialInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.RoomUtilisationType.CommandRoomUtilisationType
  commandRoomUtilisationType;
end CommandRoomUtilisationTypeInput;
