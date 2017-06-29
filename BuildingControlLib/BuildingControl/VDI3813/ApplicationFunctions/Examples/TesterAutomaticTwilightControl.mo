within BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Examples;
model TesterAutomaticTwilightControl
  extends Modelica.Icons.Example;
  Sunshading.AutomaticTwilightControl automaticTwilightControl(PAR_TI=10,
      PAR_S_ACT={1,20})
    annotation (Placement(transformation(extent={{20,0},{100,40}})));
  Sources.Binary.PrescribedB_ON prescribedB_ON
    annotation (Placement(transformation(extent={{-20,20},{0,40}})));
  Sources.Illuminance.PrescribedH_OUT prescribedH_OUT
    annotation (Placement(transformation(extent={{-20,0},{0,20}})));
  Modelica.Blocks.Sources.BooleanStep sourceB_ON(startTime=10, startValue=false)
    "Imitates starting signal from BAS"
    annotation (Placement(transformation(extent={{-100,40},{-80,60}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=-250,
    offset=300,
    duration=100,
    startTime=10)
    annotation (Placement(transformation(extent={{-100,0},{-80,20}})));
  Modelica.Blocks.Sources.Ramp ramp1(
    duration=100,
    height=250,
    offset=50,
    startTime=120)
    annotation (Placement(transformation(extent={{-100,-40},{-80,-20}})));
  Modelica.Blocks.Math.MultiSum multiSum(nu=2)
    annotation (Placement(transformation(extent={{-56,4},{-44,16}})));
equation
  connect(automaticTwilightControl.B_ON, prescribedB_ON.B_ON) annotation (Line(
      points={{28,28},{0,28},{0,30},{1.9,30}},
      color={0,0,0},
      thickness=1));
  connect(automaticTwilightControl.H_OUT, prescribedH_OUT.H_OUT) annotation (
      Line(
      points={{28,12},{0,12},{0,10},{1.9,10}},
      color={0,0,0},
      thickness=1));
  connect(sourceB_ON.y, prescribedB_ON.u) annotation (Line(points={{-79,50},{
          -44,50},{-44,30},{-18,30}}, color={255,0,255}));
  connect(prescribedH_OUT.u, multiSum.y)
    annotation (Line(points={{-18,10},{-30,10},{-42.98,10}}, color={0,0,127}));
  connect(ramp.y, multiSum.u[1])
    annotation (Line(points={{-79,10},{-56,10},{-56,12.1}}, color={0,0,127}));
  connect(ramp1.y, multiSum.u[2]) annotation (Line(points={{-79,-30},{-68,-30},
          {-68,7.9},{-56,7.9}}, color={0,0,127}));
  annotation (
    experiment(StopTime=300),
    __Dymola_experimentSetupOutput,
    __Dymola_experimentFlags(
      Advanced(GenerateVariableDependencies=false, OutputModelicaCode=false),
      Evaluate=false,
      OutputCPUtime=false,
      OutputFlatModelica=false));
end TesterAutomaticTwilightControl;
