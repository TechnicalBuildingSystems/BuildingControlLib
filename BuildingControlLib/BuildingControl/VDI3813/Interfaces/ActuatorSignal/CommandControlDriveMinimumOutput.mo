within BuildingControlLib.BuildingControl.VDI3813.Interfaces.ActuatorSignal;
connector CommandControlDriveMinimumOutput
  "Output connector of SetpointControlDriveMinimum"
 extends Partial.PartialOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.ActuatorSignal.SetpointControlDriveMinimum
 setpointControlDriveMinimum;
end CommandControlDriveMinimumOutput;
