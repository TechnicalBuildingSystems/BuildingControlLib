within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Presence;
connector CommandPresenceOperatorOutput
  "Output connector of CommandPresenceOperator"
 extends Partial.PartialOutput;
  output
    BuildingControlLib.BuildingControl.VDI3813.Types.Presence.CommandPresenceOperator
    valuePresenceOperator;
end CommandPresenceOperatorOutput;
