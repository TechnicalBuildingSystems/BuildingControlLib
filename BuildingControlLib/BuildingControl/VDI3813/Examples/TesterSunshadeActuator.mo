within BuildingControlLib.BuildingControl.VDI3813.Examples;
model TesterSunshadeActuator "Tester for ActuateSunshade and SunshadeActuator"
  import BuildingControlLib;
  extends Modelica.Icons.Example;
  BuildingControlLib.Utilities.Rooms.Room_withSunshade room_withSunshade
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={62,70})));
  Modelica.Blocks.Sources.BooleanPulse sunshadeTrigger(width=50, period=3600)
    "Open and closes sunshade of room. if true sunshade reduces irradiation i.e. deployed"
    annotation (Placement(transformation(extent={{-100,60},{-80,80}})));
  BuildingControl.VDI3813.OperatorAndDisplayFunctions.ActuateSunshade
    actuateSunshade
    annotation (Placement(transformation(extent={{-84,14},{-34,40}})));
  BuildingControl.VDI3813.ActuatorFunctions.SunshadeActuator sunshadeActuator
    annotation (Placement(transformation(extent={{30,15},{74,43}})));
  BuildingControl.VDI3813.Sensors.SensorM sensorM
    annotation (Placement(transformation(extent={{20,60},{40,80}})));
  BuildingControl.VDI3813.Sources.Sunshade.PrescribedCMD_S prescribedCMD_S
    annotation (Placement(transformation(extent={{-60,60},{-40,80}})));
  ApplicationFunctions.Sunshading.PriorityControl priorityControl
    annotation (Placement(transformation(extent={{-40,-56},{68,0}})));
equation
  connect(sensorM.y, room_withSunshade.uOperateSunblind) annotation (Line(
      points={{42,70},{53,70}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(sunshadeActuator.S_STA, actuateSunshade.S_STA) annotation (Line(
      points={{80.6,29},{80,29},{80,28},{98,28},{98,-70},{-92,-70},{-92,26},{
          -84,26},{-84,27},{-76.5,27}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));

  connect(sensorM.M, sunshadeActuator.M) annotation (Line(
      points={{20,70},{6,70},{6,50},{51.78,50},{51.78,43.14}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(sunshadeTrigger.y, prescribedCMD_S.u) annotation (Line(
      points={{-79,70},{-58,70}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(actuateSunshade.CMD, prescribedCMD_S.CMD) annotation (Line(
      points={{-59,40},{-59,48},{-12,48},{-12,66},{-44.1,66}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(sunshadeActuator.S_SET, priorityControl.S_SET) annotation (Line(
      points={{36.6,29},{24,29},{24,6},{90,6},{90,-28},{78.8,-28}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(priorityControl.S_MAN, actuateSunshade.S_MAN) annotation (Line(
      points={{-34.6,-39.2},{-34.6,-40},{-70,-40},{-70,6},{-26.5,6},{-26.5,27}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));

  annotation (preferredView="info",Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics),
    experiment(StopTime=86400, Interval=60),
    __Dymola_experimentSetupOutput,
    Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end TesterSunshadeActuator;
