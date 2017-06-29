within BuildingControlLib.Utilities.AirHandlingUnit.Controls.Examples;
model TesterModeSelector
  "Tester to debug VDI3814 variant of VAVReheat State Machine"
  extends Modelica.Icons.Example;
  Buildings.Examples.VAVReheat.Controls.ControlBus controlBus annotation (
      Placement(transformation(extent={{-30,30},{10,70}}), iconTransformation(
          extent={{-110,-24},{-90,-4}})));
  Modelica.Blocks.Sources.Constant TRooSetHea(k=293.15)
    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
  Modelica.Blocks.Sources.Constant TRooMin(k=292.65)
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  Modelica.Blocks.Sources.Constant TRooAve(k=292.863)
    annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
  Modelica.Blocks.Sources.Constant dTNexOcc(k=1476)
    annotation (Placement(transformation(extent={{-60,80},{-40,100}})));
  Modelica.Blocks.Sources.Constant TOut(k=272.044)
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Modelica.Blocks.Sources.BooleanStep     occupied(startTime=100)
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
  Modelica.Blocks.Sources.Constant TRooSetCool(k=303.15)
    annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));
  ModeSelector_VDI3814 modeSelector_VDI3814
    annotation (Placement(transformation(extent={{2,-30},{76,56}})));
  Buildings.Examples.VAVReheat.Controls.ControlBus controlBus1 annotation (
      Placement(transformation(extent={{-18,-20},{22,20}}), iconTransformation(
          extent={{-110,-24},{-90,-4}})));
equation

  connect(dTNexOcc.y, controlBus.dTNexOcc) annotation (Line(
      points={{-39,90},{-36,90},{-36,50},{-10,50}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(TRooSetHea.y, controlBus.TRooSetHea) annotation (Line(
      points={{-39,-30},{-36,-30},{-36,50},{-10,50}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(TRooMin.y, controlBus.TRooMin) annotation (Line(
      points={{-59,30},{-36,30},{-36,50},{-10,50}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(TRooAve.y, controlBus.TRooAve) annotation (Line(
      points={{-39,10},{-36,10},{-36,50},{-10,50}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(occupied.y, controlBus.occupied) annotation (Line(
      points={{-39,50},{-10,50}},
      color={255,0,255},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(TOut.y, controlBus.TOut) annotation (Line(
      points={{-59,70},{-36,70},{-36,50},{-10,50}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(TRooSetCool.y, controlBus.TRooSetCoo) annotation (Line(
      points={{-59,-10},{-36,-10},{-36,50},{-10,50}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));

  connect(controlBus1, modeSelector_VDI3814.cb) annotation (Line(
      points={{2,0},{24,0},{24,15},{45,15}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
        connect(dTNexOcc.y, controlBus1.dTNexOcc) annotation (Line(
      points={{-39,90},{-36,90},{-36,0},{2,0}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(TRooSetHea.y, controlBus1.TRooSetHea) annotation (Line(
      points={{-39,-30},{-36,-30},{-36,50},{-30,50},{-30,0},{2,0}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(TRooMin.y, controlBus1.TRooMin) annotation (Line(
      points={{-59,30},{-36,30},{-36,0},{2,0}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(TRooAve.y, controlBus1.TRooAve) annotation (Line(
      points={{-39,10},{-36,10},{-36,0},{2,0}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(occupied.y, controlBus1.occupied) annotation (Line(
      points={{-39,50},{-18,50},{-18,0},{2,0}},
      color={255,0,255},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(TOut.y, controlBus1.TOut) annotation (Line(
      points={{-59,70},{-36,70},{-36,0},{2,0}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));

  connect(TRooSetCool.y, controlBus1.TRooSetCoo) annotation (Line(
      points={{-59,-10},{-36,-10},{-36,0},{2,0}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));

  annotation (experiment(StopTime=500),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    __Dymola_experimentSetupOutput);
end TesterModeSelector;
