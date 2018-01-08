within BuildingControlLib.BuildingControl.VDI3813.SensorFunctions;
block WindVelocityMeasurement
  "Sensor function to retrieve wind velocity measurement from physical sensor."

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Extend from PartialFunctionBlock and insert specific functionality
  extends Interfaces.Partial.PartialFunction(      redeclare
      BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Internal.WindVelocityMeasurementFunctionality
      functionality(
      PAR_CAL_slope = PAR_CAL_slope,
      PAR_CAL_yIntercept = PAR_CAL_yIntercept));

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Parameter definition
  parameter Real PAR_CAL_slope = 1
    "Slope to calibrate measurement of wind velocity with a linear equation.";
  parameter Real PAR_CAL_yIntercept = 0
    "Y-axis intercept of linear wind velocity calibration equation.";

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Connectors
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.PhysicalRealInput
    W "Physical signal of an outdoor wind velocity measurement." annotation (Placement(transformation(extent={{-10,90},{10,110}}),
        iconTransformation(extent={{-20,80},{20,120}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealOutput
    W_ACT "Outdoor air velocity in m/s." annotation (Placement(transformation(extent={{100,60},{120,80}}),
                   iconTransformation(extent={{100,-20},{160,20}})));
equation

  connect(W, functionality.W) annotation (Line(
      points={{0,100},{0,38}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(W_ACT, functionality.W_ACT) annotation (
      Line(
      points={{110,70},{80,70},{80,0},{49.4,0}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),      graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics),  preferredView="info",
Documentation(info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Block that implements function &QUOT;Wind velocity measurement&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.8, p. 16]</a>. </p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p>&QUOT;The sensor function <i>Wind velocity measurement</i> (RA-FL section 2, column 7; informative function block Figure 9) provides information about the flow velocity of outdoor air at the measuring site (e. g. a building facade). This information is used to protect, e. g. particularly external sunshades from damage due to wind conditions.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.8, p. 16]</a></p>
<p><b>Fig. 1: </b>&QUOT;Informative representation of the sensor function <i>Wind velocity measurement</i>&QUOT;, <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.8, Figure 9, p. 16]</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/docVDI3813_WindVelocityMeasurement.png\" alt=\"docVDI3813_WindVelocityMeasurement.png\"/> </p></td>
</tr>
</table>
<p><br><h4><span style=\"color:#008000\">Input Variables</span></h4></p>
<p><b>Tab . 1: </b>The following table presents the input variables of the function as specified in the standard.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Datatype VDI3813</h4></p></td>
<td><p align=\"center\"><h4>Semantic data type</h4></p></td>
<td><p align=\"center\"><h4>Signal flow direction</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>W</p></td>
<td valign=\"top\"><p>Analog</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Analog.ValuePhysicalWindVelocityInput\">ValuePhysicalWindVelocity</a> </p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Physical signal of an outdoor wind velocity measurement.</p></td>
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
<td valign=\"top\"><p>W_ACT</p></td>
<td valign=\"top\"><p>ValueWindVelocity</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Wind.ValueWindVelocityOutput\">ValueWindVelocity</a></p></td>
<td valign=\"top\"><p>Output</p></td>
<td valign=\"top\"><p>Outdoor air velocity in m/s.</p></td>
</tr>
</table>
<p><br><br><br><b><font style=\"color: #008000; \">Parameters</font></b> </p>
<p><b>Tab . 3: </b>The following table presents the parameters of the function. In this case there are differences from the standard because the description of PAR_CAL is not very specific: &QUOT;calibration parameter for matching to the measurement signal&QUOT;, <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.8, Figure 9, p. 16]</a>. For calibration issues the assumption of a linear equation has been made where the parameter PAR_CAL_slope allows to adjust the slope of the curve and the parameter PAR_CAL_yIntercept allows to adjust the y axis intercept.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p><br><br>PAR_CAL_slope</p></td>
<td valign=\"top\"><p>Slope to calibrate measurement of wind velocity with a linear equation.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_CAL_yIntercept</p></td>
<td valign=\"top\"><p>Y-axis intercept of linear wind velocity calibration equation.</p></td>
</tr>
</table>
</html>",
        revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end WindVelocityMeasurement;
