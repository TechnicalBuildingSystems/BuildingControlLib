within BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Internal;
block sunshadeUtilityCloseSlat
  "Utility block for fixed outcomes of states in sunshade control state charts (input = true -> output = -80, input = false -> output = 0)"
  extends Modelica.Blocks.Interfaces.partialBooleanSI;

  Modelica.Blocks.Sources.RealExpression valTrue(y=-80.0)
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  Modelica.Blocks.Sources.RealExpression valFalse(y=0.0)
    annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  connect(valTrue.y, switch1.u1) annotation (Line(
      points={{-59,30},{-36,30},{-36,8},{-12,8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(valFalse.y, switch1.u3) annotation (Line(
      points={{-59,-30},{-36,-30},{-36,-8},{-12,-8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch1.y, y) annotation (Line(
      points={{11,0},{110,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(u, switch1.u2) annotation (Line(
      points={{-120,0},{-12,0}},
      color={255,0,255},
      smooth=Smooth.None));
  annotation (preferedView="Info",Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
end sunshadeUtilityCloseSlat;
