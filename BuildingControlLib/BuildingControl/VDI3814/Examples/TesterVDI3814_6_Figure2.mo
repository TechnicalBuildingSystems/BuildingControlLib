within BuildingControlLib.BuildingControl.VDI3814.Examples;
model TesterVDI3814_6_Figure2
  "Test of implemented  VDI 3814-6 stategraph objects"
extends Modelica.Icons.Example;
  StateGraph.Action action2(assignValue=1, controlOutput="Trigger t1")
    annotation (Placement(transformation(extent={{12,54},{106,68}})));
  StateGraph.Action action3(assignValue=1, controlOutput="Preheater Pump")
    annotation (Placement(transformation(extent={{12,68},{106,82}})));
StateGraph.InitialState SystemOff(
    nNumbering=0,
    nOut=1,
    nIn=1) annotation (Placement(transformation(extent={{-80,120},{-40,148}})));
StateGraph.State NormalMode(
    nOut=2,
    nNumbering=2,
    nIn=2) annotation (Placement(transformation(extent={{-80,20},{-42,46}})));
  StateGraph.AND1 and1(nu=2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-50,-60})));
StateGraph.State freezeProtection(
    nIn=1,
    nOut=1,
    nNumbering=2)
    annotation (Placement(transformation(extent={{-102,-36},{-56,-12}})));
  inner Modelica.StateGraph.StateGraphRoot stateGraphRoot
    annotation (Placement(transformation(extent={{-160,140},{-140,160}})));
  StateGraph.ReturnToState passThrough(                           nout=1,
      nNumberingOfTargetState=0)
    annotation (Placement(transformation(extent={{-16,-36},{4,-16}})));
  StateGraph.ReturnToState passThrough1(                           nout=1,
      nNumberingOfTargetState=2)
    annotation (Placement(transformation(extent={{-90,-86},{-70,-66}})));
StateGraph.State StartupMode(
    nIn=1,
    nNumbering=1,
    nOut=1) annotation (Placement(transformation(extent={{-80,72},{-42,100}})));
  Modelica.Blocks.Interfaces.BooleanInput FrostProtector
    annotation (Placement(transformation(extent={{-180,40},{-140,80}})));
  Modelica.Blocks.Interfaces.BooleanInput AcknowledgeButton
    annotation (Placement(transformation(extent={{-180,0},{-140,40}})));
  Modelica.Blocks.Interfaces.BooleanInput System
    annotation (Placement(transformation(extent={{-180,-40},{-140,0}})));
  Modelica.Blocks.Sources.BooleanExpression be1(y=FrostProtector)
    annotation (Placement(transformation(extent={{4,-66},{-22,-50}})));
  Modelica.Blocks.Sources.BooleanExpression be2(y=AcknowledgeButton)
    annotation (Placement(transformation(extent={{14,-80},{-22,-62}})));
  Modelica.Blocks.Sources.BooleanExpression be3(y=not System)
    annotation (Placement(transformation(extent={{40,-24},{20,-8}})));
  Modelica.Blocks.Sources.BooleanExpression be4(y=System)
    annotation (Placement(transformation(extent={{2,104},{-18,120}})));
  Modelica.Blocks.Sources.BooleanExpression be5(y=FrostProtector)
    annotation (Placement(transformation(extent={{-24,-14},{-50,2}})));
  Modelica.Blocks.Math.BooleanToInteger modeUnOccOff(integerTrue=Integer(
        Buildings.Examples.VAVReheat.Controls.OperationModes.unoccupiedOff))
    annotation (Placement(transformation(extent={{-270,203},{-250,223}})));
  Modelica.Blocks.Math.BooleanToInteger modeUnOccOff1(
                                                     integerTrue=Integer(
        Buildings.Examples.VAVReheat.Controls.OperationModes.unoccupiedOff))
    annotation (Placement(transformation(extent={{-270,203},{-250,223}})));
  Modelica.Blocks.Math.BooleanToInteger modeUnOccOff2(
                                                     integerTrue=Integer(
        Buildings.Examples.VAVReheat.Controls.OperationModes.unoccupiedOff))
    annotation (Placement(transformation(extent={{-270,203},{-250,223}})));
  StateGraph.Action action(assignValue=1, controlOutput="Preheater valve")
    annotation (Placement(transformation(extent={{12,82},{106,96}})));
  StateGraph.Action action1(assignValue=1, controlOutput="Dampers")
    annotation (Placement(transformation(extent={{12,94},{106,108}})));
  StateGraph.Action action4(assignValue=1, controlOutput="Fans")
    annotation (Placement(transformation(extent={{20,2},{62,10}})));
  StateGraph.Action action5(assignValue=1, controlOutput="Preheater Pump")
    annotation (Placement(transformation(extent={{20,10},{62,18}})));
  StateGraph.Action action6(controlOutput="Preheater valve", assignValue=2)
    annotation (Placement(transformation(extent={{20,18},{62,26}})));
  StateGraph.Action action7(controlOutput="Dampers", assignValue=2)
    annotation (Placement(transformation(extent={{20,26},{62,34}})));
  StateGraph.Action action10(controlOutput="Preheater valve", assignValue=3)
    annotation (Placement(transformation(extent={{26,-46},{68,-38}})));
  StateGraph.Action action11(controlOutput="Dampers", assignValue=3)
    annotation (Placement(transformation(extent={{26,-38},{68,-30}})));
  Modelica.Blocks.Sources.BooleanExpression be6(y=true)
    annotation (Placement(transformation(extent={{-10,44},{-36,60}})));
