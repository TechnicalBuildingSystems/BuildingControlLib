within BuildingControlLib.BuildingControl.VDI3813.Interfaces.ActuatorSignal;
connector CommandActuatorSignalFanSpeedOutput
  "Output connector of CommandActuatorSignalFanSpeed"
 extends Partial.PartialOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.ActuatorSignal.CommandActuatorSignalFanSpeed
 commandActuatorSignalFanSpeed;
end CommandActuatorSignalFanSpeedOutput;
