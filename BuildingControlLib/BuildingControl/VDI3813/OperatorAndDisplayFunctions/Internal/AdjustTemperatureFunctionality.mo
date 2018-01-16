within BuildingControlLib.BuildingControl.VDI3813.OperatorAndDisplayFunctions.Internal;
block AdjustTemperatureFunctionality
  "Algorithm model to provide functionality of AdjustTemperatureSetpoint"
extends
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.Partial.PartialFunctionality;
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.PhysicalRealInput
    CMD "Physical operation command (absolute temperature difference) for changing room air temperature." annotation (Placement(transformation(extent={{-20,80},{20,120}}),
        iconTransformation(extent={{-20,80},{20,120}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealInput
    T_STA "Absolute temperature difference that is currently used as setpoint." annotation (Placement(
        transformation(extent={{-100,-20},{-40,20}}), iconTransformation(extent=
           {{-100,-20},{-40,20}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealOutput
    T_SETPT "New absolute temperature difference for use as setpoint." annotation (Placement(transformation(extent={{100,-20},{160,20}}),
        iconTransformation(extent={{100,-20},{160,20}})));

        Real u;
        Real uMin;
        Real uMax;

parameter Modelica.SIunits.TemperatureDifference PAR_T_UL = 4
    "Upper limit for new air temperature setpoint.";
parameter Modelica.SIunits.TemperatureDifference PAR_T_LL = 4
    "Lower limit for new air temperature setpoint.";
parameter Boolean strict=false "= true, if strict limits with noEvent(..)"
    annotation (Evaluate=true, choices(checkBox=true), Dialog(tab="Advanced"));

equation
   u = T_STA + CMD;
   uMax = T_STA + PAR_T_UL;
   uMin = T_STA - PAR_T_LL;

  if strict then
    T_SETPT = smooth(0, noEvent(if u > uMax then uMax else if u < uMin then uMin else u));
  else
    T_SETPT = smooth(0,if u > uMax then uMax else if u < uMin then uMin else u);
  end if;

         annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),preferredView="info",
    Documentation(info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<p>Block that implements functionality of &QUOT;Adjust temperature setpoint&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.4.5, p. 28 - 29]</a>. </p>
<h4><span style=\"color: #008000\">Functional Description</span></h4>
<p>&QUOT;The operator function<i> Adjust temperature setpoint</i> (RA-FL section 5, column 4; informative function block Figure 19) converts a manual actuation to output information which is then available as input information to the application functions. The adjustment range is to be limited by means of parameters. The setpoint can be given in terms of either absolute temperatures or a relative offset from the default setpoint of the control system.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.4.5, p. 28 - 29]</a></p>
<p>In the textual and informative description of the function the input is named T_SYNC.<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.4.5, p. 28 - 29]</a> This value is never generated as an output by any other function. Furthermore the other operator and display functions have status inputs that have the ending _STA. Following this convention the input acronym has been changed from T_SYNC to T_STA.</p>

</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end AdjustTemperatureFunctionality;
