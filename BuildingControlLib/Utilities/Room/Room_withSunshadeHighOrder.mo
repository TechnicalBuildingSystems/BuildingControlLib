within BuildingControlLib.Utilities.Room;
model Room_withSunshadeHighOrder
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
  Internal.SouthFacingWindows                                  Room(TypOW=
        AixLib.DataBase.Walls.ASHRAE140.OW_Case900(), TypFL=
        AixLib.DataBase.Walls.ASHRAE140.FL_Case900(),
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
"),     Text(
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
 </html>",
         info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Model of a room with an real input to deliver a control signal [0,1] to the heater and as an output the room temperature as simulated.</p>
<p>Model derived from <code>AixLib.Building.HighOrder.Examples.Validation.ASHRAE140.Case900FF</code>.</p>
</html>"));
end Room_withSunshadeHighOrder;
