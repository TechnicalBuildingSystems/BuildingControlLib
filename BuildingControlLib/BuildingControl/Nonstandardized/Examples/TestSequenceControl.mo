within BuildingControlLib.BuildingControl.Nonstandardized.Examples;
model TestSequenceControl "Tester for SequenceControl block"
  extends Modelica.Icons.Example;

  SequenceControl sequenceControl
    annotation (Placement(transformation(extent={{-6,-12},{14,8}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=28 - 15,
    duration=100,
    offset=15,
    startTime=10) annotation (Placement(transformation(extent={{-78,-10},{-58,10}})));
equation

  connect(sequenceControl.u, ramp.y) annotation (Line(points={{-8,-2},{-32,-2},
          {-32,0},{-57,0}}, color={0,0,127}));
  annotation (experiment(StopTime=110), __Dymola_experimentSetupOutput);
end TestSequenceControl;
