within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Binary;
connector ValueWindowOutput "Output connector of ValueWindow"
 extends Partial.PartialOutput;
 output BuildingControlLib.BuildingControl.VDI3813.Types.Binary.ValueWindow
 valueWindow;
end ValueWindowOutput;
