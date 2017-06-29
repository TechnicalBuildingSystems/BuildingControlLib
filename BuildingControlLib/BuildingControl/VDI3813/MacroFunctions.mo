within BuildingControlLib.BuildingControl.VDI3813;
package MacroFunctions
  "Compositions of different functions referring to VDI 3813"
  extends Modelica.Icons.VariantsPackage;

  package Examples "Modelica.Icons.ExamplesPackage"
    extends Modelica.Icons.ExamplesPackage;
    model TesterMacroSunblind "Macro which implements a control for a sunblind"
      import BuildingControlLib;
      Sources.Analog.PrescribedT                         prescribedT
        annotation (Placement(transformation(extent={{-80,252},{-60,272}})));
      Sources.Analog.PrescribedT                         prescribedT1
        annotation (Placement(transformation(extent={{-80,112},{-60,132}})));
      Sources.Physical.PrescribedP                         prescribedP
        annotation (Placement(transformation(extent={{-80,226},{-60,246}})));
      Sources.Physical.PrescribedB                         prescribedB1
        annotation (Placement(transformation(extent={{-80,138},{-60,158}})));
          Sources.Presence.PrescribedP_MAN                         prescribedP_MAN
        annotation (Placement(transformation(extent={{-80,194},{-60,214}})));
      Modelica.Blocks.Sources.Constant sourceAirTempOut(k=273.15 + 10)
        "Source of temperature measurement of outdoor air temperature"
        annotation (Placement(transformation(extent={{-132,96},{-112,116}})));
      Modelica.Blocks.Sources.BooleanStep     sourceP(startTime=0, startValue=true)
        "Source to define detection of a person in a room. if == true then person present."
        annotation (Placement(transformation(extent={{-146,230},{-126,250}})));
      Modelica.Blocks.Sources.BooleanStep     sourceWindow(
          startTime=50, startValue=false)
        "Boundary condition for window detector, if false then window is open"
        annotation (Placement(transformation(extent={{-150,128},{-130,148}})));
      Modelica.Blocks.Sources.BooleanConstant sourceP_MAN(k=false)
        "Source to give feedback from user that occupant is in room. if == true then occupant present."
        annotation (Placement(transformation(extent={{-146,198},{-126,218}})));
      Modelica.Blocks.Sources.Constant sourceT_ROOM(k=273.15 + 15)
        "Boundary condition defining the room air temperature"
        annotation (Placement(transformation(extent={{-144,266},{-124,286}})));
      Sources.Analog.PrescribedH prescribedH
        annotation (Placement(transformation(extent={{-80,276},{-60,296}})));
      Modelica.Blocks.Sources.Constant sourceH(k=100000)
        "Source to define brightness of outdoor illuminance in lux"
        annotation (Placement(transformation(extent={{-146,300},{-126,320}})));
      BuildingControlLib.BuildingControl.VDI3813.MacroFunctions.MacroSunblind
        macroSunBlind
        annotation (Placement(transformation(extent={{12,50},{134,344}})));
    equation
      connect(sourceAirTempOut.y,prescribedT1. u) annotation (Line(
          points={{-111,106},{-90,106},{-90,122},{-78,122}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(sourceP.y,prescribedP. u) annotation (Line(
          points={{-125,240},{-92,240},{-92,238},{-78,238}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(sourceWindow.y,prescribedB1. u) annotation (Line(
          points={{-129,138},{-90,138},{-90,150},{-78,150}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(sourceP_MAN.y,prescribedP_MAN. u) annotation (Line(
          points={{-125,208},{-88,208},{-88,204},{-78,204}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(sourceT_ROOM.y,prescribedT. u) annotation (Line(
          points={{-123,276},{-100,276},{-100,262},{-78,262}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(sourceH.y,prescribedH. u) annotation (Line(
          points={{-125,310},{-88,310},{-88,286},{-78,286}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(prescribedH.H, macroSunBlind.H) annotation (Line(
          points={{-58.1,286},{-44,286},{-44,285.2},{13.22,285.2}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(prescribedT.T, macroSunBlind.T) annotation (Line(
          points={{-58.1,262},{-44,262},{-44,271.48},{13.83,271.48}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(prescribedP_MAN.P_MAN, macroSunBlind.P_MAN) annotation (Line(
          points={{-58.1,204},{-24,204},{-24,238.16},{18.1,238.16}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(prescribedP.P, macroSunBlind.P) annotation (Line(
          points={{-59.9,236},{-44.05,236},{-44.05,257.76},{14.44,257.76}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(prescribedB1.B, macroSunBlind.B) annotation (Line(
          points={{-59.9,148},{-40,148},{-40,183.28},{13.22,183.28}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(prescribedT1.T, macroSunBlind.T1) annotation (Line(
          points={{-58.1,122},{-6,122},{-6,167.6},{13.22,167.6}},
          color={0,0,0},
          smooth=Smooth.None));

      annotation (preferedView="Info",
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-160,60},{
                140,340}}), graphics),
        Icon(coordinateSystem(extent={{-160,60},{140,340}}, preserveAspectRatio=
               false), graphics),
        experiment(StopTime=1000),
        __Dymola_experimentSetupOutput,
        Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
    end TesterMacroSunblind;
    annotation (preferedView="Info",Documentation(info="<html>
<p>The containing models had been used to test the functionalities of the implemented sensor functions referring to VDI3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1]</a>. </p>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
  end Examples;

  model MacroSunblind "Macro which implements a control for a sunblind"

        SensorFunctions.PresenceDetection                         presenceDetection
      annotation (Placement(transformation(extent={{-60,166},{-40,186}})));
    SensorFunctions.AirTemperatureMeasurementFunctions.AirTemperatureMeasurementRoom
      airTemperatureMeasurementRoom
      annotation (Placement(transformation(extent={{-60,200},{-40,220}})));
    SensorFunctions.WindowMonitoring                         windowMonitoring
      annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
    SensorFunctions.AirTemperatureMeasurementFunctions.AirTemperatureMeasurementOutdoor
      airTemperatureMeasurementOutdoor
      annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
        ApplicationFunctions.Basic.OccupancyEvaluation
      occupancyEvaluation
      annotation (Placement(transformation(extent={{-26,22},{14,62}})));
    ApplicationFunctions.RoomClimate.SetpointCalculation
      setpointCalculation
      annotation (Placement(transformation(extent={{-26,-80},{14,-40}})));
        ApplicationFunctions.Sunshading.PriorityControl priorityControl
      annotation (Placement(transformation(extent={{-26,-34},{14,6}})));
    ActuatorFunctions.SunshadeActuator sunshadeActuator
      annotation (Placement(transformation(extent={{40,-20},{80,20}})));
    Modelica.Blocks.Sources.Constant
                                 sourceS_PROT_Pos(k=-1)
      annotation (Placement(transformation(extent={{-146,162},{-126,182}})));
    Modelica.Blocks.Sources.Constant sourceS_PROT_Angle(k=10)
      annotation (Placement(transformation(extent={{-120,140},{-100,160}})));
    Modelica.Blocks.Sources.Constant
                                 sourceS_MAINT_Pos(k=-1)
      "Source to define S_xxx input signal. Fixed to -1 to deactivate in priorityControl."
      annotation (Placement(transformation(extent={{-148,124},{-128,144}})));
    Modelica.Blocks.Sources.Constant sourceS_MAINT_Angle(k=20)
      annotation (Placement(transformation(extent={{-118,106},{-98,126}})));
    Sources.Sunshade.PrescribedS_PROT prescribedS_PROT
      annotation (Placement(transformation(extent={{-84,144},{-64,164}})));
    Sources.Sunshade.PrescribedS_MAINT prescribedS_MAINT
      annotation (Placement(transformation(extent={{-84,122},{-64,142}})));
      Modelica.Blocks.Sources.Constant
                                   sourceS_AUTO_Pos(k=-1)
      "Source to define S_xxx input signal. Fixed to -1 to deactivate in priorityControl."
      annotation (Placement(transformation(extent={{-144,80},{-124,100}})));
    Modelica.Blocks.Sources.Constant sourceS_AUTO_Angle(k=50)
      annotation (Placement(transformation(extent={{-116,62},{-96,82}})));
    Sources.Sunshade.PrescribedS_AUTO prescribedS_AUTO
      annotation (Placement(transformation(extent={{-80,80},{-60,100}})));
    ApplicationFunctions.Sunshading.AutomaticThermalControl
      automaticThermalControl
      annotation (Placement(transformation(extent={{40,-80},{80,-40}})));
    SensorFunctions.BrightnessMeasurementFunctions.BrightnessMeasurementOutdoor
      brightnessMeasurementOutdoor
      annotation (Placement(transformation(extent={{-60,228},{-40,248}})));
    Interfaces.Binary.CommandPhysicalMotorControlRelayOutput M annotation (
        Placement(transformation(extent={{136,170},{168,224}}),
          iconTransformation(
          extent={{-9,-20},{9,20}},
          rotation=-90,
          origin={112,139})));
    Interfaces.Analog.ValuePhysicalIlluminanceInput H annotation (Placement(
          transformation(extent={{-266,130},{-246,150}}), iconTransformation(
            extent={{-266,130},{-246,150}})));
    Interfaces.Presence.CommandPresenceOperatorInput P_MAN annotation (
        Placement(transformation(extent={{-250,82},{-230,102}}),
          iconTransformation(extent={{-250,82},{-230,102}})));
    Interfaces.Analog.ValuePhysicalTemperatureInput T
      "Air temperature measurement of room temperature" annotation (Placement(
          transformation(extent={{-264,116},{-244,136}}), iconTransformation(
            extent={{-264,116},{-244,136}})));
    Interfaces.Physical.ValuePhysicalPresenceInput P annotation (Placement(
          transformation(extent={{-262,102},{-242,122}}), iconTransformation(
            extent={{-262,102},{-242,122}})));
    Interfaces.Analog.ValuePhysicalTemperatureInput T1
      "Air temperature measurement of outdoor air temperature" annotation (
        Placement(transformation(extent={{-266,10},{-246,30}}),
          iconTransformation(extent={{-266,10},{-246,30}})));
    Modelica.Blocks.Sources.Constant sourceT_STA(k=0)
      "Boundary condition defining the room air temperature"
      annotation (Placement(transformation(extent={{-154,-88},{-134,-68}})));
    Interfaces.Physical.ValuePhysicalBinaryInput B annotation (Placement(
          transformation(extent={{-266,26},{-246,46}}), iconTransformation(
            extent={{-266,26},{-246,46}})));
    Sources.AirTemperature.PrescribedT_STA   prescribedT_SETPT
      annotation (Placement(transformation(extent={{-106,-96},{-86,-76}})));
        Sources.AirTemperature.PrescribedT_BMS
      prescribedT_BMS
      annotation (Placement(transformation(extent={{-94,-50},{-74,-30}})));
    Modelica.Blocks.Sources.Constant sourceT_BMS(k=0)
      "Boundary condition to set T_BMS i.e. relative change of temperature setpoint from BMS system in Kelvin. Temperature difference ! ."
      annotation (Placement(transformation(extent={{-154,-52},{-134,-32}})));
    OperatorAndDisplayFunctions.AdjustTemperatureSetpoint
      adjustTemperatureSetpoint
      annotation (Placement(transformation(extent={{-70,-92},{-50,-72}})));
    Sources.AirTemperature.PrescribedCMD_T   prescribedT_SETPT1
      annotation (Placement(transformation(extent={{-114,-72},{-94,-52}})));
    Modelica.Blocks.Sources.Constant sourceCMD_T(k=0)
      "Boundary condition to set T_SETPT i.e. relative change of temperature setpoint from user in Kelvin. Temperature difference ! ."
      annotation (Placement(transformation(extent={{-138,-70},{-118,-50}})));
  equation
    connect(presenceDetection.P_AUTO,occupancyEvaluation. P_AUTO) annotation (
        Line(
        points={{-37,176},{-32,176},{-32,50.2},{-21.8,50.2}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(airTemperatureMeasurementOutdoor.T_OUT,setpointCalculation. T_OUT)
      annotation (Line(
        points={{-37,-30},{-32,-30},{-32,-76},{-26,-76},{-26,-75.8},{-20.8,
            -75.8}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(sunshadeActuator.S_SET,priorityControl. S_SET) annotation (Line(
        points={{46,0},{30,0},{30,-14},{18,-14}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(priorityControl.B_WINDOW,windowMonitoring. B_WINDOW) annotation (Line(
        points={{-24,-4},{-32,-4},{-32,10},{-37,10}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(prescribedS_PROT.S_PROT,priorityControl. S_PROT) annotation (Line(
        points={{-62.1,154},{-32,154},{-32,-10},{-24,-10}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(prescribedS_PROT.u[1],sourceS_PROT_Pos. y) annotation (Line(
        points={{-82,153},{-92,153},{-92,172},{-125,172}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(prescribedS_PROT.u[2],sourceS_PROT_Angle. y) annotation (Line(
        points={{-82,155},{-92,155},{-92,150},{-99,150}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(prescribedS_MAINT.S_MAINT,priorityControl. S_MAINT) annotation (
        Line(
        points={{-62.1,132},{-32,132},{-32,-16},{-24,-16}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(sourceS_MAINT_Angle.y,prescribedS_MAINT. u[2]) annotation (Line(
        points={{-97,116},{-92,116},{-92,116},{-88,116},{-88,133},{-82,133}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(prescribedS_AUTO.S_AUTO,priorityControl. S_AUTO) annotation (Line(
        points={{-58.1,90},{-32,90},{-32,-28},{-24,-28}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(sourceS_AUTO_Angle.y,prescribedS_AUTO. u[2]) annotation (Line(
        points={{-95,72},{-88,72},{-88,92},{-82,92},{-82,91},{-78,91}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(occupancyEvaluation.P_ACT,automaticThermalControl. P_ACT) annotation (
       Line(
        points={{18,50},{24,50},{24,50},{30,50},{30,-50},{44,-50}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(brightnessMeasurementOutdoor.H_OUT,automaticThermalControl. H_OUT)
      annotation (Line(
        points={{-37,238},{-32,238},{-32,-90},{34,-90},{34,-58},{44,-58}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(airTemperatureMeasurementRoom.T_ROOM,automaticThermalControl. T_ROOM)
      annotation (Line(
        points={{-37,210},{-32,210},{-32,-90},{34,-90},{34,-66},{44,-66}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(setpointCalculation.T_SETPTS,automaticThermalControl. T_SETPTS)
      annotation (Line(
        points={{19.4,-60},{34,-60},{34,-74},{44,-74}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(sunshadeActuator.M, M) annotation (Line(points={{59.8,20.2},{57.9,
            20.2},{57.9,197},{152,197}}, smooth=Smooth.None));
    connect(H, brightnessMeasurementOutdoor.H) annotation (Line(
        points={{-256,140},{-110,140},{-110,248},{-50,248}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(P_MAN, occupancyEvaluation.P_MAN) annotation (Line(
        points={{-240,92},{-240,38},{-21.8,38},{-21.8,38.2}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(T, airTemperatureMeasurementRoom.T) annotation (Line(
        points={{-254,126},{-108,126},{-108,220},{-50,220}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(P, presenceDetection.P) annotation (Line(
        points={{-252,112},{-134,112},{-134,194},{-104,194},{-104,192},{-50,192},
            {-50,186}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(T1, airTemperatureMeasurementOutdoor.T) annotation (Line(
        points={{-256,20},{-46,20},{-46,-20},{-50,-20}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(B, windowMonitoring.B) annotation (Line(
        points={{-256,36},{-154,36},{-154,20},{-50,20}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(sourceS_MAINT_Pos.y, prescribedS_MAINT.u[1]) annotation (Line(
        points={{-127,134},{-104,134},{-104,131},{-82,131}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(sourceS_AUTO_Pos.y, prescribedS_AUTO.u[1]) annotation (Line(
        points={{-123,90},{-100,90},{-100,89},{-78,89}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(automaticThermalControl.S_MAN, priorityControl.S_MAN) annotation (
        Line(
        points={{84,-60},{90,-60},{90,-90},{-32,-90},{-32,-22},{-24,-22}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(sourceT_STA.y, prescribedT_SETPT.u) annotation (Line(
        points={{-133,-78},{-114,-78},{-114,-86},{-104,-86}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(sourceT_BMS.y,prescribedT_BMS. u) annotation (Line(
        points={{-133,-42},{-92,-42},{-92,-40}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(prescribedT_BMS.T_BMS, setpointCalculation.T_BMS) annotation (Line(
        points={{-72.1,-40},{-64,-40},{-64,-46},{-32,-46},{-32,-52},{-20.8,-52}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));

    connect(adjustTemperatureSetpoint.T_SETPT, setpointCalculation.T_SETPT)
      annotation (Line(
        points={{-47,-82},{-36.5,-82},{-36.5,-64},{-20.4,-64}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(prescribedT_SETPT.T_STA, adjustTemperatureSetpoint.T_STA)
      annotation (Line(
        points={{-84.1,-86},{-78.05,-86},{-78.05,-82},{-67,-82}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(prescribedT_SETPT1.CMD_T, adjustTemperatureSetpoint.CMD)
      annotation (Line(
        points={{-92.1,-62},{-76,-62},{-76,-71.9},{-60,-71.9}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(sourceCMD_T.y, prescribedT_SETPT1.u) annotation (Line(
        points={{-117,-60},{-114,-60},{-114,-62},{-112,-62}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (preferedView="Info",Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-260,
              -100},{140,200}}),      graphics={
          Rectangle(
            extent={{-252,336},{-162,-100}},
            lineColor={0,0,0},
            fillPattern=FillPattern.Solid,
            fillColor={215,215,215}),
          Rectangle(
            extent={{120,336},{210,-100}},
            lineColor={0,0,0},
            fillPattern=FillPattern.Solid,
            fillColor={215,215,215}),
          Text(
            extent={{-242,328},{-198,312}},
            lineColor={0,0,0},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid,
            textString="Inputs"),
          Text(
            extent={{132,326},{194,308}},
            lineColor={0,0,0},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid,
            textString="Outputs")}), Icon(coordinateSystem(extent={{-260,-100},
              {140,200}}, preserveAspectRatio=false), graphics={
          Rectangle(
            extent={{-258,192},{138,-52}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            lineThickness=0.5),
          Line(
            points={{-258,154},{138,154}},
            color={0,0,0},
            thickness=0.5,
            smooth=Smooth.None),
          Text(
            extent={{-160,182},{38,164}},
            lineColor={0,0,0},
            lineThickness=1,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            textString="%name",
            fontName="Arial",
            textStyle={TextStyle.Bold})}),
      Documentation(info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Block that implements a room automation control function for sunblind control; from VDI 3813 [1]. </p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p>Block calculated the setpoints for energy modes protection, economy, precomfort and comfort, heating and cooling respectively. Setpoint shifts may be induced from outside through the operator (T_BMS) or manually by the user (T_SETPT). Parameter of heating and cooling protection serve as boundaries and my not be crossed. Also a setpoint might not cross another setpoint, e.g. the setpoint for heating precomfort may not be larger than the setpoint from heating comfort. Setpoint shifts affect all setpoints equally. Setpoints comfort and precomfort are shiftable from the user and the operator. Setpoints for economy mode may be shifted only by the operator. Additionally setpoint for energy modes cooling comfort and precomfort may be shifted through the outdoor air temperature (T_OUT) termed &QUOT;summer compensation&QUOT;.</p>
<h4><span style=\"color:#008000\">Input Variables</span></h4>
<p>The following table presents the input variables of the function as specified in the standard. </p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Datatype VDI3813</h4></p></td>
<td><p align=\"center\"><h4>Semantic data type</h4></p></td>
<td><p align=\"center\"><h4>Signal flow direction</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>T_BMS</p></td>
<td valign=\"top\"><p>Temp</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Types.SetpointTemperatureOperator\">SetpointTemperatureOperator</a> </p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Setpoint shift provided by the operator of a building through a Building Management System (BMS).</p></td>
</tr>
<tr>
<td valign=\"top\"><p>T_SETPT</p></td>
<td valign=\"top\"><p>Temp</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Types.SetpointTemperatureUser\">SetpointTemperatureUser</a></p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Setpoint shift provided by the user of a room manually.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>T_OUT</p></td>
<td valign=\"top\"><p>Temp</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Types.ValueTemperatureOutdoor\">ValueTemperatureOutdoor</a></p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Measurement of outdoor air temperature. Has an effect on summer compensation.</p></td>
</tr>
</table>
<p><br><h4><span style=\"color:#008000\">Output Variables</span></h4></p>
<p>The following table presents the output variables of the function as specified in the standard.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Datatype VDI3813</h4></p></td>
<td><p align=\"center\"><h4>Semantic data type</h4></p></td>
<td><p align=\"center\"><h4>Signal flow direction</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>T_SETPS</p></td>
<td valign=\"top\"><p>Temp</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Types.SetpointHeatCoolEnergyModes\">SetpointSetpointHeatCoolEnergyModes</a> </p></td>
<td valign=\"top\"><p>Output</p></td>
<td valign=\"top\"><p>Array of setpoints for every energy mode.</p></td>
</tr>
</table>
<p><br><br><br><b><font style=\"color: #008000; \">Parameter</font></b> </p>
<p>The following table presents the parameter of the function as specified in the standard.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_SETPS</p></td>
<td valign=\"top\"><p>Array containing default setpoints for every energy mode.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_SUMM</p></td>
<td valign=\"top\"><p>Parameter to specify summer compensation behaviour.</p></td>
</tr>
</table>
<p><br><br><br><b><font style=\"color: #008000; \">References</font></b> </p>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"><tr>
<td><p>[1]</p></td>
<td><p>VDI 3813-2 - Geb&auml;udeautomation (GA) - Blatt 2: Raumautomationsfunktionen (RA-Funktionen). Beuth Verlag GmbH, Berlin, 2011. </p></td>
</tr>
</table>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
  end MacroSunblind;
  annotation (preferredView="info",Documentation(info="<html>
<p>This package contains operator and display functions desribed in VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1]</a>:</p>
<p>&QUOT;For a simplified representation of several interacting RA functions, several RA functions can be combined to give an RA macro, in which case the internal information relations need not be represented.&QUOT;  <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.6.2, p. 94]</a></p>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
end MacroFunctions;
