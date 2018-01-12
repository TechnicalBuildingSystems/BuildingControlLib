within BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Internal;
block EnergyModeSelectionFunctionality
  "Algorithm model to provide functionality of EnergyModeSelection"
    extends Interfaces.Partial.PartialFunctionality;

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Connector
  Interfaces.BooleanInput P_ACT
    annotation (Placement(transformation(extent={{-100,-60},{-60,-20}})));
  Interfaces.BooleanInput B_WINDOW
    annotation (Placement(transformation(extent={{-100,-20},{-60,20}})));
  Interfaces.EnergyModeOutput M_ACT
    annotation (Placement(transformation(extent={{100,-20},{140,20}})));
  Interfaces.EnergyModeInput M_BMS
    annotation (Placement(transformation(extent={{-100,20},{-60,60}})));

algorithm
  if B_WINDOW == false then
    M_ACT := EM.protection;
  else
    if P_ACT == true then
      M_ACT := EM.comfort;
    else
       M_ACT := M_BMS;
    end if;
  end if;
  annotation (preferedView="Info",Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
",        info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Block that implements functionality of &QUOT;Energy mode selection&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.19, p. 63 - 65]</a>. </p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p>&QUOT;Selection of the energy mode for a room climate function (RA-FL section 6, column 18; informative function block Figure 40) serves for matching the energy output with the room utilisation. Instead of, e. g., keeping the room at a comfort temperature constantly and irrespective of the actual utilisation, the setpoints (see Section 6.5.21) vary depending on utilisation type, room type and any further boundary conditions such as the room occupancy planning (see VDI 3813 Part 1, Section 7). Each of the various utilisations is assigned an energy mode. The following energy modes are possible: COMFORT: Comfort mode represents the state of an occupied room. Temperature and air quality are within the comfortable range. Depending on the heating or cooling mode, the controller operates on the basis of the respective comfort setpoints. Changeover to the comfort mode is triggered by any room check-in or <i>Presence detection</i>, or can optionally be controlled by time program. PRE COMFORT: Precomfort mode represents the energy-saving state of an unoccupied room which, however, is to reach comfort mode within a short time. The controller operates on the basis of suitably deviating setpoints for heating or cooling mode and at reduced air change rate. Changeover to the precomfort mode is usually controlled by a time program. ECONOMY: Economy mode represents the energy-saving state of a room unoccupied for an extended period, e. g. during night-time. The controller operates on the basis of heating or cooling mode setpoints deviating even further and at reduced air change rate. Changeover to the economy mode is usually controlled by a time program. PROTECTION: Protection mode represents the state of a room, which merely keeps the building fabric and the mechanical equipment free from damage at minimum energy input. The controller, therefore, operates on the basis of minimumenergy setpoints for the heating or cooling mode. Changeover to this energy mode is triggered either in case of temporary disuse of the building (e. g. holidays) or by windows being opened.&QUOT;<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.19, p. 63 - 65]</a></p>
<p><br><b>Fig. 1: </b>UML activity diagram of the application function <i>Energy mode selection, </i><a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.19, p. 63 - 65]</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/docUMLAkt_EnergyModeSelection.PNG\"/> </p></td>
</tr>
</table>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td></td>
</tr>
</table>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td></td>
</tr>
</table>
<h4><span style=\"color: #008000\">Input Variables</span></h4>
<p>The following table presents the input variables of the function as specified in the standard. </p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Datatype VDI3813</h4></p></td>
<td><p align=\"center\"><h4>Semantic data type</h4></p></td>
<td><p align=\"center\"><h4>Signal flow direction</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>M_BMS</p></td>
<td valign=\"top\"><p>Mode</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.EnergyMode.CommandEnergyModeTimeScheduleInput\">CommandEnergyModeTimeSchedule</a> </p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Energy mode specified by a time schedule (TimeProgramEnergyMode).</p></td>
</tr>
<tr>
<td valign=\"top\"><p>B_WINDOW</p></td>
<td valign=\"top\"><p>Binary</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Binary.ValueWindowInput\">ValueWindow</a> </p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>State of the windows in the room (open -&GT; protection mode; closed -&GT; other dependencies).</p></td>
</tr>
<tr>
<td valign=\"top\"><p>P_ACT</p></td>
<td valign=\"top\"><p>Presence</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Presence.ValuePresenceEvaluationInput\">ValuePresenceEvaluation</a> </p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Room occupancy state.</p></td>
</tr>
</table>
<p><br><h4><span style=\"color: #008000\">Output Variables</span></h4></p>
<p>The following table presents the output variables of the function as specified in the standard.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Datatype VDI3813</h4></p></td>
<td><p align=\"center\"><h4>Semantic data type</h4></p></td>
<td><p align=\"center\"><h4>Signal flow direction</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>M_ACT</p></td>
<td valign=\"top\"><p>Mode</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Mode.ValueEnergyModeCurrentlyOutput\">ValueEnergyModeCurrently</a> </p></td>
<td valign=\"top\"><p>Output</p></td>
<td valign=\"top\"><p>Valid energy mode.</p></td>
</tr>
</table>
</html>"));
end EnergyModeSelectionFunctionality;
