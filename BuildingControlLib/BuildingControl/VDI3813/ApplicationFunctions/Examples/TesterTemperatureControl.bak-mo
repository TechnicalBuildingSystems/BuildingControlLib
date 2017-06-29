within BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Examples;
model TesterTemperatureControl
  "Model for testing the functionality of TemperatureControl"
  extends Modelica.Icons.Example;

  parameter Integer nF_ACT = 6 "Size of enumeration ControlFunction";
  parameter Integer nM_ACT = 4 "Size of enumeration Energy Modes";
  parameter Integer nT_SETPS = 8 "Number of defined setpoints";

  parameter Real T_SETPTS[8] = {16,18,20,22,28,32,34,36};
  Modelica.Blocks.Sources.Constant SourceT_SETPTS[nT_SETPS](
   k = {273.15+T_SETPTS[1],
        273.15+T_SETPTS[2],
        273.15+T_SETPTS[3],
        273.15+T_SETPTS[4],
        273.15+T_SETPTS[5],
        273.15+T_SETPTS[6],
        273.15+T_SETPTS[7],
        273.15+T_SETPTS[8]});

 Sources.AirTemperature.PrescribedT_SETPTS prescribedT_SETPTS annotation (
      Placement(transformation(
        extent={{-40,-41},{40,41}},
        rotation=270,
        origin={-363,382})));
  Sources.AirTemperature.PrescribedT_ROOM prescribedT_ROOM annotation (
      Placement(transformation(
        extent={{-40.5,-40.5},{40.5,40.5}},
        rotation=270,
        origin={-281.5,381.5})));

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
  Sources.ControlFunction.PrescribedF_ACT prescribedF_ACT annotation (Placement(
        transformation(
        extent={{-39.5,-39.5},{39.5,39.5}},
        rotation=270,
        origin={-120.5,380.5})));
  Sources.EnergyMode.PrescribedM_ACT prescribedM_ACT annotation (Placement(
        transformation(
        extent={{-38.5,-38.5},{38.5,38.5}},
        rotation=270,
        origin={-201.5,379.5})));
  Sources.ActuatorSignal.PrescribedV_STA_FS prescribedV_STA_VP annotation (
      Placement(transformation(
        extent={{-44,-42},{44,42}},
        rotation=270,
        origin={-446,380})));
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
  Sensors.SensorV_SET_VP sensorV_SET_VP annotation (Placement(transformation(
        extent={{-67,-55},{67,55}},
        rotation=90,
        origin={399,525})));
  RoomClimate.TemperatureControl temperatureControl
    annotation (Placement(transformation(extent={{-50,112},{352,316}})));
equation

  for i in 1:nT_SETPS loop
   connect( SourceT_SETPTS[i].y, prescribedT_SETPTS.u[i]);
  end for;
  for j in 1:nM_ACT loop
    connect( SourcM_ACT[j].y, sumM_ACT.u[j]);
  end for;
  for k in 1:nF_ACT loop
    connect(SourcF_ACT[k].y, sumF_ACT.u[k]);
  end for;
    // Auto

  connect(sumM_ACT.y, prescribedM_ACT.u) annotation (Line(
      points={{-200,457},{-202,457},{-202,410.3},{-201.5,410.3}},
      color={255,127,0},
      smooth=Smooth.None));
  connect(sumF_ACT.y, prescribedF_ACT.u) annotation (Line(
      points={{-120,457},{-120,412.1},{-120.5,412.1}},
      color={255,127,0},
      smooth=Smooth.None));
  connect(SourceV_STA_VP.y, prescribedV_STA_VP.u) annotation (Line(
      points={{-437,463.9},{-437,433.95},{-446,433.95},{-446,415.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sensorV_SET_VP.y, Room.u) annotation (Line(
      points={{421,605.4},{413.5,605.4},{413.5,643},{274.6,643}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prescribedT_ROOM.u, Room.y) annotation (Line(
      points={{-281.5,413.9},{-279.75,413.9},{-279.75,643},{152.7,643}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(temperatureControl.V_SET_VP, sensorV_SET_VP.V_SET_VP) annotation (
      Line(
      points={{392.2,254.8},{392.2,358.4},{399,358.4},{399,471.4}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(temperatureControl.F_ACT, prescribedF_ACT.F_ACT) annotation (Line(
      points={{-9.8,265},{-65.9,265},{-65.9,333.495},{-120.5,333.495}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(temperatureControl.M_ACT, prescribedM_ACT.M_ACT) annotation (Line(
      points={{-9.8,244.6},{-108.9,244.6},{-108.9,333.685},{-201.5,333.685}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(temperatureControl.T_ROOM, prescribedT_ROOM.T_ROOM) annotation (Line(
      points={{-9.8,224.2},{-147.9,224.2},{-147.9,333.305},{-281.5,333.305}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(temperatureControl.T_SETPS, prescribedT_SETPTS.T_SETPTS) annotation (
      Line(
      points={{-7.79,203.8},{-189.895,203.8},{-189.895,334.4},{-363,334.4}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedV_STA_VP.V_STA_FS, temperatureControl.V_STA_FS) annotation (
     Line(
      points={{-446,327.64},{-236,327.64},{-236,183.4},{-7.79,183.4}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  annotation (experiment(StopTime=100, Interval=1),
      __Dymola_experimentSetupOutput,
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),      graphics={Text(
          extent={{-88,50},{-52,16}},
          lineColor={0,0,255},
          textString="See source code"), Line(
          points={{-58,28},{-52,18},{-54,18}},
          color={0,0,255},
          smooth=Smooth.None)}),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),preferedView="Info",
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
