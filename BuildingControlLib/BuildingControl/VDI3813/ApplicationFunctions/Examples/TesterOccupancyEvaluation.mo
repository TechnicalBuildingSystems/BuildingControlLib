within BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Examples;
model TesterOccupancyEvaluation
  "Model for testing the functionality of OccupancyEvaluation"
  extends Modelica.Icons.Example;
  Basic.OccupancyEvaluation occupancyEvaluation(PAR_BEH=false)
    annotation (Placement(transformation(extent={{20,0},{100,40}})));
  SensorFunctions.PresenceDetection
                    presenceDetection
    annotation (Placement(transformation(extent={{-70,40},{-20,60}})));
  Sources.Physical.PrescribedP prescribedPresence
    annotation (Placement(transformation(extent={{-60,80},{-40,100}})));
  Sources.Presence.PrescribedP_MAN
    prescribedValuePresenceOperator
    annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
  Modelica.Blocks.Sources.BooleanStep sourcePresenceOperator(startTime=10,
      startValue=false)
    annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
  Modelica.Blocks.Sources.BooleanStep sourcePresenceSensor(startValue=false,
      startTime=30)
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
equation
  connect(prescribedPresence.P,presenceDetection. P) annotation (Line(
      points={{-39.9,90},{-39.9,92},{-30,92},{-30,74},{-45,74},{-45,60}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(presenceDetection.P_AUTO, occupancyEvaluation.P_AUTO) annotation (
     Line(
      points={{-12.5,50},{0,50},{0,28.2},{28.4,28.2}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedValuePresenceOperator.P_MAN, occupancyEvaluation.P_MAN)
    annotation (Line(
      points={{-18.1,10},{0,10},{0,16},{14,16},{14,16.2},{28.4,16.2}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(sourcePresenceOperator.y, prescribedValuePresenceOperator.u)
    annotation (Line(
      points={{-59,10},{-38,10}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(sourcePresenceSensor.y, prescribedPresence.u) annotation (Line(
      points={{-79,90},{-68,90},{-68,92},{-58,92}},
      color={255,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),                preferedView="Info", Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
",        info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Block that implements function &QUOT;Occupancy evaluation&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.2, p. 32 - 33]</a>. </p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p>&QUOT;The function<i> Occupancy evaluation</i> (RA-FL section 6, column 1; informative function block Figure 23) evaluates the output information received from <i>Presence detection</i> and from operator functions (<i>Signal presence</i>) in order to determine the occupancy state in a room for all further application functions. Various options of room check-in and check-out can thus be implemented.&QUOT;<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.2, p. 32 - 33]</a></p>
<h4><span style=\"color:#008000\">Concept</span></h4>
<p>With this test case ist possible to check both evaluation methods. The method is chosen via the parameter of occupancy evaluation. Beside the application function there are two boolean signal sources. One presents an operator control and the other a sensor signal. The sensor signal is pre processed by the function presence detection. The activation times are different. The operator signal comes first.</p>
<p>In case 1 only P_AUTO should be evaluated. Because of that the first signal change does not change anything. The second change that comes from the sensor triggers the change of the evaluated output signal.</p>
<p>In case 2 both signals should be evalueated. But P_MAN is evaluated only if P_AUTO is TRUE. Because of this the output should be activated after both signals are active.</p>
</html>"));
end TesterOccupancyEvaluation;
