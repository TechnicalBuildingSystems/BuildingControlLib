within BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.RoomClimate;
block FunctionSelection
  "Selects current air temperature control function depending on operator settings and boundary conditions"
   /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Extend from PartialFunctionBlock and insert specific functionality
extends
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.Partial.PartialFunction(
        redeclare
      BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Internal.FunctionSelectionFunctionality
        functionality);
  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Connectors
  Interfaces.ControlFunctionAirTemperatureInput F_BMS "Control function for air temperature control that is generated by time schedule of the operator." annotation (Placement(transformation(extent={{-100,20},{-60,60}})));
  Interfaces.BooleanInput B_DEW "Measured value that shows if dewpoint has been reached."
    annotation (Placement(transformation(extent={{-100,-20},{-60,20}})));
  Interfaces.RealInput T_ROOM "Measured room air temperature."
    annotation (Placement(transformation(extent={{-100,-60},{-60,-20}})));
  Interfaces.RealInput[8] T_SETPTS "Array of temperature setpoints for heating and cooling of all energy modes."
    annotation (Placement(transformation(extent={{-100,-100},{-60,-60}})));
  Interfaces.ControlFunctionAirTemperatureOutput
    F_ACT "Valid room air temperature control function." annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  connect(F_BMS, functionality.F_BMS) annotation (Line(
      points={{-80,40},{-58,40},{-58,19},{-34.2,19}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(B_DEW, functionality.B_DEW) annotation (Line(
      points={{-80,0},{-58,0},{-58,11.4},{-34.2,11.4}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(T_ROOM, functionality.T_ROOM) annotation (Line(
      points={{-80,-40},{-58,-40},{-58,-3.8},{-34.2,-3.8}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(T_SETPTS, functionality.T_SETPTS) annotation (Line(
      points={{-80,-80},{-58,-80},{-58,-11.4},{-34.2,-11.4}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(functionality.F_ACT, F_ACT) annotation (Line(
      points={{41.8,0},{74,0},{74,0},{110,0}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),      graphics),preferredView="info", Documentation(info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<p>Block that implements functionality of &QUOT;Function selection&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.22, p. 70 - 72]</a>. </p>
<h4><span style=\"color: #008000\">Functional Description</span></h4>
<p>&QUOT;The room climate can be influenced by various control functions (see Figure 44) (RA-FL section 6, column 21; informative function block Figure 45), which can either be specified by the operator or determined automatically depending on specific states. Based on the currently selected control function, the application functions <i>Room supply air temperature cascade control</i>, <i>Room temperature control</i>, <i>Fan control</i> and <i>Night-time cooling</i> can decide whether to be active or not. The following control functions are selectable:</p>
<p>OFF: control inactive</p>
<p>AUTO: control active with automatic changeover between heating and cooling modes</p>
<p>HEATING: control active in heating mode</p>
<p>COOLING: control active in cooling mode</p>
<p>PRECOOL: control active in cooling mode, but using comfort setpoint for heating</p>
<p>NIGHTCOOL: only night-time cooling active</p>
<p>Apart from the selection of a control function by the operator (e. g. via a time program), a change of function can also be triggered by the dewpoint being reached in cooling mode. In this case, the controller remains inactive (OFF). If automatic room-by-room changeover between heating and cooling is permissible (e. g. with four-pipe systems), and is selected by the operator (F_BMS = AUTO), the function decides on changing the active function (HEATING or COOLING) depending on the current setpoints (T_SETPT) and the room temperature (T_ROOM). In doing so, the function must make sure that, for systems having just one joint register or one joint area for heating and cooling purposes, changeover takes place via the OFF function, after an appropriate holding time to allow any open valves to close.&QUOT;<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.22, p. 70 - 72]</a></p>
<p><br>Implementation of the functionality of function selection. Assumption is made that T_ZE (Temperature in the middle between comfort setpoints) is the arithmetic mean of the cooling and heating set points.</p>
<p><br><b>Fig. 1: </b>&QUOT;Changeover conditions/function selection<i>T</i><sub>ZE</sub> = centre of neutral zone&QUOT;, <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.22, Figure 44, p. 71]</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/docVDI3813_ChangeoverFunctionSelection.PNG\"/> </p></td>
</tr>
</table>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td></td>
</tr>
</table>
<p><br><b>Fig. 2: </b>&QUOT;Informative representation of the application function <i>Function selection</i>&QUOT;, <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.22, Figure 45, p. 71]</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/docVDI3813_FunctionSelection.PNG\" alt=\"docVDI3813_FunctionSelection.PNG\"/> </p></td>
</tr>
</table>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
end FunctionSelection;
