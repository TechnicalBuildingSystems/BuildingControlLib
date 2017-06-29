within BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Examples;
model TesterFunctionSelection
  "Model for testing the functionality of FunctionSelection"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.BooleanStep sourceB_DEW(              startValue=true,
      startTime=70)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-10,82})));
  RoomClimate.FunctionSelection functionSelection
    annotation (Placement(transformation(extent={{-62,-76},{98,-40}})));
  Sources.Binary.PrescribedB_DEW prescribedB_DEW annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-10,10})));
  Sources.AirTemperature.PrescribedT_ROOM prescribedT_ROOM annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-30,10})));
  Sources.AirTemperature.PrescribedT_SETPTS prescribedT_SETPTS annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,10})));

  Modelica.Blocks.Sources.Constant SourceT_SETPTS[8](
   k = {273.15+T_SETPTS[1],
        273.15+T_SETPTS[2],
        273.15+T_SETPTS[3],
        273.15+T_SETPTS[4],
        273.15+T_SETPTS[5],
        273.15+T_SETPTS[6],
        273.15+T_SETPTS[7],
        273.15+T_SETPTS[8]});

  parameter Real T_SETPTS[8] = {16,18,20,22,28,32,34,36};
  parameter Integer nF_BMS = integer(CF.nightcool);

  Modelica.Blocks.Sources.Step step(
    height=-5,
    offset=273.15 + 26,
    startTime=70) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-30,50})));

  Modelica.Blocks.Sources.IntegerStep SourceF_BMS[nF_BMS](
    height={0,2,3,-1,-1,-3,0,2,3,-1,-1},
    offset={1,0,0,0,0,0,0,0,0,0,0},
    startTime={10,20,30,40,50,60,80,90,100,110,120}) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={22,80})));
  Modelica.Blocks.MathInteger.Sum sum(nu=nF_BMS)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=270,
        origin={10,32})));
  Sources.ControlFunction.PrescribedF_BMS_AirTemperature prescribedF_BMS
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={10,10})));

equation
    for j in 1:nF_BMS loop
    connect(SourceF_BMS[j].y, sum.u[j]) annotation (Line(
      points={{22,69},{22,38},{10,38}},
      color={255,127,0},
      smooth=Smooth.None));
  end for;

  for i in 1:8 loop
   SourceT_SETPTS[i].y = prescribedT_SETPTS.u[i];
  end for;
  connect(prescribedF_BMS.F_BMS, functionSelection.F_BMS) annotation (Line(
      points={{10,-1.9},{10,-24},{-68,-24},{-68,-50.8},{-46,-50.8}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedB_DEW.B_DEW, functionSelection.B_DEW) annotation (Line(
      points={{-10,-1.9},{-10,-22},{-74,-22},{-74,-58},{-46,-58}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedT_ROOM.T_ROOM, functionSelection.T_ROOM) annotation (Line(
      points={{-30,-1.9},{-30,-18},{-80,-18},{-80,-66},{-66,-66},{-66,-65.2},{-46,
          -65.2}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));

  connect(prescribedT_SETPTS.T_SETPTS, functionSelection.T_SETPTS) annotation (
      Line(
      points={{-50,-1.9},{-50,-8},{-84,-8},{-84,-72.4},{-46,-72.4}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));

  connect(sourceB_DEW.y, prescribedB_DEW.u) annotation (Line(
      points={{-10,71},{-10,18}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(sum.y, prescribedF_BMS.u) annotation (Line(
      points={{10,25.1},{10,18}},
      color={255,127,0},
      smooth=Smooth.None));

  connect(step.y, prescribedT_ROOM.u) annotation (Line(
      points={{-30,39},{-34,39},{-34,18},{-30,18}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),      graphics={Text(
          extent={{-88,50},{-52,16}},
          lineColor={0,0,255},
          textString="See source code"), Line(
          points={{-58,28},{-52,18},{-54,18}},
          color={0,0,255},
          smooth=Smooth.None)}),
    experiment(StopTime=200),
    __Dymola_experimentSetupOutput,preferedView="Info",
    Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
", info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Block that implements functionality of &QUOT;Function selection&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.22, p. 70 - 72]</a>. </p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p>&QUOT;The room climate can be influenced by various control functions (see Figure 44) (RA-FL section 6, column 21; informative function block Figure 45), which can either be specified by the operator or determined automatically depending on specific states. Based on the currently selected control function, the application functions <i>Room supply air temperature cascade control</i>, <i>Room temperature control</i>, <i>Fan control</i> and <i>Night-time cooling</i> can decide whether to be active or not. The following control functions are selectable:</p>
<p>OFF: control inactive</p>
<p>AUTO: control active with automatic changeover between heating and cooling modes</p>
<p>HEATING: control active in heating mode</p>
<p>COOLING: control active in cooling mode</p>
<p>PRECOOL: control active in cooling mode, but using comfort setpoint for heating</p>
<p>NIGHTCOOL: only night-time cooling active</p>
<p>Apart from the selection of a control function by the operator (e. g. via a time program), a change of function can also be triggered by the dewpoint being reached in cooling mode. In this case, the controller remains inactive (OFF). If automatic room-by-room changeover between heating and cooling is permissible (e. g. with four-pipe systems), and is selected by the operator (F_BMS = AUTO), the function decides on changing the active function (HEATING or COOLING) depending on the current setpoints (T_SETPT) and the room temperature (T_ROOM). In doing so, the function must make sure that, for systems having just one joint register or one joint area for heating and cooling purposes, changeover takes place via the OFF function, after an appropriate holding time to allow any open valves to close.&QUOT;<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.22, p. 70 - 72]</a></p>
<p>Implementation of the functionality of function selection. Assumption is made that T_ZE (Temperature in the middle between comfort setpoints) is the arithmetic mean of the cooling and heating set points.</p>
<h4><span style=\"color:#008000\">Concept</span></h4>
<p></p>
</html>"));
end TesterFunctionSelection;
