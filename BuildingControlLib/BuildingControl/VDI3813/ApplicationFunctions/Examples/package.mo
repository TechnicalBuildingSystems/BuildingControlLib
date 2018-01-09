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

 model TesterSlatTracking
  extends Modelica.Icons.Example;
  Sunshading.SlatTracking slatTracking
    annotation (Placement(transformation(extent={{0,0},{100,60}})));
  Sources.Binary.PrescribedB_ON prescribedB_ON
    annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
  Sources.Illuminance.PrescribedH_OUT prescribedH_OUT
    annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  Sources.Angle.PrescribedA_SUN_AZ prescribedA_SUN_AZ
    annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
  Sources.Angle.PrescribedA_SUN_EL prescribedA_SUN_EL
    annotation (Placement(transformation(extent={{-40,-20},{-20,0}})));
 equation
  connect(slatTracking.B_ON, prescribedB_ON.B_ON) annotation (Line(
      points={{10,42},{-10,42},{-10,50},{-18.1,50}},
      color={0,0,0},
      thickness=1));
  connect(slatTracking.H_OUT, prescribedH_OUT.H_OUT) annotation (Line(
      points={{10,30},{-38.1,30}},
      color={0,0,0},
      thickness=1));
  connect(slatTracking.A_SUN_AZ, prescribedA_SUN_AZ.A_SUN_AZ) annotation (Line(
      points={{10,18},{-20,18},{-20,10},{-38.1,10}},
      color={0,0,0},
      thickness=1));
  connect(slatTracking.A_SUN_EL, prescribedA_SUN_EL.A_SUN_EL) annotation (Line(
      points={{10,6},{-10,6},{-10,-10},{-18.1,-10}},
      color={0,0,0},
      thickness=1));
 end TesterSlatTracking;

 model TesterShadowCorrection
  extends Modelica.Icons.Example;
  Sunshading.ShadowCorrection shadowCorrection
    annotation (Placement(transformation(extent={{20,-20},{100,20}})));
  Sources.Angle.PrescribedA_SUN_EL prescribedA_SUN_EL
    annotation (Placement(transformation(extent={{-20,-38},{0,-18}})));
  Sources.Angle.PrescribedA_SUN_AZ prescribedA_SUN_AZ
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Sources.Sunshade.PrescribedS_AUTO prescribedS_AUTO
    annotation (Placement(transformation(extent={{-20,20},{0,40}})));
 equation
  connect(shadowCorrection.A_SUN_EL, prescribedA_SUN_EL.A_SUN_EL) annotation (
      Line(
      points={{28,-8},{14,-8},{14,-28},{1.9,-28}},
      color={0,0,0},
      thickness=1));
  connect(shadowCorrection.A_SUN_AZ, prescribedA_SUN_AZ.A_SUN_AZ) annotation (
      Line(
      points={{28,0},{1.9,0}},
      color={0,0,0},
      thickness=1));
  connect(shadowCorrection.S_AUTO_IN, prescribedS_AUTO.S_AUTO) annotation (Line(
      points={{28,8},{14,8},{14,30},{1.9,30}},
      color={0,0,0},
      thickness=1));
 end TesterShadowCorrection;

 model TesterWeatherProtection
  extends Modelica.Icons.Example;
  Sunshading.WeatherProtection weatherProtection
    annotation (Placement(transformation(extent={{20,-20},{100,20}})));
  Sources.Binary.PrescribedR_ACT prescribedR_ACT
    annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));
  Sources.AirTemperature.PrescribedT_OUT prescribedT_OUT
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Sources.WindVelocity.PrescribedW_ACT prescribedW_ACT
    annotation (Placement(transformation(extent={{-20,20},{0,40}})));
 equation
  connect(weatherProtection.R_ACT, prescribedR_ACT.R_ACT) annotation (Line(
      points={{28,-8},{14,-8},{14,-30},{1.9,-30}},
      color={0,0,0},
      thickness=1));
  connect(weatherProtection.T_OUT, prescribedT_OUT.T_OUT) annotation (Line(
      points={{28,0},{1.9,0}},
      color={0,0,0},
      thickness=1));
  connect(weatherProtection.W_ACT, prescribedW_ACT.W_ACT) annotation (Line(
      points={{28,8},{14,8},{14,30},{1.9,30}},
      color={0,0,0},
      thickness=1));
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
