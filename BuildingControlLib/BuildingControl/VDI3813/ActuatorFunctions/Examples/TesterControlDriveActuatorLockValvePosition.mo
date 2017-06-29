within BuildingControlLib.BuildingControl.VDI3813.ActuatorFunctions.Examples;
model TesterControlDriveActuatorLockValvePosition
  "Model for testing the functionality of ControlDriveActuatorLockValvePosition"
  extends Modelica.Icons.Example;
  ControlDriveActuator.ControlDriveActuatorLockValvePosition controlDriveActuatorLockValvePosition
    annotation (Placement(transformation(extent={{-24,-30},{84,26}})));
  Sources.ActuatorSignal.PrescribedV_SET_LCK prescribedV_SET_LCK annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,50})));
  Sensors.SensorY sensorY
    annotation (Placement(transformation(extent={{40,40},{60,60}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue
    annotation (Placement(transformation(extent={{76,40},{96,60}})));
  Modelica.Blocks.Sources.Step sourceV_SET_LCK(height=1, startTime=200)
    annotation (Placement(transformation(extent={{-100,60},{-80,80}})));
equation

  connect(prescribedV_SET_LCK.V_SET_LCK, controlDriveActuatorLockValvePosition.V_SET_LCK)
    annotation (Line(
      points={{-50,38.1},{-50,-2},{-7.8,-2}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(controlDriveActuatorLockValvePosition.Y, sensorY.Y) annotation (Line(
        points={{29.46,26.28},{29.46,50.14},{40,50.14},{40,50}}, color={0,0,0}));
  connect(sensorY.y, realValue.numberPort)
    annotation (Line(points={{62,50},{74.5,50},{74.5,50}}, color={0,0,127}));
  connect(prescribedV_SET_LCK.u, sourceV_SET_LCK.y) annotation (Line(points={{
          -50,58},{-64,58},{-64,70},{-79,70}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),
    experiment(StopTime=1000, Interval=60),
    __Dymola_experimentSetupOutput,preferredView="info",
    Documentation(info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<p>Simulation to check the behaviour of the function model of &QUOT;Control drive actuator&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.2.4, p. 21 - 22]</a>. For semantic correctness it is specialized for lock valve positions.</p>
<h4><span style=\"color: #008000\">Functional Description</span></h4>
<p>&QUOT; <i>Control drive actuators</i> (RA-FL section 3, column 3; informative function block Figure 14) operate valves, air dampers, fans or other control devices based on input information received from operator or application functions for, e. g., the control of room temperature or air quality. The function is also used, e. g., for controlling the opening angle of windows. Control is by percent (closed = 0 &percnt;; open = 100 &percnt;). The actually achievable positioning accuracy depends on the drive units used and on the overall mechanical system. Using the actuator function for window control requires additional input information that will allow immediate stopping by means of an operator function. It must furthermore be ensured in this case that the response time of the actuator following receipt of input information for positioning is less than 200 ms so as to exclude any operating errors. The function is allocated to the room shell (fixed rooms) or the segment shell (flexible room layout). &QUOT;<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.2.4, p. 21 - 22]</a> </p>
<p>The positions are per cent values between 0 and 1 as it is mentioned in the standard <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 4, p. 4 - 6]</a>.</p>
<h4><span style=\"color: #008000\">Concept</span></h4>
<p>The simulation contains a signal source to immitate a new value command for the control drive actuator of fans. The signal is passed to a converter for changing the signal type from Modelica standard type to VDI 3813 semantic type (V_SET_LCK). From there the signal goes to the actuator function, which generates a motor control signal (Y) and a signal for further processing or display of the information (V_STA_LCK). The V_STA_LCK output should be similar to the V_SET_LCK input, beside of the different data types. If V_SET_LCK is greater than zero, Y should become TRUE.</p>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end TesterControlDriveActuatorLockValvePosition;
