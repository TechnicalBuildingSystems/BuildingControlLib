within BuildingControlLib.BuildingControl.VDI3813.Interfaces.WindVelocity;
connector ValueWindVelocityOutput "Output connector of ValueWindVelocity"
 extends Partial.PartialOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.WindVelocity.ValueWindVelocity
 valueWindVelocity;
end ValueWindVelocityOutput;
