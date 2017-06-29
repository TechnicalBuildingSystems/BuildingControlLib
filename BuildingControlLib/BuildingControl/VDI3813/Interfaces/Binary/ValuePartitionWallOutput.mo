within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Binary;
connector ValuePartitionWallOutput "Output connector of ValuePartitionWall"
 extends Partial.PartialOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.Binary.ValuePartitionWall
 valuePartitionWall;
end ValuePartitionWallOutput;
