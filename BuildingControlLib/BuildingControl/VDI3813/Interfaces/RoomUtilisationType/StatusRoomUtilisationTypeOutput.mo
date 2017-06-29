within BuildingControlLib.BuildingControl.VDI3813.Interfaces.RoomUtilisationType;
connector StatusRoomUtilisationTypeOutput
  "Output connector of StatusRoomUtilisationType"
 extends Partial.PartialOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.RoomUtilisationType.StatusRoomUtilisationType
 statusRoomUtilisationType;
end StatusRoomUtilisationTypeOutput;
