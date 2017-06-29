within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Binary;
connector CommandPhysicalMotorControlRelayOutput
  "Output connector of CommandPhysicalMotorControlRelay"
 extends Partial.PartialPhysicalOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.Binary.CommandPhysicalMotorControlRelay
 commandPhysicalMotorControlRelay;
end CommandPhysicalMotorControlRelayOutput;
