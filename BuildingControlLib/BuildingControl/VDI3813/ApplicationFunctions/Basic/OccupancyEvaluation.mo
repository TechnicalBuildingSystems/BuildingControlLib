within BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Basic;
block OccupancyEvaluation "Evaluate automatic and manual occupancy signal"
  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Extend from PartialFunctionBlock and insert specific functionality
extends
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.Partial.PartialFunction(
        redeclare
      BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Internal.OccupancyEvaluationFunctionality
        functionality(PAR_BEH=PAR_BEH));

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Connector
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.BooleanInput P_AUTO
    "Presence signal for evaluation issues generated from a sensor device."                                                   annotation (Placement(
        transformation(extent={{-100,40},{-80,60}}), iconTransformation(extent={{-100,20},
            {-58,62}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.BooleanInput P_MAN
    "Presence signal for evaluation issues generated from an operator input."
    annotation (Placement(transformation(extent={{-100,-20},{-80,0}}),
        iconTransformation(extent={{-100,-40},{-58,2}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.BooleanOutput P_ACT
    "Evaluated presence signal."                                                       annotation (Placement(
        transformation(extent={{100,40},{120,60}}), iconTransformation(extent={{100,20},
            {140,60}})));

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Parameter
  parameter Boolean PAR_BEH = true
    "Changes the evaluation behaviour. TRUE: Only P_AUTO is evaluated; FALSE: P_AUTO and P_MAN are evaluated using logical conjunction";

equation
  connect(P_AUTO, functionality.P_AUTO) annotation (Line(
      points={{-90,50},{-64,50},{-64,7.6},{-30.4,7.6}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(P_MAN, functionality.P_MAN) annotation (Line(
      points={{-90,-10},{-64,-10},{-64,-7.6},{-30.4,-7.6}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(functionality.P_ACT, P_ACT) annotation (Line(
      points={{45.6,0},{72,0},{72,50},{110,50}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),preferredView="info",
    Documentation(info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<p>Block that implements function &QUOT;Occupancy evaluation&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.2, p. 32 - 33]</a>. </p>
<h4><span style=\"color: #008000\">Functional Description</span></h4>
<p>&QUOT;The function<i> Occupancy evaluation</i> (RA-FL section 6, column 1; informative function block Figure 23) evaluates the output information received from <i>Presence detection</i> and from operator functions (<i>Signal presence</i>) in order to determine the occupancy state in a room for all further application functions. Various options of room check-in and check-out can thus be implemented.&QUOT;<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.2, p. 32 - 33]</a></p>
<p><b>Fig. 1: </b>&QUOT;Informative representation of the application function <i>Occupancy evaluation</i>&QUOT;, <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.2, Figure 23, p. 32 - 33]</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/docVDI3813_OccupancyEvaluation.PNG\" alt=\"docVDI3813_OccupancyEvaluation.PNG\"/> </p></td>
</tr>
</table>

</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>

"));
end OccupancyEvaluation;
