within BuildingControlLib.BuildingControl.VDI3813.Interfaces.ActuatorSignal;
connector CommandControlDriveMinimumInput
  "Input connector of SetpointControlDriveMinimum"
 extends Partial.PartialInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.ActuatorSignal.SetpointControlDriveMinimum
  setpointControlDriveMinimum;
end CommandControlDriveMinimumInput;
