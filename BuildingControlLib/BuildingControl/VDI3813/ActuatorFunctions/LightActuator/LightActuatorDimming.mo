within BuildingControlLib.BuildingControl.VDI3813.ActuatorFunctions.LightActuator;
block LightActuatorDimming
  "Actuator function to provide a control signal to a physical light source"
  import BuildingControlLib;

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Extend from PartialFunctionBlock and insert specific functionality
  extends
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.Partial.PartialFunction(
      redeclare
      BuildingControlLib.BuildingControl.VDI3813.ActuatorFunctions.Internal.SunshadeActuatorFunctionality
      functionality);
  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Connectors
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade.CommandSunshadeInput
    S_SET "New position of the sunshade." annotation (Placement(transformation(extent={{-100,60},{-80,80}}),
        iconTransformation(extent={{-100,-20},{-40,20}})));

  BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade.StatusSunshadeOutput
    S_STA "Current position of the sunshade." annotation (Placement(transformation(extent={{100,60},{120,80}}),
        iconTransformation(extent={{100,-20},{160,20}})));

  BuildingControlLib.BuildingControl.VDI3813.Interfaces.Binary.CommandPhysicalMotorControlRelayOutput
    M
    "Physical signal to change the sunshade position (if M == true then sunshade deployed else sunshade not deployed)."
                                                                                                        annotation (Placement(transformation(extent={{-10,90},{10,110}}),
        iconTransformation(extent={{-22,82},{20,120}})));

equation
  connect(S_STA,functionality.S_STA) annotation (Line(
      points={{110,70},{80,70},{80,0},{49.4,0}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(M,functionality.M) annotation (Line(
      points={{0,100},{0,38.38},{-0.38,38.38}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(S_SET, functionality.S_SET) annotation (Line(
      points={{-90,70},{-80,70},{-80,0},{-26.6,0}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),      graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics),  preferredView="info",
Documentation(info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<p>Block that implements function &QUOT;Light actuator&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.2.2, p. 18 - 20]</a>. This function is a specialization for light circuits of dimmable light sources.</p>
<h4><span style=\"color: #008000\">Functional Description</span></h4>
<p>&QUOT;Light actuators switch or dim lighting equipment on the basis of input information received from automatic application functions or from operator functions. Each lighting circuit is represented as a <i>Light actuator</i> function (RA-FL section 3, column 1; informative function block Figure 12). Depending on the design used, the switching/actuating function can be binary, i. e. switching, or continuous, i. e. dimming. The current value of the lighting is made available as output information for synchronising operator and display functions. It must be ensured that the response time for actuating the lighting after receipt of the input information is less than 200 ms so as to avoid any delay perceivable to the user. In order to allow definite states to be assumed in the case of voltage failure or voltage recovery of the automation system, parameterisation of manipulated values is required for these cases. For dimmable luminaires, the dimming speed for dimming up and down (dimming ramp or fade time) can be determined in addition. The function is allocated to the room shell (fixed rooms) or the segment shell (flexible room layout).&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.2.2, p. 18 - 20</a>]</p>
<p><b>Fig. 1: </b>&QUOT;Informative representation of the actuator function <i>Light actuator</i>&QUOT;, <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.2.2, Figure 12, p. 19 - 20]</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/docVDI3813_LightActuator.PNG\" alt=\"docVDI3813_LightActuator.PNG\"/> </p></td>
</tr>
</table>
<p><br><h4><span style=\"color: #008000\">Input Variables</span></h4></p>
<p><b>Tab. 1: </b>The following table presents the input variables of the function as specified in the standard. </p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Datatype VDI3813</h4></p></td>
<td><p align=\"center\"><h4>Semantic data type</h4></p></td>
<td><p align=\"center\"><h4>Signal flow direction</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>L_SET</p></td>
<td valign=\"top\"><p>Light</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Types.CommandLightBinary\">CommandLightBinary</a> </p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>New state of the dimmable light source.</p></td>
</tr>
</table>
<p><br><h4><span style=\"color: #008000\">Output Variables</span></h4></p>
<p><b>Tab. 2: </b>The following table presents the output variables of the function as specified in the standard. </p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Datatype VDI3813</h4></p></td>
<td><p align=\"center\"><h4>Semantic data type</h4></p></td>
<td><p align=\"center\"><h4>Signal flow direction</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>L_STA</p></td>
<td valign=\"top\"><p>Light</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Types.StatusLightBinary\">StatusLightBinary</a> </p></td>
<td valign=\"top\"><p>Output</p></td>
<td valign=\"top\"><p>Current state of the dimmable light source.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>L</p></td>
<td valign=\"top\"><p>Binary</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Types.CommandPhysicalLightControlBinary\">CommandPhysicalLightControlBinary</a> </p></td>
<td valign=\"top\"><p>Output</p></td>
<td valign=\"top\"><p>Physical binary signal to change the dimming state of the light source.</p></td>
</tr>
</table>
<p><br><br><br><br><br><span style=\"color: #008000;\">Parameters</span> </p>
<p><b>Tab. 3: </b>The following table presents the parameters of the function as specified in the standard. CHECK</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_POFF</p></td>
<td valign=\"top\"><p>Dimming state that is used in case of a voltage failure.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_PON</p></td>
<td valign=\"top\"><p>Dimming state that is used in case of a voltage recovery.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_DIM</p></td>
<td valign=\"top\"><p>Light status that is used in case of a voltage failure.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_CAL</p></td>
<td valign=\"top\"><p>Light status that is used in case of a voltage recovery.</p></td>
</tr>
</table>
</html>",
        revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
end LightActuatorDimming;
