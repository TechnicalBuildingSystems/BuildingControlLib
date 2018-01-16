within BuildingControlLib.BuildingControl.VDI3813.ActuatorFunctions.Internal;
block ControlDriveActuatorLockValvePositionFunctionality
  "Algorithm model to provide functionality of ControlDriveActuatorLockValvePosition"
  extends
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.Partial.PartialFunctionality;

  Interfaces.PhysicalRealOutput
    Y "Physical signal to change lock valve position(0-1, 0:closed, 1:opened)."   annotation (Placement(transformation(extent={{-22,80},{20,120}}),
        iconTransformation(extent={{-22,82},{20,120}})));
  Interfaces.RealInput V_SET_LCK
    "New lock valve position(0-1, 0:closed, 1:opened)."
    annotation (Placement(transformation(extent={{-100,-20},{-40,20}}),
        iconTransformation(extent={{-100,-20},{-40,20}})));
  Interfaces.RealOutput V_STA_VP
    "Currently used lock valve position(0-1, 0:closed, 1:opened)."
    annotation (Placement(transformation(extent={{100,-20},{160,20}}),
        iconTransformation(extent={{100,-20},{160,20}})));

equation
  // current value
  V_STA_VP = V_SET_LCK;
  // physical output depending from setpoint sunshade value

  Y = V_SET_LCK;

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics),
    Documentation(info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Block that implements the functionality of &QUOT;Control drive actuator&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.2.4, p. 21 - 22]</a>. For semantic correctness it is specialized for lock valve positions.</p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p>&QUOT; <i>Control drive actuators</i> (RA-FL section 3, column 3; informative function block Figure 14) operate valves, air dampers, fans or other control devices based on input information received from operator or application functions for, e. g., the control of room temperature or air quality. The function is also used, e. g., for controlling the opening angle of windows. Control is by percent (closed = 0 &percnt;; open = 100 &percnt;). The actually achievable positioning accuracy depends on the drive units used and on the overall mechanical system. Using the actuator function for window control requires additional input information that will allow immediate stopping by means of an operator function. It must furthermore be ensured in this case that the response time of the actuator following receipt of input information for positioning is less than 200 ms so as to exclude any operating errors. The function is allocated to the room shell (fixed rooms) or the segment shell (flexible room layout). &QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.2.4, p. 21 - 22]</a> </p>
<p>The positions are per cent values between 0 and 1 as it is mentioned in the standard <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 4, p. 4 - 6]</a>.</p>

</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end ControlDriveActuatorLockValvePositionFunctionality;
