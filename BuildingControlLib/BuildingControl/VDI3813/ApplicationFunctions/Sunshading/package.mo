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

</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
  end AutomaticSolarControl;



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

    Interfaces.RealInput W_ACT
      "Measured wind velocity in m/s." annotation (Placement(transformation(
            extent={{-100,20},{-80,40}}), iconTransformation(extent={{-100,20},{-60,
              60}})));
    Interfaces.RealInput T_OUT
      "Measured outdoor air temperature in Kelvin." annotation (Placement(
          transformation(extent={{-100,-20},{-80,0}}), iconTransformation(extent={
              {-100,-20},{-60,20}})));
    Interfaces.BooleanInput R_ACT "Measured precipitation."
      annotation (Placement(transformation(extent={{-100,-60},{-80,-40}}),
          iconTransformation(extent={{-100,-60},{-60,-20}})));
    Interfaces.RealOutput[2] S_PROT
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
