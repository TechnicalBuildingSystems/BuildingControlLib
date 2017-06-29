within BuildingControlLib.BuildingControl.Nonstandardized.Examples;
model TestLimiter "Tester for Limiter block"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Ramp     const(
    height=40,
    duration=500,
    offset=273.15 + 10,
    startTime=100)
    annotation (Placement(transformation(extent={{-90,-12},{-70,8}})));
  Internal.Limiter limiter(
    uMin=273.15 + 20,
    uMax=273.15 + 30,
    yMin=3,
    yMax=0) annotation (Placement(transformation(extent={{-40,-40},{40,40}})));
equation

  connect(const.y, limiter.u) annotation (Line(
      points={{-69,-2},{-48,-2},{-48,0}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput,
    Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
end TestLimiter;
