within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Presence;
connector ValuePresenceEvaluationInput
  "Input connector of ValuePresenceEvaluation"
 extends Partial.PartialInput;
 input
    BuildingControlLib.BuildingControl.VDI3813.Types.Presence.ValuePresenceEvaluation
  valuePresenceEvaluation;
end ValuePresenceEvaluationInput;
