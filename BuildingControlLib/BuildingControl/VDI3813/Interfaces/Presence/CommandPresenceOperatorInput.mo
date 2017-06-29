within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Presence;
connector CommandPresenceOperatorInput
  "Input connector of CommandPresenceOperator"
 extends Partial.PartialInput;
  input
    BuildingControlLib.BuildingControl.VDI3813.Types.Presence.CommandPresenceOperator
    valuePresenceOperator;
end CommandPresenceOperatorInput;
