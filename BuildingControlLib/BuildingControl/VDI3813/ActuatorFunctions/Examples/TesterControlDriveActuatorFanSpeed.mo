within BuildingControlLib.BuildingControl.VDI3813.ActuatorFunctions.Examples;
model TesterControlDriveActuatorFanSpeed
  "Model for testing the functionality of ControlDriveActuatorDamperPosition"
  extends Modelica.Icons.Example;
  ControlDriveActuator.ControlDriveActuatorFanSpeed controlDriveActuatorFanSpeed
    annotation (Placement(transformation(extent={{-26,-28},{82,28}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue
    annotation (Placement(transformation(extent={{76,40},{96,60}})));
  Modelica.Blocks.Sources.Step sourceV_SET_FS(height=1, startTime=200)
    annotation (Placement(transformation(extent={{-100,60},{-80,80}})));
equation

  connect(realValue.numberPort, controlDriveActuatorFanSpeed.Y) annotation (
      Line(points={{74.5,50},{30,50},{30,28.28},{27.46,28.28}}, color={0,0,127}));
  connect(sourceV_SET_FS.y, controlDriveActuatorFanSpeed.V_SET_FS) annotation (
      Line(points={{-79,70},{-50,70},{-50,0},{-9.8,0}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),
    experiment(StopTime=1000, Interval=60),
    __Dymola_experimentSetupOutput,preferredView="info",
    Documentation(info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<p>Simulation to check the behaviour of the function model of &QUOT;Control drive actuator&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.2.4, p. 21 - 22]</a>. For semantic correctness it is specialized for fan speeds.</p>
<h4><span style=\"color: #008000\">Functional Description</span></h4>
<p>&QUOT; <i>Control drive actuators</i> (RA-FL section 3, column 3; informative function block Figure 14) operate valves, air dampers, fans or other control devices based on input information received from operator or application functions for, e. g., the control of room temperature or air quality. The function is also used, e. g., for controlling the opening angle of windows. Control is by percent (closed = 0 &percnt;; open = 100 &percnt;). The actually achievable positioning accuracy depends on the drive units used and on the overall mechanical system. Using the actuator function for window control requires additional input information that will allow immediate stopping by means of an operator function. It must furthermore be ensured in this case that the response time of the actuator following receipt of input information for positioning is less than 200 ms so as to exclude any operating errors. The function is allocated to the room shell (fixed rooms) or the segment shell (flexible room layout). &QUOT;<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.2.4, p. 21 - 22]</a> </p>
<p>The positions are per cent values between 0 and 1 as it is mentioned in the standard <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 4, p. 4 - 6]</a>.</p>
<h4><span style=\"color: #008000\">Concept</span></h4>
<p>The simulation contains a signal source to imitate a new value command for the control drive actuator of fans. The signal is passed to a converter for changing the signal type from Modelica standard type to VDI 3813 semantic type (V_SET_FS). From there the signal goes to the actuator function, which generates a motor control signal (Y) and a signal for further processing or display of the information (V_STA_FS). The V_STA_FS output should be similar to the V_SET_FS input, beside of the different data types. If V_SET_FS is greater than zero, Y should become TRUE.</p>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end TesterControlDriveActuatorFanSpeed;
