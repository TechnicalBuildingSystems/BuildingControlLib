within BuildingControlLib.BuildingControl;
package VDI3813 "Package of control functions for building automation referring to VDI3813 standard."
    extends Modelica.Icons.VariantsPackage;
  import EM =
  BuildingControlLib.BuildingControl.VDI3813.Types.EnumerationTypes.EnergyModes;
  import CF =
  BuildingControlLib.BuildingControl.VDI3813.Types.EnumerationTypes.ControlFunctionsAirTemperature;
  import RU =
  BuildingControlLib.BuildingControl.VDI3813.Types.EnumerationTypes.RoomUtilisations;
  //import           BuildingControlLib.BuildingControl.VDI3813;


  annotation (preferredView="info", Documentation(info="<html>
<p>This package contains building control functions based on the description in directive VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1]</a>. It encompasses a set of functions required for room automation. </p>
<p><b>Fig. 1: </b>UML class diagramm to show the basic ideas behind modelling the standardised room automation functions of VDI 3813.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/docUMLStr_FunctionConcept.png\" alt=\"docUMLStr_FunctionConcept.png\"/></p></td>
</tr>
</table>
<p><br><br><br><br><b>Tab. 1: </b>Documentation notes</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Group</h4></p></td>
<td><p align=\"center\"><h4>Functions</h4></p></td>
<td><p align=\"center\"><h4>Functionalities</h4></p></td>
<td><p align=\"center\"><h4>Examples</h4></p></td>
<td><p align=\"center\"><h4>Package</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>Sensor functions</p></td>
<td valign=\"top\"><p>Done</p></td>
<td valign=\"top\"><p>Done</p></td>
<td valign=\"top\"><p>Done</p></td>
<td valign=\"top\"><p>Done</p></td>
</tr>
<tr>
<td valign=\"top\"><p>Actuator functions</p></td>
<td valign=\"top\"><p>Done</p></td>
<td valign=\"top\"><p>Done</p></td>
<td valign=\"top\"><p>Done beside SunshadeActuator</p></td>
<td valign=\"top\"><p>Done</p></td>
</tr>
<tr>
<td valign=\"top\"><p>Operator functions</p></td>
<td valign=\"top\"><p>Done</p></td>
<td valign=\"top\"><p>Done</p></td>
<td valign=\"top\"><p>Done beside ActuateSunshade</p></td>
<td valign=\"top\"><p>Done (missing pic)</p></td>
</tr>
<tr>
<td valign=\"top\"><p>Application functions</p></td>
<td valign=\"top\"><p>Done</p></td>
<td valign=\"top\"><p>Todo</p></td>
<td valign=\"top\"><p>Todo</p></td>
<td valign=\"top\"><p>Todo</p></td>
</tr>
<tr>
<td valign=\"top\"><p>Macro functions</p></td>
<td valign=\"top\"><p>Todo</p></td>
<td valign=\"top\"><p>Todo</p></td>
<td valign=\"top\"><p>Todo</p></td>
<td valign=\"top\"><p>Todo</p></td>
</tr>
</table>
<p><br><h4>TODO</h4></p>
<ul>
<li><i>LightActuatorSwitching</i> algorithm (plus implementation of Functionality and Tester)</li>
<li><i>LightActuatorDimming</i> algorithm (plus implementation of Functionality and Tester)</li>
<li><i>TesterSunshadeActuator</i> algorithm</li>
<li><i>TesterActuateSunshade</i> algorithm</li>
</ul>
<h4><span style=\"color: #008000\">Analogsignale Digitalsignale</span></h4>
<ul>
<li>Bei Sensoren i. d. R. festgelegt ob analog oder bin&auml;r</li>
<li>Bei Aktoren i. d. R. beides m&ouml;glich! Abschnitt vier: Prozentwert; Beschreibungen: analog/bin&auml;r</li>
<li>Bei Bedien-/Displayfktn h&auml;ufig beides m&ouml;glich!</li>
</ul>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
end VDI3813;
