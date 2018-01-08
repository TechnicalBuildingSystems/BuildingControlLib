within BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Internal;
block PrecipitationDetectionFunctionality
  "Algorithm model to provide functionality of PrecipitationDetection"

  extends
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.Partial.PartialFunctionality;

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Connectors
   BuildingControlLib.BuildingControl.VDI3813.Interfaces.PhysicalBooleanInput
    R
    "Physical signal of precipitation detection (default: true = precipitation detected / false = no precipitation detected)."
                                                                                                        annotation (Placement(transformation(extent={{-20,80},{20,120}}),
        iconTransformation(extent={{-20,80},{20,120}})));
   BuildingControlLib.BuildingControl.VDI3813.Interfaces.BooleanOutput
    R_ACT
    "Boolean value for precipitation outside the building (default: true = precipitation detected / false = no precipitation detected)."
    annotation (Placement(transformation(extent={{100,-20},{160,20}}),
        iconTransformation(extent={{100,-20},{160,20}})));
  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Parameter definition
  parameter Boolean PAR_CAL = true
    "matching to the contact type of the electronic precipitation detector, [1, section 6.1.9, Figure 10, p. 17]";
equation
  if PAR_CAL then
    R = R_ACT;
  else
    R = not R_ACT;
  end if;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics),
    Documentation(info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Block that implements the functionality of &QUOT;Precipitation detection&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.9, p. 17]. </a></p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p>&QUOT;The sensor function <i>Precipitation detection</i> (RA-FL section 2, column 8; informative function block Figure 10) provides information on rain, snow or other forms of precipitation. This information is used, e. g., as input information for protection functions of the sunshade or for the closing of window casements.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.9, p. 17]</a></p>
<p>The calibration parameter PAR_CAL is used to choose the right contact logic.</p>
<p>By default PAR_CAL ist true which leads to a positive logic. That means if precipitation&nbsp; is detected R is true and R_ACT is set to true. If no&nbsp;precipitation&nbsp;is detected R is false and R_ACT is set to false.</p>
<p>If PAR_CAL is set to false the logic is complementary/inverted. If precipitation is detected R is false and R_ACT is set to true etc..</p>
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
<td valign=\"top\"><p>R</p></td>
<td valign=\"top\"><p>Binary</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Physical.ValuePhysicalPrecipitationInput\">ValuePhysicalPrecipitation</a> </p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Physical signal of precipitation detection (default: true = precipitation detected / false = no precipitation detected).</p></td>
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
<td valign=\"top\"><p>R_ACT</p></td>
<td valign=\"top\"><p>Binary</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Binary.ValuePrecipitationOutput\">ValuePrecipitation</a> </p></td>
<td valign=\"top\"><p>Output</p></td>
<td valign=\"top\"><p>Boolean value for precipitation outside the building (default: true = precipitation detected / false = no precipitation detected).</p></td>
</tr>
</table>
<p><br><br><br><br><b><font style=\"color: #008000; \">Parameters</font></b> </p>
<p><b>Tab . 3: </b>The following table presents the parameter of the function as specified in the standard.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_CAL</p></td>
<td valign=\"top\"><p>For specifying the logic of the precipitation detector.</p></td>
</tr>
</table>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end PrecipitationDetectionFunctionality;
