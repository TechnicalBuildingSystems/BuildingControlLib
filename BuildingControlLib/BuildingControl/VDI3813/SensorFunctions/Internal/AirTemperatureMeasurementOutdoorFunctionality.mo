within BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Internal;
block AirTemperatureMeasurementOutdoorFunctionality
  "Algorithm model to provide functionality of AirTemperatureMeasurementOutdoor"

  extends
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.Partial.PartialFunctionality;

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Parameter definition
  parameter Real slope = 1 "Slope of temperature calibration curve";
  parameter Real yIntercept = 0
    "Y-axis intercept of temperature calibration curve";

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Connectors
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.PhysicalRealInput
    T "Physical signal of outdoor air temperature measurement." annotation (Placement(transformation(extent={{-20,80},{20,120}}),
        iconTransformation(extent={{-20,80},{20,120}})));

  BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealOutput
    T_OUT "Outdoor air temperature in Kelvin." annotation (Placement(transformation(extent={{100,-20},{160,20}}),
        iconTransformation(extent={{100,-20},{160,20}})));

equation
  T_OUT = slope * T + yIntercept;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics),
    Documentation(info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Block that implements the functionality of &QUOT;Air temperature measurement&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.5, p. 13]</a>. For semantic correctness it is specialized for outdoor temperatures.</p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p>&QUOT;The sensor function<i>Air temperature measurement</i> (RA-FL section 2, column 4; informative function block Figure 6) is used to measure the air temperature of the room and, in air-bound heating and cooling systems, also the extract and supply air temperatures as well as the outdoor temperature. Room, supply or extract air temperatures are the input information for heating and cooling functions, whereas the outdoor temperature is required, e. g., for night-time cooling, summer compensation or for weather protection functions of the sunshade.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.5, p. 13]</a></p>
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
<td valign=\"top\"><p>T</p></td>
<td valign=\"top\"><p>Analog</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Analog.ValuePhysicalTemperatureInput\">ValuePhysicalTemperature</a> </p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Physical signal of outdoor air temperature measurement.</p></td>
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
<td valign=\"top\"><p>T_OUT</p></td>
<td valign=\"top\"><p>Temperature</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature.ValueAirTemperatureOutdoorOutput\">ValueAirTemperatureOutdoor</a> </p></td>
<td valign=\"top\"><p>Output</p></td>
<td valign=\"top\"><p>Outdoor air temperature in Kelvin.</p></td>
</tr>
</table>
<p><br><br><b><font style=\"color: #008000; \">Parameters</font></b> </p>
<p><b>Tab . 3: </b>The following table presents the parameters of the function. In this case there are differences from the standard because the description of PAR_CAL is not very specific: &QUOT;calibration of electronic measuring equipment/physical interface&QUOT;<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.5, Figure 6, p. 14]</a>. For calibration issues the assumption of a linear equation has been made where the parameter PAR_CAL_slope allows to adjust the slope of the curve and the parameter PAR_CAL_yIntercept allows to adjust the y axis intercept.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p><br>PAR_CAL_slope</p></td>
<td valign=\"top\"><p>Slope to calibrate measurement of outdoor air temperature with a linear equation.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_CAL_yIntercept</p></td>
<td valign=\"top\"><p>Y-axis intercept of linear outdoor air temperature calibration equation.</p></td>
</tr>
</table>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end AirTemperatureMeasurementOutdoorFunctionality;
