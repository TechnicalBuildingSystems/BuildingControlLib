within BuildingControlLib.BuildingControl.VDI3813.Interfaces.RoomUtilisationType;
connector CommandRoomUtilisationTypeOutput
  "Output connector of CommandRoomUtilisationType"
 extends Partial.PartialOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.RoomUtilisationType.CommandRoomUtilisationType
 commandRoomUtilisationType;
end CommandRoomUtilisationTypeOutput;
