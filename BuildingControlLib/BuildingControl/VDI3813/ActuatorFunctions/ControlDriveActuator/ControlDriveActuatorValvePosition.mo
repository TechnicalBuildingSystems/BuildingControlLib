within BuildingControlLib.BuildingControl.VDI3813.ActuatorFunctions.ControlDriveActuator;
block ControlDriveActuatorValvePosition
  "Actuator function which connects automation system to motor driven valve actuator"
  import BuildingControlLib;

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Extend from PartialFunctionBlock and insert specific functionality
  extends
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.Partial.PartialFunction(
      redeclare
      BuildingControlLib.BuildingControl.VDI3813.ActuatorFunctions.Internal.ControlDriveActuatorValvePositionFunctionality
      functionality);
  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Connectors
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.ActuatorSignal.CommandActuatorSignalValvePositionInput
    V_SET_VP "New valve position." annotation (Placement(transformation(extent={{-100,60},{-80,80}}),
        iconTransformation(extent={{-100,-20},{-40,20}})));

  BuildingControlLib.BuildingControl.VDI3813.Interfaces.ActuatorSignal.StatusActuatorSignalValvePositionOutput
    V_STA_VP "Currently used valve position." annotation (Placement(transformation(extent={{100,60},{120,80}}),
        iconTransformation(extent={{100,-20},{160,20}})));

  BuildingControlLib.BuildingControl.VDI3813.Interfaces.Analog.CommandPhysicalControlDriveOutput
    Y "Physical signal to change valve position." annotation (Placement(transformation(extent={{-10,90},{10,110}}),
        iconTransformation(extent={{-22,82},{20,120}})));

equation
  connect(Y,functionality.Y) annotation (Line(
      points={{0,100},{0,38.38},{-0.38,38.38}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(V_SET_VP, functionality.V_SET_VP) annotation (Line(
      points={{-90,70},{-60,70},{-60,0},{-26.6,0}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(functionality.V_STA_VP, V_STA_VP) annotation (Line(
      points={{49.4,0},{76,0},{76,70},{110,70}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),      graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics),  preferredView="info",
Documentation(info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<p>Block that implements function &QUOT;Control Drive Actuator&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.2.4, p. 21 - 22]</a>. For semantic correctness it is specialized for valve positions.</p>
<h4><span style=\"color: #008000\">Functional Description</span></h4>
<p>&QUOT;<i>Control drive actuators</i> (RA-FL section 3, column 3; informative function block Figure 14) operate valves, air dampers, fans or other control devices based on input information received from operator or application functions for, e. g., the control of room temperature or air quality. The function is also used, e. g., for controlling the opening angle of windows. Control is by percent (closed = 0 &percnt;; open = 100 &percnt;). The actually achievable positioning accuracy depends on the drive units used and on the overall mechanical system. Using the actuator function for window control requires additional input information that will allow immediate stopping by means of an operator function. It must furthermore be ensured in this case that the response time of the actuator following receipt of input information for positioning is less than 200 ms so as to exclude any operating errors. The function is allocated to the room shell (fixed rooms) or the segment shell (flexible room layout).&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.2.4, p. 21 - 22]</a> </p>
<p>The positions are per cent values between 0 and 1 as it is mentioned in the standard <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 4, p. 4 - 6]</a>.</p>
<p><b>Fig. 1: </b>&QUOT;Informative representation of the actuator function <i>Control drive actuator</i>&QUOT;, <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.2.4, Figure 14, p. 22]</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/docVDI3813_ControlDriveActuator.PNG\" alt=\"docVDI3813_ControlDriveActuator.PNG\"/> </p></td>
</tr>
</table>
<h4><span style=\"color: #008000\">Input Variables</span></h4>
<p><b>Tab. 1: </b>The following table presents the input variables of the function. The connectors and data types have been specialized to provide semantic interfaces and improve error prevention of connections. </p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Datatype VDI3813</h4></p></td>
<td><p align=\"center\"><h4>Semantic data type</h4></p></td>
<td><p align=\"center\"><h4>Signal flow direction</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>V_SET_VP</p></td>
<td valign=\"top\"><p>Position</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.ActuatorSignals.CommandActuatorSignalValvePositionInput\">CommandActuatorSignalValvePosition</a> </p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>New valve position.</p></td>
</tr>
</table>
<h4><span style=\"color: #008000\">Output Variables</span></h4>
<p><b>Tab. 2: </b>The following table presents the output variables of the function. The connectors and data types have been specialized to provide semantic interfaces and improve error prevention of connections. </p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Datatype VDI3813</h4></p></td>
<td><p align=\"center\"><h4>Semantic data type</h4></p></td>
<td><p align=\"center\"><h4>Signal flow direction</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>V_STA_VP</p></td>
<td valign=\"top\"><p>Position</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.ActuatorSignals.StatusActuatorSignalDamperPositionOutput\">StatusActuatorSignalDamperPosition</a> </p></td>
<td valign=\"top\"><p>Output</p></td>
<td valign=\"top\"><p>Currently used valve position.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>Y</p></td>
<td valign=\"top\"><p>Analog</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Analog.CommandPhysicalControlDriveOutput\">CommandPhysicalControlDrive</a> </p></td>
<td valign=\"top\"><p>Output</p></td>
<td valign=\"top\"><p>Physical signal to change valve position.</p></td>
</tr>
</table>
</html>",
        revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end ControlDriveActuatorValvePosition;
