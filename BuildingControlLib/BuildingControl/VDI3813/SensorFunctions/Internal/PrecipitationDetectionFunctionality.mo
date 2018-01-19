within BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Internal;
block PrecipitationDetectionFunctionality
  "Algorithm model to provide functionality of PrecipitationDetection"

  extends
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.Partial.PartialFunctionality;

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Connectors
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.PhysicalBooleanInput R
    "Physical signal of precipitation detection (default: true = precipitation detected / false = no precipitation detected)."
    annotation (Placement(transformation(extent={{-20,80},{20,120}}),
        iconTransformation(extent={{-20,80},{20,120}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.BooleanOutput R_ACT
    "Boolean value for precipitation outside the building (default: true = precipitation detected / false = no precipitation detected)."
    annotation (Placement(transformation(extent={{100,-20},{160,20}}),
        iconTransformation(extent={{100,-20},{160,20}})));
  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Parameter definition
  parameter Boolean PAR_CAL=true
    "matching to the contact type of the electronic precipitation detector, [1, section 6.1.9, Figure 10, p. 17]";
equation
  if PAR_CAL then
    R = R_ACT;
  else
    R = not R_ACT;
  end if;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics),
    Documentation(info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Block that implements the functionality of &QUOT;Precipitation detection&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.9, p. 17]. </a></p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p>&QUOT;The sensor function <i>Precipitation detection</i> (RA-FL section 2, column 8; informative function block Figure 10) provides information on rain, snow or other forms of precipitation. This information is used, e. g., as input information for protection functions of the sunshade or for the closing of window casements.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.9, p. 17]</a></p>
<p>The calibration parameter PAR_CAL is used to choose the right contact logic.</p>
<p>By default PAR_CAL ist true which leads to a positive logic. That means if precipitation&nbsp; is detected R is true and R_ACT is set to true. If no&nbsp;precipitation&nbsp;is detected R is false and R_ACT is set to false.</p>
<p>If PAR_CAL is set to false the logic is complementary/inverted. If precipitation is detected R is false and R_ACT is set to true etc..</p>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end PrecipitationDetectionFunctionality;
