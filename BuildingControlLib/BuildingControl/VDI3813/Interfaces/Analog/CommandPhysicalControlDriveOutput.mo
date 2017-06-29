within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Analog;
connector CommandPhysicalControlDriveOutput
  "Output connector of CommandPhysicalControlDrive"
 extends Partial.PartialPhysicalOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.Analog.CommandPhysicalControlDrive
 commandPhysicalControlDrive;
end CommandPhysicalControlDriveOutput;
