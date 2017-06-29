within BuildingControlLib.Utilities.AirHandlingUnit.Controls.Examples;
model TesterMySimpleStateMachine "tester for simple state machine model"
    extends Modelica.Icons.Example;
  MySimpleStateMachine mySimpleStateMachine
    annotation (Placement(transformation(extent={{-14,-14},{30,32}})));
  Modelica.Blocks.Sources.Step step(
    height=-1,
    offset=1,
    startTime=86400) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={312,12})));
  Modelica.Blocks.Sources.Step step1(
    height=-1,
    offset=1,
    startTime=86400) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={312,12})));
  Modelica.Blocks.Sources.Step step2(
    height=-1,
    offset=1,
    startTime=86400) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={312,12})));
  Modelica.Blocks.Sources.Pulse pulse(
    period=300,
    nperiod=5,
    offset=0,
    startTime=100)
    annotation (Placement(transformation(extent={{-94,0},{-74,20}})));
equation

  connect(pulse.y, mySimpleStateMachine.uSchedule) annotation (Line(
      points={{-73,10},{-44,10},{-44,8.73864},{-14.05,8.73864}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
            -100,-100},{100,100}}), graphics));
end TesterMySimpleStateMachine;
