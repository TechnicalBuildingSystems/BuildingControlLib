within BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions;
package Sunshading "Subgroup ob sunshading application functions"




  block AutomaticTwilightControl
    "Sunshade control for room with the aim to backup heating/cooling of the room from sunset to sunrise."
    /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
    // Extend from PartialFunctionBlock and insert specific functionality
    extends
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.Partial.PartialFunction(
      redeclare
      BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Internal.AutomaticTwilightControlFunctionality
      functionality(
      PAR_H_ACT=PAR_H_ACT,
      PAR_H_DEA=PAR_H_DEA,
      PAR_TI=PAR_TI,
      PAR_S_ACT=PAR_S_ACT,
      PAR_S_DEA=PAR_S_DEA));
    /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
    // Parameter
    parameter Modelica.SIunits.Illuminance PAR_H_ACT = 100
      "Sunset threshold value of outdoor illuminance in lux for sunblind activation.";
    parameter Modelica.SIunits.Illuminance PAR_H_DEA = 200
      "Sunrise threshold value of outdoor illuminance in lux for sunblind deactivation.";
    parameter Modelica.SIunits.Time PAR_TI = 300 "Hysteresis time for twilight recognition in seconds.";
    parameter Real[2] PAR_S_ACT = {1,0}
      "Setpoints for sun shade position and slat angle (in percent and degree) when sunset detected.";
    parameter Real[2] PAR_S_DEA = {0,30}
      "Setpoints for sun shade position and slat angle (in percent and degree) when sunrise detected.";

    /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
    // Connectors
      BuildingControlLib.BuildingControl.VDI3813.Interfaces.BooleanInput B_ON "Command to switch the function on or off (true == on / false == off)."
        annotation (Placement(transformation(extent={{-100,40},{-80,60}}),
            iconTransformation(extent={{-100,20},{-60,60}})));
      BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealInput
        H_OUT "Measured outdoor illuminance in lux." annotation (Placement(transformation(extent={{-100,0},{-80,20}}),
            iconTransformation(extent={{-100,-60},{-60,-20}})));
      BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealOutput[2]
        S_AUTO "New sunshade position." annotation (Placement(transformation(extent={{100,-10},{120,10}}),
            iconTransformation(extent={{100,-20},{140,20}})));

  equation
      connect(S_AUTO, functionality.S_AUTO) annotation (
          Line(
          points={{110,0},{100,0},{100,-4},{60,-4},{60,0},{45.6,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
        connect(B_ON, functionality.B_ON) annotation (
          Line(
          points={{-90,50},{-90,50},{-90,46},{-50,46},{-50,19},{-30.4,19}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(H_OUT, functionality.H_OUT) annotation (
          Line(
          points={{-90,10},{-90,10},{-90,3.8},{-30.4,3.8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}),      graphics), Icon(coordinateSystem(
            preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
                      preferredView="info",
  Documentation(info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<p>Block that implements function of &QUOT;Automatic twilight control&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.13, p. 51 - 53]</a>. </p>
<h4><span style=\"color: #008000\">Functional Description</span></h4>
<p>&QUOT;The function <i>Automatic twilight control</i> (RA-FL section 6, column 12; informative function block Figure 34) allows sunshading equipment to be positioned in accordance with outdoor brightness. For instance, it allows the closing of the sunshade during night hours in order to, reduce cooling down via the windows or reduce light emission by the building. To this end, the application function processes the input information about the illuminance outside the building, originating from the sensor function <i>Brightness measurement</i>, and generates actuating information for assigned actuator functions of the type <i>Sunshade actuator</i>.&QUOT;<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.13, p. 51 - 53]</a></p>
<p><b>Fig. 1: </b>&QUOT;Informative representation of the application function <i>Automatic twilight control</i>&QUOT;, <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.13, Figure 34, p. 53]</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/docVDI3813_AutomaticTwilightControl.PNG\" alt=\"docVDI3813_AutomaticTwilightControl.PNG\"/> </p></td>
</tr>
</table>
<p><br><h4><span style=\"color: #008000\">Input Variables</span></h4></p>
<p>The following table presents the input variables of the function as specified in the standard. </p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Datatype VDI3813</h4></p></td>
<td><p align=\"center\"><h4>Semantic data type</h4></p></td>
<td><p align=\"center\"><h4>Signal flow direction</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>B_ON</p></td>
<td valign=\"top\"><p>Binary</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Binary.ValueSwitchFunctionOnOffInput\">ValueSwitchFunctionOnOff</a> </p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Command to switch the function on or off (true == on / false == off).</p></td>
</tr>
<tr>
<td valign=\"top\"><p>H_OUT</p></td>
<td valign=\"top\"><p>Illuminance</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Illuminance.ValueIlluminanceOutdoorInput\">ValueIlluminanceOutdoor</a></p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Measured outdoor illuminance in lux.</p></td>
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
<td valign=\"top\"><p>S_AUTO</p></td>
<td valign=\"top\"><p>Sunshade</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade.CommandSunshadeAutomaticOutput\">CommandSunshadeAutomatic</a> </p></td>
<td valign=\"top\"><p>Output</p></td>
<td valign=\"top\"><p>New sunshade position.</p></td>
</tr>
</table>
<p><br><br><b><span style=\"color: #008000;\">Parameters</span></b> </p>
<p>The following table presents the parameter of the function as specified in the standard.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_H_ACT</p></td>
<td valign=\"top\"><p>Sunset&nbsp;threshold&nbsp;value&nbsp;of&nbsp;outdoor&nbsp;illuminance&nbsp;in&nbsp;lux for sunblind activation.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_H_DEA</p></td>
<td valign=\"top\"><p>Sunrise&nbsp;threshold&nbsp;value&nbsp;of&nbsp;outdoor&nbsp;illuminance&nbsp;in&nbsp;lux&nbsp;for&nbsp;sunblind&nbsp;deactivation.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_TI</p></td>
<td valign=\"top\"><p>Hysteresis&nbsp;time&nbsp;for&nbsp;twilight&nbsp;recognition&nbsp;in&nbsp;seconds.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_S_ACT</p></td>
<td valign=\"top\"><p>Setpoints&nbsp;for&nbsp;sun&nbsp;shade&nbsp;position&nbsp;and&nbsp;slat&nbsp;angle&nbsp;(in&nbsp;percent&nbsp;and&nbsp;degree)&nbsp;when&nbsp;sunset&nbsp;detected.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_S_DEA</p></td>
<td valign=\"top\"><p>Setpoints&nbsp;for&nbsp;sun&nbsp;shade&nbsp;position&nbsp;and&nbsp;slat&nbsp;angle&nbsp;(in&nbsp;percent&nbsp;and&nbsp;degree)&nbsp;when&nbsp;sunrise&nbsp;detected.</p></td>
</tr>
</table>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
  end AutomaticTwilightControl;

  block AutomaticSolarControl
    "Sunshade control for room with the aim to protect occupants from sunshine."
    /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
    // Extend from PartialFunctionBlock and insert specific functionality
    extends
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.Partial.PartialFunction(
          redeclare
        BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Internal.AutomaticSolarControlFunctionality
          functionality(
          PAR_H_ACT=PAR_H_ACT,
          PAR_H_DEA=PAR_H_DEA,
          PAR_TI=PAR_TI,
          PAR_S_ACT=PAR_S_ACT,
          PAR_S_DEA=PAR_S_DEA));
    /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
    // Parameter
    parameter Modelica.SIunits.Illuminance PAR_H_ACT = 11000
      "Treshold value of outdoor illuminance in lux for sunblind activation.";
    parameter Modelica.SIunits.Illuminance PAR_H_DEA = 10000
      "Threshold value of outdoor illuminance in lux for sunblind deactivation.";
    parameter Modelica.SIunits.Time PAR_TI = 300 "Hysteresis time for activation and deactivation in seconds.";
    parameter Real[2] PAR_S_ACT = {1,0}
      "Setpoints for sun shade position and slat angle (in percent and degree) when high illuminance detected.";
    parameter Real[2] PAR_S_DEA = {0,30}
      "Setpoints for sun shade position and slat angle (in percent and degree) when high illuminance detected.";

    /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
    // Connectors
      BuildingControlLib.BuildingControl.VDI3813.Interfaces.BooleanInput B_ON "Command to switch the function on or off (true == on / false == off)."
        annotation (Placement(transformation(extent={{-100,40},{-80,60}}),
            iconTransformation(extent={{-100,20},{-60,60}})));
      BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealInput
        H_OUT "Measured outdoor illuminance in lux." annotation (Placement(transformation(extent={{-100,0},{-80,20}}),
            iconTransformation(extent={{-100,-60},{-60,-20}})));
      BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealOutput[2]
        S_AUTO "New sunshade position." annotation (Placement(transformation(extent={{100,-10},{120,10}}),
            iconTransformation(extent={{100,-20},{140,20}})));

  equation
      connect(S_AUTO, functionality.S_AUTO) annotation (
          Line(
          points={{110,0},{100,0},{100,-4},{60,-4},{60,0},{45.6,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
        connect(B_ON, functionality.B_ON) annotation (
          Line(
          points={{-90,50},{-90,46},{-50,46},{-50,19},{-30.4,19}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(H_OUT, functionality.H_OUT) annotation (
          Line(
          points={{-90,10},{-90,3.8},{-30.4,3.8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}})),                Icon(coordinateSystem(
            preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
                      preferredView="info",
  Documentation(info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<p>Block that implements function of &QUOT;Automatic solar control&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.14, p. 53 - 55]</a>. </p>
<h4><span style=\"color: #008000\">Functional Description</span></h4>
<p>&QUOT;The <i>Automatic solar control</i> (RA-FL section 6, column 13; informative function block Figure 35) prevents user discomfort due to exposure to high-intensity sunrays by moving the sunshade to a defined fixed anti-glare position as soon as the daylight exceeds a defined illuminance. With fading brightness, the sunshade is moved to a parking position. To this end, the application function processes the input information about the illuminance measured on the facade, as provided by the sensor function <i>Brightness measurement</i>, and generates actuating information for assigned actuator functions of the type <i>Sunshade actuator</i>.&QUOT;<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.14, p. 53 - 55]</a></p>
<p><b>Fig. 1: </b>&QUOT;Informative representation of the application function <i>Automatic solar control</i>&QUOT;, <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.14, Figure 35, p. 54]</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/docVDI3813_AutomaticSolarControl.PNG\" alt=\"docVDI3813_AutomaticSolarControl.PNG\"/> </p></td>
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
<td valign=\"top\"><p>B_ON</p></td>
<td valign=\"top\"><p>Binary</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Binary.ValueSwitchFunctionOnOffInput\">ValueSwitchFunctionOnOff</a> </p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Command to switch the function on or off (true == on / false == off).</p></td>
</tr>
<tr>
<td valign=\"top\"><p>H_OUT</p></td>
<td valign=\"top\"><p>Illuminance</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Illuminance.ValueIlluminanceOutdoorInput\">ValueIlluminanceOutdoor</a></p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Measured outdoor illuminance in lux.</p></td>
</tr>
</table>
<h4><span style=\"color: #008000\">Output Variables</span></h4>
<p>The following table presents the output variables of the function as specified in the standard.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Datatype VDI3813</h4></p></td>
<td><p align=\"center\"><h4>Semantic data type</h4></p></td>
<td><p align=\"center\"><h4>Signal flow direction</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>S_AUTO</p></td>
<td valign=\"top\"><p>Sunshade</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade.CommandSunshadeAutomaticOutput\">CommandSunshadeAutomatic</a> </p></td>
<td valign=\"top\"><p>Output</p></td>
<td valign=\"top\"><p>New sunshade position.</p></td>
</tr>
</table>
<p><br><br><br><b><span style=\"color: #008000;\">Parameters</span></b> </p>
<p>The following table presents the parameter of the function as specified in the standard.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_H_ACT</p></td>
<td valign=\"top\"><p>Threshold&nbsp;value&nbsp;of&nbsp;outdoor&nbsp;illuminance&nbsp;in&nbsp;lux for sunblind activation (protection).</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_H_DEA</p></td>
<td valign=\"top\"><p>Threshold&nbsp;value&nbsp;of&nbsp;outdoor&nbsp;illuminance&nbsp;in&nbsp;lux&nbsp;for&nbsp;sunblind&nbsp;deactivation (parking).</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_TI</p></td>
<td valign=\"top\"><p>Hysteresis&nbsp;time&nbsp;for&nbsp;twilight&nbsp;recognition&nbsp;in&nbsp;seconds.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_S_ACT</p></td>
<td valign=\"top\"><p>Setpoints&nbsp;for&nbsp;sun&nbsp;shade&nbsp;position&nbsp;and&nbsp;slat&nbsp;angle&nbsp;(in&nbsp;percent&nbsp;and&nbsp;degree)&nbsp;when&nbsp;sunset&nbsp;detected.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_S_DEA</p></td>
<td valign=\"top\"><p>Setpoints&nbsp;for&nbsp;sun&nbsp;shade&nbsp;position&nbsp;and&nbsp;slat&nbsp;angle&nbsp;(in&nbsp;percent&nbsp;and&nbsp;degree)&nbsp;when&nbsp;sunrise&nbsp;detected.</p></td>
</tr>
</table>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
  end AutomaticSolarControl;

  block SlatTracking
    "Sunshade control for unoccupied room with the aim to backup heating/cooling of the room"
    /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
    // Extend from PartialFunctionBlock and insert specific functionality
    extends
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.Partial.PartialFunction(
          redeclare
        BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Internal.SlatTrackingFunctionality
          functionality(
          PAR_H_ACT=PAR_H_ACT,
          PAR_H_DEA=PAR_H_DEA,
          PAR_TI=PAR_TI,
          PAR_PARK=PAR_PARK,
          PAR_LEN=PAR_LEN,
          PAR_CYC=PAR_CYC,
          PAR_SLAT=PAR_SLAT));

    /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
    // Parameter
    parameter Modelica.SIunits.Illuminance PAR_H_ACT = 100
      "Sunset threshold value of outdoor illuminance in lux for sunblind activation.";
    parameter Modelica.SIunits.Illuminance PAR_H_DEA = 100
      "Sunrise threshold value of outdoor illuminance in lux for sunblind deactivation.";
    parameter Modelica.SIunits.Time PAR_TI = 60
      "Hysteresis time for twilight recognition in seconds.";
    parameter Real[2] PAR_PARK = {0,30}
      "Sunshade position if protection is deactivated.";
    parameter Real[2] PAR_LEN = {0,30}
      "Sunshade position if protection is activated.";
    parameter Modelica.SIunits.Time PAR_CYCLE = 300
      "Cycle time for repositioning the slats in seconds.";
    parameter Real[2] PAR_SLAT = {1,0}
      "Geometry data of the slats.";

    /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
    // Connectors
      BuildingControlLib.BuildingControl.VDI3813.Interfaces.Binary.ValueSwitchFunctionOnOffInput B_ON "Command to switch the function on or off (true == on / false == off)."
        annotation (Placement(transformation(extent={{-100,20},{-80,40}}),
            iconTransformation(extent={{-100,20},{-60,60}})));
      BuildingControlLib.BuildingControl.VDI3813.Interfaces.Illuminance.ValueIlluminanceOutdoorInput
        H_OUT "Measured outdoor illuminance in lux." annotation (Placement(transformation(extent={{-100,
            -20},{-80,0}}),
            iconTransformation(extent={{-100,-20},{-60,20}})));
      BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade.CommandSunshadeAutomaticOutput
        S_AUTO "New sunshade position." annotation (Placement(transformation(extent={{100,-20},
            {120,0}}),
            iconTransformation(extent={{100,-20},{140,20}})));


  Interfaces.Angle.ValueAngleSunAzimuthInput A_SUN_AZ
    "Current sun position (azimuth angle in degree)." annotation (Placement(
        transformation(extent={{-100,-60},{-80,-40}}), iconTransformation(
          extent={{-100,-60},{-60,-20}})));
  Interfaces.Angle.ValueAngleSunElevationInput A_SUN_EL
    "Current sun position (elevation angle in degree)."
    annotation (Placement(transformation(extent={{-100,-100},{-80,-80}}),
        iconTransformation(extent={{-100,-100},{-60,-60}})));
  equation

  connect(B_ON, functionality.B_ON) annotation (Line(
      points={{-90,30},{-64,30},{-64,26.6},{-64.6,26.6}},
      color={0,0,0},
      thickness=1));
  connect(H_OUT, functionality.H_OUT) annotation (Line(
      points={{-90,-10},{-63,-10},{-63,11.4},{-64.6,11.4}},
      color={0,0,0},
      thickness=1));
  connect(A_SUN_AZ, functionality.A_SUN_AZ) annotation (Line(
      points={{-90,-50},{-64,-50},{-64,-3.8},{-64.6,-3.8}},
      color={0,0,0},
      thickness=1));
  connect(A_SUN_EL, functionality.A_SUN_EL) annotation (Line(
      points={{-90,-90},{-64,-90},{-64,-19},{-64.6,-19}},
      color={0,0,0},
      thickness=1));
  connect(functionality.S_AUTO, S_AUTO) annotation (Line(
      points={{45.6,0},{76,0},{76,-10},{110,-10}},
      color={0,0,0},
      thickness=1));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}})),                Icon(coordinateSystem(
            preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
                      preferredView="info",
  Documentation(info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<p>Block that implements function of &QUOT;Slat tracking&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.15, p. 55 - 58]</a>. </p>
<h4><span style=\"color: #008000\">Functional Description</span></h4>
<p>&QUOT;The function <i>Slat tracking</i> (RA-FL section 6, column 14; informative function block Figure 36), just like the <i>Automatic solar control</i>, is mainly intended for anti-glare protection. Unlike <i>Automatic solar control</i>, however, <i>Slat tracking</i> allows the position of the blinds to be adjusted cyclically in accordance with the current solar altitude if a specified illuminance limit is exceeded. Each room is thus optimally provided with daylight although direct incidence of sunlight is prevented. With fading brightness, the sunshade is moved to a parking position. To this end, the application function processes the input information about the illuminance measured on the facade, as provided by the sensor function <i>Brightness measurement</i>, and generates actuating information for assigned actuator functions of the type <i>Sunshade actuator</i>.&QUOT;<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.15, p. 55 - 58]</a></p>
<p><b>Fig. 1: </b>&QUOT;Informative representation of the application function <i>Slat tracking</i>&QUOT;, <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.15, Figure 36, p. 56]</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/docVDI3813_SlatTracking.PNG\" alt=\"docVDI3813_SlatTracking.PNG\"/> </p></td>
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
<td valign=\"top\"><p>B_ON</p></td>
<td valign=\"top\"><p>Binary</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Binary.ValueSwitchFunctionOnOffInput\">ValueSwitchFunctionOnOff</a> </p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Command to switch the function on or off (true == on / false == off).</p></td>
</tr>
<tr>
<td valign=\"top\"><p>H_OUT</p></td>
<td valign=\"top\"><p>Illuminance</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Illuminance.ValueIlluminanceOutdoorInput\">ValueIlluminanceOutdoor</a></p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Measured outdoor illuminance in lux.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>A_SUN_AZ</p></td>
<td valign=\"top\"><p>Angle</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Angle.ValueAngleSunAzimuthInput\">ValueAngleSunAzimuth</a></p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Current sun position (azimuth angle in degree).</p></td>
</tr>
<tr>
<td valign=\"top\"><p>A_SUN_EL</p></td>
<td valign=\"top\"><p>Angle</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Angle.ValueAngleSunElevationInput\">ValueAngleSunElevation</a></p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Current sun position (elevation angle in degree).</p></td>
</tr>
</table>
<h4><span style=\"color: #008000\">Output Variables</span></h4>
<p>The following table presents the output variables of the function as specified in the standard.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Datatype VDI3813</h4></p></td>
<td><p align=\"center\"><h4>Semantic data type</h4></p></td>
<td><p align=\"center\"><h4>Signal flow direction</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>S_AUTO</p></td>
<td valign=\"top\"><p>Sunshade</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade.CommandSunshadeAutomaticOutput\">CommandSunshadeAutomatic</a> </p></td>
<td valign=\"top\"><p>Output</p></td>
<td valign=\"top\"><p>New sunshade position.</p></td>
</tr>
</table>
<p><br><br><br><br><br><br><br><br><b><span style=\"color: #008000;\">Parameters</span></b> </p>
<p>The following table presents the parameter of the function as specified in the standard.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_H_ACT</p></td>
<td valign=\"top\"><p>Sunset&nbsp;threshold&nbsp;value&nbsp;of&nbsp;outdoor&nbsp;illuminance&nbsp;in&nbsp;lux for sunblind activation.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_H_DEA</p></td>
<td valign=\"top\"><p>Sunrise&nbsp;threshold&nbsp;value&nbsp;of&nbsp;outdoor&nbsp;illuminance&nbsp;in&nbsp;lux&nbsp;for&nbsp;sunblind&nbsp;deactivation.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_TI</p></td>
<td valign=\"top\"><p>Hysteresis&nbsp;time&nbsp;for&nbsp;twilight&nbsp;recognition&nbsp;in&nbsp;seconds.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_PARK</p></td>
<td valign=\"top\"><p>Sunshade position if protection is deactivated.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_LEN</p></td>
<td valign=\"top\"><p>Sunshade position if protection is activated.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_CYC</p></td>
<td valign=\"top\"><p>Cycle time for repositioning the slats in seconds.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_SLAT</p></td>
<td valign=\"top\"><p>Geometry data of the slats.</p></td>
</tr>
</table>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
  end SlatTracking;

  block ShadowCorrection
    "Sunshade control for unoccupied room with the aim to backup heating/cooling of the room"
    /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
    // Extend from PartialFunctionBlock and insert specific functionality
    extends
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.Partial.PartialFunction(
          redeclare
        BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Internal.ShadowCorrectionFunctionality
          functionality(
          PAR_PARK=PAR_PARK,
          PAR_SHAD=PAR_SHAD));
    /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
    // Parameter
    parameter Real[2] PAR_PARK = {0,30}
      "Sunshade position if window is in the shadow of some other object.";
    parameter Real[2] PAR_SHAD = {1,0}
      "Geometry data of objects in the area that could cast a shadow on the window.";

    /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
    // Connectors

    Interfaces.Sunshade.CommandSunshadeAutomaticInput S_AUTO_IN
      "New position of the sunshade without shadow correction." annotation (
        Placement(transformation(extent={{-100,20},{-80,40}}), iconTransformation(
            extent={{-100,20},{-60,60}})));
    Interfaces.Sunshade.CommandSunshadeAutomaticOutput S_AUTO_OUT
      "New position of the sunshade with shadow correction."      annotation (
        Placement(transformation(extent={{100,-20},{120,0}}), iconTransformation(
            extent={{100,-20},{140,20}})));
    Interfaces.Angle.ValueAngleSunAzimuthInput A_SUN_AZ
      "Current sun position (azimuth angle)."           annotation (Placement(
          transformation(extent={{-100,-12},{-80,8}}), iconTransformation(extent={
              {-100,-20},{-60,20}})));
    Interfaces.Angle.ValueAngleSunElevationInput A_SUN_EL
      "Current sun position (elevation angle)."           annotation (Placement(
          transformation(extent={{-100,-50},{-80,-30}}), iconTransformation(
            extent={{-100,-60},{-60,-20}})));
  equation

  connect(S_AUTO_IN, functionality.S_AUTO_IN) annotation (Line(
      points={{-90,30},{-62,30},{-62,15.2},{-30.4,15.2}},
      color={0,0,0},
      thickness=1));
  connect(A_SUN_AZ, functionality.A_SUN_AZ) annotation (Line(
      points={{-90,-2},{-62,-2},{-62,0},{-30.4,0}},
      color={0,0,0},
      thickness=1));
  connect(A_SUN_EL, functionality.A_SUN_EL) annotation (Line(
      points={{-90,-40},{-62,-40},{-62,-15.2},{-30.4,-15.2}},
      color={0,0,0},
      thickness=1));
  connect(functionality.S_AUTO_OUT, S_AUTO_OUT) annotation (Line(
      points={{45.6,0},{74,0},{74,-10},{110,-10}},
      color={0,0,0},
      thickness=1));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}})),                Icon(coordinateSystem(
            preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
                      preferredView="info",
  Documentation(info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<p>Block that implements function of &QUOT;Shadow correction&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.16, p. 58 - 59]</a>. </p>
<h4><span style=\"color: #008000\">Functional Description</span></h4>
<p>&QUOT;The <i>Shadow correction</i> (RA-FL section 6, column 15; informative function block Figure 37) can be used in conjunction with <i>Automatic solar control</i> or <i>Slat tracking</i>. The function checks whether a window or group of windows allocated, e. g., to a room, are temporarily shadowed by surrounding buildings or parts of the building they belong to. If this is the case, the positioning command of the sunshading function is replaced by a specified parking position allowing improved provision with daylight.&QUOT;<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.16, p. 58 - 59]</a></p>
<p><b>Fig. 1: </b>&QUOT;Informative representation of the application function <i>Shadow correction</i>&QUOT;, <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.16, Figure 37, p. 58]</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/docVDI3813_ShadowCorrection.PNG\" alt=\"docVDI3813_ShadowCorrection.PNG\"/> </p></td>
</tr>
</table>
<p><br><h4><span style=\"color: #008000\">Input Variables</span></h4></p>
<p>The following table presents the input variables of the function as specified in the standard. </p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Datatype VDI3813</h4></p></td>
<td><p align=\"center\"><h4>Semantic data type</h4></p></td>
<td><p align=\"center\"><h4>Signal flow direction</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>S_AUTO_IN</p></td>
<td valign=\"top\"><p>Sunshade</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade.CommandSunshadeAutomaticInput\">CommandSunshadeAutomatic</a> </p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>New position of the sunshade without shadow correction.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>A_SUN_AZ</p></td>
<td valign=\"top\"><p>Angle</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Angle.ValueAngleSunAzimuthInput\">ValueAngleSunAzimuth</a></p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Current sun position (azimuth angle).</p></td>
</tr>
<tr>
<td valign=\"top\"><p>A_SUN_EL</p></td>
<td valign=\"top\"><p>Angle</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Angle.ValueAngleSunElevationInput\">ValueAngleSunElevation</a></p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Current sun position (elevation angle).</p></td>
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
<td valign=\"top\"><p>S_AUTO_OUT</p></td>
<td valign=\"top\"><p>Sunshade</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade.CommandSunshadeAutomaticOutput\">CommandSunshadeAutomatic</a> </p></td>
<td valign=\"top\"><p>Output</p></td>
<td valign=\"top\"><p>New position of the sunshade with shadow correction.</p></td>
</tr>
</table>
<p><br><br><br><br><b><span style=\"color: #008000;\">Parameters</span></b> </p>
<p>The following table presents the parameter of the function as specified in the standard.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_PARK</p></td>
<td valign=\"top\"><p>Sunshade position if window is in the shadow of some other object.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_SHAD</p></td>
<td valign=\"top\"><p>Geometry data of objects in the area that could cast a shadow on the window.</p></td>
</tr>
</table>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
  end ShadowCorrection;

  block WeatherProtection
    "Sunshade control for unoccupied room with the aim to backup heating/cooling of the room"
    /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
    // Extend from PartialFunctionBlock and insert specific functionality
    extends
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.Partial.PartialFunction(
          redeclare
        BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Internal.WeatherProtectionFunctionality
          functionality(
          PAR_WIND=PAR_WIND,
          PAR_FROST=PAR_FROST,
          PAR_DEICE=PAR_DEICE,
          PAR_PROT=PAR_PROT));

    /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
    // Parameter
    parameter Modelica.SIunits.Velocity PAR_WIND = 0
      "Threshold for critical wind velocity.";
    parameter   Modelica.SIunits.Temp_K PAR_FROST = 1
      "Threshold for critical temperatures before icing.";
    parameter Modelica.SIunits.Time PAR_DEICE = 3600
      "Protection time for the sunshade de-icing after cold temperatures and rain.";
    parameter Real[2] PAR_PROT = {1,0}
      "Sunshade position in protection mode.";

    /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
    // Connectors

    Interfaces.WindVelocity.ValueWindVelocityInput W_ACT
      "Measured wind velocity in m/s." annotation (Placement(transformation(
            extent={{-100,20},{-80,40}}), iconTransformation(extent={{-100,20},{-60,
              60}})));
    Interfaces.AirTemperature.ValueAirTemperatureOutdoorInput T_OUT
      "Measured outdoor air temperature in Kelvin." annotation (Placement(
          transformation(extent={{-100,-20},{-80,0}}), iconTransformation(extent={
              {-100,-20},{-60,20}})));
    Interfaces.Binary.ValuePrecipitationInput R_ACT "Measured precipitation."
      annotation (Placement(transformation(extent={{-100,-60},{-80,-40}}),
          iconTransformation(extent={{-100,-60},{-60,-20}})));
    Interfaces.Sunshade.CommandSunshadeProtectionOutput S_PROT
      "New sunshade position." annotation (Placement(transformation(extent={{100,-20},
              {120,0}}), iconTransformation(extent={{100,-20},{140,20}})));
  equation
  connect(W_ACT, functionality.W_ACT) annotation (Line(
      points={{-90,30},{-62,30},{-62,15.2},{-30.4,15.2}},
      color={0,0,0},
      thickness=1));
  connect(T_OUT, functionality.T_OUT) annotation (Line(
      points={{-90,-10},{-64,-10},{-64,0},{-30.4,0}},
      color={0,0,0},
      thickness=1));
  connect(R_ACT, functionality.R_ACT) annotation (Line(
      points={{-90,-50},{-64,-50},{-64,-15.2},{-30.4,-15.2}},
      color={0,0,0},
      thickness=1));
  connect(functionality.S_PROT, S_PROT) annotation (Line(
      points={{45.6,0},{76,0},{76,-10},{110,-10}},
      color={0,0,0},
      thickness=1));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}})),                Icon(coordinateSystem(
            preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
                      preferredView="info",
  Documentation(info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<p>Block that implements function of &QUOT;Weather protection&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.18, p. 61 - 63]</a>. </p>
<h4><span style=\"color: #008000\">Functional Description</span></h4>
<p>&QUOT;The function <i>Weather protection</i> (RA-FL section 6, column 17; informative function block Figure 39) prevents damage to external sunshading equipment due to wind, rain or icing. Whereas wind velocity and rain are measured directly by means of sensors, the icing hazard is predicted indirectly through evaluation of precipitation in combination with the outdoor temperature. To this end, the application function processes the input information from the sensor functions <i>Wind velocity measurement</i>, <i>Temperature measurement</i> and <i>Precipitation detection</i> and, in case of a damage hazard, generates a positioning command for the application function <i>Priority control</i> of the sunshade.&QUOT;<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.18, p. 61 - 63]</a></p>
<p><b>Fig. 1: </b>&QUOT;Informative representation of the application function <i>Weather protection</i>&QUOT;, <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.18, Figure 39, p. 62]</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/docVDI3813_WeatherProtection.PNG\" alt=\"docVDI3813_WeatherProtection.PNG\"/> </p></td>
</tr>
</table>
<p><br><h4><span style=\"color: #008000\">Input Variables</span></h4></p>
<p>The following table presents the input variables of the function as specified in the standard. </p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Datatype VDI3813</h4></p></td>
<td><p align=\"center\"><h4>Semantic data type</h4></p></td>
<td><p align=\"center\"><h4>Signal flow direction</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>W_ACT</p></td>
<td valign=\"top\"><p>Wind</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.WindVelocity.ValueWindVelocityInput\">ValueWindVelocity</a> </p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Measured wind velocity in m/s.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>T_OUT</p></td>
<td valign=\"top\"><p>Temperature</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature.ValueAirTemperatureOutdoorInput\">ValueAirTemperatureOutdoor</a></p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Measured outdoor air temperature in Kelvin.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>R_ACT</p></td>
<td valign=\"top\"><p>Precipitation</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Binary.ValuePrecipitationInput\">ValuePrecipitation</a></p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Measured precipitation.</p></td>
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
<td valign=\"top\"><p>S_PROT</p></td>
<td valign=\"top\"><p>Sunshade</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade.CommandSunshadeProtectionOutput\">CommandSunshadeProtection</a> </p></td>
<td valign=\"top\"><p>Output</p></td>
<td valign=\"top\"><p>New sunshade position.</p></td>
</tr>
</table>
<p><br><br><br><br><br><b><span style=\"color: #008000;\">Parameters</span></b> </p>
<p>The following table presents the parameter of the function as specified in the standard.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_WIND</p></td>
<td valign=\"top\"><p>Threshold for critical wind velocity.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_FROST</p></td>
<td valign=\"top\"><p>Threshold for critical temperatures before icing.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_DEICE</p></td>
<td valign=\"top\"><p>Protection time for the sunshade de-icing after cold temperatures and rain.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_PROT</p></td>
<td valign=\"top\"><p>Sunshade position in protection mode.</p></td>
</tr>
</table>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
  end WeatherProtection;

          annotation(preferedView="Info", Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
end Sunshading;
