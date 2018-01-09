within BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Internal;
block PriorityControlFunctionality
  "Algorithm model to provide functionality of PriorityControl"
  extends Interfaces.Partial.PartialFunctionality;

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Connectors
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.BooleanInput B_WINDOW "Boolean window state (default: true == closed / false == open)."
    annotation (Placement(transformation(extent={{-100,60},{-80,80}}), iconTransformation(extent={{-100,40},{-60,60}})));
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealInput[2]
    S_PROT "Positioning command for the sunshade from WeatherProtection." annotation (Placement(transformation(extent={{-100,30},{-80,50}}),
        iconTransformation(extent={{-100,10},{-60,30}})));
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealInput[2]
    S_MAINT "Positioning command for the sunshade from operator." annotation (Placement(transformation(extent={{-100,0},{-80,20}}),
        iconTransformation(extent={{-100,-20},{-60,0}})));
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealInput[2]
    S_MAN "Positioning command for the sunshade from ActuateSunshade or AutomaticThermalControl." annotation (Placement(transformation(extent={{-100,-30},{-80,-10}}),
        iconTransformation(extent={{-100,-50},{-60,-30}})));
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealInput[2]
    S_AUTO "Positioning command for the sunshade from other automation functions." annotation (Placement(transformation(extent={{-100,-60},{-80,-40}}),
        iconTransformation(extent={{-100,-80},{-60,-60}})));
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealOutput[2]
    S_SET "New position of the sunshade." annotation (Placement(transformation(extent={{100,60},{120,80}}),
        iconTransformation(extent={{100,-10},{140,10}})));

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Variables
   Real valuesPosition[4]
    "Array holding position values to enable individual prioritization";
   Real valuesAngle[4]
    "Array holding angle values to enable individual prioritization";

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Parameters
  parameter Types.EnumerationTypes.PAR_PRIO PAR_PRIO_S_PROT=Types.EnumerationTypes.PAR_PRIO.highest
    "Parameter to set priority level of S_PROT";
  parameter Types.EnumerationTypes.PAR_PRIO PAR_PRIO_S_MAINT=Types.EnumerationTypes.PAR_PRIO.high
    "Parameter to set priority level of S_MAINT";
  parameter Types.EnumerationTypes.PAR_PRIO PAR_PRIO_S_MAN=Types.EnumerationTypes.PAR_PRIO.medium
    "Parameter to set priority level of S_MAN";
  parameter Types.EnumerationTypes.PAR_PRIO PAR_PRIO_S_AUTO=Types.EnumerationTypes.PAR_PRIO.low
    "Parameter to set priority level of S_AUTO";

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Components
  inner Modelica.StateGraph.StateGraphRoot stateGraphRoot
    annotation (Placement(transformation(extent={{86,84},{94,92}})));
  Modelica.StateGraph.InitialStep initialStep annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-78,90})));
  Modelica.StateGraph.Transition t0 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-58,90})));
  Modelica.StateGraph.StepWithSignal prioL1Active annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-20,30})));
  Modelica.StateGraph.Transition t1(condition=B_WINDOW)       annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-52,52})));
  Modelica.StateGraph.StepWithSignal start(nIn=2) annotation (Placement(
        transformation(
        extent={{-6,6},{6,-6}},
        rotation=270,
        origin={-22,74})));
  Modelica.StateGraph.StepWithSignal prioL2Active annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-20,-6})));
  Modelica.StateGraph.StepWithSignal prioL3Active annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-20,-42})));
  Modelica.StateGraph.StepWithSignal prioL4Active annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-20,-77})));
  Modelica.StateGraph.Transition t2(condition=valuesPosition[1] <= -1)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-54,12})));
  Modelica.StateGraph.Transition t3(condition=valuesPosition[2] <= -1)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-52,-24})));
  Modelica.StateGraph.Transition t4(condition=valuesPosition[3] <= -1)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-54,-60})));
  Modelica.StateGraph.StepWithSignal noPrio annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={28,-88})));
  Modelica.StateGraph.Transition t5(condition=valuesPosition[4] <= -1)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-60,-86})));
  Modelica.StateGraph.Transition t6(condition=true,
    enableTimer=true,
    waitTime=60)                                    annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={60,-74})));

  sunShadeUtility noPrioSunPos(
    valFalse( y = 0.0), valTrue(y=0.0))
                         annotation (
      Placement(transformation(
        extent={{-3.5,-4},{3.5,4}},
        rotation=90,
        origin={22,-68.5})));

  sunShadeUtility noPrioSunAng(
   valTrue( y = 0.0),
    valFalse( y = 0.0))
    annotation (Placement(transformation(
        extent={{-3.5,-4},{3.5,4}},
        rotation=90,
        origin={32,-68.5})));

  sunShadeUtility prioL4SunAng(
    valTrue( y = valuesAngle[4]),
    valFalse( y = 0.0))  annotation (Placement(transformation(
        extent={{-3.5,-4},{3.5,4}},
        rotation=0,
        origin={-2,-82.5})));

  sunShadeUtility prioL4SunPos(
    valTrue( y = valuesPosition[4]),
    valFalse( y = 0.0)) annotation (Placement(transformation(
        extent={{-3.5,-4},{3.5,4}},
        rotation=0,
        origin={-2,-70.5})));

  sunShadeUtility prioL3SunAng(
   valTrue( y = valuesAngle[3]),
    valFalse( y = 0.0)) annotation (Placement(transformation(
        extent={{-3.5,-4},{3.5,4}},
        rotation=0,
        origin={-2,-48.5})));

  sunShadeUtility prioL3SunPos(
   valTrue( y = valuesPosition[3]),
    valFalse( y = 0.0)) annotation (Placement(transformation(
        extent={{-3.5,-4},{3.5,4}},
        rotation=0,
        origin={-2,-38.5})));

  sunShadeUtility prioL2SunAng(
   valTrue( y = valuesAngle[2]),
    valFalse( y = 0.0)) annotation (Placement(transformation(
        extent={{-3.5,-4},{3.5,4}},
        rotation=0,
        origin={-2,-12.5})));

  sunShadeUtility prioL2SunPos(
   valTrue( y = valuesPosition[2]),
    valFalse( y = 0.0))   annotation (Placement(transformation(
        extent={{-3.5,-4},{3.5,4}},
        rotation=0,
        origin={-2,-0.5})));

  sunShadeUtility prioL1SunAng(
   valTrue( y = valuesAngle[1]),
    valFalse( y = 0.0))   annotation (Placement(transformation(
        extent={{-3.5,-4},{3.5,4}},
        rotation=0,
        origin={0,25.5})));
  sunShadeUtility  prioL1SunPos(
   valTrue( y = valuesPosition[1]),
    valFalse( y = 0.0))  annotation (Placement(transformation(
        extent={{-3.5,-4},{3.5,4}},
        rotation=0,
        origin={0,37.5})));

  sunShadeUtility startSunPos(
   valTrue( y = 0.0),
    valFalse( y = 0.0))  annotation (Placement(transformation(
        extent={{-3.5,-4},{3.5,4}},
        rotation=0,
        origin={-2,77.5})));

  sunShadeUtility startSunAng(
   valTrue( y = 0.0),
    valFalse( y = 0.0)) annotation (Placement(transformation(
        extent={{-3.5,-4},{3.5,4}},
        rotation=0,
        origin={-2,65.5})));

  Modelica.Blocks.Math.MultiSum sumSunPos(nu=6)
    annotation (Placement(transformation(extent={{30,48},{42,60}})));
  Modelica.Blocks.Math.MultiSum sumSunAng(nu=6)
    annotation (Placement(transformation(extent={{44,-28},{56,-16}})));
