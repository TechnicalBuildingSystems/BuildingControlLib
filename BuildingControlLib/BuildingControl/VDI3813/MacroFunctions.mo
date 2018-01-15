within BuildingControlLib.BuildingControl.VDI3813;
package MacroFunctions
  "Compositions of different functions referring to VDI 3813"
  extends Modelica.Icons.VariantsPackage;

  package Examples "Modelica.Icons.ExamplesPackage"
    extends Modelica.Icons.ExamplesPackage;
    model TesterMacroSunblind "Macro which implements a control for a sunblind"
      import BuildingControlLib;
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
      Modelica.Blocks.Sources.Constant sourceH(k=100000)
        "Source to define brightness of outdoor illuminance in lux"
        annotation (Placement(transformation(extent={{-146,300},{-126,320}})));
      BuildingControlLib.BuildingControl.VDI3813.MacroFunctions.MacroSunblind
        macroSunBlind
        annotation (Placement(transformation(extent={{12,50},{134,344}})));
    equation

      connect(sourceH.y, macroSunBlind.H) annotation (Line(points={{-125,310},{
              -56,310},{-56,314.6},{15.05,314.6}}, color={0,0,127}));
      connect(sourceT_ROOM.y, macroSunBlind.T) annotation (Line(points={{-123,
              276},{-56,276},{-56,295},{15.05,295}}, color={0,0,127}));
      connect(sourceWindow.y, macroSunBlind.B) annotation (Line(points={{-129,
              138},{-58,138},{-58,279.32},{15.05,279.32}}, color={255,0,255}));
      connect(sourceP.y, macroSunBlind.P) annotation (Line(points={{-125,240},{
              -56,240},{-56,167.6},{15.05,167.6}}, color={255,0,255}));
      connect(sourceP_MAN.y, macroSunBlind.P_MAN) annotation (Line(points={{
              -125,208},{-56,208},{-56,136.24},{15.05,136.24}}, color={255,0,
              255}));
      connect(sourceAirTempOut.y, macroSunBlind.T1) annotation (Line(points={{
              -111,106},{-48,106},{-48,79.4},{15.05,79.4}}, color={0,0,127}));
      annotation (preferedView="Info",
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-160,60},{
                140,340}})),
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
      annotation (Placement(transformation(extent={{-218,-10},{-198,10}})));
    SensorFunctions.AirTemperatureMeasurementFunctions.AirTemperatureMeasurementRoom
      airTemperatureMeasurementRoom
      annotation (Placement(transformation(extent={{-80,120},{-60,140}})));
    SensorFunctions.WindowMonitoring                         windowMonitoring
      annotation (Placement(transformation(extent={{-180,108},{-160,128}})));
    SensorFunctions.AirTemperatureMeasurementFunctions.AirTemperatureMeasurementOutdoor
      airTemperatureMeasurementOutdoor
      annotation (Placement(transformation(extent={{-210,-100},{-190,-80}})));
        ApplicationFunctions.Basic.OccupancyEvaluation
      occupancyEvaluation
      annotation (Placement(transformation(extent={{-80,-28},{-40,12}})));
    ApplicationFunctions.RoomClimate.SetpointCalculation
      setpointCalculation
      annotation (Placement(transformation(extent={{-100,-100},{-60,-60}})));
        ApplicationFunctions.Sunshading.PriorityControl priorityControl
      annotation (Placement(transformation(extent={{-98,40},{-58,80}})));
    ActuatorFunctions.SunshadeActuator sunshadeActuator
      annotation (Placement(transformation(extent={{40,40},{80,80}})));
    Modelica.Blocks.Sources.Constant
                                 sourceS_PROT_Pos(k=-1)
      annotation (Placement(transformation(extent={{-180,74},{-160,94}})));
    Modelica.Blocks.Sources.Constant sourceS_PROT_Angle(k=10)
      annotation (Placement(transformation(extent={{-154,90},{-134,110}})));
    Modelica.Blocks.Sources.Constant
                                 sourceS_MAINT_Pos(k=-1)
      "Source to define S_xxx input signal. Fixed to -1 to deactivate in priorityControl."
      annotation (Placement(transformation(extent={{-180,38},{-160,58}})));
    Modelica.Blocks.Sources.Constant sourceS_MAINT_Angle(k=20)
      annotation (Placement(transformation(extent={{-154,54},{-134,74}})));
      Modelica.Blocks.Sources.Constant
                                   sourceS_AUTO_Pos(k=-1)
      "Source to define S_xxx input signal. Fixed to -1 to deactivate in priorityControl."
      annotation (Placement(transformation(extent={{-180,4},{-160,24}})));
    Modelica.Blocks.Sources.Constant sourceS_AUTO_Angle(k=50)
      annotation (Placement(transformation(extent={{-154,18},{-134,38}})));
    ApplicationFunctions.Sunshading.AutomaticThermalControl
      automaticThermalControl
      annotation (Placement(transformation(extent={{40,-86},{80,-46}})));
    SensorFunctions.BrightnessMeasurementFunctions.BrightnessMeasurementOutdoor
      brightnessMeasurementOutdoor
      annotation (Placement(transformation(extent={{-40,140},{-20,160}})));
    Interfaces.BooleanOutput M annotation (
        Placement(transformation(extent={{120,80},{140,100}}),
          iconTransformation(
          extent={{-9,-20},{9,20}},
          rotation=-90,
          origin={112,139})));
    Interfaces.RealInput H annotation (Placement(
          transformation(extent={{-260,160},{-240,180}}), iconTransformation(
            extent={{-260,160},{-240,180}})));
    Interfaces.BooleanInput P_MAN annotation (
        Placement(transformation(extent={{-260,-22},{-240,-2}}),
          iconTransformation(extent={{-260,-22},{-240,-2}})));
    Interfaces.RealInput T
      "Air temperature measurement of room temperature" annotation (Placement(
          transformation(extent={{-260,140},{-240,160}}), iconTransformation(
            extent={{-260,140},{-240,160}})));
    Interfaces.BooleanInput P annotation (Placement(
          transformation(extent={{-260,10},{-240,30}}),   iconTransformation(
            extent={{-260,10},{-240,30}})));
    Interfaces.RealInput T1
      "Air temperature measurement of outdoor air temperature" annotation (
        Placement(transformation(extent={{-260,-80},{-240,-60}}),
          iconTransformation(extent={{-260,-80},{-240,-60}})));
    Modelica.Blocks.Sources.Constant sourceT_STA(k=0)
      "Boundary condition defining the room air temperature"
      annotation (Placement(transformation(extent={{-220,-60},{-200,-40}})));
    Interfaces.BooleanInput B annotation (Placement(
          transformation(extent={{-260,124},{-240,144}}),
                                                        iconTransformation(
            extent={{-260,124},{-240,144}})));
    Modelica.Blocks.Sources.Constant sourceT_BMS(k=0)
      "Boundary condition to set T_BMS i.e. relative change of temperature setpoint from BMS system in Kelvin. Temperature difference ! ."
      annotation (Placement(transformation(extent={{-150,-60},{-130,-40}})));
    OperatorAndDisplayFunctions.AdjustTemperatureSetpoint
      adjustTemperatureSetpoint
      annotation (Placement(transformation(extent={{-180,-80},{-160,-60}})));
    Modelica.Blocks.Sources.Constant sourceCMD_T(k=0)
      "Boundary condition to set T_SETPT i.e. relative change of temperature setpoint from user in Kelvin. Temperature difference ! ."
      annotation (Placement(transformation(extent={{-196,-40},{-176,-20}})));
  equation
    connect(presenceDetection.P_AUTO,occupancyEvaluation.P_AUTO) annotation (
        Line(
        points={{-195,0},{-82,0},{-82,0.2},{-75.8,0.2}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(airTemperatureMeasurementOutdoor.T_OUT,setpointCalculation.T_OUT)
      annotation (Line(
        points={{-187,-90},{-160,-90},{-160,-96},{-102,-96},{-102,-95.8},{-94.8,-95.8}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(sunshadeActuator.S_SET,priorityControl.S_SET) annotation (Line(
        points={{46,60},{-54,60}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(priorityControl.B_WINDOW,windowMonitoring.B_WINDOW) annotation (Line(
        points={{-96,70},{-106,70},{-106,118},{-157,118}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(occupancyEvaluation.P_ACT,automaticThermalControl.P_ACT) annotation (
       Line(
        points={{-36,0},{20,0},{20,-56},{44,-56}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(brightnessMeasurementOutdoor.H_OUT,automaticThermalControl.H_OUT)
      annotation (Line(
        points={{-17,150},{0,150},{0,-64},{44,-64}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(airTemperatureMeasurementRoom.T_ROOM,automaticThermalControl.T_ROOM)
      annotation (Line(
        points={{-57,130},{-20,130},{-20,-72},{44,-72}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(setpointCalculation.T_SETPTS,automaticThermalControl.T_SETPTS)
      annotation (Line(
        points={{-54.6,-80},{44,-80}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(sunshadeActuator.M, M) annotation (Line(points={{59.8,80.2},{57.9,80.2},
            {57.9,90},{130,90}},         smooth=Smooth.None));
    connect(H, brightnessMeasurementOutdoor.H) annotation (Line(
        points={{-250,170},{-30,170},{-30,160}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(P_MAN, occupancyEvaluation.P_MAN) annotation (Line(
        points={{-250,-12},{-76,-12},{-76,-11.8},{-75.8,-11.8}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(T, airTemperatureMeasurementRoom.T) annotation (Line(
        points={{-250,150},{-70,150},{-70,140}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(P, presenceDetection.P) annotation (Line(
        points={{-250,20},{-208,20},{-208,20},{-208,20},{-208,20},{-208,18},{-208,
            10}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(T1, airTemperatureMeasurementOutdoor.T) annotation (Line(
        points={{-250,-70},{-200,-70},{-200,-80}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(B, windowMonitoring.B) annotation (Line(
        points={{-250,134},{-170,134},{-170,128}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(automaticThermalControl.S_MAN, priorityControl.S_MAN) annotation (
        Line(
        points={{84,-66},{90,-66},{90,-40},{-106,-40},{-106,52},{-96,52}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));

    connect(adjustTemperatureSetpoint.T_SETPT, setpointCalculation.T_SETPT)
      annotation (Line(
        points={{-157,-70},{-140,-70},{-140,-84},{-94.4,-84}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(sourceT_BMS.y, setpointCalculation.T_BMS) annotation (Line(points={{-129,
            -50},{-130,-50},{-130,-50},{-130,-50},{-120,-50},{-120,-72},{-94.8,-72}},
          color={0,0,127}));
    connect(sourceCMD_T.y, adjustTemperatureSetpoint.CMD) annotation (Line(points=
           {{-175,-30},{-175,-30},{-170,-30},{-170,-59.9}}, color={0,0,127}));
    connect(sourceT_STA.y, adjustTemperatureSetpoint.T_STA) annotation (Line(
          points={{-199,-50},{-199,-50},{-190,-50},{-190,-70},{-177,-70}}, color={
            0,0,127}));
    connect(sourceS_AUTO_Pos.y, priorityControl.S_AUTO[1]) annotation (Line(
          points={{-159,14},{-159,12},{-116,12},{-116,45},{-96,45}}, color={0,0,127}));
    connect(sourceS_AUTO_Angle.y, priorityControl.S_AUTO[2]) annotation (Line(
          points={{-133,28},{-120,28},{-120,47},{-96,47}}, color={0,0,127}));
    connect(sourceS_MAINT_Pos.y, priorityControl.S_MAINT[1]) annotation (Line(
          points={{-159,48},{-120,48},{-120,57},{-96,57}}, color={0,0,127}));
    connect(sourceS_MAINT_Angle.y, priorityControl.S_MAINT[2]) annotation (Line(
          points={{-133,64},{-120,64},{-120,59},{-96,59}}, color={0,0,127}));
    connect(sourceS_PROT_Pos.y, priorityControl.S_PROT[1]) annotation (Line(
          points={{-159,84},{-116,84},{-116,63},{-96,63}}, color={0,0,127}));
    connect(sourceS_PROT_Angle.y, priorityControl.S_PROT[2]) annotation (Line(
          points={{-133,100},{-112,100},{-112,65},{-96,65}}, color={0,0,127}));
    annotation (preferedView="Info",Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-260,
              -100},{140,200}}),      graphics={
          Rectangle(
            extent={{-260,200},{-220,-100}},
            lineColor={0,0,0},
            fillPattern=FillPattern.Solid,
            fillColor={215,215,215}),
          Rectangle(
            extent={{100,200},{140,-100}},
            lineColor={0,0,0},
            fillPattern=FillPattern.Solid,
            fillColor={215,215,215}),
          Text(
            extent={{-264,220},{-220,200}},
            lineColor={0,0,0},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid,
            textString="Inputs"),
          Text(
            extent={{100,220},{172,200}},
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
<p>This package contains operator and display functions described in VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1]</a>:</p>
<p>&QUOT;For a simplified representation of several interacting RA functions, several RA functions can be combined to give an RA macro, in which case the internal information relations need not be represented.&QUOT;  <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.6.2, p. 94]</a></p>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
end MacroFunctions;
