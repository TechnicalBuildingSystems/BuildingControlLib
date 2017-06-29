within BuildingControlLib.BuildingControl.VDI3813.Sources.AirQuality;
model PrescribedQ_ROOM
  "Model to interface Modelica Standard Library and ValueAirQuality"
  extends Interfaces.Partial.PartialSource;
 Modelica.Blocks.Interfaces.RealInput u
  annotation (Placement(transformation(extent={{-140,    -60},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
 BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirQuality.ValueAirQualityOutput
 Q_ROOM annotation (Placement(transformation(extent={{100,-20},{138,20}})));
equation
 u = Q_ROOM.valueAirQuality;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end PrescribedQ_ROOM;
