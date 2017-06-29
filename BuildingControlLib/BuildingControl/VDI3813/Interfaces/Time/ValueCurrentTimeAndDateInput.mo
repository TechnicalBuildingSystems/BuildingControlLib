within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Time;
connector ValueCurrentTimeAndDateInput
  "Input connector of ValueCurrentTimeAndDate"
 extends Partial.PartialInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.Time.ValueCurrentTimeAndDate
  valueCurrentTimeAndDate;
end ValueCurrentTimeAndDateInput;
