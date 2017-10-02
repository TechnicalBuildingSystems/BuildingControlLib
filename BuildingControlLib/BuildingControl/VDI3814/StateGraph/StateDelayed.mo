within BuildingControlLib.BuildingControl.VDI3814.StateGraph;
model StateDelayed
  "State in a VDI 3814-6 Stategraph, includes per definition also transitions"
   extends Interfaces.PartialState(transitions(
    waitTime = {1}, enableTimer = { false}));

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Documentation(revisions="<html>
<ul>
<li>November 11, 2017&nbsp; by Georg Ferdinand Schneider:<br>Implemented.</li>
</ul>
</html>"));
end StateDelayed;
