within BuildingControlLib.BuildingControl.Nonstandardized;
block SequenceControl "Model of a sequence control function"
  extends Modelica.Blocks.Interfaces.SISO;

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Parameter
  parameter Integer nCurves = 2 "Number of curves in sequence control";
  parameter Real CurvesIntervalCoordinates[nCurves,2,2]= {{{16,100},{19,0}},
                                                          {{23,0},{26,100}}}
    "Parameter array to specify interval coordinates left hand side and right hand side point";
   /*
   Explanation of the input format to parameterise curves:
      
   {
   {{xCooLHS_1,yCooLHS_1},{xCooRHS_1,yCooRHS_1}},
   {{xCooLHS_2,yCooLHS_2},{xCooRHS_2,yCooRHS_2}},
   ...
   {{xCooLHS_nCurves,yCooLHS_nCurves},{xCooRHS_1,yCooRHS_nCurves}},
   }
   
   xCooLHS_n - X-coordinate of left hand side interval of the n-th curve
   yCooLHS_n - Y-coordinate of left hand side interval of the n-th curve
   xCooRHS_n - X-coordinate of right hand side interval of the n-th curve
   yCooRHS_n - Y-coordinate of right hand side interval of the n-th curve
   */

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Components

  Internal.Limiter Curves[nCurves](
      uMin = { CurvesIntervalCoordinates[i,1,1] for i in 1:nCurves},
      uMax = { CurvesIntervalCoordinates[i,2,1] for i in 1:nCurves},
      yMin = { CurvesIntervalCoordinates[i,1,2] for i in 1:nCurves},
      yMax = { CurvesIntervalCoordinates[i,2,2] for i in 1:nCurves})
      "Array of curves in sequence control";

  Modelica.Blocks.Math.MultiSum multiSum(nu=nCurves) "Aggregate output signals of all curves";



equation

  for i in 1:nCurves loop
    // Connect input to inputs of curves
    connect(u,Curves[i].u);
    // Connect different output signals to aggregate model (MultiSum)
    connect(Curves[i].y,multiSum.u[i]);
  end for;
  // Connect aggregated output to SISO.y
connect(multiSum.y,y);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={
    Line(points={{-86,-90},{-86,68}},
                                  color={192,192,192}),
    Polygon(
      points={{-86,90},{-94,68},{-78,68},{-86,90}},
      lineColor={192,192,192},
      fillColor={192,192,192},
      fillPattern=FillPattern.Solid),
    Line(points={{-90,-86},{70,-86}},
                                  color={192,192,192}),
    Polygon(
      points={{92,-86},{70,-94},{70,-78},{92,-86}},
      lineColor={192,192,192},
      fillColor={192,192,192},
      fillPattern=FillPattern.Solid),
        Line(
          points={{-86,46},{-62,46},{-16,-86},{70,-86}},
          color={0,0,0},
          smooth=Smooth.None,
          pattern=LinePattern.Dash,
          thickness=0.5),
        Text(
          extent={{-30,-90},{18,-96}},
          lineColor={0,0,0},
          pattern=LinePattern.DashDot,
          lineThickness=0.5,
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid,
          textString="Input signal"),
        Text(
          extent={{-17,9},{17,-9}},
          lineColor={0,0,0},
          pattern=LinePattern.DashDot,
          lineThickness=0.5,
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid,
          origin={-91,7},
          rotation=90,
          textString="Output signal"),
        Line(
          points={{-86,-86},{22,-86},{64,46},{92,46}},
          color={0,0,0},
          smooth=Smooth.None)}),
                          Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics={
                                Rectangle(
        extent={{-100,-100},{100,100}},
        lineColor={0,0,127},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid),
    Line(points={{-88,-92},{-88,66}},
                                  color={192,192,192}),
    Polygon(
      points={{-88,88},{-96,66},{-80,66},{-88,88}},
      lineColor={192,192,192},
      fillColor={192,192,192},
      fillPattern=FillPattern.Solid),
    Line(points={{-92,-88},{68,-88}},
                                  color={192,192,192}),
    Polygon(
      points={{90,-88},{68,-96},{68,-80},{90,-88}},
      lineColor={192,192,192},
      fillColor={192,192,192},
      fillPattern=FillPattern.Solid),
        Line(
          points={{-88,44},{-64,44},{8,-88},{68,-88}},
          color={0,0,0},
          smooth=Smooth.None,
          pattern=LinePattern.Dash,
          thickness=0.5),
        Text(
          extent={{-66,-26},{-36,-34}},
          lineColor={0,0,0},
          pattern=LinePattern.DashDot,
          lineThickness=0.5,
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid,
          textString="Curve [nCurves]"),
        Text(
          extent={{-32,-92},{16,-98}},
          lineColor={0,0,0},
          pattern=LinePattern.DashDot,
          lineThickness=0.5,
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid,
          textString="Input signal"),
        Text(
          extent={{-17,9},{17,-9}},
          lineColor={0,0,0},
          pattern=LinePattern.DashDot,
          lineThickness=0.5,
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid,
          origin={-93,5},
          rotation=90,
          textString="Output signal"),
        Text(
          extent={{-66,60},{-44,48}},
          lineColor={0,0,0},
          pattern=LinePattern.DashDot,
          lineThickness=0.5,
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid,
          textString="Interval coordinates lefthandside [nCurves]
(x,y)"),Line(
          points={{-62,44},{-56,50}},
          color={0,0,0},
          smooth=Smooth.None),
        Text(
          extent={{24,-46},{46,-58}},
          lineColor={0,0,0},
          pattern=LinePattern.DashDot,
          lineThickness=0.5,
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid,
          textString="Interval coordinates righthandside [nCurves]
(x,y)"),Line(
          points={{34,-60},{12,-84}},
          color={0,0,0},
          smooth=Smooth.None)}),
    Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
", info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<p>This model allows to implement a sequence control often deployed in building automation systems. A sequence control is used to implement for example
 that a heating coil valve of an air handling unit may only be opened when the respective cooling coil valve is closed. We model each <i>sequence</i> of a 
 sequence control as a set of three linear curves defined on their intervals. The first curves interval ranges from -inf to xCooLHS, the
second interval ranges from xCooLHS to xCooRHS and the third interval from xCooRHS to +inf.</p>

<h4><span style=\"color: #008000\">Assumptions</span></h4>

<p>We assume that only linear functions occur. One sequence control may be composed out of several sequences spanning with <code>nCurves</code>.</p>

<h4><span style=\"color: #008000\">Parameterisation</span></h4>
<p>To parameterise multiple sequences we use a multidimensional array which should be used as follows:</p>
 <p><code>
CurvesIntervalCoordinates[nCurves,2,2]  = {<br />
   {{xCooLHS_1,yCooLHS_1},{xCooRHS_1,yCooRHS_1}},<br />
   {{xCooLHS_2,yCooLHS_2},{xCooRHS_2,yCooRHS_2}},<br />
   ...<br />
   {{xCooLHS_nCurves,yCooLHS_nCurves},{xCooRHS_1,yCooRHS_nCurves}},<br />
   }<br /></code><br />
   where<br /><br />
<code>xCooLHS_n - X-coordinate of left hand side interval of the n-th curve<br />
   yCooLHS_n - Y-coordinate of left hand side interval of the n-th curve<br />
   xCooRHS_n - X-coordinate of right hand side interval of the n-th curve<br />
   yCooRHS_n - Y-coordinate of right hand side interval of the n-th curve<br />
</code></p>

</html>"));
end SequenceControl;
