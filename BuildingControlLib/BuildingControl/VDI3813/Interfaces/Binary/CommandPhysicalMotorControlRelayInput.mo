within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Binary;
connector CommandPhysicalMotorControlRelayInput
  "Input connector of CommandPhysicalMotorControlRelay"
 extends Partial.PartialPhysicalInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.Binary.CommandPhysicalMotorControlRelay
  commandPhysicalMotorControlRelay;
end CommandPhysicalMotorControlRelayInput;
