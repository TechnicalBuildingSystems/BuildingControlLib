within BuildingControlLib.BuildingControl.VDI3813.Sensors;
model SensorT_SETPTS
  "Model to interface SetpointHeatCoolEnergyModes and Modelica Standard Library"
  extends Interfaces.Partial.PartialSensor;
  Interfaces.AirTemperature.SetpointHeatCoolEnergyModesInput T_SETPTS
    annotation (Placement(transformation(extent={{-100,-20},{-60,20}})));
  Modelica.Blocks.Interfaces.RealOutput y[8] annotation (Placement(transformation(
          extent={{100,-38},{176,38}}),  iconTransformation(extent={{86,-6},{
            106,14}})));
algorithm
 for i in 1:8 loop
 T_SETPTS.setpointHeatCoolEnergyModes[i] := y[i];
 end for;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
end SensorT_SETPTS;
