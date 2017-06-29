within BuildingControlLib.BuildingControl.VDI3814.StateGraph;
model InitialState
  "\"Intital state in a VDI 3814-6 stategraph. The state is always numbered 0\""
  extends Interfaces.PartialInitialState(
      nNumbering = 0);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    Documentation(revisions="<html>
<ul>
<li>November 11, 2017&nbsp; by Georg Ferdinand Schneider:<br>Implemented.</li>
</ul>
</html>"));
end InitialState;
