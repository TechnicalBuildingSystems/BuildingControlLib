within BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature;
connector ValueAirTemperatureRoomOutput
  "Output connector of ValueAirTemperatureRoom"
 extends Partial.PartialOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.AirTemperature.ValueAirTemperatureRoom
 valueAirTemperatureRoom;
end ValueAirTemperatureRoomOutput;
