within BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Internal;
block WindVelocityMeasurementFunctionality
  "Algorithm model to provide functionality of WindVelocityMeasurement"

  extends
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.Partial.PartialFunctionality;

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Parameter definition
  parameter Real PAR_CAL_slope = 1 "Slope of temperature calibration curve";
  parameter Real PAR_CAL_yIntercept = 0
    "Y-axis intercept of temperature calibration curve";

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Connectors
   BuildingControlLib.BuildingControl.VDI3813.Interfaces.PhysicalRealInput
    W "Physical signal of an outdoor wind velocity measurement (expected unit is m/s)." annotation (Placement(transformation(extent={{-20,80},{20,120}}),
        iconTransformation(extent={{-20,80},{20,120}})));
   BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealOutput
    W_ACT "Outdoor air velocity (expected unit is m/s)."
     annotation (Placement(transformation(extent={{100,-20},{160,20}}),
                   iconTransformation(extent={{100,-20},{160,20}})));

equation
  W = PAR_CAL_slope * W_ACT + PAR_CAL_yIntercept;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics),
    Documentation(info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Block that implements the functionality of &QUOT;Wind velocity measurement&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.8, p. 16]</a>. </p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p>&QUOT;The sensor function <i>Wind velocity measurement</i> (RA-FL section 2, column 7; informative function block Figure 9) provides information about the flow velocity of outdoor air at the measuring site (e. g. a building facade). This information is used to protect, e. g. particularly external sunshades from damage due to wind conditions.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.8, p. 16]</a></p>

</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end WindVelocityMeasurementFunctionality;
