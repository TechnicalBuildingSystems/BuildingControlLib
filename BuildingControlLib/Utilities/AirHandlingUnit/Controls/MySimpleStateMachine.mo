within BuildingControlLib.Utilities.AirHandlingUnit.Controls;
model MySimpleStateMachine "A Finite State Machine for time schedule example"

  Modelica.StateGraph.InitialStep initialStep
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  Modelica.StateGraph.Transition start "Starts the system"
    annotation (Placement(transformation(extent={{-50,20},{-30,40}})));
  Buildings.Examples.VAVReheat.Controls.State SG_StateOff(
    nIn=2,
    nOut=1,
    mode=Buildings.Examples.VAVReheat.Controls.OperationModes.SG_StateOff)
    "Starts in off mode"
    annotation (Placement(transformation(extent={{-20,20},{0,40}})));
  Buildings.Examples.VAVReheat.Controls.State SG_StateOn(
    nIn=1,
    nOut=1,
    mode=Buildings.Examples.VAVReheat.Controls.OperationModes.SG_StateOn)
    "State at night when schedule is of"
    annotation (Placement(transformation(extent={{80,20},{100,40}})));

  Modelica.StateGraph.Transition t2(
    enableTimer=false,
    waitTime=1,
    condition=uSchedule >= 1)
    annotation (Placement(transformation(extent={{26,16},{52,42}})));
  parameter Modelica.SIunits.TemperatureDifference delTRooOnOff(min=0.1)=1
    "Deadband in room temperature between occupied on and occupied off";
  parameter Modelica.SIunits.Temperature TRooSetHeaOcc=293.15
    "Set point for room air temperature during heating mode";
  parameter Modelica.SIunits.Temperature TRooSetCooOcc=299.15
    "Set point for room air temperature during cooling mode";
  parameter Modelica.SIunits.Temperature TSetHeaCoiOut=303.15
    "Set point for air outlet temperature at central heating coil";
  Modelica.StateGraph.Transition t1(
    enableTimer=false,
    waitTime=1,
    condition=uSchedule <= 0)
    annotation (Placement(transformation(extent={{54,70},{28,96}})));
  inner Modelica.StateGraph.StateGraphRoot stateGraphRoot
    annotation (Placement(transformation(extent={{160,160},{180,180}})));
  Buildings.Examples.VAVReheat.Controls.ControlBus cb annotation (Placement(
        transformation(extent={{-86,84},{-66,104}}), iconTransformation(extent=
            {{-176,124},{-124,176}})));
  Modelica.Blocks.MathInteger.Sum sum(nu=2)
    annotation (Placement(transformation(extent={{-104,88},{-92,100}})));
  Modelica.Blocks.Interfaces.RealInput uSchedule
    annotation (Placement(transformation(extent={{-255,-37},{-186,32}})));
  Modelica.Blocks.Interfaces.RealOutput yFan
    "Nominalized fan control signal, y == 1 fan on, y == 0 Fan off"
    annotation (Placement(transformation(extent={{220,-40},{300,40}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal
    annotation (Placement(transformation(extent={{110,-72},{130,-52}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal1(realTrue=0.0, realFalse=0.0)
    annotation (Placement(transformation(extent={{110,-104},{130,-84}})));
  Modelica.Blocks.Math.MultiSum multiSum(nu=2)
    annotation (Placement(transformation(extent={{160,-76},{172,-64}})));
equation
  connect(start.outPort, SG_StateOff.inPort[1]) annotation (Line(
      points={{-38.5,30},{-29.75,30},{-29.75,30.5},{-21,30.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(initialStep.outPort[1], start.inPort) annotation (Line(
      points={{-59.5,30},{-44,30}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(SG_StateOff.outPort[1], t2.inPort) annotation (Line(
      points={{0.5,30},{8.25,30},{8.25,29},{33.8,29}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(t2.outPort, SG_StateOn.inPort[1]) annotation (Line(
      points={{40.95,29},{60,29},{60,30},{79,30}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(SG_StateOn.outPort[1], t1.inPort) annotation (Line(
      points={{100.5,30},{112,30},{112,83},{46.2,83}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(t1.outPort, SG_StateOff.inPort[2]) annotation (Line(
      points={{39.05,83},{-30,83},{-30,29.5},{-21,29.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(SG_StateOff.y, sum.u[1]) annotation (Line(
      points={{1,24},{2,24},{2,2},{4,2},{4,-38},{-110,-38},{-110,96.1},{-104,96.1}},
      color={255,127,0},
      smooth=Smooth.None));

  connect(SG_StateOn.y, sum.u[2]) annotation (Line(
      points={{101,24},{194,24},{194,-38},{-110,-38},{-110,91.9},{-104,91.9}},
      color={255,127,0},
      smooth=Smooth.None));
  connect(sum.y, cb.controlMode) annotation (Line(
      points={{-91.1,94},{-76,94}},
      color={255,127,0},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(booleanToReal1.u, SG_StateOff.active) annotation (Line(
      points={{108,-94},{-10,-94},{-10,19}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(SG_StateOn.active, booleanToReal.u) annotation (Line(
      points={{90,19},{90,-62},{108,-62}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(booleanToReal1.y, multiSum.u[1]) annotation (Line(
      points={{131,-94},{146,-94},{146,-67.9},{160,-67.9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanToReal.y, multiSum.u[2]) annotation (Line(
      points={{131,-62},{144,-62},{144,-72.1},{160,-72.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(multiSum.y, yFan) annotation (Line(
      points={{173.02,-70},{208,-70},{208,0},{260,0}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-220,-220},
            {220,220}}), graphics),
                                Icon(coordinateSystem(
          preserveAspectRatio=true, extent={{-220,-220},{220,220}}), graphics={
          Rectangle(
          extent={{-200,200},{200,-200}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={215,215,215}), Text(
          extent={{-176,80},{192,-84}},
          lineColor={0,0,255},
          textString="%name")}));
end MySimpleStateMachine;
