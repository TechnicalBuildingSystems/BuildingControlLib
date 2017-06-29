within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Analog;
connector CommandPhysicalControlDriveInput
  "Input connector of CommandPhysicalControlDrive"
 extends Partial.PartialPhysicalInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.Analog.CommandPhysicalControlDrive
  commandPhysicalControlDrive;
end CommandPhysicalControlDriveInput;
