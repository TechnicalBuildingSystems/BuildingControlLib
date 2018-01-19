within BuildingControlLib.BuildingControl.VDI3813.OperatorAndDisplayFunctions.Examples;
model TesterAdjustTemperatureSetpoint
  "Model for testing the functionality of  AdjustTemperatureSetpoint"
  extends Modelica.Icons.Example;
  AdjustTemperatureSetpoint adjustTemperatureSetpoint
    annotation (Placement(transformation(extent={{-40,-28},{50,24}})));
  Modelica.Blocks.Sources.Constant T_STA(k=23)
    annotation (Placement(transformation(extent={{-100,-14},{-80,6}})));
  Modelica.Blocks.Sources.Pulse userInput1(
    startTime=10,
    amplitude=2,
    width=50,
    period=5,
    nperiod=1)
    annotation (Placement(transformation(extent={{-94,68},{-74,88}})));
  Modelica.Blocks.Math.MultiSum multiSum(nu=2)
    annotation (Placement(transformation(extent={{-66,56},{-54,68}})));
  Modelica.Blocks.Sources.Pulse userInput2(
    width=50,
    period=5,
    nperiod=1,
    amplitude=5,
    startTime=15)
    annotation (Placement(transformation(extent={{-94,36},{-74,56}})));
equation

  connect(userInput1.y, multiSum.u[1]) annotation (Line(points={{-73,78},{-73,
          60},{-66,60},{-66,64.1}}, color={0,0,127}));
  connect(userInput2.y, multiSum.u[2]) annotation (Line(points={{-73,46},{-70,
          46},{-70,59.9},{-66,59.9}}, color={0,0,127}));
  connect(multiSum.y, adjustTemperatureSetpoint.CMD) annotation (Line(points={{
          -52.98,62},{4,62},{4,24.26},{5,24.26}}, color={0,0,127}));
  connect(T_STA.y, adjustTemperatureSetpoint.T_STA) annotation (Line(points={{
          -79,-4},{-26.5,-4},{-26.5,-2}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),               preferredView="info", Documentation(info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<p>Simulation to check the behaviour of the function model of &QUOT;Adjust temperature setpoint&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.4.5, p. 28 - 29]</a>. Function block was adapted in comparison to the standard to a naming convention introduced by changing T_SYNC to T_STA.</p>
<h4><span style=\"color: #008000\">Functional Description</span></h4>
<p>&QUOT;The operator function<i> Adjust temperature setpoint</i> (RA-FL section 5, column 4; informative function block Figure 19) converts a manual actuation to output information which is then available as input information to the application functions. The adjustment range is to be limited by means of parameters. The setpoint can be given in terms of either absolute temperatures or a relative offset from the default setpoint of the control system.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.4.5, p. 28 - 29]</a></p>
<p>In the textual and informative description of the function the input is named T_SYNC.<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.4.5, p. 28 - 29]</a> This value is never generated as an output by any other function. Furthermore the other operator and display functions have status inputs that have the ending _STA. Following this convention the input acronym has been changed from T_SYNC to T_STA.</p>
<h4><span style=\"color: #008000\">Concept</span></h4>
<p><br>This tester shows the usage and behaviour of the adjust temperature setpoint control function. Two user interactions are modelled by a pulse each. The first asks to increase the setpoint by 2 K which is done by the function. The second one asks for an increase above the thershold. The function limits to the allow setpoint.</p>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"),
    experiment(
      StopTime=30,
      Interval=1,
      __Dymola_Algorithm="Dassl"),
    __Dymola_experimentSetupOutput);
end TesterAdjustTemperatureSetpoint;
