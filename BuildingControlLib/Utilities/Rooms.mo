within BuildingControlLib.Utilities;
package Rooms "Room models for testing control functions"

  model RoomHeating
    "Model of a room to test temperature control. Derived room model from Aixlib Case900FF."

    AixLib.Building.Components.Weather.BaseClasses.Sun sun(
      TimeCorrection=0,
      Latitude=39.76,
      Longitude=-104.9,
      DiffWeatherDataTime=-7,
      Diff_localStandardTime_WeatherDataTime=0.5)
      annotation (Placement(transformation(extent={{-142,61},{-118,85}})));
    AixLib.Building.Components.Weather.RadiationOnTiltedSurface.RadOnTiltedSurf_Perez
      radOnTiltedSurf_Perez[5](
      Azimut={180,-90,0,90,0},
      Tilt={90,90,90,90,0},
      each GroundReflection=0.2,
      each Latitude=39.76,
      each h=1609,
      each WeatherFormat=2) "N,E,S,W, Horz"
      annotation (Placement(transformation(extent={{-102,56},{-74,84}})));

    Modelica.Blocks.Sources.CombiTimeTable Solar_Radiation(
      tableOnFile=true,
      tableName="Table",
      columns={2,3},
      fileName=
          Modelica.Utilities.Files.loadResource("modelica://AixLib/Resources/WeatherData/Weatherdata_ASHARE140.mat"))
      annotation (Placement(transformation(extent={{-114,0},{-94,20}})));
    Modelica.Blocks.Sources.CombiTimeTable Source_Weather(
      tableOnFile=true,
      tableName="Table",
      columns={4,5,6,7},
      fileName=
          Modelica.Utilities.Files.loadResource("modelica://AixLib/Resources/WeatherData/Weatherdata_ASHARE140.mat"))
      annotation (Placement(transformation(extent={{-114,30},{-94,50}})));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature outsideTemp
      "ambient temperature"
      annotation (Placement(transformation(extent={{-70,41},{-59,52}})));
    AixLib.Building.HighOrder.Rooms.ASHRAE140.SouthFacingWindows Room(TypOW=
          AixLib.DataBase.Walls.ASHRAE140.OW_Case900(), TypFL=
          AixLib.DataBase.Walls.ASHRAE140.FL_Case900(),
      outerWall_South(withSunblind=false))
      annotation (Placement(transformation(extent={{-9,17},{33,58}})));
    AixLib.Utilities.Sources.HourOfDay hourOfDay
      annotation (Placement(transformation(extent={{80,69},{100,89}})));
    Modelica.Blocks.Interfaces.RealOutput RoomTemperature(unit="degC") "in degC"
      annotation (Placement(transformation(extent={{77,37},{97,57}})));
    Modelica.Blocks.Sources.Constant AirExchangeRate(k=0.41)
      annotation (Placement(transformation(extent={{-40,-50},{-27,-37}})));
    Modelica.Blocks.Sources.Constant Source_InternalGains_convective(k=0.4*200)
      annotation (Placement(transformation(extent={{-112,-31},{-99,-18}})));
    Modelica.Blocks.Sources.Constant Source_InternalGains_radiative(k=0.6*200)
      annotation (Placement(transformation(extent={{-112,-58},{-100,-46}})));
    Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow Ground(Q_flow=0)
      "adiabatic boundary"
      annotation (Placement(transformation(extent={{-75,0},{-55,20}})));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow
      InternalGains_convective
      annotation (Placement(transformation(extent={{-91,-34},{-71,-14}})));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow
      InternalGains_radiative
      annotation (Placement(transformation(extent={{-92,-62},{-72,-42}})));
    Modelica.Blocks.Interfaces.RealInput valveSignalInput
      "Normalized control signal of heating valve input"
      annotation (Placement(transformation(extent={{-165,-93},{-140,-68}})));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow roomHeater(T_ref=313.15)
      "Idealized model of a Heater to heat room" annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={20,-30})));
    Modelica.Blocks.Math.Gain normalizeValveSignal(k=1*1000)
      "Calculate heating power from normalized valve signal. Heating power manually fixed to 3 kilowatts"
      annotation (Placement(transformation(
          extent={{-4.5,-4.5},{4.5,4.5}},
          rotation=90,
          origin={21.5,-55.5})));
  equation
      //Connections for input solar model
    for i in 1:5 loop
      connect(sun.OutDayAngleSun, radOnTiltedSurf_Perez[i].InDayAngleSun);
      connect(sun.OutHourAngleSun, radOnTiltedSurf_Perez[i].InHourAngleSun);
      connect(sun.OutDeclinationSun, radOnTiltedSurf_Perez[i].InDeclinationSun);
      connect(Solar_Radiation.y[1], radOnTiltedSurf_Perez[i].solarInput1);
      connect(Solar_Radiation.y[2], radOnTiltedSurf_Perez[i].solarInput2);
    end for;

    // Set outputs
     RoomTemperature = Modelica.SIunits.Conversions.to_degC(Room.airload.T);

    connect(Source_Weather.y[1], outsideTemp.T) annotation (Line(
        points={{-93,40},{-80,40},{-80,46.5},{-71.1,46.5}},
        color={0,0,127}));
    connect(radOnTiltedSurf_Perez.OutTotalRadTilted, Room.SolarRadiationPort)
      annotation (Line(
        points={{-75.4,75.6},{-50,75.6},{-50,49.8},{-11.1,49.8}},
        color={255,128,0}));
    connect(outsideTemp.port, Room.Therm_outside) annotation (Line(
        points={{-59,46.5},{-55,46.5},{-55,47},{-50,47},{-50,57.385},{-10.05,
            57.385}},
        color={191,0,0}));

    connect(Source_Weather.y[2], Room.WindSpeedPort) annotation (Line(
        points={{-93,40},{-11.1,40},{-11.1,43.65}},
        color={0,0,127}));
    connect(AirExchangeRate.y, Room.AER) annotation (Line(
        points={{-26.35,-43.5},{-20,-43.5},{-20,27.25},{-11.1,27.25}},
        color={0,0,127}));
    connect(Ground.port, Room.Therm_ground) annotation (Line(
        points={{-55,10},{5.28,10},{5.28,17.82}},
        color={191,0,0}));
    connect(Source_InternalGains_convective.y, InternalGains_convective.Q_flow)
      annotation (Line(
        points={{-98.35,-24.5},{-93,-24.5},{-93,-23},{-92,-23},{-92,-24},{-91,-24}},
        color={0,0,127}));

    connect(Source_InternalGains_radiative.y, InternalGains_radiative.Q_flow)
      annotation (Line(
        points={{-99.4,-52},{-92,-52}},
        color={0,0,127}));
    connect(InternalGains_convective.port, Room.thermRoom) annotation (Line(
        points={{-71,-24},{-50,-24},{-50,-14},{6,-14},{6,42.215},{5.91,42.215}},
        color={191,0,0}));
    connect(InternalGains_radiative.port, Room.starRoom) annotation (Line(
        points={{-72,-52},{-60,-52},{-60,-24},{-50,-24},{-50,-14},{13.89,-14},{
            13.89,42.83}},
        color={191,0,0}));
    connect(roomHeater.port, Room.thermRoom) annotation (Line(
        points={{20,-20},{13,-20},{13,42.215},{5.91,42.215}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(normalizeValveSignal.y, roomHeater.Q_flow) annotation (Line(
        points={{21.5,-50.55},{21.5,-45.775},{20,-45.775},{20,-40}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(normalizeValveSignal.u, valveSignalInput) annotation (Line(
        points={{21.5,-60.9},{20.75,-60.9},{20.75,-80.5},{-152.5,-80.5}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Icon(coordinateSystem(extent={{-100,-100},{100,100}},
                          preserveAspectRatio=false),
                                        graphics={
          Rectangle(
            extent={{-100,92},{94,-92}},
            lineColor={215,215,215},
            fillColor={0,127,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-86,76},{80,-80}},
            lineColor={135,135,135},
            fillColor={135,135,135},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-100,26},{-86,-34}},
            lineColor={170,213,255},
            fillColor={170,213,255},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-22,12},{22,-12}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid,
            textString="Window",
            textStyle={TextStyle.Bold},
            origin={-94,-2},
            rotation=90),
          Text(
            extent={{-54,-54},{54,-76}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid,
            textString="Length"),
          Text(
            extent={{-22,11},{22,-11}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid,
            textString="width",
            origin={65,0},
            rotation=90),
          Text(
            extent={{30,84},{90,56}},
            lineColor={0,0,0},
            textString="RoomTemperature",
            textStyle={TextStyle.Bold}),
          Text(
            extent={{-146,-46},{-40,-70}},
            lineColor={0,0,0},
            textStyle={TextStyle.Bold},
            textString="NominalSignalInputHeatingValve")}),
                           Diagram(coordinateSystem(
          extent={{-150,-100},{120,90}},
          preserveAspectRatio=false,
          grid={1,1}), graphics={
          Rectangle(
            extent={{-48,90},{48,-10}},
            lineColor={0,0,255},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-116,-13},{-60,-70}},
            lineColor={0,0,127},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{50,90},{120,-100}},
            lineColor={0,0,255},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-150,90},{-50,-10}},
            lineColor={0,0,255},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),Text(
            extent={{-150,20},{-122,4}},
            lineColor={0,0,255},
            textString="1 - Direct normal irradiance in W/m2
2 - global horizontal
     radiance in W/m2
"),       Text(
            extent={{-147,-2},{-79,-10}},
            lineColor={0,0,255},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid,
            textString="Weather boundary conditions"),
                                           Text(
            extent={{-148,48},{-116,30}},
            lineColor={0,0,255},
            textString="1 - Air Temperature in K
2 - Wind Speed m/s
3- Dew Point Temperature in K
4- Cloud Cover"),
          Text(
            extent={{35,-91},{96,-99}},
            lineColor={0,0,255},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid,
            textString="Outputs"),
          Rectangle(
            extent={{-50,-14},{47,-64}},
            lineColor={0,0,127},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-54,-55},{7,-63}},
            lineColor={0,0,255},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid,
            textString="HVAC system"),
          Text(
            extent={{-125,-61},{-68,-68}},
            lineColor={0,0,255},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid,
            textString="Internal gains"),
          Text(
            extent={{-57,-2},{11,-10}},
            lineColor={0,0,255},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid,
            textString="Building physics")}),
                    Icon(coordinateSystem(
          extent={{-150,-100},{120,90}},
          preserveAspectRatio=false,
          grid={1,1})),
      experiment(StopTime=3.1536e+007, Interval=3600),
      __Dymola_experimentSetupOutput(events=false),
      Documentation(revisions="<html>
 <ul>
 <li><i>March 9, 2015</i> by Ana Constantin:<br/>Implemented</li>
 </ul>
 </html>", info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Model of a room with an real input to deliver a control signal [0,1] to the heater and as an output the room temperature as simulated.</p>
<h4><span style=\"color: #008000\">Acknowledgements</span></h4>
<p>This model is derived from the model 
<a href=\"AixLib.Building.HighOrder.Examples.Validation.ASHRAE140.Case900FF\">Case900FF</a> from the AixLib library 
<a href=\"https://www.github.com/RWTH-EBC/AixLib\">https://www.github.com/RWTH-EBC/AixLib</a></p>

</html>"));
  end RoomHeating;

  model RoomSunshade
    "Model to test a sunshade automation system. Derived room model from Aixlib Case900FF."

      parameter AixLib.DataBase.Profiles.Profile_BaseDataDefinition VentilationProfile = AixLib.DataBase.Profiles.Ventilation_2perDay_Mean05perH();

    AixLib.Building.Components.Weather.BaseClasses.Sun sun(
      TimeCorrection=0,
      Latitude=39.76,
      Longitude=-104.9,
      DiffWeatherDataTime=-7,
      Diff_localStandardTime_WeatherDataTime=0.5)
      annotation (Placement(transformation(extent={{-142,61},{-118,85}})));
    AixLib.Building.Components.Weather.RadiationOnTiltedSurface.RadOnTiltedSurf_Perez
      radOnTiltedSurf_Perez[5](
      Azimut={180,-90,0,90,0},
      Tilt={90,90,90,90,0},
      each GroundReflection=0.2,
      each Latitude=39.76,
      each h=1609,
      each WeatherFormat=2) "N,E,S,W, Horz"
      annotation (Placement(transformation(extent={{-102,56},{-74,84}})));

    Modelica.Blocks.Sources.CombiTimeTable Solar_Radiation(
      tableOnFile=true,
      tableName="Table",
      columns={2,3},
      fileName=
          Modelica.Utilities.Files.loadResource("modelica://AixLib/Resources/WeatherData/Weatherdata_ASHARE140.mat"))
      annotation (Placement(transformation(extent={{-114,0},{-94,20}})));
    Modelica.Blocks.Sources.CombiTimeTable Source_Weather(
      tableOnFile=true,
      tableName="Table",
      columns={4,5,6,7},
      fileName=
          Modelica.Utilities.Files.loadResource("modelica://AixLib/Resources/WeatherData/Weatherdata_ASHARE140.mat"))
      annotation (Placement(transformation(extent={{-114,30},{-94,50}})));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature outsideTemp
      "ambient temperature"
      annotation (Placement(transformation(extent={{-70,41},{-59,52}})));
    SouthFacingWindows Room(
      TypOW=AixLib.DataBase.Walls.ASHRAE140.OW_Case900(),
      TypFL=AixLib.DataBase.Walls.ASHRAE140.FL_Case900(),
      outerWall_South(withSunblind=true))
      annotation (Placement(transformation(extent={{-9,17},{33,58}})));
    AixLib.Utilities.Sources.HourOfDay hourOfDay
      annotation (Placement(transformation(extent={{80,69},{100,89}})));
    Modelica.Blocks.Interfaces.RealOutput yRoomTemperature "in degC"
      annotation (Placement(transformation(extent={{100,39},{120,59}}),
          iconTransformation(extent={{100,39},{120,59}})));
    Modelica.Blocks.Sources.Constant Source_InternalGains_convective(k=0.4*200)
      annotation (Placement(transformation(extent={{-112,-31},{-99,-18}})));
    Modelica.Blocks.Sources.Constant Source_InternalGains_radiative(k=0.6*200)
      annotation (Placement(transformation(extent={{-112,-58},{-100,-46}})));
    Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow Ground(Q_flow=0)
      "adiabatic boundary"
      annotation (Placement(transformation(extent={{-75,0},{-55,20}})));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow
      InternalGains_convective
      annotation (Placement(transformation(extent={{-91,-34},{-71,-14}})));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow
      InternalGains_radiative
      annotation (Placement(transformation(extent={{-92,-62},{-72,-42}})));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow roomHeater(T_ref=313.15)
      "Idealized model of a Heater to heat room" annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={8,-32})));
    Modelica.Blocks.Math.Gain normalizeValveSignal(k=1000)
      "Calculate normalized valve signal bei dividing by maximum volume flow rate and multiplying by the heating source power"
      annotation (Placement(transformation(
          extent={{-4.5,-4.5},{4.5,4.5}},
          rotation=90,
          origin={9.5,-56.5})));
    Modelica.Blocks.Interfaces.BooleanInput uSunblind
      "Boolean input, if true then sunshade deployed, irradation reduced"
      annotation (Placement(transformation(
          extent={{-10.5,-10.5},{10.5,10.5}},
          rotation=0,
          origin={-142.5,-79.5}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-90,-50})));
    Modelica.Blocks.Interfaces.RealOutput yOutdoorAirTemperature "in degC"
      annotation (Placement(transformation(extent={{100,19},{120,39}}),
          iconTransformation(extent={{100,19},{120,39}})));
    Modelica.Blocks.Sources.CombiTimeTable VentilationWindow(
      columns={2,3,4,5,6},
      extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic,
      tableOnFile=false,
      table=VentilationProfile.Profile)
      "Profile to simulate the opening of the window"
      annotation (Placement(transformation(extent={{-34,-47},{-14,-27}})));
    Modelica.Blocks.Interfaces.BooleanOutput yBWindow
      "indicates if Window is opened"
      annotation (Placement(transformation(extent={{100,-1},{120,19}}),
          iconTransformation(extent={{100,-1},{120,19}})));
    Modelica.Blocks.Interfaces.BooleanOutput yPresence
      "indicates if room is occupied"
      annotation (Placement(transformation(extent={{100,-21},{120,-1}}),
          iconTransformation(extent={{100,-21},{120,-1}})));
    AixLib.Controls.SetPoints.OccupancySchedule occSch(occupancy=3600*{8,10,12,18})
      annotation (Placement(transformation(extent={{51,-23},{71,-3}})));
    Modelica.Blocks.Sources.Constant constHeatControlInput(k=0.5)
      annotation (Placement(transformation(extent={{-25,-90},{-5,-70}})));
    Modelica.Blocks.Interfaces.RealOutput yIlluminance "lux" annotation (
        Placement(transformation(extent={{101,-39},{121,-19}}),
          iconTransformation(extent={{100,59},{120,79}})));
  equation
      //Connections for input solar model
    for i in 1:5 loop
      connect(sun.OutDayAngleSun, radOnTiltedSurf_Perez[i].InDayAngleSun);
      connect(sun.OutHourAngleSun, radOnTiltedSurf_Perez[i].InHourAngleSun);
      connect(sun.OutDeclinationSun, radOnTiltedSurf_Perez[i].InDeclinationSun);
      connect(Solar_Radiation.y[1], radOnTiltedSurf_Perez[i].solarInput1);
      connect(Solar_Radiation.y[2], radOnTiltedSurf_Perez[i].solarInput2);
    end for;

    // Set outputs
     yRoomTemperature = Room.airload.T;
     yOutdoorAirTemperature = Source_Weather.y[1];
     yIlluminance = 2.49*radOnTiltedSurf_Perez[5].OutTotalRadTilted.I;
     if VentilationWindow.y[1] > 0 then
       yBWindow =  false;// If window is opened then yBWindow == false
     else
       yBWindow =  true; // If window is closed then yBWindow == true
     end if;

    connect(Source_Weather.y[1], outsideTemp.T) annotation (Line(
        points={{-93,40},{-80,40},{-80,46.5},{-71.1,46.5}},
        color={0,0,127}));
    connect(radOnTiltedSurf_Perez.OutTotalRadTilted, Room.SolarRadiationPort)
      annotation (Line(
        points={{-75.4,75.6},{-50,75.6},{-50,49.8},{-11.1,49.8}},
        color={255,128,0}));
    connect(outsideTemp.port, Room.Therm_outside) annotation (Line(
        points={{-59,46.5},{-55,46.5},{-55,47},{-50,47},{-50,57.385},{-10.05,
            57.385}},
        color={191,0,0}));

    connect(Source_Weather.y[2], Room.WindSpeedPort) annotation (Line(
        points={{-93,40},{-11.1,40},{-11.1,43.65}},
        color={0,0,127}));
    connect(Ground.port, Room.Therm_ground) annotation (Line(
        points={{-55,10},{5.28,10},{5.28,17.82}},
        color={191,0,0}));
    connect(Source_InternalGains_convective.y, InternalGains_convective.Q_flow)
      annotation (Line(
        points={{-98.35,-24.5},{-93,-24.5},{-93,-23},{-92,-23},{-92,-24},{-91,-24}},
        color={0,0,127}));

    connect(Source_InternalGains_radiative.y, InternalGains_radiative.Q_flow)
      annotation (Line(
        points={{-99.4,-52},{-92,-52}},
        color={0,0,127}));
    connect(InternalGains_convective.port, Room.thermRoom) annotation (Line(
        points={{-71,-24},{-50,-24},{-50,-14},{6,-14},{6,42.215},{5.91,42.215}},
        color={191,0,0}));
    connect(InternalGains_radiative.port, Room.starRoom) annotation (Line(
        points={{-72,-52},{-60,-52},{-60,-24},{-50,-24},{-50,-14},{13.89,-14},{
            13.89,42.83}},
        color={191,0,0}));
    connect(roomHeater.port, Room.thermRoom) annotation (Line(
        points={{8,-22},{7,-22},{7,-14},{6,-14},{6,42.215},{5.91,42.215}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(normalizeValveSignal.y, roomHeater.Q_flow) annotation (Line(
        points={{9.5,-51.55},{9.5,-45.775},{8,-45.775},{8,-42}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(uSunblind, Room.uSunblind) annotation (Line(
        points={{-142.5,-79.5},{-48,-79.5},{-48,34.015},{-10.05,34.015}},
        color={255,0,255},
        smooth=Smooth.None));

    connect(VentilationWindow.y[1], Room.AER) annotation (Line(
        points={{-13,-37},{-13,27.25},{-11.1,27.25}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(occSch.occupied, yPresence) annotation (Line(
        points={{72,-19},{79,-19},{79,-11},{110,-11}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(yPresence, yPresence) annotation (Line(
        points={{110,-11},{110,-11},{110,-11}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(normalizeValveSignal.u, constHeatControlInput.y) annotation (Line(
        points={{9.5,-61.9},{9.5,-71.45},{-4,-71.45},{-4,-80}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Icon(coordinateSystem(extent={{-100,-100},{100,100}},
                          preserveAspectRatio=false),
                                        graphics={
          Rectangle(
            extent={{-68,90},{94,-92}},
            lineColor={215,215,215},
            fillColor={0,127,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-52,74},{80,-80}},
            lineColor={135,135,135},
            fillColor={135,135,135},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-66,34},{-52,-26}},
            lineColor={170,213,255},
            fillColor={170,213,255},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-22,12},{22,-12}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid,
            textString="Window",
            textStyle={TextStyle.Bold},
            origin={-60,2},
            rotation=90),
          Text(
            extent={{-54,-54},{54,-76}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid,
            textString="Length"),
          Text(
            extent={{-22,11},{22,-11}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid,
            textString="width",
            origin={65,0},
            rotation=90),
          Text(
            extent={{30,84},{90,56}},
            lineColor={0,0,0},
            textStyle={TextStyle.Bold},
            textString="Outputs"),
          Text(
            extent={{-53,12},{53,-12}},
            lineColor={0,0,0},
            textStyle={TextStyle.Bold},
            textString="Inputs",
            origin={-91,42},
            rotation=90)}),Diagram(coordinateSystem(
          extent={{-180,-100},{120,90}},
          preserveAspectRatio=false,
          grid={1,1}), graphics={
          Rectangle(
            extent={{-179,-14},{-120,-100}},
            lineColor={0,0,255},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-48,90},{48,-10}},
            lineColor={0,0,255},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-116,-13},{-60,-70}},
            lineColor={0,0,127},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{50,90},{120,-100}},
            lineColor={0,0,255},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-160,90},{-50,-10}},
            lineColor={0,0,255},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),Text(
            extent={{-150,20},{-122,4}},
            lineColor={0,0,255},
            textString="1 - Direct normal irradiance in W/m2
2 - global horizontal
     radiance in W/m2
"),       Text(
            extent={{-147,-2},{-79,-10}},
            lineColor={0,0,255},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid,
            textString="Weather boundary conditions"),
                                           Text(
            extent={{-148,48},{-116,30}},
            lineColor={0,0,255},
            textString="1 - Air Temperature in K
2 - Wind Speed m/s
3- Dew Point Temperature in K
4- Cloud Cover"),
          Text(
            extent={{35,-91},{96,-99}},
            lineColor={0,0,255},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid,
            textString="Outputs"),
          Rectangle(
            extent={{-51,-13},{46,-63}},
            lineColor={0,0,127},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-54,-55},{7,-63}},
            lineColor={0,0,255},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid,
            textString="HVAC system"),
          Text(
            extent={{-125,-61},{-68,-68}},
            lineColor={0,0,255},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid,
            textString="Internal gains"),
          Text(
            extent={{-57,-2},{11,-10}},
            lineColor={0,0,255},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid,
            textString="Building physics"),
          Text(
            extent={{-170,-89},{-109,-97}},
            lineColor={0,0,255},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid,
            textString="Inputs")}),
                    Icon(coordinateSystem(
          extent={{-150,-100},{120,90}},
          preserveAspectRatio=false,
          grid={1,1})),
      experiment(StopTime=3.1536e+007, Interval=3600),
      __Dymola_experimentSetupOutput(events=false),
      Documentation(revisions="<html>
 <ul>
 <li><i>March 9, 2015</i> by Ana Constantin:<br/>Implemented</li>
 </ul>
 </html>", info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Model of a room with an real input to deliver a control signal [0,1] to the heater and as an output the room temperature as simulated.</p>
<h4><span style=\"color: #008000\">Acknowledgements</span></h4>
<p>This model is derived from the model 
<a href=\"AixLib.Building.HighOrder.Examples.Validation.ASHRAE140.Case900FF\">Case900FF</a> from the AixLib library 
<a href=\"https://www.github.com/RWTH-EBC/AixLib\">https://www.github.com/RWTH-EBC/AixLib</a></p>

</html>"));
  end RoomSunshade;

  model RoomHeatingSunshade "Derived room model from Aixlib Case900FF."

      parameter AixLib.DataBase.Profiles.Profile_BaseDataDefinition VentilationProfile = AixLib.DataBase.Profiles.Ventilation_2perDay_Mean05perH();

    AixLib.Building.Components.Weather.BaseClasses.Sun sun(
      TimeCorrection=0,
      Latitude=39.76,
      Longitude=-104.9,
      DiffWeatherDataTime=-7,
      Diff_localStandardTime_WeatherDataTime=0.5)
      annotation (Placement(transformation(extent={{-142,61},{-118,85}})));
    AixLib.Building.Components.Weather.RadiationOnTiltedSurface.RadOnTiltedSurf_Perez
      radOnTiltedSurf_Perez[5](
      Azimut={180,-90,0,90,0},
      Tilt={90,90,90,90,0},
      each GroundReflection=0.2,
      each Latitude=39.76,
      each h=1609,
      each WeatherFormat=2) "N,E,S,W, Horz"
      annotation (Placement(transformation(extent={{-102,56},{-74,84}})));

    Modelica.Blocks.Sources.CombiTimeTable Solar_Radiation(
      tableOnFile=true,
      tableName="Table",
      columns={2,3},
      fileName=
          Modelica.Utilities.Files.loadResource("modelica://AixLib/Resources/WeatherData/Weatherdata_ASHARE140.mat"))
      annotation (Placement(transformation(extent={{-114,0},{-94,20}})));
    Modelica.Blocks.Sources.CombiTimeTable Source_Weather(
      tableOnFile=true,
      tableName="Table",
      columns={4,5,6,7},
      fileName=
          Modelica.Utilities.Files.loadResource("modelica://AixLib/Resources/WeatherData/Weatherdata_ASHARE140.mat"))
      annotation (Placement(transformation(extent={{-114,30},{-94,50}})));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature outsideTemp
      "ambient temperature"
      annotation (Placement(transformation(extent={{-70,41},{-59,52}})));
    SouthFacingWindows Room(
      TypOW=AixLib.DataBase.Walls.ASHRAE140.OW_Case900(),
      TypFL=AixLib.DataBase.Walls.ASHRAE140.FL_Case900(),
      outerWall_South(withSunblind=true))
      annotation (Placement(transformation(extent={{-9,17},{33,58}})));
    AixLib.Utilities.Sources.HourOfDay hourOfDay
      annotation (Placement(transformation(extent={{80,69},{100,89}})));
    Modelica.Blocks.Interfaces.RealOutput yRoomTemperature "in degC"
      annotation (Placement(transformation(extent={{99,39},{119,59}}),
          iconTransformation(extent={{99,39},{119,59}})));
    Modelica.Blocks.Sources.Constant Source_InternalGains_convective(k=0.4*200)
      annotation (Placement(transformation(extent={{-112,-31},{-99,-18}})));
    Modelica.Blocks.Sources.Constant Source_InternalGains_radiative(k=0.6*200)
      annotation (Placement(transformation(extent={{-112,-58},{-100,-46}})));
    Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow Ground(Q_flow=0)
      "adiabatic boundary"
      annotation (Placement(transformation(extent={{-75,0},{-55,20}})));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow
      InternalGains_convective
      annotation (Placement(transformation(extent={{-91,-34},{-71,-14}})));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow
      InternalGains_radiative
      annotation (Placement(transformation(extent={{-92,-62},{-72,-42}})));
    Modelica.Blocks.Interfaces.RealInput uValveSignalInput
      "Normalized control signal of heating valve input"
      annotation (Placement(transformation(extent={{-100,-101},{-75,-76}}),
          iconTransformation(extent={{-100,-79},{-80,-60}})));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow roomHeater(T_ref=313.15)
      "Idealized model of a Heater to heat room" annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={8,-32})));
    Modelica.Blocks.Math.Gain normalizeValveSignal(k=1/5.2*1000)
      "Calculate normalized valve signal bei dividing by maximum volume flow rate and multiplying by the heating source power"
      annotation (Placement(transformation(
          extent={{-4.5,-4.5},{4.5,4.5}},
          rotation=90,
          origin={9.5,-56.5})));
    Modelica.Blocks.Interfaces.BooleanInput uSunblind
      "Boolean input, if true then sunshade deployed, irradation reduced"
      annotation (Placement(transformation(
          extent={{-10.5,-10.5},{10.5,10.5}},
          rotation=0,
          origin={-179.5,-94.5}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-90,-50})));
    Modelica.Blocks.Interfaces.RealOutput yOutdoorAirTemperature "in degC"
      annotation (Placement(transformation(extent={{100,19},{120,39}}),
          iconTransformation(extent={{100,19},{120,39}})));
    Modelica.Blocks.Sources.CombiTimeTable VentilationWindow(
      columns={2,3,4,5,6},
      extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic,
      tableOnFile=false,
      table=VentilationProfile.Profile)
      "Profile to simulate the opening of the window"
      annotation (Placement(transformation(extent={{-34,-47},{-14,-27}})));
    Modelica.Blocks.Interfaces.BooleanOutput yBWindow
      "indicates if Window is opened"
      annotation (Placement(transformation(extent={{100,-1},{120,19}}),
          iconTransformation(extent={{100,-1},{120,19}})));
    Modelica.Blocks.Interfaces.BooleanOutput yPresence
      "indicates if room is occupied"
      annotation (Placement(transformation(extent={{100,-21},{120,-1}}),
          iconTransformation(extent={{100,-21},{120,-1}})));
    AixLib.Controls.SetPoints.OccupancySchedule occSch(occupancy=3600*{8,10,12,18})
      annotation (Placement(transformation(extent={{51,-23},{71,-3}})));
  equation
      //Connections for input solar model
    for i in 1:5 loop
      connect(sun.OutDayAngleSun, radOnTiltedSurf_Perez[i].InDayAngleSun);
      connect(sun.OutHourAngleSun, radOnTiltedSurf_Perez[i].InHourAngleSun);
      connect(sun.OutDeclinationSun, radOnTiltedSurf_Perez[i].InDeclinationSun);
      connect(Solar_Radiation.y[1], radOnTiltedSurf_Perez[i].solarInput1);
      connect(Solar_Radiation.y[2], radOnTiltedSurf_Perez[i].solarInput2);
    end for;

    // Set outputs
     yRoomTemperature = Modelica.SIunits.Conversions.to_degC(Room.airload.T);
     yOutdoorAirTemperature = Modelica.SIunits.Conversions.to_degC(Source_Weather.y[1]);
     if VentilationWindow.y[1] > 0 then
       yBWindow =  false;// If window is opened then yBWindow == false
     else
       yBWindow =  true; // If window is closed then yBWindow == true
     end if;

    connect(Source_Weather.y[1], outsideTemp.T) annotation (Line(
        points={{-93,40},{-80,40},{-80,46.5},{-71.1,46.5}},
        color={0,0,127}));
    connect(radOnTiltedSurf_Perez.OutTotalRadTilted, Room.SolarRadiationPort)
      annotation (Line(
        points={{-75.4,75.6},{-50,75.6},{-50,49.8},{-11.1,49.8}},
        color={255,128,0}));
    connect(outsideTemp.port, Room.Therm_outside) annotation (Line(
        points={{-59,46.5},{-55,46.5},{-55,47},{-50,47},{-50,57.385},{-10.05,
            57.385}},
        color={191,0,0}));

    connect(Source_Weather.y[2], Room.WindSpeedPort) annotation (Line(
        points={{-93,40},{-11.1,40},{-11.1,43.65}},
        color={0,0,127}));
    connect(Ground.port, Room.Therm_ground) annotation (Line(
        points={{-55,10},{5.28,10},{5.28,17.82}},
        color={191,0,0}));
    connect(Source_InternalGains_convective.y, InternalGains_convective.Q_flow)
      annotation (Line(
        points={{-98.35,-24.5},{-93,-24.5},{-93,-23},{-92,-23},{-92,-24},{-91,-24}},
        color={0,0,127}));

    connect(Source_InternalGains_radiative.y, InternalGains_radiative.Q_flow)
      annotation (Line(
        points={{-99.4,-52},{-92,-52}},
        color={0,0,127}));
    connect(InternalGains_convective.port, Room.thermRoom) annotation (Line(
        points={{-71,-24},{-50,-24},{-50,-14},{6,-14},{6,42.215},{5.91,42.215}},
        color={191,0,0}));
    connect(InternalGains_radiative.port, Room.starRoom) annotation (Line(
        points={{-72,-52},{-60,-52},{-60,-24},{-50,-24},{-50,-14},{13.89,-14},{
            13.89,42.83}},
        color={191,0,0}));
    connect(roomHeater.port, Room.thermRoom) annotation (Line(
        points={{8,-22},{7,-22},{7,-14},{6,-14},{6,42.215},{5.91,42.215}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(normalizeValveSignal.y, roomHeater.Q_flow) annotation (Line(
        points={{9.5,-51.55},{9.5,-45.775},{8,-45.775},{8,-42}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(normalizeValveSignal.u, uValveSignalInput) annotation (Line(
        points={{9.5,-61.9},{10.75,-61.9},{10.75,-88.5},{-87.5,-88.5}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(uSunblind, Room.uSunblind) annotation (Line(
        points={{-179.5,-94.5},{-48,-94.5},{-48,7},{-48,34.015},{-29,34.015},{-10.05,
            34.015}},
        color={255,0,255},
        smooth=Smooth.None));

    connect(VentilationWindow.y[1], Room.AER) annotation (Line(
        points={{-13,-37},{-13,-5},{-13,27.25},{-11.1,27.25}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(occSch.occupied, yPresence) annotation (Line(
        points={{72,-19},{79,-19},{79,-11},{110,-11}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(yPresence, yPresence) annotation (Line(
        points={{110,-11},{110,-11},{110,-11}},
        color={255,0,255},
        smooth=Smooth.None));
    annotation (Icon(coordinateSystem(extent={{-100,-100},{100,100}},
                          preserveAspectRatio=false),
                                        graphics={
          Rectangle(
            extent={{-68,90},{94,-92}},
            lineColor={215,215,215},
            fillColor={0,127,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-52,74},{80,-80}},
            lineColor={135,135,135},
            fillColor={135,135,135},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-66,34},{-52,-26}},
            lineColor={170,213,255},
            fillColor={170,213,255},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-22,12},{22,-12}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid,
            textString="Window",
            textStyle={TextStyle.Bold},
            origin={-60,2},
            rotation=90),
          Text(
            extent={{-54,-54},{54,-76}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid,
            textString="Length"),
          Text(
            extent={{-22,11},{22,-11}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid,
            textString="width",
            origin={65,0},
            rotation=90),
          Text(
            extent={{30,84},{90,56}},
            lineColor={0,0,0},
            textStyle={TextStyle.Bold},
            textString="Outputs"),
          Text(
            extent={{-53,12},{53,-12}},
            lineColor={0,0,0},
            textStyle={TextStyle.Bold},
            textString="Inputs",
            origin={-91,42},
            rotation=90)}),Diagram(coordinateSystem(
          extent={{-180,-100},{120,90}},
          preserveAspectRatio=false,
          grid={1,1}), graphics={
          Rectangle(
            extent={{-179,-14},{-120,-100}},
            lineColor={0,0,255},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-48,90},{48,-10}},
            lineColor={0,0,255},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-116,-13},{-60,-70}},
            lineColor={0,0,127},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{50,90},{120,-100}},
            lineColor={0,0,255},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-150,90},{-50,-10}},
            lineColor={0,0,255},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),Text(
            extent={{-150,20},{-122,4}},
            lineColor={0,0,255},
            textString="1 - Direct normal irradiance in W/m2
2 - global horizontal
     radiance in W/m2
"),       Text(
            extent={{-147,-2},{-79,-10}},
            lineColor={0,0,255},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid,
            textString="Weather boundary conditions"),
                                           Text(
            extent={{-148,48},{-116,30}},
            lineColor={0,0,255},
            textString="1 - Air Temperature in K
2 - Wind Speed m/s
3- Dew Point Temperature in K
4- Cloud Cover"),
          Text(
            extent={{35,-91},{96,-99}},
            lineColor={0,0,255},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid,
            textString="Outputs"),
          Rectangle(
            extent={{-51,-13},{46,-63}},
            lineColor={0,0,127},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-54,-55},{7,-63}},
            lineColor={0,0,255},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid,
            textString="HVAC system"),
          Text(
            extent={{-125,-61},{-68,-68}},
            lineColor={0,0,255},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid,
            textString="Internal gains"),
          Text(
            extent={{-57,-2},{11,-10}},
            lineColor={0,0,255},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid,
            textString="Building physics"),
          Text(
            extent={{-170,-89},{-109,-97}},
            lineColor={0,0,255},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid,
            textString="Inputs")}),
                    Icon(coordinateSystem(
          extent={{-150,-100},{120,90}},
          preserveAspectRatio=false,
          grid={1,1})),
      experiment(StopTime=3.1536e+007, Interval=3600),
      __Dymola_experimentSetupOutput(events=false),
      Documentation(revisions="<html>
 <ul>
 <li><i>March 9, 2015</i> by Ana Constantin:<br/>Implemented</li>
 </ul>
 </html>", info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<p>Model of a room with an real input to deliver a control signal [0,1] to the heater and as an output the room temperature as simulated. Also an Boolean input is requried to specify if a solar shade is deployed in front of the window or not.</p>
<h4><span style=\"color: #008000\">Acknowledgements</span></h4>
<p>This model is derived from the model <a href=\"AixLib.Building.HighOrder.Examples.Validation.ASHRAE140.Case900FF\">Case900FF</a> from the AixLib library <a href=\"https://www.github.com/RWTH-EBC/AixLib\">https://www.github.com/RWTH-EBC/AixLib</a> </p>
</html>"));
  end RoomHeatingSunshade;

  model SouthFacingWindows "windows facing south"

    parameter Modelica.SIunits.Length Room_Lenght=6 "length" annotation (Dialog(group = "Dimensions", descriptionLabel = true));
    parameter Modelica.SIunits.Height Room_Height=2.7 "height" annotation (Dialog(group = "Dimensions", descriptionLabel = true));
    parameter Modelica.SIunits.Length Room_Width=8 "width"
                                                          annotation (Dialog(group = "Dimensions", descriptionLabel = true));

    parameter Modelica.SIunits.Area Win_Area= 12 "Window area " annotation (Dialog(group = "Windows", descriptionLabel = true, enable = withWindow1));

    parameter Modelica.SIunits.Temperature T0=295.15 "Outside"
                                                              annotation(Dialog(tab="Initial temperatures", descriptionLabel = true));
    parameter Modelica.SIunits.Temperature T0_IW=295.15 "IW"  annotation(Dialog(tab="Initial temperatures", descriptionLabel = true));
    parameter Modelica.SIunits.Temperature T0_OW=295.15 "OW"  annotation(Dialog(tab="Initial temperatures", descriptionLabel = true));
    parameter Modelica.SIunits.Temperature T0_CE=295.15 "Ceiling"
                                                              annotation(Dialog(tab="Initial temperatures", descriptionLabel = true));
    parameter Modelica.SIunits.Temperature T0_FL=295.15 "Floor"
                                                              annotation(Dialog(tab="Initial temperatures", descriptionLabel = true));
    parameter Modelica.SIunits.Temperature T0_Air=295.15 "Air"
                                                              annotation(Dialog(tab="Initial temperatures", descriptionLabel = true));

    parameter Real solar_absorptance_OW = 0.6 "Solar absoptance outer walls " annotation (Dialog(group = "Outer wall properties", descriptionLabel = true));
    parameter Real eps_out=0.9 "emissivity of the outer surface"
                                         annotation (Dialog(group = "Outer wall properties", descriptionLabel = true));

    parameter AixLib.DataBase.Walls.WallBaseDataDefinition TypOW=
        AixLib.DataBase.Walls.ASHRAE140.OW_Case600()
      "choose an external wall type "
      annotation (Dialog(group="Wall Types"), choicesAllMatching=true);
    parameter AixLib.DataBase.Walls.WallBaseDataDefinition TypCE=
        AixLib.DataBase.Walls.ASHRAE140.RO_Case600() "choose a ceiling type "
      annotation (Dialog(group="Wall Types"), choicesAllMatching=true);
    parameter AixLib.DataBase.Walls.WallBaseDataDefinition TypFL=
        AixLib.DataBase.Walls.ASHRAE140.FL_Case600() "choose a floor type "
      annotation (Dialog(group="Wall Types"), choicesAllMatching=true);

    parameter AixLib.DataBase.WindowsDoors.Simple.OWBaseDataDefinition_Simple Win=AixLib.DataBase.WindowsDoors.Simple.WindowSimple_ASHRAE140()
      "choose a Window type" annotation(Dialog(group="Windows"),choicesAllMatching= true);

  protected
    parameter Modelica.SIunits.Volume Room_V=Room_Lenght*Room_Height*Room_Width;

  public
    Walls.Wall_ASHRAE140_Controllable outerWall_South(
      withDoor=false,
      WallType=TypOW,
      T0=T0_OW,
      wall_length=Room_Width,
      solar_absorptance=solar_absorptance_OW,
      Model=2,
      outside=true,
      withWindow=true,
      windowarea=Win_Area,
      wall_height=Room_Height,
      surfaceType=AixLib.DataBase.Surfaces.RoughnessForHT.Brick_RoughPlaster(),
      WindowType=AixLib.DataBase.WindowsDoors.Simple.WindowSimple_ASHRAE140(),
      withSunblind=true)
      annotation (Placement(transformation(extent={{-76,-36},{-62,44}})));

    AixLib.Building.Components.Walls.Wall_ASHRAE140 outerWall_West(
      wall_length=Room_Lenght,
      wall_height=Room_Height,
      withDoor=false,
      T0=T0_IW,
      outside=true,
      WallType=TypOW,
      solar_absorptance=solar_absorptance_OW,
      surfaceType=AixLib.DataBase.Surfaces.RoughnessForHT.Brick_RoughPlaster(),
      Model=2) annotation (Placement(transformation(
          extent={{-4,-24},{4,24}},
          rotation=-90,
          origin={26,78})));
    AixLib.Building.Components.Walls.Wall_ASHRAE140 outerWall_East(
      wall_length=Room_Lenght,
      wall_height=Room_Height,
      T0=T0_IW,
      outside=true,
      WallType=TypOW,
      solar_absorptance=solar_absorptance_OW,
      surfaceType=AixLib.DataBase.Surfaces.RoughnessForHT.Brick_RoughPlaster(),
      Model=2) annotation (Placement(transformation(
          extent={{-4.00001,-24},{4.00001,24}},
          rotation=90,
          origin={26,-64})));
    AixLib.Building.Components.Walls.Wall_ASHRAE140 outerWall_North(
      wall_height=Room_Height,
      U_door=5.25,
      door_height=1,
      door_width=2,
      withDoor=false,
      T0=T0_IW,
      wall_length=Room_Width,
      outside=true,
      WallType=TypOW,
      solar_absorptance=solar_absorptance_OW,
      surfaceType=AixLib.DataBase.Surfaces.RoughnessForHT.Brick_RoughPlaster(),
      Model=2) annotation (Placement(transformation(extent={{74,-36},{60,44}})));
    AixLib.Building.Components.Walls.Wall_ASHRAE140 ceiling(
      wall_length=Room_Lenght,
      wall_height=Room_Width,
      ISOrientation=3,
      withDoor=false,
      T0=T0_CE,
      WallType=TypCE,
      outside=true,
      solar_absorptance=solar_absorptance_OW,
      surfaceType=AixLib.DataBase.Surfaces.RoughnessForHT.Brick_RoughPlaster(),
      Model=2) annotation (Placement(transformation(
          extent={{-2,-12},{2,12}},
          rotation=270,
          origin={-32,78})));
    AixLib.Building.Components.Walls.Wall_ASHRAE140 floor(
      wall_length=Room_Lenght,
      wall_height=Room_Width,
      withDoor=false,
      ISOrientation=2,
      T0=T0_FL,
      WallType=TypFL,
      solar_absorptance=solar_absorptance_OW,
      outside=false,
      Model=2) annotation (Placement(transformation(
          extent={{-2.00031,-12},{2.00003,12}},
          rotation=90,
          origin={-32,-64})));
    AixLib.Building.Components.DryAir.Airload airload(V=Room_V, c=1005)
      annotation (Placement(transformation(extent={{10,-18},{28,0}})));
    AixLib.Utilities.Interfaces.Adaptors.HeatStarToComb thermStar_Demux
      annotation (Placement(transformation(
          extent={{-10,8},{10,-8}},
          rotation=90,
          origin={-32,-32})));
    Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor
      annotation (Placement(transformation(extent={{32,-34},{42,-24}})));
    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a Therm_ground
      annotation (Placement(transformation(extent={{-36,-100},{-28,-92}})));
    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a Therm_outside
      annotation (Placement(transformation(extent={{-110,92},{-100,102}})));
    Modelica.Blocks.Interfaces.RealInput WindSpeedPort
      annotation (Placement(transformation(extent={{-120,20},{-104,36}}),
          iconTransformation(extent={{-120,20},{-100,40}})));
  public
    AixLib.Utilities.Interfaces.Star starRoom
      annotation (Placement(transformation(extent={{0,18},{18,34}})));
    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a thermRoom
      annotation (Placement(transformation(extent={{-36,16},{-22,30}})));
    AixLib.Utilities.Interfaces.SolarRad_in SolarRadiationPort[5] "N,E,S,W,Hor"
      annotation (Placement(transformation(extent={{-120,50},{-100,70}})));
    AixLib.Building.Components.DryAir.VarAirExchange varAirExchange(
      V=Room_V,
      c=airload.c,
      rho=airload.rho)
      annotation (Placement(transformation(extent={{-82,-66},{-62,-46}})));
    Modelica.Blocks.Interfaces.RealInput AER "Air exchange rate "
      annotation (Placement(transformation(extent={{-122,-62},{-100,-40}}),
          iconTransformation(extent={{-120,-60},{-100,-40}})));
    Modelica.Blocks.Interfaces.BooleanInput uSunblind
      "Input signal for controllable sunblind, if == true then sunblind is deployed"
      annotation (Placement(transformation(extent={{-116,-28},{-94,-6}})));
  equation
    connect(thermStar_Demux.star, starRoom) annotation (Line(
        points={{-26.2,-21.6},{-26.2,0.2},{9,0.2},{9,26}},
        color={95,95,95},
        pattern=LinePattern.Solid));
    connect(thermStar_Demux.therm, thermRoom) annotation (Line(
        points={{-37.1,-21.9},{-37.1,-0.95},{-29,-0.95},{-29,23}},
        color={191,0,0}));
    connect(varAirExchange.InPort1, AER) annotation (Line(
        points={{-81,-62.4},{-86,-62.4},{-86,-50},{-111,-50},{-111,-52},{-111,-54},
            {-111,-51},{-112,-51},{-111,-51}},
        color={0,0,127}));
    connect(outerWall_South.port_outside, Therm_outside) annotation (Line(
        points={{-76.35,4},{-86,4},{-86,97},{-105,97}},
        color={191,0,0}));
    connect(floor.port_outside, Therm_ground) annotation (Line(
        points={{-32,-66.1003},{-32,-96}},
        color={191,0,0}));
    connect(outerWall_East.port_outside, Therm_outside) annotation (Line(
        points={{26,-68.2},{26,-80},{-86,-80},{-86,97},{-105,97}},
        color={191,0,0}));
    connect(outerWall_North.port_outside, Therm_outside) annotation (Line(
        points={{74.35,4},{82,4},{82,-80},{-86,-80},{-86,97},{-105,97}},
        color={191,0,0}));
    connect(outerWall_West.port_outside, Therm_outside) annotation (Line(
        points={{26,82.2},{26,88},{-86,88},{-86,97},{-105,97}},
        color={191,0,0}));
    connect(outerWall_South.WindSpeedPort, WindSpeedPort) annotation (Line(
        points={{-76.35,33.3333},{-86,33.3333},{-86,28},{-112,28}},
        color={0,0,127}));
    connect(outerWall_South.thermStarComb_inside, thermStar_Demux.thermStarComb)
      annotation (Line(
        points={{-62,4},{-54,4},{-54,-56},{-32.1,-56},{-32.1,-41.4}},
        color={191,0,0}));
    connect(floor.thermStarComb_inside, thermStar_Demux.thermStarComb)
      annotation (Line(
        points={{-32,-62},{-32,-41.4},{-32.1,-41.4}},
        color={191,0,0}));
    connect(outerWall_East.thermStarComb_inside, thermStar_Demux.thermStarComb)
      annotation (Line(
        points={{26,-60},{28,-60},{28,-56},{-32.1,-56},{-32.1,-41.4}},
        color={191,0,0}));
    connect(outerWall_North.thermStarComb_inside, thermStar_Demux.thermStarComb)
      annotation (Line(
        points={{60,4},{46,4},{46,-56},{-32.1,-56},{-32.1,-41.4}},
        color={191,0,0}));
    connect(outerWall_West.thermStarComb_inside, thermStar_Demux.thermStarComb)
      annotation (Line(
        points={{26,74},{26,60},{46,60},{46,-56},{-32.1,-56},{-32.1,-41.4}},
        color={191,0,0}));
    connect(ceiling.thermStarComb_inside, thermStar_Demux.thermStarComb)
      annotation (Line(
        points={{-32,76},{-32,60},{46,60},{46,-56},{-32.1,-56},{-32.1,-41.4}},
        color={191,0,0}));
    connect(ceiling.port_outside, Therm_outside) annotation (Line(
        points={{-32,80.1},{-32,88},{-86,88},{-86,97},{-105,97}},
        color={191,0,0}));
    connect(outerWall_East.WindSpeedPort, WindSpeedPort) annotation (Line(
        points={{8.4,-68.2},{8.4,-80},{-86,-80},{-86,28},{-112,28}},
        color={0,0,127}));
    connect(ceiling.WindSpeedPort, WindSpeedPort) annotation (Line(
        points={{-23.2,80.1},{-23.2,88},{-86,88},{-86,28},{-112,28}},
        color={0,0,127}));
    connect(outerWall_North.WindSpeedPort, WindSpeedPort) annotation (Line(
        points={{74.35,33.3333},{82,33.3333},{82,-80},{-86,-80},{-86,28},{-112,
            28}},
        color={0,0,127}));

    connect(outerWall_West.WindSpeedPort, WindSpeedPort) annotation (Line(
        points={{43.6,82.2},{43.6,88},{-86,88},{-86,28},{-112,28}},
        color={0,0,127}));

    connect(outerWall_South.solarRadWinTrans, floor.solarRadWin) annotation (Line(
        points={{-60.25,-16.6667},{-54,-16.6667},{-54,-56},{-40.8,-56},{-40.8,
            -61.8}},
        color={0,0,127}));

    connect(outerWall_South.solarRadWinTrans, outerWall_East.solarRadWin)
      annotation (Line(
        points={{-60.25,-16.6667},{-54,-16.6667},{-54,-56},{8.4,-56},{8.4,-59.6}},
        color={0,0,127}));

    connect(outerWall_South.solarRadWinTrans, outerWall_South.solarRadWin)
      annotation (Line(
        points={{-60.25,-16.6667},{-54,-16.6667},{-54,33.3333},{-61.3,33.3333}},
        color={0,0,127}));

    connect(outerWall_South.solarRadWinTrans, ceiling.solarRadWin) annotation (
        Line(
        points={{-60.25,-16.6667},{-54,-16.6667},{-54,60},{-23.2,60},{-23.2,
            75.8}},
        color={0,0,127}));

    connect(outerWall_North.solarRadWin, outerWall_South.solarRadWinTrans)
      annotation (Line(
        points={{59.3,33.3333},{46,33.3333},{46,60},{-54,60},{-54,-16.6667},{
            -60.25,-16.6667}},
        color={0,0,127}));
    connect(SolarRadiationPort[3], outerWall_South.SolarRadiationPort)
      annotation (Line(
        points={{-110,60},{-86,60},{-86,40.6667},{-78.1,40.6667}},
        color={255,128,0}));
    connect(ceiling.SolarRadiationPort, SolarRadiationPort[5]) annotation (
        Line(
        points={{-21,80.6},{-21,88},{-86,88},{-86,68},{-110,68}},
        color={255,128,0}));
    connect(outerWall_West.SolarRadiationPort, SolarRadiationPort[4]) annotation (
       Line(
        points={{48,83.2},{48,88},{-86,88},{-86,64},{-110,64}},
        color={255,128,0}));
    connect(outerWall_North.SolarRadiationPort, SolarRadiationPort[1])
      annotation (Line(
        points={{76.1,40.6667},{82,40.6667},{82,-80},{-86,-80},{-86,52},{-110,
            52}},
        color={255,128,0}));

    connect(outerWall_East.SolarRadiationPort, SolarRadiationPort[2]) annotation (
       Line(
        points={{4,-69.2},{4,-80},{-86,-80},{-86,56},{-110,56}},
        color={255,128,0}));
    connect(outerWall_South.solarRadWinTrans, outerWall_West.solarRadWin)
      annotation (Line(
        points={{-60.25,-16.6667},{-54,-16.6667},{-54,60},{43.6,60},{43.6,73.6}},
        color={0,0,127}));
    connect(varAirExchange.port_a, Therm_outside) annotation (Line(
        points={{-82,-56},{-86,-56},{-86,97},{-105,97}},
        color={191,0,0}));
    connect(thermStar_Demux.therm, airload.port) annotation (Line(
        points={{-37.1,-21.9},{-37.1,-10.8},{10.9,-10.8}},
        color={191,0,0}));
    connect(airload.port, temperatureSensor.port) annotation (Line(
        points={{10.9,-10.8},{4,-10.8},{4,-29},{32,-29}},
        color={191,0,0}));
    connect(varAirExchange.port_b, airload.port) annotation (Line(
        points={{-62,-56},{4,-56},{4,-10.8},{10.9,-10.8}},
        color={191,0,0}));
    connect(outerWall_South.uSunBlind, uSunblind) annotation (Line(
        points={{-74.425,-16.1667},{-87.2125,-16.1667},{-87.2125,-17},{-105,-17}},
        color={255,0,255},
        smooth=Smooth.None));

    annotation ( Icon(coordinateSystem(extent={{-100,-100},
              {100,100}}, preserveAspectRatio=false),
                                        graphics={
          Rectangle(
            extent={{-100,92},{94,-92}},
            lineColor={215,215,215},
            fillColor={0,127,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-86,76},{80,-80}},
            lineColor={135,135,135},
            fillColor={135,135,135},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-100,26},{-86,-34}},
            lineColor={170,213,255},
            fillColor={170,213,255},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-22,12},{22,-12}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid,
            textString="Window",
            textStyle={TextStyle.Bold},
            origin={-94,-2},
            rotation=90),
          Text(
            extent={{-54,-54},{54,-76}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid,
            textString="Length"),
          Text(
            extent={{-22,11},{22,-11}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid,
            textString="width",
            origin={65,0},
            rotation=90)}),
      Documentation(revisions="<html>
 <ul>
 <li><i>March 9, 2015</i> by Ana Constantin:<br/>Implemented</li>
 </ul>
 </html>",  info="<html>
<h4><span style=\"color: #008000\">Acknowledgements</span></h4>
<p>This model is derived from the model 
<a href=\"AixLib.Building.HighOrder.Rooms.ASHRAE140.SouthFacingWindows\">SouthFacingWindows</a> from the AixLib library 
<a href=\"https://www.github.com/RWTH-EBC/AixLib\">https://www.github.com/RWTH-EBC/AixLib</a></p>
</html>"),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics));
  end SouthFacingWindows;
annotation (Documentation(info="<html>
<p>This package contains room models used to test building control functions. The models have been reused from AixLib library (www.github.com/RWTH-EBC/AixLib)</p>
</html>"));
end Rooms;
