within BuildingControlLib.BuildingControl.Nonstandardized.Internal;
block Limiter
  "Limit the range of a signal, derived from Modelica.Blocks.Modelica.Blocks.Nonlinear.Limiter"

  parameter Real uMin = 20 "Value of u where yMin is active";
  parameter Real uMax = 30 "Value of u where yMax is active";
  parameter Real yMin = 25 "Value of y where yMin is active";
  parameter Real yMax = 30 "Value of y where yMax is active";
  parameter Boolean strict=false "= true, if strict limits with noEvent(..)"
    annotation (Evaluate=true, choices(checkBox=true), Dialog(tab="Advanced"));
  parameter Boolean limitsAtInit=true
    "= false, if limits are ignored during initialization (i.e., y=u)"
    annotation (Evaluate=true, choices(checkBox=true), Dialog(tab="Advanced"));
  extends Modelica.Blocks.Interfaces.SISO;

equation
  assert(uMax >= uMin, "Limiter: Limits must be consistent. However, uMax (=" + String(uMax) +
                       ") < uMin (=" + String(uMin) + ")");
  if initial() and not limitsAtInit then
     y = u;
     assert(u >= uMin - 0.01*abs(uMin) and
            u <= uMax + 0.01*abs(uMax),
           "Limiter: During initialization the limits have been ignored.\n"+
           "However, the result is that the input u is not within the required limits:\n"+
           "  u = " + String(u) + ", uMin = " + String(uMin) + ", uMax = " + String(uMax));
  elseif strict then
    y = smooth(0, noEvent(if u > uMax then yMax else if u < uMin then yMin else ((yMax-yMin)/(uMax-uMin))*u + (yMax-((yMax-yMin)/(uMax-uMin))*uMax)));
  else
    y = smooth(0,if u > uMax then yMax else if u < uMin then yMin else ((yMax-yMin)/(uMax-uMin))*u + (yMax-((yMax-yMin)/(uMax-uMin))*uMax));
  end if;

  annotation (
    Documentation(info="<html>
<p>
The Limiter block passes its input signal as output signal
as long as the input is within the specified upper and lower
limits. If this is not the case, the corresponding limits are passed
as output.
</p>
</html>"), Icon(coordinateSystem(
    preserveAspectRatio=true,
    extent={{-100,-100},{100,100}}), graphics={
    Line(points={{0,-90},{0,68}}, color={192,192,192}),
    Polygon(
      points={{0,90},{-8,68},{8,68},{0,90}},
      lineColor={192,192,192},
      fillColor={192,192,192},
      fillPattern=FillPattern.Solid),
    Line(points={{-90,0},{68,0}}, color={192,192,192}),
    Polygon(
      points={{90,0},{68,-8},{68,8},{90,0}},
      lineColor={192,192,192},
      fillColor={192,192,192},
      fillPattern=FillPattern.Solid),
    Line(points={{-80,-70},{-50,-70},{50,70},{80,70}}, color={0,0,0}),
    Text(
      extent={{-150,150},{150,110}},
      textString="%name",
      lineColor={0,0,255}),
    Line(
      visible=strict,
      points={{50,70},{80,70}},
      color={255,0,0},
      smooth=Smooth.None),
    Line(
      visible=strict,
      points={{-80,-70},{-50,-70}},
      color={255,0,0},
      smooth=Smooth.None)}),
    Diagram(coordinateSystem(
    preserveAspectRatio=true,
    extent={{-100,-100},{100,100}}), graphics={
    Line(points={{0,-60},{0,50}}, color={192,192,192}),
    Polygon(
      points={{0,60},{-5,50},{5,50},{0,60}},
      lineColor={192,192,192},
      fillColor={192,192,192},
      fillPattern=FillPattern.Solid),
    Line(points={{-60,0},{50,0}}, color={192,192,192}),
    Polygon(
      points={{60,0},{50,-5},{50,5},{60,0}},
      lineColor={192,192,192},
      fillColor={192,192,192},
      fillPattern=FillPattern.Solid),
    Line(points={{-50,-40},{-30,-40},{30,40},{50,40}}, color={0,0,0}),
    Text(
      extent={{46,-6},{68,-18}},
      lineColor={128,128,128},
      textString="u"),
    Text(
      extent={{-30,70},{-5,50}},
      lineColor={128,128,128},
      textString="y"),
    Text(
      extent={{-58,-54},{-28,-42}},
      lineColor={128,128,128},
      textString="uMin"),
    Text(
      extent={{26,40},{66,56}},
      lineColor={128,128,128},
      textString="uMax")}));
end Limiter;
