within BuildingControlLib.BuildingControl.VDI3814.StateGraph;
block Or "From standard VDI 3814-6 a logical OR"
   extends Modelica.Blocks.MathBoolean.Or;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-46,50},{48,-46}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString=">1")}), Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics),
    Documentation(revisions="<html>
<ul>
<li>November 11, 2017&nbsp; by Georg Ferdinand Schneider:<br>Implemented.</li>
</ul>
</html>"));
end Or;
