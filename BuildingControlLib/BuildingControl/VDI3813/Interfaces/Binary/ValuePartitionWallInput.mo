within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Binary;
connector ValuePartitionWallInput "Input connector of ValuePartitionWall"
 extends Partial.PartialInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.Binary.ValuePartitionWall
  valuePartitionWall;
end ValuePartitionWallInput;
