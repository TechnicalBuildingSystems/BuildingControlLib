within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Angle;
connector ValueAngleSunAzimuthOutput "Output connector of ValueAngleSunAzimuth"
 extends Partial.PartialOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.Angle.ValueAngleSunAzimuth
 valueAngleSunAzimuth;
end ValueAngleSunAzimuthOutput;
