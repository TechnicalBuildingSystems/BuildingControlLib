within BuildingControlLib.BuildingControl.VDI3813.SensorFunctions;
block PrecipitationDetection
  "Function to retrieve measurement of precipitation from physical sensor."

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Extend from PartialFunctionBlock and insert specific functionality
  extends Interfaces.Partial.PartialFunction(      redeclare
      BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Internal.PrecipitationDetectionFunctionality
      functionality(PAR_CAL=PAR_CAL));

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Connectors
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.PhysicalBooleanInput
    R
    "Physical signal of precipitation detection(true = precipitation detected/false = no precipitation detected)."
                                                                                                        annotation (Placement(transformation(extent={{-10,90},{10,110}}),
        iconTransformation(extent={{-20,80},{20,120}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.BooleanOutput
    R_ACT
    "Boolean value for precipitation outside the building(true = precipitation detected / false = no precipitation detected)."
    annotation (Placement(transformation(extent={{100,60},{120,80}}),
        iconTransformation(extent={{100,-20},{160,20}})));
  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Parameter definition
  parameter Boolean PAR_CAL = true
    "For specifying the logic of the precipitation detector.";
equation
  connect(R, functionality.R) annotation (Line(
      points={{0,100},{0,38}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(R_ACT, functionality.R_ACT) annotation (Line(
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
<p>Block that implements function &QUOT;Precipitation detection&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.9, p. 17]</a>. </p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p>&QUOT;The sensor function <i>Precipitation detection</i> (RA-FL section 2, column 8; informative function block Figure 10) provides information on rain, snow or other forms of precipitation. This information is used, e. g., as input information for protection functions of the sunshade or for the closing of window casements.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.9, p. 17]</a></p>
<p>The calibration parameter PAR_CAL is used to choose the right contact logic.</p>
<p>By default PAR_CAL ist true which leads to a positive logic. That means if precipitation&nbsp; is detected R is true and R_ACT is set to true. If no&nbsp;precipitation&nbsp;is detected R is false and R_ACT is set to false.</p>
<p>If PAR_CAL is set to false the logic is complementary/inverted. If precipitation is detected R is false and R_ACT is set to true etc..</p>
<p><b>Fig. 1: </b>&QUOT;Informative representation of the sensor function <i>Precipitation detection</i>&QUOT;, <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.9, Figure 10, p. 17]</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/docVDI3813_PrecipitationDetection.png\" alt=\"docVDI3813_PrecipitationDetection.png\"/> </p></td>
</tr>
</table>

</html>",
        revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end PrecipitationDetection;
