within BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature;
connector ValueAirTemperatureRoomInput
  "Input connector of ValueAirTemperatureRoom"
 extends Partial.PartialInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.AirTemperature.ValueAirTemperatureRoom
  valueAirTemperatureRoom;
end ValueAirTemperatureRoomInput;
