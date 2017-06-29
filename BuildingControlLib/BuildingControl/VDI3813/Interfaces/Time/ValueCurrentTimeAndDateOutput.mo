within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Time;
connector ValueCurrentTimeAndDateOutput
  "Output connector of ValueCurrentTimeAndDate"
 extends Partial.PartialOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.Time.ValueCurrentTimeAndDate
 valueCurrentTimeAndDate;
end ValueCurrentTimeAndDateOutput;
