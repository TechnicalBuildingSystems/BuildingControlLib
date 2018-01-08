within BuildingControlLib.BuildingControl.VDI3813.ActuatorFunctions.Internal;
block SunshadeActuatorFunctionality
  "Algorithm model to provide functionality of SunshadeActuator"
  extends
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.Partial.PartialFunctionality;

  BuildingControlLib.BuildingControl.VDI3813.Interfaces.PhysicalBooleanOutput
    M "Physical signal to change the sunshade position." annotation (Placement(transformation(extent={{-22,80},{20,120}}),
        iconTransformation(extent={{-22,82},{20,120}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealInput[2]
    S_SET "New position of the sunshade(1: position, 2: slat angle)." annotation (Placement(transformation(extent={{-100,-20},{-40,20}}),
        iconTransformation(extent={{-100,-20},{-40,20}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealOutput[2]
    S_STA "Current position of the sunshade(1: position, 2: slat angle)." annotation (Placement(transformation(extent={{100,-20},{160,20}}),
        iconTransformation(extent={{100,-20},{160,20}})));

equation
  // current sunshade value depending from setpoint sunshade value
  S_STA[1] = S_SET[1];
  S_STA[2] = S_SET[2];

  // physical output depending from setpoint sunshade value
  if S_SET[1] > 0.5 then
    M = true;
  else
    M = false;
  end if;

  annotation (preferedView="Info",Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics),
    Documentation(info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Block that implements the functionality of &QUOT;Sunshade actuator&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.2.3, p. 20 - 21]</a>. </p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p>&QUOT;Sunshade actuators position shading devices based on input information received from, e. g., weather protection, application (e. g. anti-glare) and operator functions. Each protective element is represented as a <i>Sunshade actuator</i> function (RA-FL section 3, column 2; informative function block Figure 13). The sunshade must be controllable by percent for the position (open position = 0 &percnt;; closed position = 100 &percnt;) and additionally, in the case of adjustable slats, by degrees of slat tilt (e. g. slat angles between &ndash;80&deg; and 40&deg;), i. e. the actuator function must be capable of moving the sunshade to any mechanically reachable position. The maximum and minimum slat angles and the total runtime of the sunshade must be adjustable. The current shade position and slat tilt are available as output information for display functions. It must be ensured that the response time of the actuator following receipt of input information for positioning is less than 200 ms so as to avoid any delay perceivable to the operator. For a definite position to be assumed in case of voltage recovery, parameterisation of this position value is required. The function is allocated to the room shell (fixed rooms) or the segment shell (flexible room layout).&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.2.3, p. 20 - 21]</a></p>
<p>In the standard it is mentioned for the sunshade signal that it should contain two values when the sunshade contains slats, whereas the sunshade position should be a per cent value and the slat position should be a angle <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 4, p. 4 - 6]</a>. Because these two values could not be bundled in an array, in this implementation every sunshade connector has two variables with different data types inside. </p>
<h4><span style=\"color:#008000\">Input Variables</span></h4>
<p><b>Tab. 1: </b>The following table presents the input variables of the function as specified in the standard. </p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Datatype VDI3813</h4></p></td>
<td><p align=\"center\"><h4>Semantic data type</h4></p></td>
<td><p align=\"center\"><h4>Signal flow direction</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>S_SET</p></td>
<td valign=\"top\"><p>Sunshade</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade.CommandSunshadeInput\">CommandSunshadePos</a> </p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>New position of the sunshade.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>S_SET</p></td>
<td valign=\"top\"><p>Sunshade</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade.CommandSunshadeInput\">CommandSunshadeSlatAngle</a> </p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>New position of the slats.</p></td>
</tr>
</table>
<p><br><h4><span style=\"color:#008000\">Output Variables</span></h4></p>
<p><b>Tab. 2: </b>The following table presents the output variables of the function as specified in the standard.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Datatype VDI3813</h4></p></td>
<td><p align=\"center\"><h4>Semantic data type</h4></p></td>
<td><p align=\"center\"><h4>Signal flow direction</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>S_STA</p></td>
<td valign=\"top\"><p>Sunshade</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade.StatusSunshadeOutput\">StatusSunshadePos</a> </p></td>
<td valign=\"top\"><p>Output</p></td>
<td valign=\"top\"><p>Current position of the sunshade.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>S_STA</p></td>
<td valign=\"top\"><p>Sunshade</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade.StatusSunshadeOutput\">StatusSunshadeSlatAngle</a> </p></td>
<td valign=\"top\"><p>Output</p></td>
<td valign=\"top\"><p>Current position of the slats.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>M</p></td>
<td valign=\"top\"><p>Binary</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Binary.CommandPhysicalMotorControlRelayOutput\">CommandPhysicalMotorControlRelay</a> </p></td>
<td valign=\"top\"><p>Output</p></td>
<td valign=\"top\"><p>Physical signal to change the sunshade position.</p></td>
</tr>
</table>
<p><br><br><br><br><br><br><b><font style=\"color: #008000; \">Parameters</font></b> </p>
<p><b>Tab. 3: </b>The following table presents the parameters of the function as specified in the standard. </p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_PON</p></td>
<td valign=\"top\"><p>Contains the sunshade position that is used after a voltage recovery.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_RT</p></td>
<td valign=\"top\"><p>Contains the runtime of one full move of the sunshade.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_TT</p></td>
<td valign=\"top\"><p>Contains the runtime of one full move of the slats.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_ANG</p></td>
<td valign=\"top\"><p>Possible maximum and minimum slat angles.</p></td>
</tr>
</table>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end SunshadeActuatorFunctionality;
