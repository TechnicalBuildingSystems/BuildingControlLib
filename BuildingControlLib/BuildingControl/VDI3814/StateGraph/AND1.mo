within BuildingControlLib.BuildingControl.VDI3814.StateGraph;
block AND1 "Logical AND with multiple inputs and one output"
   extends Modelica.Blocks.MathBoolean.And;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-36,52},{36,-48}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="&")}), Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics),
    Documentation(revisions="<html>
<ul>
<li>November 11, 2017&nbsp; by Georg Ferdinand Schneider:<br>Implemented.</li>
</ul>
</html>"));
end AND1;