equation
  // Assignment of positions and angles to evaluation cascade
  valuesPosition[ PAR_PRIO_S_PROT]    = S_PROT[1];
  valuesPosition[ PAR_PRIO_S_MAINT]   = S_MAINT[1];
  valuesPosition[ PAR_PRIO_S_MAN]     = S_MAN[1];
  valuesPosition[ PAR_PRIO_S_AUTO]    = S_AUTO[1];
  valuesAngle[ PAR_PRIO_S_PROT]       = S_PROT[2];
  valuesAngle[ PAR_PRIO_S_MAINT]      = S_MAINT[2];
  valuesAngle[ PAR_PRIO_S_MAN]        = S_MAN[2];
  valuesAngle[ PAR_PRIO_S_AUTO]       = S_AUTO[2];

  // if window is closed then evaluate lower priority inputs
  // Value for window state in rooms (true := closed/ window is save , false := open/window and sunshade may collide)"


  connect(t0.inPort, initialStep.outPort[1]) annotation (Line(
      points={{-62,90},{-67.5,90}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(start.inPort[1], t0.outPort) annotation (Line(
      points={{-22.3,80.6},{-22.3,90},{-56.5,90}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(t5.outPort, noPrio.inPort[1]) annotation (Line(
      points={{-60,-87.5},{-60,-96},{4,-96},{4,-88},{17,-88}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(t6.inPort, noPrio.outPort[1]) annotation (Line(
      points={{60,-78},{60,-88},{38.5,-88}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(t6.outPort, start.inPort[2]) annotation (Line(
      points={{60,-72.5},{60,100},{-40,100},{-40,82},{-21.7,82},{-21.7,80.6}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(noPrioSunPos.u, noPrio.active) annotation (Line(
      points={{22,-72.7},{26,-72.7},{26,-77},{28,-77}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(noPrioSunAng.u, noPrio.active) annotation (Line(
      points={{32,-72.7},{30,-72.7},{30,-77},{28,-77}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(prioL4Active.active, prioL4SunPos.u) annotation (Line(
      points={{-9,-77},{-9,-73.5},{-6.2,-73.5},{-6.2,-70.5}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(prioL4Active.active, prioL4SunAng.u) annotation (Line(
      points={{-9,-77},{-9,-80.5},{-6.2,-80.5},{-6.2,-82.5}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(prioL3SunAng.u, prioL3Active.active) annotation (Line(
      points={{-6.2,-48.5},{-6.2,-45.25},{-9,-45.25},{-9,-42}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(prioL3SunPos.u, prioL3Active.active) annotation (Line(
      points={{-6.2,-38.5},{-8.1,-38.5},{-8.1,-42},{-9,-42}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(prioL2SunAng.u, prioL2Active.active) annotation (Line(
      points={{-6.2,-12.5},{-6.2,-9.25},{-9,-9.25},{-9,-6}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(prioL2SunPos.u, prioL2Active.active) annotation (Line(
      points={{-6.2,-0.5},{-6.2,-3.25},{-9,-3.25},{-9,-6}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(prioL1Active.active, prioL1SunPos.u) annotation (Line(
      points={{-9,30},{-6,30},{-6,37.5},{-4.2,37.5}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(prioL1Active.active, prioL1SunAng.u) annotation (Line(
      points={{-9,30},{-6,30},{-6,25.5},{-4.2,25.5}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(t1.outPort, prioL1Active.inPort[1]) annotation (Line(
      points={{-52,50.5},{-52,48},{-20,48},{-20,41}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(prioL1Active.outPort[1], t2.inPort) annotation (Line(
      points={{-20,19.5},{-20,18},{-54,18},{-54,16}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(t2.outPort, prioL2Active.inPort[1]) annotation (Line(
      points={{-54,10.5},{-54,8},{-20,8},{-20,5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(prioL2Active.outPort[1], t3.inPort) annotation (Line(
      points={{-20,-16.5},{-20,-16.5},{-20,-20},{-52,-20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(t3.outPort, prioL3Active.inPort[1]) annotation (Line(
      points={{-52,-25.5},{-52,-26},{-52,-26},{-52,-26},{-52,-28},{-20,-28},{
          -20,-31},{-20,-31}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(prioL3Active.outPort[1], t4.inPort) annotation (Line(
      points={{-20,-52.5},{-20,-54},{-54,-54},{-54,-56}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(t4.outPort, prioL4Active.inPort[1]) annotation (Line(
      points={{-54,-61.5},{-54,-64},{-20,-64},{-20,-66}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(prioL4Active.outPort[1], t5.inPort) annotation (Line(
      points={{-20,-87.5},{-20,-92},{-40,-92},{-40,-82},{-60,-82}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(startSunPos.u, start.active) annotation (Line(
      points={{-6.2,77.5},{-11.1,77.5},{-11.1,74},{-15.4,74}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(startSunAng.u, start.active) annotation (Line(
      points={{-6.2,65.5},{-6.2,69.75},{-15.4,69.75},{-15.4,74}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(start.outPort[1], t1.inPort) annotation (Line(
      points={{-22,67.7},{-22,62},{-52,62},{-52,56}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(startSunPos.y, sumSunPos.u[1]) annotation (Line(
      points={{1.85,77.5},{10,77.5},{10,78},{20,78},{20,58},{26,58},{26,57.5},{
          30,57.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prioL1SunPos.y, sumSunPos.u[2]) annotation (Line(
      points={{3.85,37.5},{12,37.5},{12,38},{20,38},{20,56.1},{30,56.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prioL2SunPos.y, sumSunPos.u[3]) annotation (Line(
      points={{1.85,-0.5},{1.85,0},{20,0},{20,54.7},{30,54.7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prioL3SunPos.y, sumSunPos.u[4]) annotation (Line(
      points={{1.85,-38.5},{1.85,-40},{20,-40},{20,52},{30,52},{30,53.3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prioL4SunPos.y, sumSunPos.u[5]) annotation (Line(
      points={{1.85,-70.5},{1.85,-70},{10,-70},{10,-40},{20,-40},{20,52},{30,52},
          {30,51.9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(noPrioSunPos.y, sumSunPos.u[6]) annotation (Line(
      points={{22,-64.65},{20,-64.65},{20,50.5},{30,50.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(noPrioSunAng.y, sumSunAng.u[1]) annotation (Line(
      points={{32,-64.65},{32,-18.5},{44,-18.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prioL4SunAng.y, sumSunAng.u[2]) annotation (Line(
      points={{1.85,-82.5},{1.85,-82},{12,-82},{12,-20},{44,-20},{44,-19.9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prioL3SunAng.y, sumSunAng.u[3]) annotation (Line(
      points={{1.85,-48.5},{6,-48.5},{6,-48},{12,-48},{12,-20},{44,-20},{44,
          -21.3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prioL2SunAng.y, sumSunAng.u[4]) annotation (Line(
      points={{1.85,-12.5},{12,-12.5},{12,-20},{44,-20},{44,-22.7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prioL1SunAng.y, sumSunAng.u[5]) annotation (Line(
      points={{3.85,25.5},{3.85,24},{12,24},{12,-20},{44,-20},{44,-24.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(startSunAng.y, sumSunAng.u[6]) annotation (Line(
      points={{1.85,65.5},{1.85,66},{12,66},{12,-20},{44,-20},{44,-25.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sumSunPos.y, S_SET[1]) annotation (Line(points={{43.02,54},{72,54},{
          72,65},{110,65}}, color={0,0,127}));
  connect(sumSunAng.y, S_SET[2]) annotation (Line(points={{57.02,-22},{80,-22},
          {80,75},{110,75}}, color={0,0,127}));
  annotation (preferedView="Info",Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),                Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
",        info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<p>Block that implements functionality of &QUOT;Priority control&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.12, p. 49 - 51]</a>. </p>
<h4><span style=\"color: #008000\">Functional Description</span></h4>
<p>&QUOT;The function<i> Occupancy evaluation</i> (RA-FL section 6, column 1; informative function block Figure 23) evaluates the output information received from <i>Presence detection</i> and from operator functions (<i>Signal presence</i>) in order to determine the occupancy state in a room for all further application functions. Various options of room check-in and check-out can thus be implemented.&QUOT;<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.12, p. 49 - 51]</a></p>
<p><br><br><b>Fig. 1: </b>UML activity diagram of the application function <i>Priority control, </i><a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.12, p. 49 - 51]</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/docUMLAkt_PriorityControl.PNG\"/> </p></td>
</tr>
</table>
<h4><span style=\"color: #008000\">Input Variables</span></h4>
<p>The following table presents the input variables of the function as specified in the standard. </p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Datatype VDI3813</h4></p></td>
<td><p align=\"center\"><h4>Semantic data type</h4></p></td>
<td><p align=\"center\"><h4>Signal flow direction</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>B_WINDOW</p></td>
<td valign=\"top\"><p>Binary</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Binary.ValueWindowInput\">ValueWindow</a> </p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Boolean window state (default: true == closed / false == open).</p></td>
</tr>
<tr>
<td valign=\"top\"><p>S_PROT</p></td>
<td valign=\"top\"><p>Sunshade</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade.CommandSunshadeProtectionInput\">CommandSunshadeProtection</a></p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Positioning command for the sunshade from <i>WeatherProtection</i>.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>S_MAINT</p></td>
<td valign=\"top\"><p>Sunshade</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade.CommandSunshadeMaintenanceInput\">CommandSunshadeMaintenance</a></p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Positioning command for the sunshade from operator.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>S_MAN</p></td>
<td valign=\"top\"><p>Sunshade</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade.CommandSunshadeManualInput\">CommandSunshadeManual</a></p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Positioning command for the sunshade from <i>ActuateSunshade</i> or <i>AutomaticThermalControl</i>.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>S_AUTO</p></td>
<td valign=\"top\"><p>Sunshade</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade.CommandSunshadeAutomaticInput\">CommandSunshadeAutomatic</a></p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Positioning command for the sunshade from other automation functions.</p></td>
</tr>
</table>
<p><br><h4><span style=\"color: #008000\">Output Variables</span></h4></p>
<p>The following table presents the output variables of the function as specified in the standard.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Datatype VDI3813</h4></p></td>
<td><p align=\"center\"><h4>Semantic data type</h4></p></td>
<td><p align=\"center\"><h4>Signal flow direction</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>S_SET</p></td>
<td valign=\"top\"><p>Sunshade</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade.CommandSunshadeOutput\">CommandSunshade</a> </p></td>
<td valign=\"top\"><p>Output</p></td>
<td valign=\"top\"><p>New position of the sunshade.</p></td>
</tr>
</table>
<p><br><br><br><br><br><br><br><br><br><b><span style=\"color: #008000;\">Parameters</span></b> </p>
<p>The following table presents the parameter of the function as specified in the standard.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_PRIO_S_PROT</p></td>
<td valign=\"top\"><p>Parameter&nbsp;to&nbsp;set&nbsp;priority&nbsp;level&nbsp;of&nbsp;S_PROT.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_PRIO_S_MAINT</p></td>
<td valign=\"top\"><p>Parameter&nbsp;to&nbsp;set&nbsp;priority&nbsp;level&nbsp;of&nbsp;S_MAINT.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_PRIO_S_MAN</p></td>
<td valign=\"top\"><p>Parameter&nbsp;to&nbsp;set&nbsp;priority&nbsp;level&nbsp;of&nbsp;S_MAN.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_PRIO_S_AUTO</p></td>
<td valign=\"top\"><p>Parameter&nbsp;to&nbsp;set&nbsp;priority&nbsp;level&nbsp;of&nbsp;S_AUTO.</p></td>
</tr>
</table>
</html>"));
end PriorityControlFunctionality;
