within BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Examples;
model TesterAirTemperatureMeasurement
  "Model for testing the functionality of AirTemperatureMeasurement"
  extends Modelica.Icons.Example;

  parameter Modelica.SIunits.Temperature TAmb(displayUnit="degC")=293.15
    "Ambient temperature";

  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor(
                   C=0.1, T(start=TAmb, fixed=true))
    annotation (Placement(transformation(
        origin={30,50},
        extent={{-10,10},{10,-10}},
        rotation=90)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-50,10})));
  AirTemperatureMeasurementFunctions.AirTemperatureMeasurementOutdoor
    airTemperatureMeasurementOutdoor(PAR_CAL_yIntercept=2)
    annotation (Placement(transformation(extent={{0,-40},{60,-20}})));
  AirTemperatureMeasurementFunctions.AirTemperatureMeasurementRoom
    airTemperatureMeasurementRoom(PAR_CAL_yIntercept=1)
    annotation (Placement(transformation(extent={{-100,-40},{-40,-20}})));
  AirTemperatureMeasurementFunctions.AirTemperatureMeasurementSupply
    airTemperatureMeasurementSupply(PAR_CAL_yIntercept=4)
    annotation (Placement(transformation(extent={{0,-80},{60,-60}})));
  AirTemperatureMeasurementFunctions.AirTemperatureMeasurementReturn
    airTemperatureMeasurementReturn(PAR_CAL_yIntercept=3)
    annotation (Placement(transformation(extent={{-100,-80},{-40,-60}})));
equation
  connect(temperatureSensor.port, heatCapacitor.port) annotation (Line(
      points={{-60,10},{-68,10},{-68,50},{20,50}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(temperatureSensor.T, airTemperatureMeasurementOutdoor.T.u);
  connect(temperatureSensor.T, airTemperatureMeasurementRoom.T.u);
  connect(temperatureSensor.T, airTemperatureMeasurementSupply.T.u);
  //connect(temperatureSensor.T, airTemperatureMeasurementReturn.T);
  connect(temperatureSensor.T, airTemperatureMeasurementReturn.T) annotation (
      Line(points={{-40,10},{-20,10},{-20,-52},{-70,-52},{-70,-60},{-70,-60}},
        color={0,0,127}));
      annotation ( preferredView="info",Documentation(info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Simulation to check the behaviour of the function models of &QUOT;Air temperature measurement&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.5, p. 13]</a>.</p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p>&QUOT;The sensor function<i>Air temperature measurement</i> (RA-FL section 2, column 4; informative function block Figure 6) is used to measure the air temperature of the room and, in air-bound heating and cooling systems, also the extract and supply air temperatures as well as the outdoor temperature. Room, supply or extract air temperatures are the input information for heating and cooling functions, whereas the outdoor temperature is required, e. g., for night-time cooling, summer compensation or for weather protection functions of the sunshade.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.5, p. 13]</a></p>
<h4><span style=\"color:#008000\">Concept</span></h4>
<p>The simulation contains a thermal sensor that measures the temperature of a thermal conductor and sends it to a converter for changing the signal type from Modelica standard type to VDI 3813 semantic type. From there the signal goes to the four different implementations of air temperature measurement functions. All slope parameters are set to 1. Because of that all output slopes should be the same. For the y intercept values from 1 to 4 in steps of 1 had been chosen. The four outputs should be similar, but shifted on the y axis.  </p>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"),    experiment(StopTime=1000, Interval=1),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    __Dymola_experimentSetupOutput);
end TesterAirTemperatureMeasurement;
