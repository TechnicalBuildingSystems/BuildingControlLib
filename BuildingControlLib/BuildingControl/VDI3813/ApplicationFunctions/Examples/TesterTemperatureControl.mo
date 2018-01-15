within BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Examples;
model TesterTemperatureControl
  "Model for testing the functionality of TemperatureControl"
  extends Modelica.Icons.Example;

  parameter Integer nF_ACT = 6 "Size of enumeration ControlFunction";
  parameter Integer nM_ACT = 4 "Size of enumeration Energy Modes";
  parameter Integer nT_SETPTS = 8 "Number of defined setpoints";

  parameter Real T_SETPTS[8] = {16,18,20,22,28,32,34,36};
  Modelica.Blocks.Sources.Constant SourceT_SETPTS[nT_SETPTS](
   k = {273.15+T_SETPTS[1],
        273.15+T_SETPTS[2],
        273.15+T_SETPTS[3],
        273.15+T_SETPTS[4],
        273.15+T_SETPTS[5],
        273.15+T_SETPTS[6],
        273.15+T_SETPTS[7],
        273.15+T_SETPTS[8]});


  Modelica.Blocks.Sources.IntegerStep SourcM_ACT[nM_ACT](
    height={0,1,1,1},
    offset={1,0,0,0},
    startTime={15,25,35,45}) annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-200,560})));
  Modelica.Blocks.Sources.IntegerStep SourcF_ACT[nF_ACT](
    startTime={10,20,30,40,50,60},
    height={0,1,1,1,1,1},
    offset={1,0,0,0,0,0}) annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-118,554})));
  Modelica.Blocks.MathInteger.Sum sumF_ACT( nu = nF_ACT)  annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-120,480})));
  Modelica.Blocks.MathInteger.Sum sumM_ACT( nu = nM_ACT)  annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-200,480})));
  Modelica.Blocks.Sources.Constant SourceV_STA_VP(k=0) annotation (Placement(
        transformation(
        extent={{-21,-21},{21,21}},
        rotation=270,
        origin={-437,487})));
  Modelica.Blocks.Continuous.FirstOrder Room(y_start=273.15 + 23, T=10000)
    annotation (Placement(transformation(
        extent={{-53,-53},{53,53}},
        rotation=180,
        origin={211,643})));
  RoomClimate.TemperatureControl temperatureControl
    annotation (Placement(transformation(extent={{-50,112},{352,316}})));
  Utilities.Converters.IntegerToControlFunctionsAirTemperature
    integerToControlFunctionsAirTemperature annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-122,400})));
  Utilities.Converters.IntegerToEnergyMode integerToEnergyMode annotation (
      Placement(transformation(
        extent={{-19,-19},{19,19}},
        rotation=270,
        origin={-199,403})));
equation


  for j in 1:nM_ACT loop
    connect( SourcM_ACT[j].y, sumM_ACT.u[j]);
  end for;
  for k in 1:nF_ACT loop
    connect(SourcF_ACT[k].y, sumF_ACT.u[k]);
  end for;
    // Auto

  connect(temperatureControl.T_SETPTS, SourceT_SETPTS.y)  annotation (
      Line(
      points={{-7.79,203.8},{-361.895,203.8},{-361.895,334.4},{-363,334.4}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(temperatureControl.V_SET_VP, Room.u) annotation (Line(
      points={{392.2,254.8},{392.2,643.4},{274.6,643.4},{274.6,643}},
      color={0,0,0},
      thickness=1));
  connect(SourceV_STA_VP.y, temperatureControl.V_STA_VP) annotation (Line(
        points={{-437,463.9},{-437,183.4},{-7.79,183.4}}, color={0,0,127}));
  connect(Room.y, temperatureControl.T_ROOM) annotation (Line(points={{152.7,643},
          {-282,643},{-282,224.2},{-9.8,224.2}}, color={0,0,127}));
  connect(sumM_ACT.y, integerToEnergyMode.u) annotation (Line(points={{-200,457},
          {-200,457},{-200,418.2},{-191.4,418.2}}, color={255,127,0}));
  connect(integerToEnergyMode.M, temperatureControl.M_ACT) annotation (Line(
      points={{-206.6,380.39},{-208,380.39},{-208,244.6},{-9.8,244.6}},
      color={0,0,0},
      thickness=1));
  connect(integerToControlFunctionsAirTemperature.u, sumF_ACT.y) annotation (
      Line(points={{-114,416},{-116,416},{-116,457},{-120,457}}, color={255,127,
          0}));
  connect(integerToControlFunctionsAirTemperature.F, temperatureControl.F_ACT)
    annotation (Line(
      points={{-130,376.2},{-128,376.2},{-128,265},{-9.8,265}},
      color={0,0,0},
      thickness=1));
  annotation (experiment(StopTime=100, Interval=1),
      __Dymola_experimentSetupOutput,
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-500,-100},{500,
            760}})),
    Icon(coordinateSystem(extent={{-500,-100},{500,760}})),preferedView="Info",
    Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider & Georg Ambrosius Peler:<br>Implemented.</li>
</ul>
</html>", info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<p>Block that implements functionality of &QUOT;Temperature control&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.23, p. 72 - 74]</a>. </p>
<h4><span style=\"color: #008000\">Functional Description</span></h4>
<p>&QUOT;The <i>Temperature control</i> (RA-FL section 6, column 22; informative function block Figure 46) is used to maintain a room temperature by means of constantly determining the temperature offset from the setpoint and adjusting the valve position (manipulated variable) of a heating or cooling register. In systems with separate heating and cooling equipment, one separate <i>Temperature control</i> function shall be used each for heating and for cooling.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.23, p. 72 - 74]</a></p>
<h4><span style=\"color:#008000\">Concept</span></h4>
<p></p>
</html>"));
end TesterTemperatureControl;
