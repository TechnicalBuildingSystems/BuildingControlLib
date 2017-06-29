within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Presence;
connector ValuePresenceEvaluationOutput
  "Output connector of ValuePresenceEvaluation"
 extends Partial.PartialOutput;
 output
    BuildingControlLib.BuildingControl.VDI3813.Types.Presence.ValuePresenceEvaluation
 valuePresenceEvaluation;
end ValuePresenceEvaluationOutput;
