within BuildingControlLib.BuildingControl.VDI3813.Examples;
model TesterLevel1 "Only sunshade actuator"
  extends Modelica.Icons.Example;

  ActuatorFunctions.SunshadeActuator sunshadeActuator
    annotation (Placement(transformation(extent={{4,-28},{44,12}})));
  Sensors.SensorM                         sensorM
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={28,30})));
  Sources.Sunshade.PrescribedS_SET prescribedS_SET
    annotation (Placement(transformation(extent={{-42,-18},{-22,2}})));
  Modelica.Blocks.Sources.Step step(startTime=10, height=1)
    annotation (Placement(transformation(extent={{-76,-8},{-56,12}})));
  Modelica.Blocks.Sources.Constant sourceS_SET_SlatAngle(k=180)
    annotation (Placement(transformation(extent={{-76,-38},{-56,-18}})));
  Modelica.Blocks.Interaction.Show.BooleanValue booleanValue annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={28,58})));
equation
  connect(sensorM.M, sunshadeActuator.M) annotation (Line(
      points={{28,20},{26,20},{26,12.2},{23.8,12.2}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(prescribedS_SET.S_SET, sunshadeActuator.S_SET) annotation (Line(
      points={{-20.1,-8},{10,-8}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(step.y, prescribedS_SET.u[1]) annotation (Line(
      points={{-55,2},{-52,2},{-52,-9},{-40,-9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourceS_SET_SlatAngle.y, prescribedS_SET.u[2]) annotation (Line(
      points={{-55,-28},{-48,-28},{-48,-7},{-40,-7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanValue.activePort, sensorM.y) annotation (Line(
      points={{28,46.5},{28,42}},
      color={255,0,255},
      smooth=Smooth.None));
  annotation (preferredView="info",Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
          preserveAspectRatio=false), graphics), Icon(coordinateSystem(extent={{-100,
            -100},{100,100}})),
    experiment(StopTime=20, Interval=1),
    __Dymola_experimentSetupOutput,
    Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end TesterLevel1;
