within BuildingControlLib.Utilities.AirHandlingUnit.Controls;
model ModeSelector_VDI3814 "Finite State Machine for the operational modes"

  BuildingControl.VDI3814.StateGraph.State    unOccOff(       nOut=4, nIn=3,
    nNumbering=1) "Unoccupied off mode, no coil protection"
                                                      annotation (Placement(
        transformation(
        extent={{-42,-35},{42,35}},
        rotation=0,
        origin={-336,199})));
  BuildingControl.VDI3814.StateGraph.State    unOccNigSetBac(
    nIn=1,
    nOut=2,
    nNumbering=3) "Unoccupied night set back"
                                       annotation (Placement(transformation(
        extent={{-40,-44},{40,44}},
        rotation=0,
        origin={-194,44})));

  parameter Modelica.SIunits.TemperatureDifference delTRooOnOff(min=0.1)=1
    "Deadband in room temperature between occupied on and occupied off";
  parameter Modelica.SIunits.Temperature TRooSetHeaOcc=293.15
    "Set point for room air temperature during heating mode";
  parameter Modelica.SIunits.Temperature TRooSetCooOcc=299.15
    "Set point for room air temperature during cooling mode";
  parameter Modelica.SIunits.Temperature TSetHeaCoiOut=303.15
    "Set point for air outlet temperature at central heating coil";
  inner Modelica.StateGraph.StateGraphRoot stateGraphRoot
    annotation (Placement(transformation(extent={{-420,388},{-400,408}})));
  Buildings.Examples.VAVReheat.Controls.ControlBus cb annotation (Placement(
        transformation(extent={{-40,494},{-20,514}}),  iconTransformation(
          extent={{-176,124},{-124,176}})));
  Modelica.Blocks.Routing.RealPassThrough TRooSetHea
    "Current heating setpoint temperature"
    annotation (Placement(transformation(extent={{-114,418},{-94,438}})));
  BuildingControl.VDI3814.StateGraph.State    morWarUp(
    nIn=2,
    nOut=1,
    nNumbering=2) "Morning warm up"
                              annotation (Placement(transformation(
        extent={{-47,-41},{47,41}},
        rotation=0,
        origin={-353,37})));

  Modelica.Blocks.Logical.LessEqualThreshold occThrSho(threshold=1800)
    "Signal to allow transition into morning warmup"
    annotation (Placement(transformation(extent={{-112,458},{-92,478}})));
  BuildingControl.VDI3814.StateGraph.State    occ(
      nIn=3,
    nOut=1,
    nNumbering=4) "Occupied mode"
                             annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-302,-58})));
  Modelica.Blocks.Routing.RealPassThrough TRooMin
    annotation (Placement(transformation(extent={{-114,388},{-94,408}})));
  Modelica.Blocks.Math.Feedback TRooMinErrHea "Room control error for heating"
    annotation (Placement(transformation(extent={{-74,418},{-54,438}})));
  Modelica.Blocks.Routing.BooleanPassThrough occupied
    "outputs true if building is occupied"
    annotation (Placement(transformation(extent={{-114,328},{-94,348}})));
  BuildingControl.VDI3814.StateGraph.State    morPreCoo(nIn=1,
    nOut=1,
    nNumbering=1) "Pre-cooling mode"
                               annotation (Placement(transformation(
        extent={{-42,-43},{42,43}},
        rotation=0,
        origin={-528,35})));

  Modelica.Blocks.Logical.And and1
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-58,-22})));
  Modelica.Blocks.Routing.RealPassThrough TRooAve "Average room temperature"
    annotation (Placement(transformation(extent={{-114,358},{-94,378}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y=TRooAve.y <
        TRooSetCooOcc)
    annotation (Placement(transformation(extent={{40,-10},{-36,14}})));
  Buildings.Examples.VAVReheat.Controls.PreCoolingStarter preCooSta(
      TRooSetCooOcc=TRooSetCooOcc) "Model to start pre-cooling"
    annotation (Placement(transformation(extent={{6,484},{26,504}})));
  Modelica.Blocks.Logical.Not not1
    annotation (Placement(transformation(extent={{22,-258},{2,-238}})));
  Modelica.Blocks.Logical.And and2
    annotation (Placement(transformation(extent={{-38,-218},{-58,-198}})));
  Modelica.Blocks.Logical.Not not2
    annotation (Placement(transformation(extent={{22,-218},{2,-198}})));
  Modelica.Blocks.MathInteger.Sum sum(nu=5)
    annotation (Placement(transformation(extent={{-86,148},{-74,160}})));
  Modelica.Blocks.Logical.Timer timerT6 annotation (Placement(transformation(
        origin={0,32},
        extent={{-10,10},{10,-10}},
        rotation=180)));
  Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqual(threshold=60)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}}, rotation=180,
        origin={-32,34})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpressiont7(y=TRooMin.y -
        delTRooOnOff/2 < TRooSetCooOcc or occupied.y)
    annotation (Placement(transformation(extent={{20,-138},{-56,-114}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpressiont3(y=TRooMin.y +
        delTRooOnOff/2 > TRooSetHeaOcc or occupied.y)
    annotation (Placement(transformation(extent={{24,-116},{-52,-92}})));
  Modelica.Blocks.Logical.And and3
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-66,30})));
  Modelica.Blocks.Logical.And and4
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-78,102})));
  Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqual1(
                                                             threshold=60)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}}, rotation=180,
        origin={-44,110})));
  Modelica.Blocks.Logical.Timer timerT2 annotation (Placement(transformation(
        origin={-12,110},
        extent={{-10,10},{10,-10}},
        rotation=180)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpressiont2(y=TRooMinErrHea.y >
        delTRooOnOff/2)
    annotation (Placement(transformation(extent={{14,64},{-62,88}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpressiont1(y=delTRooOnOff/2 <
        -TRooMinErrHea.y)
    annotation (Placement(transformation(extent={{32,-192},{-44,-168}})));
  Modelica.Blocks.Logical.And and5
    annotation (Placement(transformation(extent={{-50,-170},{-70,-150}})));
  Modelica.Blocks.Logical.Timer timerT1 annotation (Placement(transformation(
        origin={12,-156},
        extent={{-10,10},{10,-10}},
        rotation=180)));
  Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqual2(threshold=30*60)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}}, rotation=180,
        origin={-28,-156})));
  Modelica.Blocks.Math.BooleanToInteger modeMorPreCoo(integerTrue=Integer(
        Buildings.Examples.VAVReheat.Controls.OperationModes.unoccupiedPreCool))
    annotation (Placement(transformation(extent={{-456,22},{-436,42}})));
  Modelica.Blocks.Math.BooleanToInteger modeMorWarUp(integerTrue=Integer(
        Buildings.Examples.VAVReheat.Controls.OperationModes.unoccupiedWarmUp))
    annotation (Placement(transformation(extent={{-272,12},{-252,32}})));
  Modelica.Blocks.Math.BooleanToInteger modeOcc(integerTrue=Integer(Buildings.Examples.VAVReheat.Controls.OperationModes.occupied))
    annotation (Placement(transformation(extent={{-262,-68},{-242,-48}})));
  Modelica.Blocks.Math.BooleanToInteger modeUnOccNigSetBac(integerTrue=Integer(
        Buildings.Examples.VAVReheat.Controls.OperationModes.unoccupiedNightSetBack))
    annotation (Placement(transformation(extent={{-136,22},{-116,42}})));
  Modelica.Blocks.Math.BooleanToInteger modeUnOccOff(integerTrue=Integer(
        Buildings.Examples.VAVReheat.Controls.OperationModes.unoccupiedOff))
    annotation (Placement(transformation(extent={{-270,203},{-250,223}})));
  BuildingControl.VDI3814.StateGraph.InitialState initialState(nIn=0, nOut=1)
    "InitialState" annotation (Placement(transformation(
        extent={{-35,-36},{35,36}},
        rotation=0,
        origin={-343,318})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant
    annotation (Placement(transformation(extent={{-218,274},{-238,294}})));
  BuildingControl.VDI3814.StateGraph.ReturnToState passThrough(
      nNumberingOfTargetState=0, nout=1)
    annotation (Placement(transformation(extent={{-368,-146},{-336,-108}})));
  BuildingControl.VDI3814.StateGraph.ReturnToState passThrough1(
      nNumberingOfTargetState=0, nout=1)
    annotation (Placement(transformation(extent={{-172,-122},{-142,-92}})));
equation
  // Graphical annotation removed from connect() statements
  connect(unOccOff.active, timerT6.u);
  connect(unOccOff.active, timerT2.u);
  connect(unOccNigSetBac.active, timerT1.u);
  connect(passThrough1.outport[1], unOccOff.inPort[2]);
  connect(and5.y, unOccOff.u[2]);
  connect(passThrough.outport[1], unOccOff.inPort[3]);
  connect(and2.y, unOccOff.u[3]);

  // Graphical annotation kept from connect() statements

  connect(cb.dTNexOcc, occThrSho.u) annotation (Line(
      points={{-192,388},{-154,388},{-154,468},{-114,468}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(cb.TRooMin, TRooMin.u) annotation (Line(
      points={{-192,388},{-154,388},{-154,398},{-116,398}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(TRooSetHea.y, TRooMinErrHea.u1)  annotation (Line(
      points={{-93,428},{-72,428}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TRooMin.y, TRooMinErrHea.u2)    annotation (Line(
      points={{-93,398},{-64,398},{-64,420}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cb.occupied, occupied.u) annotation (Line(
      points={{-192,388},{-154,388},{-154,338},{-116,338}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(occThrSho.y, and1.u1) annotation (Line(
      points={{-91,468},{50,468},{50,-22},{-46,-22}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(cb.TRooAve, TRooAve.u) annotation (Line(
      points={{-192,388},{-154,388},{-154,366},{-124,366},{-124,368},{-116,368}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(booleanExpression.y, and1.u2) annotation (Line(
      points={{-39.8,2},{-42,2},{-42,-14},{-46,-14}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(cb, preCooSta.controlBus) annotation (Line(
      points={{-192,388},{-154,388},{-154,316},{-112.2,316}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(occThrSho.y, not1.u) annotation (Line(
      points={{-91,468},{104,468},{104,-248},{24,-248}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(occupied.y, not2.u) annotation (Line(
      points={{-93,338},{104,338},{104,-208},{24,-208}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(cb.TRooSetHea, TRooSetHea.u) annotation (Line(
      points={{-192,388},{-154,388},{-154,428},{-116,428}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(sum.y, cb.controlMode) annotation (Line(
      points={{-73.1,154},{-8,154},{-8,294},{-210,294},{-210,388},{-192,388}},
      color={255,127,0},
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(and2.u1, not2.y) annotation (Line(
      points={{-36,-208},{1,-208}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(not1.y, and2.u2) annotation (Line(
      points={{1,-248},{-24,-248},{-24,-216},{-36,-216}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(greaterEqual.u, timerT6.y) annotation (Line(
      points={{-20,34},{-20,32},{-11,32}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(greaterEqual.y, and3.u2) annotation (Line(
      points={{-43,34},{-46.5,34},{-46.5,38},{-54,38}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(and1.y, and3.u1) annotation (Line(
      points={{-69,-22},{-78,-22},{-78,2},{-48,2},{-48,30},{-54,30}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(timerT2.y, greaterEqual1.u) annotation (Line(
      points={{-23,110},{-32,110}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(greaterEqual1.y, and4.u2) annotation (Line(
      points={{-55,110},{-66,110}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(booleanExpressiont2.y, and4.u1) annotation (Line(
      points={{-65.8,76},{-64,76},{-64,102},{-66,102}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(booleanExpressiont1.y, and5.u2) annotation (Line(
      points={{-47.8,-180},{-47.8,-174},{-48,-174},{-48,-168}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(greaterEqual2.y, and5.u1) annotation (Line(
      points={{-39,-156},{-42,-156},{-42,-160},{-48,-160}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(timerT1.y, greaterEqual2.u) annotation (Line(
      points={{1,-156},{-16,-156}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(preCooSta.y, morPreCoo.u[1]) annotation (Line(
      points={{-95,312},{50,312},{50,106},{-156,106},{-156,98},{-502.8,98},{
          -502.8,80.58}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(modeMorPreCoo.u, morPreCoo.active) annotation (Line(
      points={{-458,32},{-430,32},{-430,34},{-456,34},{-456,35},{-481.8,35}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(and1.y, morWarUp.u[2]) annotation (Line(
      points={{-69,-22},{-102,-22},{-102,96},{-270,96},{-324.8,96},{-324.8,88},
          {-324.8,79.23}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(and3.y, morWarUp.u[1]) annotation (Line(
      points={{-77,30},{-94,30},{-94,100},{-128,100},{-128,98},{-306,98},{
          -324.8,98},{-324.8,90},{-324.8,81.69}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(modeMorWarUp.u, morWarUp.active) annotation (Line(
      points={{-274,22},{-282,22},{-282,37},{-301.3,37}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(modeOcc.u, occ.active) annotation (Line(
      points={{-264,-58},{-291,-58}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(booleanExpressiont7.y, occ.u[2]) annotation (Line(
      points={{-59.8,-126},{-78,-126},{-78,-118},{-80,-118},{-80,-38},{-296,-38},
          {-296,-47.4}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(booleanExpressiont3.y, occ.u[1]) annotation (Line(
      points={{-55.8,-104},{-64,-104},{-64,-48},{-296,-48},{-296,-47}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(occupied.y, occ.u[3]) annotation (Line(
      points={{-93,338},{50,338},{50,-36},{-296,-36},{-296,-47.8}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(and4.y, unOccNigSetBac.u[1]) annotation (Line(
      points={{-89,102},{-92,102},{-92,98},{-108,98},{-108,96},{-170,96},{-170,
          90.64}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(modeUnOccNigSetBac.u, unOccNigSetBac.active) annotation (Line(
      points={{-138,32},{-158,32},{-158,44},{-150,44}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(modeUnOccOff.u, unOccOff.active) annotation (Line(
      points={{-272,213},{-282,213},{-282,199},{-289.8,199}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(unOccOff.outPort[1], unOccNigSetBac.inPort[1]) annotation (Line(
      points={{-339.045,164},{-339.045,128.8},{-194,128.8},{-194,95.92}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(unOccOff.outPort[2], morWarUp.inPort[1]) annotation (Line(
      points={{-336.735,164},{-336.735,124.8},{-353,124.8},{-353,88.865}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(unOccOff.outPort[3], morPreCoo.inPort[1]) annotation (Line(
      points={{-334.425,164},{-334.425,166},{-338,166},{-338,130},{-528,130},{
          -528,112},{-528,112},{-528,85.74}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(unOccOff.outPort[4], occ.inPort[3]) annotation (Line(
      points={{-332.115,164},{-332.115,128},{-280,128},{-280,-26},{-302,-26},{
          -302,-47.3333}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(morWarUp.outPort[1], occ.inPort[1]) annotation (Line(
      points={{-352.53,-4},{-352.53,-17.2},{-302,-17.2},{-302,-45.0667}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(morPreCoo.outPort[1], occ.inPort[2]) annotation (Line(
      points={{-527.58,-8},{-382,-8},{-382,-20},{-302,-20},{-302,-46.2}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(unOccNigSetBac.outPort[2], morWarUp.inPort[2]) annotation (Line(
      points={{-191.4,0},{-190,0},{-190,-14},{-240,-14},{-240,96},{-353,96},{
          -353,81.895}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(modeUnOccOff.y, sum.u[1]) annotation (Line(
      points={{-249,213},{-240,213},{-240,212},{-232,212},{-232,158},{-100,158},
          {-100,157.36},{-86,157.36}},
      color={255,127,0},
      smooth=Smooth.None));
  connect(modeUnOccNigSetBac.y, sum.u[2]) annotation (Line(
      points={{-115,32},{-112,32},{-112,150},{-86,150},{-86,155.68}},
      color={255,127,0},
      smooth=Smooth.None));
  connect(modeMorWarUp.y, sum.u[3]) annotation (Line(
      points={{-251,22},{-244,22},{-244,-8},{-112,-8},{-112,154},{-86,154}},
      color={255,127,0},
      smooth=Smooth.None));
  connect(modeMorPreCoo.y, sum.u[4]) annotation (Line(
      points={{-435,32},{-428,32},{-428,16},{-422,16},{-422,-8},{-112,-8},{-112,
          152.32},{-86,152.32}},
      color={255,127,0},
      smooth=Smooth.None));
  connect(modeOcc.y, sum.u[5]) annotation (Line(
      points={{-241,-58},{-232,-58},{-232,-8},{-112,-8},{-112,150.64},{-86,150.64}},
      color={255,127,0},
      smooth=Smooth.None));
  connect(initialState.outPort[1], unOccOff.inPort[1]) annotation (Line(
      points={{-342.65,280.56},{-342.65,269.58},{-336,269.58},{-336,244.267}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(booleanConstant.y, unOccOff.u[1]) annotation (Line(
      points={{-239,284},{-268,284},{-268,252},{-302,252},{-302,237.5},{-310.8,
          237.5}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(passThrough.transition_in, occ.outPort[1]) annotation (Line(
      points={{-351.68,-111.8},{-354,-111.8},{-354,-98},{-310,-98},{-310,-100},
          {-302,-100},{-302,-68},{-301.9,-68}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(passThrough1.transition_in, unOccNigSetBac.outPort[1]) annotation (
      Line(
      points={{-156.7,-95},{-156.7,-66},{-156,-66},{-156,-12},{-195.8,-12},{
          -195.8,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(and2.y, passThrough.u) annotation (Line(
      points={{-59,-208},{-202,-208},{-202,-115.6},{-344.32,-115.6}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(and5.y, passThrough1.u) annotation (Line(
      points={{-71,-160},{-109.5,-160},{-109.5,-98},{-149.8,-98}},
      color={255,0,255},
      smooth=Smooth.None));

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-580,
            -300},{160,560}})), Icon(coordinateSystem(
          preserveAspectRatio=true, extent={{-580,-300},{160,560}}), graphics={
          Rectangle(
          extent={{-200,200},{200,-200}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={215,215,215}), Text(
          extent={{-176,80},{192,-84}},
          lineColor={0,0,255},
          textString="%name")}));
end ModeSelector_VDI3814;
