within BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Examples;
model TesterAutomaticThermalControl
  "Model for testing the functionality of TesterAutomaticThermalControl"
  extends Modelica.Icons.Example;

  Sunshading.AutomaticThermalControl automaticThermalControl(
    PAR_S_COOL={1,45},
    PAR_H_ACT=200,
    PAR_S_HEAT={0,10})
    annotation (Placement(transformation(extent={{22,-20},{94,12}})));
  Modelica.Blocks.Sources.Constant T_BMS(k=0)
    annotation (Placement(transformation(extent={{-92,-56},{-86,-50}})));
  Sources.AirTemperature.PrescribedT_BMS prescribedT_BMS
    annotation (Placement(transformation(extent={{-80,-56},{-74,-52}})));
  Sources.AirTemperature.PrescribedT_SETPT prescribedT_SETPT
    annotation (Placement(transformation(extent={{-82,-66},{-76,-60}})));
  Modelica.Blocks.Sources.Constant T_SETPT(k=0)
    annotation (Placement(transformation(extent={{-96,-66},{-90,-60}})));
  RoomClimate.SetpointCalculation setpointCalculation
    annotation (Placement(transformation(extent={{-14,-74},{40,-56}})));
  Sources.AirTemperature.PrescribedT_OUT prescribedT_OUT
    annotation (Placement(transformation(extent={{-80,-74},{-74,-68}})));
  Modelica.Blocks.Sources.Constant T_OUT(k=273.15 - 3)
    annotation (Placement(transformation(extent={{-92,-78},{-86,-72}})));
  SensorFunctions.PresenceDetection
                    presenceDetection(PAR_HOLD=60, holdingActive=true)
    "Value for sensor based presence indication in rooms (true = occupied / false = unoccupied)"
    annotation (Placement(transformation(extent={{-44,42},{4,62}})));
  Sources.Physical.PrescribedP prescribedPresence
    annotation (Placement(transformation(extent={{-3,-3},{3,3}},
        rotation=270,
        origin={-21,71})));
  Modelica.Blocks.Sources.BooleanExpression sourceP_AUTO(y=false)
    "Force that room is unoccupied."
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-20,88})));
  SensorFunctions.BrightnessMeasurementFunctions.BrightnessMeasurementOutdoor
    brightnessMeasurementOutdoor
    annotation (Placement(transformation(extent={{-76,16},{-32,36}})));
  Sources.Analog.PrescribedH
    prescribedPhysicalIlluminance annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=270,
        origin={-54,54})));
  Modelica.Blocks.Sources.Pulse          sourceH_OUT(
    period=600,
    nperiod=1,
    offset=500,
    startTime=800,
    amplitude=-450) "Vary the outdoor illuminance between 500 and 50 lux"
                                                            annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-54,86})));
  Sources.Analog.PrescribedT prescribedT
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},
        rotation=270,
        origin={-84,52})));
  SensorFunctions.AirTemperatureMeasurementFunctions.AirTemperatureMeasurementRoom
    airTemperatureMeasurementRoom
    annotation (Placement(transformation(extent={{-94,-32},{-34,-12}})));
  Modelica.Blocks.Sources.Pulse    sourceT_ROOM(
    amplitude=-10,
    nperiod=2,
    offset=273.15 + 30,
    period=800,
    startTime=100,
    width=50) "Room temperature osciilates between 22 and 19 degree Celsius"
                                                               annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-84,74})));
  Basic.OccupancyEvaluation occupancyEvaluation(PAR_BEH=true)
    annotation (Placement(transformation(extent={{30,38},{50,58}})));
  Sources.Presence.PrescribedP_MAN prescribedP_MAN annotation (Placement(
        transformation(
        extent={{-4,-5},{4,5}},
        rotation=270,
        origin={15,70})));
  Modelica.Blocks.Sources.BooleanExpression sourceP_MAN(y=false)
    "Enforce that room is unoccupied."
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={16,88})));
equation

  connect(prescribedT_BMS.u,T_BMS. y) annotation (Line(
      points={{-79.4,-54},{-78,-54},{-78,-53},{-85.7,-53}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(T_SETPT.y,prescribedT_SETPT. u) annotation (Line(
      points={{-89.7,-63},{-81.4,-63}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(T_OUT.y,prescribedT_OUT. u) annotation (Line(
      points={{-85.7,-75},{-82,-75},{-82,-71},{-79.4,-71}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prescribedT_BMS.T_BMS,setpointCalculation. T_BMS) annotation (
      Line(
      points={{-73.43,-54},{-60,-54},{-60,-61.4},{-6.98,-61.4}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedT_SETPT.T_SETPT,setpointCalculation. T_SETPT)
    annotation (Line(
      points={{-75.43,-63},{-60,-63},{-60,-66},{-54,-66},{-54,-66.8},{-6.44,-66.8}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedT_OUT.T_OUT,setpointCalculation. T_OUT) annotation (
      Line(
      points={{-73.43,-71},{-60,-71},{-60,-72},{-58,-72},{-58,-72.11},{-6.98,-72.11}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(setpointCalculation.T_SETPTS, automaticThermalControl.T_SETPTS)
    annotation (Line(
      points={{47.29,-65},{92,-65},{92,-44},{10,-44},{10,-15.2},{29.2,-15.2}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedPresence.P,presenceDetection. P) annotation (Line(
      points={{-21,67.97},{-21,68},{-20,68},{-20,62}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(sourceP_AUTO.y, prescribedPresence.u) annotation (Line(
      points={{-20,77},{-20,73.4},{-20.4,73.4}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(prescribedPhysicalIlluminance.H,brightnessMeasurementOutdoor. H)
    annotation (Line(
      points={{-54,49.24},{-54,49.24},{-54,36}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(brightnessMeasurementOutdoor.H_OUT, automaticThermalControl.H_OUT)
    annotation (Line(
      points={{-25.4,26},{-20,26},{-20,-2.4},{29.2,-2.4}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(airTemperatureMeasurementRoom.T_ROOM, automaticThermalControl.T_ROOM)
    annotation (Line(
      points={{-25,-22},{-24,-22},{-24,-8.8},{29.2,-8.8}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(airTemperatureMeasurementRoom.T, prescribedT.T) annotation (Line(
      points={{-64,-12},{-64,8},{-84,8},{-84,47.24}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(sourceT_ROOM.y, prescribedT.u) annotation (Line(
      points={{-84,63},{-84,55.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(occupancyEvaluation.P_AUTO, presenceDetection.P_AUTO) annotation (
      Line(
      points={{32.1,52.1},{15.05,52.1},{15.05,52},{11.2,52}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(occupancyEvaluation.P_ACT, automaticThermalControl.P_ACT) annotation (
     Line(
      points={{52,52},{54,52},{54,24},{14,24},{14,4},{29.2,4}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedP_MAN.P_MAN, occupancyEvaluation.P_MAN) annotation (Line(
      points={{15,65.24},{14,65.24},{14,66},{14,46},{32,46},{32,46.1},{32.1,
          46.1}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(sourceP_MAN.y, prescribedP_MAN.u) annotation (Line(
      points={{16,77},{15,77},{15,73.2}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(sourceH_OUT.y, prescribedPhysicalIlluminance.u) annotation (Line(
      points={{-54,75},{-54,57.2}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),                                                                     graphics),
    experiment(StopTime=2000),
    __Dymola_experimentSetupOutput,preferedView="Info",
    Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
", info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Block that implements functionality of &QUOT;Automatic thermal control&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.17, p. 59 - 61]</a>. </p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p>&QUOT;By means of <i>Automatic thermal control </i>(RA-FL section 6, column 16; informative function block Figure 38), the sunshade is used in unoccupied rooms to support heating or cooling by deliberately admitting or preventing solar heat inputs. This helps avoiding overheating in summer and reducing the heating load in winter. To this end, the application function processes the input information about the occupancy state of the room (<i>Occupancy evaluation</i>), the outdoor brightness (<i>Brightness measurement</i>), the room temperature (<i>Temperature measurement</i>) and the setpoints (<i>Setpoint calculation</i>) and, on this basis, generates positioning commands for the sunshade.&QUOT;<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.17, p. 59 - 61]</a></p>
<h4><span style=\"color:#008000\">Concept</span></h4>
<p></p>
</html>"));
end TesterAutomaticThermalControl;
