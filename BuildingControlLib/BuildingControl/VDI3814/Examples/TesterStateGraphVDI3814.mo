within BuildingControlLib.BuildingControl.VDI3814.Examples;
model TesterStateGraphVDI3814
  "Test of implemented  VDI 3814-6 stategraph objects"
extends Modelica.Icons.Example;
StateGraph.InitialState AnlageAUS(       nNumbering=0,
    nOut=1,
    nIn=2)
    annotation (Placement(transformation(extent={{-60,40},{-20,80}})));
StateGraph.State Kuehlen(
    nIn=1,
    nNumbering=1,
    nOut=2)
    annotation (Placement(transformation(extent={{-60,-20},{-20,18}})));
StateGraph.State Heizen(nIn=1, nNumbering=2,
    nOut=1)
  annotation (Placement(transformation(extent={{-80,-90},{-40,-50}})));
  StateGraph.AND1 aND1_1(nu=2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={10,90})));
  StateGraph.AND1 aND1_2(nu=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={10,-32})));
  StateGraph.Or Or(nu=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={10,30})));
  Modelica.Blocks.Sources.BooleanStep booleanStep(startTime=10) annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={50,90})));
  Modelica.Blocks.Sources.BooleanStep booleanStep1(startTime=10) annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={50,60})));
  Modelica.Blocks.Sources.BooleanStep SchalterAN(startTime=20) annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={50,8})));
  Modelica.Blocks.Sources.BooleanStep SchalterAN1(startTime=30) annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={50,-32})));
StateGraph.State Frostschutz(
    nIn=1,
    nNumbering=3,
    nOut=1) annotation (Placement(transformation(extent={{-6,-98},{34,-58}})));
  Modelica.Blocks.Sources.BooleanStep SchalterAN2(startTime=30) annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={74,-56})));
  Modelica.Blocks.Sources.BooleanStep SchalterAN3(startTime=30) annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={22,110})));
  inner Modelica.StateGraph.StateGraphRoot stateGraphRoot
    annotation (Placement(transformation(extent={{80,42},{100,62}})));
equation
  connect(Or.y, Kuehlen.u[1]) annotation (Line(
      points={{-1.5,30},{-28,30},{-28,19.14}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(booleanStep.y, aND1_1.u[1]) annotation (Line(
      points={{39,90},{34,90},{34,86.5},{20,86.5}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(booleanStep1.y, aND1_1.u[2]) annotation (Line(
      points={{39,60},{34,60},{34,93.5},{20,93.5}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(SchalterAN.y, Or.u[1]) annotation (Line(
      points={{39,8},{32,8},{32,30},{20,30}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(SchalterAN1.y, aND1_2.u[1]) annotation (Line(
      points={{39,-32},{20,-32}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(aND1_2.y, Heizen.u[1]) annotation (Line(
      points={{-1.5,-32},{-26,-32},{-26,-48.8},{-48,-48.8}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(Kuehlen.outPort[1], Heizen.inPort[1]) annotation (Line(
      points={{-40.9,-20},{-40.9,-31.38},{-60,-31.38},{-60,-46.4}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(AnlageAUS.outPort[1], Kuehlen.inPort[1]) annotation (Line(
      points={{-39.8,39.2},{-39.8,30.6},{-40,30.6},{-40,21.42}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Frostschutz.u[1], SchalterAN2.y) annotation (Line(
      points={{26,-56.8},{46,-56.8},{46,-56},{63,-56}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(Kuehlen.outPort[2], Frostschutz.inPort[1]) annotation (Line(
      points={{-38.7,-20},{-12.9,-20},{-12.9,-54.4},{14,-54.4}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(AnlageAUS.inPort[1], Heizen.outPort[1]) annotation (Line(
      points={{-40,85.3},{-96,85.3},{-96,-90},{-59.8,-90}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Frostschutz.outPort[1], AnlageAUS.inPort[2]) annotation (Line(
      points={{14.2,-98},{14.2,-100},{-96,-100},{-96,94},{-40,94},{-40,81.9}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(aND1_1.y, AnlageAUS.u[1]) annotation (Line(
      points={{-1.5,90},{-14,90},{-14,81.8},{-28,81.8}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(SchalterAN3.y, AnlageAUS.u[2]) annotation (Line(
      points={{11,110},{-7.5,110},{-7.5,80.6},{-28,80.6}},
      color={255,0,255},
      smooth=Smooth.None));
annotation (preferredView="diagram",Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),
    experiment(StopTime=20),
    __Dymola_experimentSetupOutput,
    Documentation(info="<html>
<p>Simple tester to check models and functionality.</p>
</html>"));
end TesterStateGraphVDI3814;
