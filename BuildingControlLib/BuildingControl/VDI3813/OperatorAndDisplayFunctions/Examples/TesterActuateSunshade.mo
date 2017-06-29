within BuildingControlLib.BuildingControl.VDI3813.OperatorAndDisplayFunctions.Examples;
model TesterActuateSunshade
  "Model for testing the functionality of  ActuateSunshade"
 extends Modelica.Icons.Example;

  ActuateSunshade actuateSunshade
    annotation (Placement(transformation(extent={{-20,-20},{40,20}})));
  Sources.Sunshade.PrescribedS_STA prescribedS_STA
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Sources.Sunshade.PrescribedCMD_S prescribedCMD_S
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
  Modelica.Blocks.Sources.BooleanStep sourceCMD(startTime=10)
    annotation (Placement(transformation(extent={{-92,40},{-72,60}})));
  Modelica.Blocks.Sources.RealExpression sourceCurrentPosition
    annotation (Placement(transformation(extent={{-98,0},{-78,20}})));
  Modelica.Blocks.Sources.RealExpression sourceCurrentAngle
    annotation (Placement(transformation(extent={{-98,-20},{-78,0}})));
equation
  connect(prescribedCMD_S.CMD, actuateSunshade.CMD) annotation (Line(points={{-44.1,
          46},{10,46},{10,20},{10,20}},      color={0,0,0}));
  connect(sourceCMD.y, prescribedCMD_S.u)
    annotation (Line(points={{-71,50},{-64,50},{-58,50}}, color={255,0,255}));
  connect(prescribedS_STA.S_STA, actuateSunshade.S_STA) annotation (Line(
      points={{-38.1,0},{-11,0}},
      color={0,0,0},
      thickness=1));
  connect(sourceCurrentPosition.y, prescribedS_STA.u[1]) annotation (Line(
        points={{-77,10},{-68,10},{-68,-1},{-58,-1}}, color={0,0,127}));
  connect(sourceCurrentAngle.y, prescribedS_STA.u[2]) annotation (Line(points={
          {-77,-10},{-68,-10},{-68,1},{-58,1}}, color={0,0,127}));
 annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
           -100},{100,100}})),                preferredView="info",Documentation(info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<p>Simulation to check the behaviour of the function model of &QUOT;Actuate sunshade&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.4.3, p. 26 - 27]</a>. </p>
<h4><span style=\"color: #008000\">Functional Description</span></h4>
<p>&QUOT;The operator function<i> Actuate sunshade</i> (RA-FL section 5, column 2; informative function block Figure 17) converts a manual actuation to output information which is then available as input information to the application functions. The following mode of pushbutton actuation has proven useful for positioning: Brief actuation of the button (leading and trailing edges following in immediate succession) generates output information on the relative change of slat angle depending on the parameterisation of the sensor. In contrast, depressing the button for a longer time generates output information regarding the rising or descending of the sunshade. Operator control actions using different operating devices may differ from the mode of functioning described for pushbuttons. However, they must in principle be capable of generating the same output information.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.4.3, p. 26 - 27]</a></p>
<p>In the standard it is mentioned for the sunshade signal that it should contain two values when the sunshade contains slats, whereas the sunshade position should be a per cent value and the slat position should be a angle <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 4, p. 4 - 6]</a>. Because these two values could not be bundled in an array, in this implementation every sunshade connector has two variables with different data types inside. </p>
<p><br>The output of actuate sunshade is named S_SET in the informative description <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.4.3, p. 26 - 27]</a>. But in the textual description of priority control an input S_MAN is mentioned. It says explicitly that the signal comes from actuate sunshade or automatic thermal control <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.12, p. 49 - 51]</a>. Because of this S_MAN is used as acronym for the output of actuate sunshade.</p>
<h4><span style=\"color: #008000\">Concept</span></h4>
<p>Testing is done by simply using a Boolean step to imitate the interaction of a user with a device implementing this functionality. if a command (CMD == true) is send to the function block the output position changes to 1 and the angle to 45 degree.</p>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"),
    experiment(
      StopTime=20,
      Interval=1,
      __Dymola_Algorithm="Dassl"),
    __Dymola_experimentSetupOutput);
end TesterActuateSunshade;
