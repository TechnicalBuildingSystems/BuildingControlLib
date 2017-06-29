within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Partial;
partial block PartialFunction "Superclass for all function blocks to 
  provide graphics and enforce implementation of functionality"

  // TO DO: Add parameter
  // TO DO: Add connectors
  // TO DO: Redeclare functionality with suitable algorithm
   replaceable PartialFunctionality functionality
     annotation (Placement(transformation(extent={{-38,-38},{38,38}})));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                               graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineThickness=0.5),
        Line(
          points={{-100,74},{100,74}},
          color={0,0,0},
          thickness=0.5,
          smooth=Smooth.None),
        Text(
          extent={{-100,96},{98,78}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="%name",
          fontName="Arial",
          textStyle={TextStyle.Bold})}),
    Documentation(info="<html>
<pre><font style=\"color: #006400; \">Partial&nbsp;block&nbsp;that&nbsp;should&nbsp;be&nbsp;used&nbsp;as&nbsp;superclass&nbsp;for&nbsp;all&nbsp;function&nbsp;blocks&nbsp;to&nbsp;</font>
<font style=\"color: #006400; \">guarantee&nbsp;that&nbsp;the&nbsp;design&nbsp;is&nbsp;aligned&nbsp;with&nbsp;the&nbsp;graphical&nbsp;conventions&nbsp;introduced&nbsp;</font>
<font style=\"color: #006400; \">for&nbsp;function&nbsp;blocks&nbsp;in&nbsp;VDI3813.</font></pre>
</html>"));
end PartialFunction;
