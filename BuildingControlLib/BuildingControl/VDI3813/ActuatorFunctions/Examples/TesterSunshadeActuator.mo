within BuildingControlLib.BuildingControl.VDI3813.ActuatorFunctions.Examples;
model TesterSunshadeActuator
  "Model for testing the functionality of  SunshadeActuator"
  extends Modelica.Icons.Example;

  SunshadeActuator sunshadeActuator
    annotation (Placement(transformation(extent={{-20,-80},{80,20}})));
  Modelica.Blocks.Sources.Step sunshadePosition(startTime=200)
    annotation (Placement(transformation(extent={{-200,0},{-160,40}})));
  Modelica.Blocks.Sources.Constant slatAngle(k=180)
    annotation (Placement(transformation(extent={{-254,-46},{-214,-6}})));
  Modelica.Blocks.Interaction.Show.BooleanValue sunshadeMotorSignal
    annotation (Placement(transformation(extent={{60,140},{120,200}})));
equation
  connect(sunshadeActuator.M, sunshadeMotorSignal.activePort) annotation (Line(
        points={{29.5,20.5},{29.5,170},{54,170},{56,170},{55.5,170}}, color={0,
          0,0}));
  connect(sunshadePosition.y, sunshadeActuator.S_SET[1]) annotation (Line(
        points={{-158,20},{-88,20},{-88,-30},{-12.5,-30}}, color={0,0,127}));
  connect(slatAngle.y, sunshadeActuator.S_SET[2]) annotation (Line(points={{
          -212,-26},{-88,-26},{-88,-30},{2.5,-30}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-260,
            -100},{100,200}})),
    experiment(StopTime=86400, Interval=60),
    __Dymola_experimentSetupOutput,preferredView="info",
    Documentation(info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<p>Simulation to check the behaviour of the function model of &QUOT;Sunshade actuator&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.2.3, p. 20 - 21]</a>. </p>
<h4><span style=\"color: #008000\">Functional Description</span></h4>
<p>&QUOT;Sunshade actuators position shading devices based on input information received from, e. g., weather protection, application (e. g. anti-glare) and operator functions. Each protective element is represented as a <i>Sunshade actuator</i> function (RA-FL section 3, column 2; informative function block Figure 13). The sunshade must be controllable by percent for the position (open position = 0 &percnt;; closed position = 100 &percnt;) and additionally, in the case of adjustable slats, by degrees of slat tilt (e. g. slat angles between &ndash;80&deg; and 40&deg;), i. e. the actuator function must be capable of moving the sunshade to any mechanically reachable position. The maximum and minimum slat angles and the total runtime of the sunshade must be adjustable. The current shade position and slat tilt are available as output information for display functions. It must be ensured that the response time of the actuator following receipt of input information for positioning is less than 200 ms so as to avoid any delay perceivable to the operator. For a definite position to be assumed in case of voltage recovery, parameterisation of this position value is required. The function is allocated to the room shell (fixed rooms) or the segment shell (flexible room layout).&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.2.3, p. 20 - 21]</a></p>
<p>In the standard it is mentioned for the sunshade signal that it should contain two values when the sunshade contains slats, whereas the sunshade position should be a per cent value and the slat position should be a angle <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 4, p. 4 - 6]</a>. Because these two values could not be bundled in an array, in this implementation every sunshade connector has two variables with different data types inside. </p>
<h4><span style=\"color: #008000\">Concept</span></h4>
<p>The simulation contains a signal source to imitate a new value command for the sunshade actuator. The signal is passed to a converter for changing the signal type from Modelica standard type to VDI 3813 semantic type (S_SET). From there the signal goes to the actuator function, which generates a motor control signal (M) and a signal for further processing or display of the information (S_STA). The S_STA output should be similar to the S_SET input, beside of the different data types. If S_SET is greater than zero, M should become TRUE.</p>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end TesterSunshadeActuator;
