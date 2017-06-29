within BuildingControlLib.BuildingControl.VDI3813.Interfaces.ActuatorSignal;
connector StatusActuatorSignalFanSpeedOutput
  "Output connector of StatusActuatorSignalFanSpeed"
 extends Partial.PartialOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.ActuatorSignal.StatusActuatorSignalFanSpeed
 statusActuatorSignalFanSpeed;
end StatusActuatorSignalFanSpeedOutput;
