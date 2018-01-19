within BuildingControlLib.BuildingControl.VDI3813.OperatorAndDisplayFunctions;
block ActuateSunshade
  "Enables the user to adjust the sunshade position and the slat angle"
  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Extend from PartialFunctionBlock and insert specific functionality
  extends Interfaces.Partial.PartialFunction(      redeclare
      BuildingControlLib.BuildingControl.VDI3813.OperatorAndDisplayFunctions.Internal.ActuateSunshadeFunctionality
      functionality);
  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Connectors
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.PhysicalBooleanInput
    CMD "Physical operation command for changing sunshade state(true: sun protection, false: no sun protection)."   annotation (Placement(transformation(extent={{-10,90},{10,110}}),
        iconTransformation(extent={{-20,80},{20,120}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealInput[2]
    S_STA "Currently used sunshade position(1:position, 2:slat angle)."    annotation (Placement(transformation(extent={{-100,60},{-80,80}}),
        iconTransformation(extent={{-100,-20},{-40,20}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealOutput[2]
    S_MAN "New sunshade position(1:position, 2:slat angle)."   annotation (Placement(transformation(extent={{100,60},{120,80}}),
        iconTransformation(extent={{100,-20},{160,20}})));


equation
  connect( S_STA, functionality.S_STA)  annotation (Line(
      points={{-90,70},{-80,70},{-80,0},{-26.6,0}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(S_MAN,  functionality.S_MAN)  annotation (Line(
      points={{110,70},{80,70},{80,0},{49.4,0}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect( CMD, functionality.CMD)  annotation (Line(
      points={{0,100},{0,38},{0,38}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),      graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics),  preferredView="info",
Documentation(info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<p>Block that implements function &QUOT;Actuate sunshade&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.4.3, p. 26 - 27]</a>. </p>
<h4><span style=\"color: #008000\">Functional Description</span></h4>
<p>&QUOT;The operator function<i> Actuate sunshade</i> (RA-FL section 5, column 2; informative function block Figure 17) converts a manual actuation to output information which is then available as input information to the application functions. The following mode of pushbutton actuation has proven useful for positioning: Brief actuation of the button (leading and trailing edges following in immediate succession) generates output information on the relative change of slat angle depending on the parameterisation of the sensor. In contrast, depressing the button for a longer time generates output information regarding the rising or descending of the sunshade. Operator control actions using different operating devices may differ from the mode of functioning described for pushbuttons. However, they must in principle be capable of generating the same output information.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.4.3, p. 26 - 27]</a></p>
<p>In the standard it is mentioned for the sunshade signal that it should contain two values when the sunshade contains slats, whereas the sunshade position should be a per cent value and the slat position should be a angle <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 4, p. 4 - 6]</a>. Because these two values could not be bundled in an array, in this implementation every sunshade connector has two variables with different data types inside. </p>
<p>The output of actuate sunshade is named S_SET in the informative description <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.4.3, p. 26 - 27]</a>. But in the textual description of priority control an input S_MAN is mentioned. It says explicitly that the signal comes from actuate sunshade or automatic thermal control <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.12, p. 49 - 51]</a>. Because of this S_MAN is used as acronym for the output of actuate sunshade.</p>
<p><br><b>Fig. 1: </b>&QUOT;Informative representation of the actuator function <i>Actuate sunshade</i>&QUOT;, <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.4.3, p. 26 - 27]</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/docVDI3813_ActuateSunshade.PNG\" alt=\"docVDI3813_ActuateSunshade.PNG\"/> </p></td>
</tr>
</table>

<p><br><br><br><br><b><span style=\"color: #008000;\">Parameter</span></b> </p>
<p>In the standard are named two parameters without detailed functionality description. In this case these parameters are not used. </p>
</html>",
        revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end ActuateSunshade;
