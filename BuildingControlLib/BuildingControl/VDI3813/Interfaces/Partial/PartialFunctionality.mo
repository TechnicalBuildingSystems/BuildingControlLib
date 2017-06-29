within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Partial;
partial block PartialFunctionality
  "Superclass for all functionality blocks to provide graphics"
  // TO DO: Add parameter
  // TO DO: Add connectors
  // TO DO: Redeclare functionality with suitable algorithm
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),
                         graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          pattern=LinePattern.Dash,
          lineThickness=1),
        Text(
          extent={{-74,132},{72,20}},
          lineColor={0,0,0},
          textString="Function specific functionality",
          lineThickness=1),
        Bitmap(extent={{-39,42},{40,-40}}, fileName=
              "modelica://BuildingControlLib/Resources/Images/FunctionalityViz.png")}),
      Documentation(info="<html>
<pre><font style=\"color: #006400; \">Partial&nbsp;block&nbsp;that&nbsp;should&nbsp;be&nbsp;used&nbsp;as&nbsp;superclass&nbsp;for&nbsp;all&nbsp;function&nbsp;blocks&nbsp;to&nbsp;</font>
<font style=\"color: #006400; \">guarantee&nbsp;that&nbsp;the&nbsp;design&nbsp;is&nbsp;aligned&nbsp;with&nbsp;the&nbsp;graphical&nbsp;conventions&nbsp;introduced&nbsp;</font>
<font style=\"color: #006400; \">for&nbsp;function&nbsp;blocks&nbsp;in&nbsp;VDI3813.</font></pre>
</html>"));
end PartialFunctionality;