equation

  // Graphical annotation removed below

  connect(passThrough.outport[1], SystemOff.inPort[1]);
  connect(be3.y, SystemOff.u[1]);
  connect(passThrough1.outport[1], NormalMode.inPort[2]);
  connect(and1.y, NormalMode.u[2]);

  // automatic connect statements below

  connect(NormalMode.outPort[2], freezeProtection.inPort[1]) annotation (Line(
      points={{-59.765,20},{-60,20},{-60,10},{-78,10},{-78,-6},{-79,-6},{-79,
          -9.84}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(passThrough1.transition_in, freezeProtection.outPort[1]) annotation (
      Line(
      points={{-79.8,-68},{-79.8,-36},{-78.77,-36}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(and1.y, passThrough1.u) annotation (Line(points={{-61.5,-60},{-74,-60},
          {-74,-70},{-75.2,-70}}, color={255,0,255}));
  connect(be1.y, and1.u[1]) annotation (Line(points={{-23.3,-58},{-40,-58},{-40,
          -63.5}}, color={255,0,255}));
  connect(be2.y, and1.u[2]) annotation (Line(points={{-23.8,-71},{-32,-71},{-32,
          -56.5},{-40,-56.5}}, color={255,0,255}));
  connect(be3.y, passThrough.u) annotation (Line(points={{19,-16},{-2,-16},{-2,-20},
          {-1.2,-20}}, color={255,0,255}));
  connect(SystemOff.outPort[1], StartupMode.inPort[1]) annotation (Line(points={
          {-59.8,119.44},{-59.8,110.72},{-61,110.72},{-61,102.52}}, color={0,0,0}));
  connect(StartupMode.outPort[1], NormalMode.inPort[1]) annotation (Line(points=
         {{-60.81,72},{-60.81,60},{-61,60},{-61,49.445}}, color={0,0,0}));

  connect(be4.y, StartupMode.u[1]) annotation (Line(points={{-19,112},{-50,112},
          {-50,100.84},{-49.6,100.84}}, color={255,0,255}));
  connect(be5.y, freezeProtection.u[1]) annotation (Line(points={{-51.3,-6},{
          -65.2,-6},{-65.2,-11.28}}, color={255,0,255}));
  connect(StartupMode.active, action1.u) annotation (Line(points={{-40.1,86},{
          -20,86},{-20,101},{2.6,101}}, color={255,0,255}));
  connect(StartupMode.active, action.u) annotation (Line(points={{-40.1,86},{
          -20,86},{-20,89},{2.6,89}}, color={255,0,255}));
  connect(StartupMode.active, action3.u) annotation (Line(points={{-40.1,86},{
          -20,86},{-20,75},{2.6,75}}, color={255,0,255}));
  connect(action2.u, StartupMode.active) annotation (Line(points={{2.6,61},{
          -19.7,61},{-19.7,86},{-40.1,86}}, color={255,0,255}));
  connect(action7.u, NormalMode.active) annotation (Line(points={{15.8,30},{16,
          30},{16,30},{8,30},{-16,30},{-16,33},{-40.1,33}}, color={255,0,255}));
  connect(NormalMode.active, action6.u) annotation (Line(points={{-40.1,33},{
          -12.05,33},{-12.05,22},{15.8,22}}, color={255,0,255}));
  connect(NormalMode.active, action5.u) annotation (Line(points={{-40.1,33},{
          -11.05,33},{-11.05,14},{15.8,14}}, color={255,0,255}));
  connect(NormalMode.active, action4.u) annotation (Line(points={{-40.1,33},{
          -12.05,33},{-12.05,6},{15.8,6}}, color={255,0,255}));
  connect(freezeProtection.active, action11.u) annotation (Line(points={{-53.7,
          -24},{-42,-24},{-42,-40},{12,-40},{12,-34},{21.8,-34}}, color={255,0,
          255}));
  connect(action10.u, freezeProtection.active) annotation (Line(points={{21.8,
          -42},{12,-42},{12,-40},{-42,-40},{-42,-24},{-53.7,-24}}, color={255,0,
          255}));
  connect(NormalMode.outPort[1], passThrough.transition_in) annotation (Line(
        points={{-61.855,20},{-60,20},{-60,10},{-20,10},{-20,0},{-6,0},{-6,-18},
          {-5.8,-18}}, color={0,0,0}));
  connect(be6.y, NormalMode.u[1]) annotation (Line(points={{-37.3,52},{-50,52},
          {-50,47.17},{-49.6,47.17}}, color={255,0,255}));
annotation (preferredView="diagram",Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-160,
            -100},{140,160}})),
    experiment(StopTime=50),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(extent={{-160,-100},{140,160}})));
end TesterVDI3814_6_Figure2;
