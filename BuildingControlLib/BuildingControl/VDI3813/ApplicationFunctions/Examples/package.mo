within BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions;
package Examples "Models for functionality test of application functions"
  extends Modelica.Icons.ExamplesPackage;













 model TesterAutomaticSolarControl
  extends Modelica.Icons.Example;
   Sunshading.AutomaticSolarControl automaticSolarControl(PAR_S_ACT={1,20},
      PAR_TI=200)
    annotation (Placement(transformation(extent={{20,0},{100,40}})));
  Modelica.Blocks.Sources.BooleanStep sourceB_ON(startTime=10, startValue=false)
    "Imitates starting signal from BAS"
    annotation (Placement(transformation(extent={{-100,40},{-80,60}})));
  Modelica.Blocks.Math.MultiSum multiSum(nu=2)
    annotation (Placement(transformation(extent={{-56,4},{-44,16}})));
  Modelica.Blocks.Sources.Pulse pulse(
    amplitude=3000,
    width=50,
    period=300,
    nperiod=1,
    offset=9000,
    startTime=200)
    annotation (Placement(transformation(extent={{-100,0},{-80,20}})));
  Modelica.Blocks.Sources.Pulse pulse1(
    amplitude=3000,
    width=50,
    nperiod=1,
    period=1000,
    startTime=600,
    offset=0)
    annotation (Placement(transformation(extent={{-100,-40},{-80,-20}})));
 equation
  connect(pulse.y, multiSum.u[1])
    annotation (Line(points={{-79,10},{-56,10},{-56,12.1}}, color={0,0,127}));
  connect(pulse1.y, multiSum.u[2]) annotation (Line(points={{-79,-30},{-66,-30},
          {-66,7.9},{-56,7.9}}, color={0,0,127}));
  connect(sourceB_ON.y, automaticSolarControl.B_ON) annotation (Line(points={{
          -79,50},{-30,50},{-30,28},{28,28}}, color={255,0,255}));
  connect(multiSum.y, automaticSolarControl.H_OUT) annotation (Line(points={{
          -42.98,10},{-10,10},{-10,12},{28,12}}, color={0,0,127}));
  annotation (experiment(StopTime=1500));
 end TesterAutomaticSolarControl;



 model TesterWeatherProtection
  extends Modelica.Icons.Example;
  Sunshading.WeatherProtection weatherProtection
    annotation (Placement(transformation(extent={{20,-20},{100,20}})));
 end TesterWeatherProtection;




   annotation (preferedView="Info",Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
", info="<html>
<p>The containing models had been used to test the functionalities of the implemented application functions referring to VDI3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1]</a>. </p>
</html>"));
end Examples;
