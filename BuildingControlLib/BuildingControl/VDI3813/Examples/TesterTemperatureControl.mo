within BuildingControlLib.BuildingControl.VDI3813.Examples;
model TesterTemperatureControl
  "Tester to test temperature control function and adjacent functions"
    extends Modelica.Icons.Example;

  ActuatorFunctions.ControlDriveActuator.ControlDriveActuatorValvePosition
    controlDriveActuatorValvePosition
    annotation (Placement(transformation(extent={{40,0},{80,40}})));
  ApplicationFunctions.RoomClimate.TemperatureControl temperatureControl
    annotation (Placement(transformation(extent={{-20,0},{20,40}})));
  ApplicationFunctions.RoomClimate.SetpointCalculation setpointCalculation
    annotation (Placement(transformation(extent={{-64,4},{-44,24}})));
  SensorFunctions.AirTemperatureMeasurementFunctions.AirTemperatureMeasurementRoom
    airTemperatureMeasurementRoom
    annotation (Placement(transformation(extent={{-66,40},{-46,60}})));
  ApplicationFunctions.RoomClimate.EnergyModeSelection energyModeSelection
    annotation (Placement(transformation(extent={{-56,-52},{-36,-32}})));
  ApplicationFunctions.Basic.TimeProgram.TimeProgramEnergyMode
    timeProgramEnergyMode
    annotation (Placement(transformation(extent={{-84,-50},{-64,-30}})));
  SensorFunctions.WindowMonitoring windowMonitoring
    annotation (Placement(transformation(extent={{-100,40},{-80,60}})));
  ApplicationFunctions.Basic.OccupancyEvaluation occupancyEvaluation
    annotation (Placement(transformation(extent={{-98,70},{-78,90}})));
equation
  connect(setpointCalculation.T_SETPTS, temperatureControl.T_SETPS) annotation (
     Line(
      points={{-41.3,14},{-28,14},{-28,18},{-15.8,18}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(airTemperatureMeasurementRoom.T_ROOM, temperatureControl.T_ROOM)
    annotation (Line(
      points={{-43,50},{-30,50},{-30,22},{-16,22}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(energyModeSelection.M_ACT, temperatureControl.M_ACT) annotation (Line(
      points={{-34,-42},{-12,-42},{-12,26},{-16,26}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(energyModeSelection.M_BMS, timeProgramEnergyMode.M_BMS) annotation (
      Line(
      points={{-54,-38},{-58,-38},{-58,-36},{-62,-36}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(windowMonitoring.B_WINDOW, energyModeSelection.B_WINDOW) annotation (
      Line(
      points={{-77,50},{-66,50},{-66,-42},{-54,-42}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(occupancyEvaluation.P_ACT, energyModeSelection.P_ACT) annotation (
      Line(
      points={{-76,84},{-66,84},{-66,-46},{-54,-46}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(temperatureControl.V_SET_VP, controlDriveActuatorValvePosition.V_SET_VP)
    annotation (Line(
      points={{24,28},{44,28},{44,20},{46,20}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  annotation (preferredView="info", Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end TesterTemperatureControl;
