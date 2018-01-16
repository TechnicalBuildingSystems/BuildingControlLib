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

</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end AirQualityMeasurementFunctionality;
