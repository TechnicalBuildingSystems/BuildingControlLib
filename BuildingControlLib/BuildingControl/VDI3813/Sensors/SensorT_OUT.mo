within BuildingControlLib.BuildingControl.VDI3813.Sensors;
model SensorT_OUT
  "Model to interface ValueAirTemperatureOutdoor and Modelica Standard Library"
  extends Interfaces.Partial.PartialSensor;
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(extent={{100,-40},
            {180,40}}), iconTransformation(extent={{100,-20},{140,20}})));

  Interfaces.AirTemperature.ValueAirTemperatureOutdoorInput T_OUT
    annotation (Placement(transformation(extent={{-100,-20},{-48,20}})));
equation
  T_OUT.valueAirTemperatureOutdoor = y;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),                                                                  graphics), Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}),
        graphics),
    Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
end SensorT_OUT;
