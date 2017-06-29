within BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Internal;
block Limiter
  "Model to generate a single control sequence. Derived from Modelica.Blocks.Nonlinear.Limiter"
    extends Modelica.Blocks.Icons.Block;
    extends Modelica.Blocks.Interfaces.SISO;

  parameter Real uMin = 20;
  parameter Real uMax = 30;
  parameter Real yMin = 25;
  parameter Real yMax = 30;
 parameter Boolean strict=false "= true, if strict limits with noEvent(..)"
    annotation (Evaluate=true, choices(checkBox=true), Dialog(tab="Advanced"));

equation
  if strict then
  y = smooth(0, noEvent(if u > uMax then yMax else if u < uMin then yMin else ((yMax-yMin)/(uMax-uMin))*u));
  else
     y = smooth(0,if u > uMax then yMax else if u < uMin then yMin else ((yMax-yMin)/(uMax-uMin))*u);
  end if;
  annotation (preferedView="Info",
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={
        Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
        Polygon(
          points={{-80,90},{-88,68},{-72,68},{-80,90}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-90,-70},{82,-70}}, color={192,192,192}),
        Polygon(
          points={{90,-70},{68,-62},{68,-78},{90,-70}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-80,-70},{-40,-70},{31,38}}, color={0,0,0}),
        Line(points={{31,38},{86,38}}, color={0,0,0})}),
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}}), graphics={
        Polygon(
          points={{-66,100},{-72,78},{-60,78},{-66,100}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Line(points={{-66,78},{-66,-90}}, color={95,95,95}),
        Line(
          points={{-66,-20},{-16,-20},{54,50}},
          color={0,0,255},
          thickness=0.5),
        Line(points={{-86,-70},{86,-70}}, color={95,95,95}),
        Polygon(
          points={{94,-70},{72,-64},{72,-76},{94,-70}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-98,-15},{-60,-26}},
          lineColor={0,0,0},
          textString="yMin"),
        Text(
          extent={{-34,-72},{10,-83}},
          lineColor={0,0,0},
          textString="uMin"),
        Text(
          extent={{-102,100},{-61,80}},
          lineColor={0,0,0},
          textString="y"),
        Text(
          extent={{74,-80},{98,-91}},
          lineColor={0,0,0},
          textString="u"),
        Line(points={{-16,-20},{-16,-70}}, color={95,95,95}),
        Line(
          points={{54,50},{72,50}},
          color={0,0,255},
          thickness=0.5),
        Line(
          points={{54,50},{-66,50}},
          color={95,95,95},
          thickness=0.25,
          arrow={Arrow.None,Arrow.None}),
        Polygon(
          points={{54,-70},{52,-60},{56,-60},{54,-70},{54,-70}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-97,57},{-68,44}},
          lineColor={0,0,0},
          textString="yMax"),
        Text(
          extent={{32,-72},{76,-83}},
          lineColor={0,0,0},
          textString="uMax")}),
    Documentation(info="<html>
<p>
The Real output y is a ramp signal:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/Ramp.png\"
     alt=\"Ramp.png\">
</p>

<p>
If parameter duration is set to 0.0, the limiting case of a Step signal is achieved.
</p>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
end Limiter;
