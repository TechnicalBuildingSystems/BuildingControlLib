within BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.RoomClimate;
block TemperatureControl
  "Control of room temperature via positioning of heating/cooling valves"
  extends
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.Partial.PartialFunction(
      redeclare
      BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Internal.TemperatureControlFunctionality
      functionality);
    /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Connectors
  Interfaces.AirTemperature.ValueAirTemperatureRoomInput T_ROOM
    annotation (Placement(transformation(extent={{-100,0},{-60,20}})));
  Interfaces.AirTemperature.SetpointHeatCoolEnergyModesInput T_SETPS
    annotation (Placement(transformation(extent={{-100,-20},{-58,0}})));
  Interfaces.ControlFunction.ValueControlFunctionAirTemperatureCurrentlyInput
    F_ACT annotation (Placement(transformation(extent={{-100,40},{-60,60}})));
  Interfaces.EnergyMode.ValueEnergyModeCurrentlyInput M_ACT
    annotation (Placement(transformation(extent={{-100,20},{-60,40}})));
  Interfaces.ActuatorSignal.CommandActuatorSignalValvePositionOutput V_SET_VP
    annotation (Placement(transformation(extent={{100,20},{140,60}})));
  Interfaces.ActuatorSignal.StatusActuatorSignalFanSpeedInput      V_STA_VP
    annotation (Placement(transformation(extent={{-100,-40},{-58,-20}})));
  Interfaces.ActuatorSignal.SetpointActuatorSignalLockValvePositionOutput V_LCK
    annotation (Placement(transformation(extent={{100,-20},{140,20}})));
equation
  connect(F_ACT, functionality.F_ACT) annotation (Line(
      points={{-80,50},{-58,50},{-58,19},{-30.4,19}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(M_ACT, functionality.M_ACT) annotation (Line(
      points={{-80,30},{-56,30},{-56,11.4},{-30.4,11.4}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(T_ROOM, functionality.T_ROOM) annotation (Line(
      points={{-80,10},{-58,10},{-58,3.8},{-30.4,3.8}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(T_SETPS, functionality.T_SETPS) annotation (Line(
      points={{-79,-10},{-56,-10},{-56,-3.8},{-29.64,-3.8}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(V_STA_VP, functionality.V_STA_VP) annotation (Line(
      points={{-79,-30},{-57.5,-30},{-57.5,-11.4},{-30.02,-11.4}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(functionality.V_SET_VP, V_SET_VP) annotation (Line(
      points={{45.6,15.2},{65.8,15.2},{65.8,40},{120,40}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(functionality.V_LCK, V_LCK) annotation (Line(
      points={{45.6,0},{120,0}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),      graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics),  preferredView="info",
Documentation(info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<p>Block that implements functionality of &QUOT;Temperature control&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.23, p. 72 - 74]</a>. </p>
<h4><span style=\"color: #008000\">Functional Description</span></h4>
<p>&QUOT;The <i>Temperature control</i> (RA-FL section 6, column 22; informative function block Figure 46) is used to maintain a room temperature by means of constantly determining the temperature offset from the setpoint and adjusting the valve position (manipulated variable) of a heating or cooling register. In systems with separate heating and cooling equipment, one separate <i>Temperature control</i> function shall be used each for heating and for cooling.&QUOT;<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.2, p. 32-33]</a></p>
<p><b>Fig. 1: </b>&QUOT;Informative representation of the application function <i>Temperature control</i>&QUOT;, <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.23, Figure 46, p. 73]</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/docVDI3813_TemperatureControl.PNG\" alt=\"docVDI3813_TemperatureControl.PNG\"/> </p></td>
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
<td valign=\"top\"><p>F_ACT</p></td>
<td valign=\"top\"><p>Funktion</p></td>
<td valign=\"top\"></td>
<td valign=\"top\"><p><br><br>Input</p></td>
<td valign=\"top\"><p>Valid room air temperature control function.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>M_ACT</p></td>
<td valign=\"top\"><p>Niveau</p></td>
<td valign=\"top\"></td>
<td valign=\"top\"><p><br><br>Input</p></td>
<td valign=\"top\"><p>Valid energy mode.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>T_ROOM</p></td>
<td valign=\"top\"><p>Temp</p></td>
<td valign=\"top\"></td>
<td valign=\"top\"><p><br><br>Input</p></td>
<td valign=\"top\"><p>Measured room air temperature in Kelvin.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>M_SETPTS</p></td>
<td valign=\"top\"><p>Temp[x]</p></td>
<td valign=\"top\"></td>
<td valign=\"top\"><p><br><br>Input</p></td>
<td valign=\"top\"><p>Array of setpoints for heating and cooling in every energy mode.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>V_STA_FS</p></td>
<td valign=\"top\"><p>Pos</p></td>
<td valign=\"top\"></td>
<td valign=\"top\"><p><br><br>Input</p></td>
<td valign=\"top\"><p>Currently used fan speed.</p></td>
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
<td valign=\"top\"><p>V_SET_VP</p></td>
<td valign=\"top\"><p>Pos </p></td>
<td valign=\"top\"></td>
<td valign=\"top\"><p><br><br>Output</p></td>
<td valign=\"top\"><p>New valve position.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>V_SET_LCK</p></td>
<td valign=\"top\"><p>Pos</p></td>
<td valign=\"top\"></td>
<td valign=\"top\"><p><br><br>Output</p></td>
<td valign=\"top\"><p>New lock valve position.</p></td>
</tr>
</table>
<p><br><br><br><br><b><span style=\"color: #008000;\">Parameter</span></b> </p>
<p>The following table presents the parameter of the function as specified in the standard.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_XXX</p></td>
<td valign=\"top\"><p>Provide description</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_XXX</p></td>
<td valign=\"top\"><p>Provide description</p></td>
</tr>
</table>
</html>",
        revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
end TemperatureControl;
