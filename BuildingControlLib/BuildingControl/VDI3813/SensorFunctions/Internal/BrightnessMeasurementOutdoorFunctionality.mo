within BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Internal;
block BrightnessMeasurementOutdoorFunctionality
  "Algorithm model to provide functionality of BrightnessMeasurementOutdoor"

  extends
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.Partial.PartialFunctionality;

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Parameter definition
  parameter Real PAR_CAL_slope = 1 "Slope of illuminance calibration curve";
  parameter Real PAR_CAL_yIntercept = 0
    "Y-axis intercept of illuminance calibration curve";

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Connectors
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.PhysicalRealInput
    H "Physical signal of outdoor brightness measurement." annotation (Placement(transformation(extent={{-20,80},{20,120}}),
        iconTransformation(extent={{-20,80},{20,120}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealOutput
    H_OUT "Outdoor illuminance in Lux." annotation (Placement(transformation(extent={{100,-20},{160,20}}),
        iconTransformation(extent={{100,-20},{160,20}})));

equation
    H_OUT = PAR_CAL_slope *
     H + PAR_CAL_yIntercept;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics),
    Documentation(info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Block that implements the functionality of &QUOT;Brightness measurement&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.6, p. 14]</a>. For semantic correctness it is specialized for outdoor illuminance.</p>
<p>. </p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p>&QUOT;The function <i>Brightness measurement</i> (RA-FL section 2, column 5; informative function block Figure 7) is required for measuring the illuminance in rooms as well as for determining the illuminance of daylight. The former is used for lighting functions, whereas the intensity of daylight influences particularly the sunshading functions.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.6, p. 14]</a></p>

</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end BrightnessMeasurementOutdoorFunctionality;
