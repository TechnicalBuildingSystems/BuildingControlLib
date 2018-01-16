within BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.BrightnessMeasurementFunctions;
block BrightnessMeasurementOutdoor
  "Sensor function to retrieve outdoor illuminance from physical sensor"

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Extend from PartialFunctionBlock and insert specific functionality
  extends Interfaces.Partial.PartialFunction(      redeclare
      BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Internal.BrightnessMeasurementOutdoorFunctionality
      functionality(
      PAR_CAL_slope = PAR_CAL_slope,
      PAR_CAL_yIntercept = PAR_CAL_yIntercept));

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Parameter definition
  parameter Real PAR_CAL_slope = 1
    "Slope to calibrate measurement of outdoor illuminance with a linear equation.";
  parameter Real PAR_CAL_yIntercept = 0
    "Y-axis intercept of linearoutdoor illuminance calibration equation.";

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Connectors
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.PhysicalRealInput
    H "Physical signal of outdoor brightness measurement." annotation (Placement(transformation(extent={{-10,90},{10,110}}),
        iconTransformation(extent={{-20,80},{20,120}})));

  BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealOutput
    H_OUT "Outdoor illuminance in Lux." annotation (Placement(transformation(extent={{100,60},{120,80}}),
        iconTransformation(extent={{100,-20},{160,20}})));

equation
  connect(H, functionality.H) annotation (Line(
      points={{0,100},{0,38}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(H_OUT,functionality.H_OUT) annotation (Line(
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
<p>Block that implements function &QUOT;Brightness measurement&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.6, p. 14]</a>. For semantic correctness it is specialized for outdoor illuminance.</p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p>&QUOT;The function <i>Brightness measurement</i> (RA-FL section 2, column 5; informative function block Figure 7) is required for measuring the illuminance in rooms as well as for determining the illuminance of daylight. The former is used for lighting functions, whereas the intensity of daylight influences particularly the sunshading functions.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.6, p. 14]</a></p>
<p><b>Fig. 1: </b>&QUOT;Informative representation of the sensor function <i>Brightness measurement</i>&QUOT;, <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.6, Figure 7, p. 15]</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/docVDI3813_BrightnessMeasurement.png\" alt=\"docVDI3813_BrightnessMeasurement.png\"/> </p></td>
</tr>
</table>

</html>",
        revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end BrightnessMeasurementOutdoor;
