within BuildingControlLib.Examples;
model TestRoomWithAutomationVDI3813
  "Model which simulates a room for one day with a sun blind automation applied. Optimized for output and plotting."
  extends Modelica.Icons.Example;
//******************************************************************************
  Utilities.Rooms.RoomSunshade roomSunshade
    annotation (Placement(transformation(extent={{188,400},{-334,650}})));
  BuildingControl.VDI3813.MacroFunctions.MacroSunblind macroSunBlind(
      sourceS_AUTO_Pos(k=-1))
    annotation (Placement(transformation(extent={{-324,40},{194,286}})));
//******************************************************************************
  Modelica.Blocks.Sources.BooleanConstant sourceP_MAN(k=false)
    "Source to give feedback from user that occupant is in room. if == true then occupant present."
    annotation (Placement(transformation(extent={{-402,120},{-382,140}})));
  Modelica.Blocks.Sources.BooleanConstant sourcePresence(k=false)
    "Source to give feedback from user that occupant is in room. if == true then occupant present."
    annotation (Placement(transformation(extent={{-444,150},{-424,170}})));
//******************************************************************************
  Modelica.Blocks.Interfaces.RealOutput Illuminance annotation (Placement(transformation(
        extent={{-35,-35},{35,35}},
        rotation=0,
        origin={437,683})));
  Modelica.Blocks.Interfaces.RealOutput PAR_H_ACT;
  Modelica.Blocks.Interfaces.BooleanOutput stHea annotation (Placement(transformation(
        extent={{-35,-35},{35,35}},
        rotation=0,
        origin={435,623})));
  Modelica.Blocks.Interfaces.BooleanOutput stCoo annotation (Placement(transformation(
        extent={{-35,-35},{35,35}},
        rotation=0,
        origin={437,563})));
  Modelica.Blocks.Interfaces.BooleanOutput uSun annotation (Placement(transformation(
        extent={{-35,-35},{35,35}},
        rotation=0,
        origin={435,501})));
  Modelica.Blocks.Interfaces.RealOutput Ventilation annotation (Placement(transformation(
        extent={{-35,-35},{35,35}},
        rotation=0,
        origin={435,443})));
  Modelica.Blocks.Interfaces.RealOutput T_Room annotation (Placement(transformation(
        extent={{-35,-35},{35,35}},
        rotation=0,
        origin={437,389})));
  Modelica.Blocks.Interfaces.RealOutput T_Out annotation (Placement(transformation(
        extent={{-35,-35},{35,35}},
        rotation=0,
        origin={437,323})));
  Modelica.Blocks.Interfaces.RealOutput TSetHea annotation (Placement(
        transformation(
        extent={{-35,-35},{35,35}},
        rotation=0,
        origin={435,201})));
  Modelica.Blocks.Interfaces.RealOutput TSetCoo annotation (Placement(
        transformation(
        extent={{-35,-35},{35,35}},
        rotation=0,
        origin={437,261})));

equation
  Illuminance = roomSunshade.yIlluminance;
  PAR_H_ACT = macroSunBlind.automaticThermalControl.functionality.PAR_H_ACT;
  stHea = macroSunBlind.automaticThermalControl.functionality.heating.active;
  stCoo = macroSunBlind.automaticThermalControl.functionality.cooling.active;
  uSun =roomSunshade.uSunblind;
  Ventilation = roomSunshade.VentilationWindow.y[1];
  T_Room = macroSunBlind.airTemperatureMeasurementRoom.T_ROOM;
  T_Out = macroSunBlind.airTemperatureMeasurementOutdoor.T_OUT;
  TSetCoo = macroSunBlind.automaticThermalControl.T_SETPTS[5];
  TSetHea = macroSunBlind.automaticThermalControl.T_SETPTS[4];

  connect(macroSunBlind.M, roomSunshade.uSunblind) annotation (Line(
      points={{208.892,170.79},{208.892,170},{226,170},{226,172},{226,172},{226,
          196},{226,338},{226,338},{226,462.5},{161.9,462.5}},
      color={0,0,0},
      thickness=1));
  connect(roomSunshade.yOutdoorAirTemperature, macroSunBlind.T1) annotation (
      Line(points={{-360.1,561.25},{-360.1,558},{-476,558},{-479.05,558},{-479.05,
          105.6},{-311.05,105.6}}, color={0,0,127}));
  connect(sourceP_MAN.y, macroSunBlind.P_MAN) annotation (Line(points={{-381,130},
          {-378,130},{-378,130.2},{-311.05,130.2}}, color={255,0,255}));
  connect(roomSunshade.yBWindow, macroSunBlind.B) annotation (Line(points={{-360.1,
          536.25},{-360.1,536},{-458,536},{-458,180},{-311.05,180},{-311.05,179.4}},
        color={255,0,255}));
  connect(sourcePresence.y, macroSunBlind.P) annotation (Line(points={{-423,160},
          {-430,160},{-430,154.8},{-311.05,154.8}}, color={255,0,255}));
  connect(roomSunshade.yRoomTemperature, macroSunBlind.T) annotation (Line(
        points={{-360.1,586.25},{-436,586.25},{-436,200},{-311.05,200},{-311.05,
          204}}, color={0,0,127}));
  connect(roomSunshade.yIlluminance, macroSunBlind.H) annotation (Line(points={{-360.1,
          611.25},{-416,611.25},{-416,228.6},{-311.05,228.6}},        color={0,0,
          127}));
  annotation (
    Diagram(coordinateSystem(extent={{-600,40},{400,800}}, preserveAspectRatio=false)),
    Icon(coordinateSystem(extent={{-600,40},{400,800}})),
    experiment(
      StopTime=604800,
      Interval=60,
      __Dymola_Algorithm="Esdirk23a"),
    __Dymola_experimentSetupOutput(
      states=false,
      derivatives=false,
      inputs=false,
      auxiliaries=false),
    Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>", info="<html>
<p>This model illustrates the coupling of a modelled room automation solution to a room model from AixLib-library. The room automation solution controls the sunblind and deploys the sunshade dependent on the presence of occupants and the room temperature.</p>
</html>"));
end TestRoomWithAutomationVDI3813;
