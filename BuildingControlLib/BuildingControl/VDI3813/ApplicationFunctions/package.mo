within BuildingControlLib.BuildingControl.VDI3813;
package ApplicationFunctions "Application functions referring to VDI3813 directive"
  extends Modelica.Icons.VariantsPackage;







annotation (preferredView="info",Documentation(info="<html>
<p>This package contains application functions desribed in VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1]</a>:</p>
<p>&QUOT;Application functions of room control represent the functionality to be achieved by means of automation. They can, therefore, be generally regarded as the link between sensor functions or operator functions on the one hand and actuator functions on the other hand. The behaviour of the application function can often be influenced by means of parameters. The informative representation of an application function also takes the form of a function block. In contrast to sensor, actuator or operator and display functions, it has no physical interface as it merely processes one or several pieces of input information, supplying the result in terms of one or several pieces of output information (Figure 22).&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.1, p. 31]</a></p>
<p><b>Fig. 1: </b>UML class diagramm of the <i>application functions</i> basic design idea.<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.1, p. 31]</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/docUMLStr_ApplicationFunctionConcept.png\" alt=\"docUMLStr_ApplicationFunctionConcept.png\"/> </p></td>
</tr>
</table>
<p><br><br><br>The application functions are the majority of all functions and probalby because of that the VDI decided to split it into subgroups. The same splitting is done in this package for compliance with the standard and a better overview of the huge amount of application functions. The subgroups are the following ones:</p>
<ol>
<li><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Basic\">Basic functions</a></li>
<li><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Lighting\">Lighting functions</a></li>
<li><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Sunshading\">Sunshading functions</a></li>
<li><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.RoomClimate\">Room climate functions</a></li>
</ol>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
end ApplicationFunctions;
