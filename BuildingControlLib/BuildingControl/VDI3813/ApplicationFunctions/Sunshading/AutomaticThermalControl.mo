within BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Sunshading;
block AutomaticThermalControl
  "Sunshade control for unoccupied room with the aim to backup heating/cooling of the room"
  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Extend from PartialFunctionBlock and insert specific functionality
  extends
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.Partial.PartialFunction(
        redeclare
      BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Internal.AutomaticThermalControlFunctionality
        functionality(
        PAR_H_ACT=PAR_H_ACT,
        PAR_S_HEAT=PAR_S_HEAT,
        PAR_S_COOL=PAR_S_COOL));
  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Parameter
  parameter Modelica.SIunits.Illuminance PAR_H_ACT = 100
    "Threshold value of outdoor illuminance in lux.";
  parameter Real[2] PAR_S_HEAT = {0,45}
    "Heating mode setpoints for sun shade position in percent and slat angle in degree.";
  parameter Real[2] PAR_S_COOL = {1,11}
    "Cooling mode setpoints for sun shade position in percent and slat angle in degree.";

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Connectors
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.BooleanInput
      P_ACT
    "Evaluated presence signal (true = occupied / false = unoccupied)."
      annotation (Placement(transformation(extent={{-100,40},{-80,60}}),
          iconTransformation(extent={{-100,40},{-60,60}})));
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealInput
      H_OUT "Measured outdoor illuminance in Lux." annotation (Placement(transformation(extent={{-100,0},{-80,20}}),
          iconTransformation(extent={{-100,0},{-60,20}})));
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealInput
      T_ROOM "Measured room air temperature in Kelvin." annotation (Placement(transformation(extent={{-100,-40},{-80,-20}}),
          iconTransformation(extent={{-100,-40},{-60,-20}})));
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealInput[8]
      T_SETPTS "Array of setpoints for heating and cooling in every energy mode." annotation (Placement(transformation(extent={{-100,-80},{-80,-60}}),
          iconTransformation(extent={{-100,-80},{-60,-60}})));
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealOutput[2]
      S_MAN "New position of sunshade." annotation (Placement(transformation(extent={{100,-10},{120,10}}),
          iconTransformation(extent={{100,-10},{140,10}})));

equation
    connect(S_MAN, functionality.S_MAN) annotation (
        Line(
        points={{110,0},{100,0},{100,-4},{60,-4},{60,0},{45.6,0}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
      connect(P_ACT, functionality.P_ACT) annotation (
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
    connect(T_ROOM, functionality.T_ROOM) annotation (
        Line(
        points={{-90,-30},{-90,-12},{-90,-12},{-90,-12},{-60,-12},{-60,-11.4},{
          -30.4,-11.4}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(T_SETPTS, functionality.T_SETPTS)
      annotation (Line(
        points={{-90,-70},{-90,-70},{-90,-44},{-50,-44},{-50,-26.6},{-30.4,
          -26.6}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),      graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics),  preferredView="info",
Documentation(info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<p>Block that implements function of &QUOT;Automatic thermal control&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.17, p. 59 - 61]</a>. </p>
<h4><span style=\"color: #008000\">Functional Description</span></h4>
<p>&QUOT;By means of <i>Automatic thermal control </i>(RA-FL section 6, column 16; informative function block Figure 38), the sunshade is used in unoccupied rooms to support heating or cooling by deliberately admitting or preventing solar heat inputs. This helps avoiding overheating in summer and reducing the heating load in winter. To this end, the application function processes the input information about the occupancy state of the room (<i>Occupancy evaluation</i>), the outdoor brightness (<i>Brightness measurement</i>), the room temperature (<i>Temperature measurement</i>) and the setpoints (<i>Setpoint calculation</i>) and, on this basis, generates positioning commands for the sunshade.&QUOT;<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.17, p. 59 - 61]</a></p>
<p><b>Fig. 1: </b>&QUOT;Informative representation of the application function <i>Automatic thermal control</i>&QUOT;, <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.17, Figure 38, p. 60]</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/docVDI3813_AutomaticThermalControl.PNG\" alt=\"docVDI3813_AutomaticThermalControl.PNG\"/> </p></td>
</tr>
</table>

</html>",
        revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
end AutomaticThermalControl;
