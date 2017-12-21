within BuildingControlLib.BuildingControl.VDI3813.Interfaces;
package type1 "Control signals, passed between room automation functions"
  connector RealInput "Real input"
    extends Modelica.Blocks.Interfaces.RealOutput;
    extends Partial.PartialInput;
  end RealInput;

  connector RealOutput "Real output"
    extends Modelica.Blocks.Interfaces.RealOutput;
    extends Partial.PartialOutput;
  end RealOutput;

  connector BooleanOutput2 "Boolean output"
    extends Partial.PartialOutput;
    output Boolean y;
  end BooleanOutput2;

  connector BooleanInput2 "Boolean input"
    extends Partial.PartialInput;
    input Boolean u;
  end BooleanInput2;

  connector BooleanOutput "Boolean output"
    extends Modelica.Blocks.Interfaces.BooleanOutput;
    extends Partial.PartialOutput;
  end BooleanOutput;

  connector BooleanInput "Boolean input"
    extends Modelica.Blocks.Interfaces.BooleanInput;
    extends Partial.PartialInput;
  end BooleanInput;

  connector RealInput2
    extends Partial.PartialInput;
    input Real u;
  end RealInput2;

  connector RealOutput2
    extends Partial.PartialOutput;
    output Real y;
  end RealOutput2;

  connector RealInput3 = input Real annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
               {100,100}}), graphics={
          Rectangle(
            extent={{100,100},{-100,-100}},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            pattern=LinePattern.None),
           Text(
             extent={{20,90},{176,-78}},
             lineColor={0,0,0},
             lineThickness=1,
             fillColor={255,255,255},
             fillPattern=FillPattern.Solid,
             textString="%name",
             fontName="Arial",
             textStyle={TextStyle.Bold}),
           Polygon(
             points={{-100,100},{-100,-100},{0,0},{-100,100}},
             lineColor={0,0,0},
             lineThickness=1,
             smooth=Smooth.None,
             fillColor={255,255,255},
             fillPattern=FillPattern.Solid)}));
  connector RealOutput3 = output Real   annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}), graphics={
          Rectangle(
            extent={{100,100},{-100,-100}},
            pattern=LinePattern.None,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
                                     Polygon(
            points={{-100,100},{-100,-100},{0,0},{-100,100}},
            lineColor={0,0,0},
            lineThickness=1,
            smooth=Smooth.None,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid), Text(
            extent={{-264,88},{-108,-80}},
            lineColor={0,0,0},
            lineThickness=1,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            textString="%name",
            fontName="Arial",
            textStyle={TextStyle.Bold})}));
end type1;
