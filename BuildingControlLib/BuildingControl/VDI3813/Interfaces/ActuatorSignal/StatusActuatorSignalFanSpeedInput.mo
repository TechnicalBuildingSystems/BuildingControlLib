within BuildingControlLib.BuildingControl.VDI3813.Interfaces.ActuatorSignal;
connector StatusActuatorSignalFanSpeedInput
  "Input connector of StatusActuatorSignalFanSpeed"
 extends Partial.PartialInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.ActuatorSignal.StatusActuatorSignalFanSpeed
  statusActuatorSignalFanSpeed;
end StatusActuatorSignalFanSpeedInput;
