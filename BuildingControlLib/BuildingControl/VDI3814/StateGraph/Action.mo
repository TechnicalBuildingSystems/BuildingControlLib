within BuildingControlLib.BuildingControl.VDI3814.StateGraph;
block Action
  "Model to describe actions of VDI 3814-6 state graphs. Assumption
  holds that enumeration is used for expressing the respective assigned value.
  based on Modelica.Blocks.Math.BooleanToReal"
  extends Modelica.Blocks.Interfaces.partialBooleanSI;

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Parameter

  parameter Real assignValue = 100 "Value to be assigned to respective output";
  parameter String controlOutput = "VAV.Outdoorair.Temp" "String specifying the actual control variable to which value should be assigned";

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Connectors

  Modelica.Blocks.Interfaces.RealOutput y "Connector of Real output signal"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));

equation

 y = if u then assignValue else 0.0;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
          extent={{-100,100},{100,-102}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-78,28},{64,-26}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="%controlOutput : %assignValue")}),         Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(revisions="<html>
<ul>
<li>November 11, 2017&nbsp; by Georg Ferdinand Schneider:<br>Implemented.</li>
</ul>
</html>"));
end Action;
