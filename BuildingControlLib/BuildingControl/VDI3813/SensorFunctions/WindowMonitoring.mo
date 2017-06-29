within BuildingControlLib.BuildingControl.VDI3813.SensorFunctions;
block WindowMonitoring
  "Sensor function to retrieve window state from physical sensor"

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Extend from PartialFunctionBlock and insert specific functionality
  extends Interfaces.Partial.PartialFunction(      redeclare
      BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Internal.WindowMonitoringFunctionality
      functionality(PAR_CAL=PAR_CAL));

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Connectors
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.Physical.ValuePhysicalBinaryInput
    B "Physical signal of window contact (true = closed / false = open)." annotation (Placement(transformation(extent={{-10,90},{10,110}}),
        iconTransformation(extent={{-20,80},{20,120}})));

  BuildingControlLib.BuildingControl.VDI3813.Interfaces.Binary.ValueWindowOutput
    B_WINDOW "Boolean window state (true = closed / false = open)."
     annotation (Placement(transformation(extent={{100,60},{120,80}}),
                  iconTransformation(extent={{100,-20},{160,20}})));
  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Parameter definition
  parameter Boolean PAR_CAL = true
    "For specifying the logic of the window contact.";
equation

  connect(B, functionality.B) annotation (Line(
      points={{0,100},{0,38}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(B_WINDOW, functionality.B_WINDOW) annotation (Line(
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
<p>Block that implements function &QUOT;Window monitoring&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.3, p. 11-12]</a>. </p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p>&QUOT;The sensor function <i>Window monitoring</i> (RA-FL section 2, column 2; informative function block Figure 4) provides information on the open/closed state of, e. g., a window casement, a sash, a group of casements, etc., in terms of the binary states &ldquo;open &rdquo; or &ldquo;closed &rdquo;.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.3, p. 11-12]</a></p>
<p>The calibration parameter PAR_CAL is used to choose the right contact logic.</p>
<p>By default PAR_CAL ist true which leads to a negative logic. That means if the window is closed B is true and B_WINDOW is set to true. If the window&nbsp;is open B is false and B_WINDOW is set to false.</p>
<p>If PAR_CAL is set to false the logic is complementary/inverted. If the window is closed B is false and B_WINDOW is set to true etc..</p>
<p><b>Fig. 1: </b>&QUOT;Informative representation of the sensor function <i>Window monitoring</i>&QUOT;, <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.3, Figure 4, p. 12]</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/docVDI3813_WindowMonitoring.png\" alt=\"docVDI3813_WindowMonitoring.png\"/> </p></td>
</tr>
</table>
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
<td valign=\"top\"><p>B</p></td>
<td valign=\"top\"><p>Binary</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Binary.ValuePhysicalBinaryInput\">ValuePhysicalBinary</a></p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Physical signal of window contact (default: true = closed / false = open).</p></td>
</tr>
</table>
<h4><span style=\"color:#008000\">Output Variables</span></h4>
<p><b>Tab . 2: </b>The following table presents the output variables of the function as specified in the standard.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Datatype VDI3813</h4></p></td>
<td><p align=\"center\"><h4>Semantic data type</h4></p></td>
<td><p align=\"center\"><h4>Signal flow direction</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>B_WINDOW</p></td>
<td valign=\"top\"><p>Binary</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Binary.ValueWindowOutput\">ValueWindow</a></p></td>
<td valign=\"top\"><p>Output</p></td>
<td valign=\"top\"><p>Boolean window state (default: true == closed / false == open).</p></td>
</tr>
</table>
<h4><span style=\"color:#008000\">Parameters</span></h4>
<p><b>Tab . 3: </b>The following table presents the parameter of the function as specified in the standard.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_CAL</p></td>
<td valign=\"top\"><p>For specifying the logic of the window contact.</p></td>
</tr>
</table>
</html>",
        revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end WindowMonitoring;
