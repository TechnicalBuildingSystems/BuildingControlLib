within BuildingControlLib.Examples;
model TestRoomWithAutomationVDI3813
  "Model which simulates a room for one day with a sun blind automation applied. Optimized for output and plotting."
  extends Modelica.Icons.Example;

  BuildingControl.VDI3813.Sources.Analog.PrescribedT prescribedT
    annotation (Placement(transformation(extent={{-414,242},{-394,262}})));
  BuildingControl.VDI3813.Sources.Analog.PrescribedT prescribedT1
    annotation (Placement(transformation(extent={{-416,102},{-396,122}})));
  BuildingControl.VDI3813.Sources.Physical.PrescribedP prescribedP
    annotation (Placement(transformation(extent={{-416,216},{-396,236}})));
  BuildingControl.VDI3813.Sources.Physical.PrescribedB prescribedB1
    annotation (Placement(transformation(extent={{-416,128},{-396,148}})));
      BuildingControl.VDI3813.Sources.Presence.PrescribedP_MAN prescribedP_MAN
    annotation (Placement(transformation(extent={{-416,184},{-396,204}})));
  Modelica.Blocks.Sources.BooleanConstant sourceP_MAN(k=false)
    "Source to give feedback from user that occupant is in room. if == true then occupant present."
    annotation (Placement(transformation(extent={{-456,190},{-436,210}})));
  BuildingControl.VDI3813.Sources.Analog.PrescribedH
                             prescribedH
    annotation (Placement(transformation(extent={{-416,266},{-396,286}})));
  BuildingControl.VDI3813.MacroFunctions.MacroSunblind macroSunBlind(
      sourceS_AUTO_Pos(k=-1))
    annotation (Placement(transformation(extent={{-324,40},{194,286}})));
  Utilities.Rooms.RoomSunshade roomSunshade
    annotation (Placement(transformation(extent={{188,400},{-334,650}})));
  BuildingControl.VDI3813.Sensors.SensorM sensorM
    annotation (Placement(transformation(extent={{230,214},{318,260}})));
  Modelica.Blocks.Sources.BooleanConstant sourcePresence(k=false)
    "Source to give feedback from user that occupant is in room. if == true then occupant present."
    annotation (Placement(transformation(extent={{-466,222},{-446,242}})));
  Modelica.Blocks.Interfaces.RealOutput Illuminance annotation (Placement(transformation(
        extent={{-35,-35},{35,35}},
        rotation=90,
        origin={-507,793})));
  Modelica.Blocks.Interfaces.RealOutput PAR_H_ACT;
  Modelica.Blocks.Interfaces.BooleanOutput stHea annotation (Placement(transformation(
        extent={{-35,-35},{35,35}},
        rotation=90,
        origin={-395,793})));
  Modelica.Blocks.Interfaces.BooleanOutput stCoo annotation (Placement(transformation(
        extent={{-35,-35},{35,35}},
        rotation=90,
        origin={-347,791})));
  Modelica.Blocks.Interfaces.BooleanOutput uSun annotation (Placement(transformation(
        extent={{-35,-35},{35,35}},
        rotation=90,
        origin={-297,797})));
  Modelica.Blocks.Interfaces.RealOutput Ventilation annotation (Placement(transformation(
        extent={{-35,-35},{35,35}},
        rotation=90,
        origin={-251,795})));
  Modelica.Blocks.Interfaces.RealOutput T_Room annotation (Placement(transformation(
        extent={{-35,-35},{35,35}},
        rotation=90,
        origin={-203,797})));
  Modelica.Blocks.Interfaces.RealOutput T_Out annotation (Placement(transformation(
        extent={{-35,-35},{35,35}},
        rotation=90,
        origin={-157,799})));
  Modelica.Blocks.Interfaces.RealOutput TSetHea annotation (Placement(
        transformation(
        extent={{-35,-35},{35,35}},
        rotation=90,
        origin={-29,801})));
  Modelica.Blocks.Interfaces.RealOutput TSetCoo annotation (Placement(
        transformation(
        extent={{-35,-35},{35,35}},
        rotation=90,
        origin={-99,799})));
equation
Illuminance =roomSunshade.yIlluminance;
PAR_H_ACT = macroSunBlind.automaticThermalControl.functionality.PAR_H_ACT;
stHea = macroSunBlind.automaticThermalControl.functionality.heating.active;
stCoo = macroSunBlind.automaticThermalControl.functionality.cooling.active;
uSun =roomSunshade.uSunblind;
Ventilation = roomSunshade.VentilationWindow.y[1];
T_Room = macroSunBlind.airTemperatureMeasurementRoom.T_ROOM.valueAirTemperatureRoom;
T_Out = macroSunBlind.airTemperatureMeasurementOutdoor.T_OUT.valueAirTemperatureOutdoor;
TSetCoo = macroSunBlind.automaticThermalControl.T_SETPTS.setpointHeatCoolEnergyModes[5];
TSetHea = macroSunBlind.automaticThermalControl.T_SETPTS.setpointHeatCoolEnergyModes[4];

  connect(sourceP_MAN.y,prescribedP_MAN. u) annotation (Line(
      points={{-435,200},{-424,200},{-424,194},{-414,194}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(prescribedH.H, macroSunBlind.H) annotation (Line(
      points={{-394.1,276},{-380,276},{-380,236.8},{-318.82,236.8}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(prescribedT.T, macroSunBlind.T) annotation (Line(
      points={{-392.1,252},{-380,252},{-380,225.32},{-316.23,225.32}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(prescribedP_MAN.P_MAN, macroSunBlind.P_MAN) annotation (Line(
      points={{-394.1,194},{-360,194},{-360,197.44},{-298.1,197.44}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedP.P, macroSunBlind.P) annotation (Line(
      points={{-395.9,226},{-380.05,226},{-380.05,213.84},{-313.64,213.84}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(prescribedB1.B, macroSunBlind.B) annotation (Line(
      points={{-395.9,138},{-376,138},{-376,151.52},{-318.82,151.52}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(prescribedT1.T, macroSunBlind.T1) annotation (Line(
      points={{-394.1,112},{-342,112},{-342,138.4},{-318.82,138.4}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(macroSunBlind.M, sensorM.M) annotation (Line(
      points={{157.74,235.98},{204.87,235.98},{204.87,237},{230,237}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(roomSunshade.uSunblind, sensorM.y) annotation (Line(
      points={{161.9,462.5},{254,462.5},{254,464},{346,464},{346,237},{326.8,237}},
      color={255,0,255},
      smooth=Smooth.None));

  connect(roomSunshade.yRoomTemperature, prescribedT.u) annotation (Line(
      points={{-360.1,586.25},{-360.1,590},{-452,590},{-452,588},{-520,588},{-520,
          252},{-412,252}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(roomSunshade.yOutdoorAirTemperature, prescribedT1.u) annotation (Line(
      points={{-360.1,561.25},{-360.1,560},{-518,560},{-518,112},{-414,112}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(roomSunshade.yBWindow, prescribedB1.u) annotation (Line(
      points={{-360.1,536.25},{-360.1,536},{-518,536},{-518,140},{-414,140}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(roomSunshade.yIlluminance, prescribedH.u) annotation (Line(
      points={{-360.1,611.25},{-360.1,612},{-504,612},{-504,276},{-414,276}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sourcePresence.y, prescribedP.u) annotation (Line(
      points={{-445,232},{-428,232},{-428,228},{-414,228}},
      color={255,0,255},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(extent={{-600,40},{400,800}}, preserveAspectRatio=false),
                    graphics),
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
