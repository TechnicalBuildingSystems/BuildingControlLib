within BuildingControlLib.BuildingControl.VDI3813.OperatorAndDisplayFunctions.Internal;
block ActuateSunshadeFunctionality
  "Algorithm model to provide functionality of ActuateSunshade"
extends
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.Partial.PartialFunctionality;
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.PhysicalBooleanInput
    CMD "Physical operation command for changing sunshade state(true: sun protection, false: no sun protection)." annotation (Placement(transformation(extent={{-20,80},{20,120}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealInput[2]
    S_STA "Currently used sunshade position(1:position, 2:slat angle)." annotation (Placement(transformation(extent={{-100,-20},{-40,20}}),
        iconTransformation(extent={{-100,-20},{-40,20}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealOutput[2]
    S_MAN "New sunshade position(1:position, 2:slat angle)." annotation (Placement(transformation(extent={{100,-20},{160,20}}),
        iconTransformation(extent={{100,-20},{160,20}})));

algorithm
  // setpoint sunshade value depending from input value
   if CMD == true then
     S_MAN[1] := 1;
     S_MAN[2] := 45;
   else
     // if not actuate than it is inactive
     S_MAN[1] := -1;
     S_MAN[2] := 0;
   end if;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),preferredView="info",
    Documentation(info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<p>Block that implements functionality of &QUOT;Actuate sunshade&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.4.3, p. 26 - 27]</a>. </p>
<h4><span style=\"color: #008000\">Functional Description</span></h4>
<p>&QUOT;The operator function<i> Actuate sunshade</i> (RA-FL section 5, column 2; informative function block Figure 17) converts a manual actuation to output information which is then available as input information to the application functions. The following mode of pushbutton actuation has proven useful for positioning: Brief actuation of the button (leading and trailing edges following in immediate succession) generates output information on the relative change of slat angle depending on the parameterisation of the sensor. In contrast, depressing the button for a longer time generates output information regarding the rising or descending of the sunshade. Operator control actions using different operating devices may differ from the mode of functioning described for pushbuttons. However, they must in principle be capable of generating the same output information.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.4.3, p. 26 - 27]</a></p>
<p>In the standard it is mentioned for the sunshade signal that it should contain two values when the sunshade contains slats, whereas the sunshade position should be a per cent value and the slat position should be a angle <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 4, p. 4 - 6]</a>. Because these two values could not be bundled in an array, in this implementation every sunshade connector has two variables with different data types inside. </p>
<p>The output of actuate sunshade is named S_SET in the informative description <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.4.3, p. 26 - 27]</a>. But in the textual description of priority control an input S_MAN is mentioned. It says explicitly that the signal comes from actuate sunshade or automatic thermal control <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.12, p. 49 - 51]</a>. Because of this S_MAN is used as acronym for the output of actuate sunshade.</p>

</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end ActuateSunshadeFunctionality;
