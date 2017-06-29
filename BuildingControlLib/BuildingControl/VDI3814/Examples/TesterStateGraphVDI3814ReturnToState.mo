within BuildingControlLib.BuildingControl.VDI3814.Examples;
model TesterStateGraphVDI3814ReturnToState
  "Test of implemented  VDI 3814-6 stategraph objects"
extends Modelica.Icons.Example;
StateGraph.InitialState off(
    nNumbering=0,
    nOut=1,
    nIn=2) annotation (Placement(transformation(extent={{-20,108},{20,148}})));
StateGraph.State cooling(
    nIn=1,
    nNumbering=1,
    nOut=2)
    annotation (Placement(transformation(extent={{-18,50},{22,88}})));
StateGraph.State heating(
    nIn=1,
    nNumbering=2,
    nOut=1) annotation (Placement(transformation(extent={{-70,-30},{-30,10}})));
  StateGraph.AND1 and1(nu=2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={64,-30})));
  StateGraph.Or or1(nu=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={42,102})));
  Modelica.Blocks.Sources.BooleanStep booleanStep(startTime=10) annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={94,-20})));
  Modelica.Blocks.Sources.BooleanStep booleanStep1(startTime=10) annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={94,8})));
  Modelica.Blocks.Sources.BooleanStep switchON(startTime=20) annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={72,102})));
  Modelica.Blocks.Sources.BooleanStep switchON1(startTime=30) annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-14,26})));
StateGraph.State freezeProtect(
    nIn=1,
    nNumbering=3,
    nOut=1) annotation (Placement(transformation(extent={{6,-30},{46,10}})));
  Modelica.Blocks.Sources.BooleanStep switchOFF(startTime=30) annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={56,34})));
  inner Modelica.StateGraph.StateGraphRoot stateGraphRoot
    annotation (Placement(transformation(extent={{-62,62},{-42,82}})));
  StateGraph.ReturnToState passThrough(nNumberingOfTargetState=0, nout=1)
    annotation (Placement(transformation(extent={{-44,-60},{-24,-40}})));
  Modelica.Blocks.Sources.BooleanStep switchON2(startTime=40) annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-10,-30})));
  StateGraph.ReturnToState passThrough1(nNumberingOfTargetState=0, nout=1)
    annotation (Placement(transformation(extent={{28,-60},{48,-40}})));
equation

  // Graphical annotation removed below

  connect(passThrough.outport[1], off.inPort[1]);
  connect(passThrough1.outport[1], off.inPort[2]);
  connect(switchON2.y, off.u[1]);
  connect(and1.y, off.u[2]);

  // automatic connect statements below

  connect(booleanStep.y, and1.u[1]) annotation (Line(
      points={{83,-20},{80,-20},{80,-34},{80,-34},{80,-33.5},{74,-33.5}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(cooling.outPort[1], heating.inPort[1]) annotation (Line(
      points={{1.1,50},{1.1,44},{-50,44},{-50,13.6}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(freezeProtect.u[1], switchOFF.y) annotation (Line(
      points={{38,11.2},{38,34},{45,34}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(cooling.outPort[2], freezeProtect.inPort[1]) annotation (Line(
      points={{3.3,50},{2,50},{2,44},{26,44},{26,13.6}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(switchON1.y, heating.u[1]) annotation (Line(
      points={{-25,26},{-38,26},{-38,11.2}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(passThrough.transition_in, heating.outPort[1]) annotation (Line(
      points={{-33.8,-42},{-34,-42},{-34,-36},{-50,-36},{-50,-30},{-49.8,-30}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(switchON2.y, passThrough.u) annotation (Line(
      points={{-21,-30},{-26,-30},{-26,-36},{-30,-36},{-30,-44},{-29.2,-44}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(passThrough1.transition_in, freezeProtect.outPort[1]) annotation (
      Line(
      points={{38.2,-42},{38,-42},{38,-38},{26.2,-38},{26.2,-30}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(passThrough1.u, and1.y) annotation (Line(
      points={{42.8,-44},{46,-44},{46,-38},{50,-38},{50,-30},{52.5,-30}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(off.outPort[1], cooling.inPort[1]) annotation (Line(
      points={{0.2,107.2},{0.2,91.6},{2,91.6},{2,91.42}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(and1.u[2], booleanStep1.y) annotation (Line(
      points={{74,-26.5},{80,-26.5},{80,-26},{80,-26},{80,8},{83,8}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(or1.u[1], switchON.y) annotation (Line(
      points={{52,102},{61,102}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(cooling.u[1], or1.y) annotation (Line(
      points={{14,89.14},{14,90},{14,90},{14,92},{14,102},{30.5,102}},
      color={255,0,255},
      smooth=Smooth.None));
annotation (preferredView="diagram",Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-160,
            -100},{140,160}}),    graphics),
    experiment(StopTime=50),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(extent={{-160,-100},{140,160}})));
end TesterStateGraphVDI3814ReturnToState;
