within BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Examples;
model TesterTimeProgramEnergyMode
  "Model for testing the functionality of TimeProgramEnergyMode"
  extends Modelica.Icons.Example;

  Basic.TimeProgram.TimeProgramEnergyMode timeProgramEnergyMode
    annotation (Placement(transformation(extent={{-20,-12},{80,48}})));
  Sources.Time.PrescribedD_ACT prescribedD_ACT
    annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  Modelica.Blocks.Sources.Constant sourceD_ACT(k=200)
    annotation (Placement(transformation(extent={{-100,20},{-80,40}})));
equation
  connect(prescribedD_ACT.D_ACT, timeProgramEnergyMode.D_ACT) annotation (Line(
      points={{-38.1,30},{-10,30}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(sourceD_ACT.y, prescribedD_ACT.u) annotation (Line(
      points={{-79,30},{-58,30}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (experiment(StopTime=1.8144e+006),
      __Dymola_experimentSetupOutput,
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),preferedView="Info",
    Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
", info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<p>Block that implements functionality of &QUOT;Time program&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.4, p. 35 - 37]</a>. </p>
<h4><span style=\"color: #008000\">Functional Description</span></h4>
<p>&QUOT;The function <i>Time program</i> (RA-FL section 6, column 3; informative function block Figure 25) allows time-controlled generation of output information, thus influencing or controlling application functions or actuator functions.The time program contains the time and date functions as well as calendar entries including exception days (e. g. holidays). The respective switching operations are generated via a default week schedule and exception day schedules with switching point/value pairs. Such a time program can be implemented and maintained either directly via an interaction interface, or it is transferred by a management communication function to an operating device or external system.&QUOT;<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.4, p. 35 - 37]</a></p>
<h4><span style=\"color: #008000\">Concept</span></h4>
<p>In this test there is a input time and a conversion block. Inside the TimeProgramEnergyMode some energy modes defined for special times via schedules. The expected energy modes from the schedules had been compared to the generated output.</p>
</html>"));
end TesterTimeProgramEnergyMode;
