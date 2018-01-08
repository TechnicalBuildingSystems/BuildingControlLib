within BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Internal;
block AirQualityMeasurementFunctionality
  "Algorithm model to provide functionality of AirQualityMeasurement"

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
    Q "Physical signal of an indoor air quality measurement." annotation (Placement(transformation(extent={{-20,80},{20,120}}),
        iconTransformation(extent={{-20,80},{20,120}})));
   BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealOutput
    Q_ROOM
    "Relative air quality in rooms (0 = worst quality; 1 = best quality)."
     annotation (Placement(transformation(extent={{100,-20},{160,20}}),
                   iconTransformation(extent={{100,-20},{160,20}})));

equation
    Q = PAR_CAL_slope * Q_ROOM + PAR_CAL_yIntercept;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),           Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics),
    Documentation(info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Block that implements the functionality of &QUOT;Air quality measurement&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.7, p. 15]</a>. </p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p>&QUOT;The sensor function <i>Air quality measurement</i> (RAFL section 2, column 6; informative function block Figure 8) provides information allowing conclusions to be drawn about the air quality in a room.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.7, p. 15]</a></p>
<p>Because the specification of the air quality signal is indefinite, in this case a value between 0 and 1 had been chosen to represent the air quality, whereas the value 0 stands for the worst quality and 1 for the best quality.</p>
<h4><span style=\"color:#008000\">Input Variables</span></h4>
<p><b>Tab . 1: </b>The following table presents the input variables of the function as specified in the standard.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Datatype VDI3813</h4></p></td>
<td><p align=\"center\"><h4>Semantic data type</h4></p></td>
<td><p align=\"center\"><h4>Signal flow direction</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>Q</p></td>
<td valign=\"top\"><p>Analog</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Analog.ValuePhysicalAirQualityInput\">ValuePhysicalAirQuality</a> </p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Physical signal of an indoor air quality measurement.</p></td>
</tr>
</table>
<p><br><h4><span style=\"color:#008000\">Output Variables</span></h4></p>
<p><b>Tab . 2: </b>The following table presents the output variables of the function as specified in the standard.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Datatype VDI3813</h4></p></td>
<td><p align=\"center\"><h4>Semantic data type</h4></p></td>
<td><p align=\"center\"><h4>Signal flow direction</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>Q_ROOM</p></td>
<td valign=\"top\"><p>Quality</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirQuality.ValueAirQualityOutput\">ValueAirQuality</a> </p></td>
<td valign=\"top\"><p>Output</p></td>
<td valign=\"top\"><p>Relative air quality in rooms (0 = worst quality; 1 = best quality).</p></td>
</tr>
</table>
<p><br><br><b><font style=\"color: #008000; \">Parameters</font></b> </p>
<p><b>Tab . 3: </b>The following table presents the parameters of the function. In this case there are differences from the standard because the description of PAR_CAL is not very specific: &QUOT;calibration of electronic measuring equipment/physical interface&QUOT;, <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.7, Figure 8, p. 15]</a>. For calibration issues the assumption of a linear equation has been made where the parameter PAR_CAL_slope allows to adjust the slope of the curve and the parameter PAR_CAL_yIntercept allows to adjust the y axis intercept.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p><br><br>PAR_CAL_slope</p></td>
<td valign=\"top\"><p>Slope to calibrate measurement of air quality with a linear equation.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_CAL_yIntercept</p></td>
<td valign=\"top\"><p>Y-axis intercept of linear air quality calibration equation.</p></td>
</tr>
</table>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end AirQualityMeasurementFunctionality;
