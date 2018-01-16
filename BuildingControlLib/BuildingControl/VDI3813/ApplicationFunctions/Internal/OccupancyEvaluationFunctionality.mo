within BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Internal;
block OccupancyEvaluationFunctionality
  "Algorithm model to provide functionality of OccupancyEvaluation"
  extends
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.Partial.PartialFunctionality;
  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Connectors
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.BooleanInput
    P_AUTO "Presence signal for evaluation issues generated from a sensor device." annotation (Placement(transformation(extent={{-100,0},{-80,20}}),
        iconTransformation(extent={{-100,0},{-60,40}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.BooleanInput
    P_MAN
    "Presence signal for evaluation issues generated from an operator input."
    annotation (Placement(transformation(extent={{-100,-36},{-80,-16}}),
        iconTransformation(extent={{-100,-40},{-60,0}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.BooleanOutput
    P_ACT "Evaluated presence signal." annotation (Placement(transformation(extent={{100,0},{120,20}}),
        iconTransformation(extent={{100,-20},{140,20}})));
  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Parameters
  parameter Boolean PAR_BEH = true "Choose operation mode, if true automatic sensor is only evaluated
                                    if false also manual feedback signal is evaluated";

equation
  if PAR_BEH then
   P_ACT = P_AUTO;
  else
   P_ACT = P_AUTO and P_MAN;
  end if;

  annotation (preferedView="Info",Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),      graphics), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics),
    Documentation(info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Block that implements functionality of &QUOT;Occupancy evaluation&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.2, p. 32 - 33]</a>. </p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p>&QUOT;The function<i> Occupancy evaluation</i> (RA-FL section 6, column 1; informative function block Figure 23) evaluates the output information received from <i>Presence detection</i> and from operator functions (<i>Signal presence</i>) in order to determine the occupancy state in a room for all further application functions. Various options of room check-in and check-out can thus be implemented.&QUOT;<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.2, p. 32 - 33]</a></p>
<p><br><b>Fig. 1: </b>UML activity diagram of the application function <i>Occupancy evaluation, </i><a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.2, p. 32 - 33]</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/docUMLAkt_OccupancyEvaluation.PNG\" alt=\"docUMLAkt_OccupancyEvaluation.png.PNG\"/> </p></td>
</tr>
</table>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td></td>
</tr>
</table>
<p><br><h4><span style=\"color:#008000\">Input Variables</span></h4></p>
<p><b>Tab . 1: </b>The following table presents the input variables of the function as specified in the standard.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Datatype VDI3813</h4></p></td>
<td><p align=\"center\"><h4>Data type</h4></p></td>
<td><p align=\"center\"><h4>Signal flow direction</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>P_AUTO</p></td>
<td valign=\"top\"><p>Presence</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.BooleanInput\">ValuePresenceSensor</a> </p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Presence signal for evaluation issues generated from a sensor device.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>P_MAN</p></td>
<td valign=\"top\"><p>Presence</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.BooleanInput\">CommandPresenceOperator</a></p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Presence signal for evaluation issues generated from an operator input.</p></td>
</tr>
</table>
<h4><span style=\"color:#008000\">Output Variables</span></h4>
<p><b>Tab . 2: </b>The following table presents the output variables of the function as specified in the standard.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Datatype VDI3813</h4></p></td>
<td><p align=\"center\"><h4>Data type</h4></p></td>
<td><p align=\"center\"><h4>Signal flow direction</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>P_ACT</p></td>
<td valign=\"top\"><p>Presence</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.BooleanOutput\">ValuePresenceEvaluation</a> </p></td>
<td valign=\"top\"><p>Output</p></td>
<td valign=\"top\"><p>Evaluated presence signal.</p></td>
</tr>
</table>
<p><br><br><br><br><br><br><b><font style=\"color: #008000; \">Parameter</font></b> </p>
<p><b>Tab . 3: </b>The following table presents the parameter of the function as specified in the standard.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_BEH</p></td>
<td valign=\"top\"><p>Changes the evaluation behaviour. TRUE: Only P_AUTO is evaluated; FALSE: P_AUTO and P_MAN are evaluated using logical conjunction</p></td>
</tr>
</table>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
end OccupancyEvaluationFunctionality;
