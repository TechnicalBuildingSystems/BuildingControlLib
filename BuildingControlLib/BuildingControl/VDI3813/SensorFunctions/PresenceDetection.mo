within BuildingControlLib.BuildingControl.VDI3813.SensorFunctions;
block PresenceDetection "Sensor function to retrieve presence from physical sensor"
 extends Interfaces.Partial.PartialFunction(redeclare Internal.PresenceDetectionFunctionality functionality(
  PAR_HOLD=PAR_HOLD,
  holdingActive=holdingActive));
 parameter Modelica.SIunits.Time PAR_HOLD=500 "Holding time in seconds for presence state, when presence has been detected.";
 parameter Boolean holdingActive=false "Flag for the presence holding process (true = holding is activated / false = holding is deactivated)";
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.PhysicalBooleanInput P
    "Physical signal of presence detection(true = presence detected/false = no presence detected)."
    annotation (Placement(transformation(extent={{-10,90},{10,110}}),
        iconTransformation(extent={{-20,80},{20,120}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.BooleanOutput P_AUTO
    "Boolean presence state in a room which comes from a sensor(true = occupied / false = unoccupied)."
    annotation (Placement(transformation(extent={{100,60},{120,80}}),
        iconTransformation(extent={{100,-20},{160,20}})));
equation
  connect(P, functionality.P) annotation (Line(
      points={{0,100},{0,38}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(P_AUTO, functionality.P_AUTO) annotation (Line(
      points={{110,70},{80,70},{80,0},{49.4,0}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
 annotation (
  Icon(coordinateSystem(preserveAspectRatio=false)),
  Diagram(coordinateSystem(preserveAspectRatio=false)),
  Documentation(
   info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Block that implements the functionality of &QUOT;Presence detection&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.2, p. 10-11]</a>. </p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p>&QUOT;The sensor function <i>Presence detection</i> (RA-FL section 2, column 1, see Section 7.3, Bild 61; informative function block Figure 3) automatically detects the presence of persons in the room and passes the output information of either the &ldquo;present&rdquo; or the &ldquo;absent&rdquo; state to those application functions whose response is determined by the room occupancy state. Due to the use in connection with lighting functions, the output information must be generated without any delay when the status of the evaluation unit changes.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.2, p. 10-11]</a></p>
<p><b>Fig. 1: </b>&QUOT;Informative representation of the sensor function <i>Presence detection</i>&QUOT;, <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.2, Figure 3, p. 11]</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/docVDI3813_PresenceDetection.png\" alt=\"docVDI3813_PresenceDetection.png\"/> </p></td>
</tr>
</table>

</html>",
   revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"),
  preferredView="info");
end PresenceDetection;
