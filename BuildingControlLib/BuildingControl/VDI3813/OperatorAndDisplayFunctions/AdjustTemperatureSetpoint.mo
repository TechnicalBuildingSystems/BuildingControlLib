within BuildingControlLib.BuildingControl.VDI3813.OperatorAndDisplayFunctions;
block AdjustTemperatureSetpoint
  "Enables the user to adjust the setpoint for room temperature"
  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Extend from PartialFunctionBlock and insert specific functionality
  extends Interfaces.Partial.PartialFunction(      redeclare
      BuildingControlLib.BuildingControl.VDI3813.OperatorAndDisplayFunctions.Internal.AdjustTemperatureFunctionality
      functionality(PAR_T_UL=PAR_T_UL,PAR_T_LL=PAR_T_LL,strict=strict));
  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Connectors
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.PhysicalRealInput
    CMD "Physical operation command (absolute temperature difference) for changing room air temperature."   annotation (Placement(transformation(extent={{-10,90},{10,110}}),
        iconTransformation(extent={{-20,82},{20,120}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealInput
    T_STA "Absolute temperature difference that is currently used as setpoint."    annotation (Placement(transformation(extent={{-100,60},{-80,80}}),
        iconTransformation(extent={{-100,-20},{-40,20}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealOutput
    T_SETPT "New absolute temperature difference for use as setpoint."   annotation (Placement(transformation(extent={{100,60},{120,80}}),
        iconTransformation(extent={{100,-20},{160,20}})));

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Parameter
  parameter Modelica.SIunits.TemperatureDifference PAR_T_UL = 4
    "Upper limit for new air temperature setpoint.";
  parameter Modelica.SIunits.TemperatureDifference PAR_T_LL = 4
    "Lower limit for new air temperature setpoint.";
  parameter Boolean strict=false "= true, if strict limits with noEvent(..)"
    annotation (Evaluate=true, choices(checkBox=true), Dialog(tab="Advanced"));

equation
  connect(T_STA, functionality.T_STA) annotation (Line(
      points={{-90,70},{-80,70},{-80,0},{-26.6,0}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(T_SETPT, functionality.T_SETPT) annotation (Line(
      points={{110,70},{80,70},{80,0},{49.4,0}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(CMD, functionality.CMD) annotation (Line(
      points={{0,100},{0,62},{0,62},{0,38}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),      graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics),  preferredView="info",
Documentation(info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<p>Block that implements function &QUOT;Adjust temperature setpoint&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.4.5, p. 28 - 29]</a>. </p>
<h4><span style=\"color: #008000\">Functional Description</span></h4>
<p>&QUOT;The operator function<i> Adjust temperature setpoint</i> (RA-FL section 5, column 4; informative function block Figure 19) converts a manual actuation to output information which is then available as input information to the application functions. The adjustment range is to be limited by means of parameters. The setpoint can be given in terms of either absolute temperatures or a relative offset from the default setpoint of the control system.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.4.5, p. 28 - 29]</a></p>
<p>In the textual and informative description of the function the input is named T_SYNC.<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.4.5, p. 28 - 29]</a> This value is never generated as an output by any other function. Furthermore the other operator and display functions have status inputs that have the ending _STA. Following this convention the input acronym has been changed from T_SYNC to T_STA.</p>
<p><b>Fig. 1: </b>&QUOT;Informative representation of the actuator function <i>Adjust temperature setpoint</i>&QUOT;, <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.4.5, Figure 19, p. 29]</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/docVDI3813_AdjustTemperatureSetpoint.PNG\" alt=\"docVDI3813_AdjustTemperatureSetpoint.PNG\"/> </p></td>
</tr>
</table>

</html>",
        revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end AdjustTemperatureSetpoint;
