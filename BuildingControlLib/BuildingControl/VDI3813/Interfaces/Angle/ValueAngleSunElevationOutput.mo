within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Angle;
connector ValueAngleSunElevationOutput
  "Output connector of ValueAngleSunElevation"
 extends Partial.PartialOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.Angle.ValueAngleSunElevation
 valueAngleSunElevation;
end ValueAngleSunElevationOutput;
