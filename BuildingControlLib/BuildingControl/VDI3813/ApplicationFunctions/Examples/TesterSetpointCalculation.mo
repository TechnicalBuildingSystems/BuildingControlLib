within BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Examples;
model TesterSetpointCalculation
  "Model for testing the functionality of SetpointCalculation"
  extends Modelica.Icons.Example;

  Modelica.Blocks.Sources.Constant T_BMS(k=0)
    annotation (Placement(transformation(extent={{-100,36},{-80,56}})));
  Sources.AirTemperature.PrescribedT_BMS prescribedT_BMS
    annotation (Placement(transformation(extent={{-62,36},{-42,56}})));
  Sources.AirTemperature.PrescribedT_SETPT prescribedT_SETPT
    annotation (Placement(transformation(extent={{-60,2},{-40,22}})));
  Modelica.Blocks.Sources.Constant T_SETPT(k=0)
    annotation (Placement(transformation(extent={{-100,2},{-80,22}})));
  RoomClimate.SetpointCalculation setpointCalculation(PAR_SUMM_yMin=0,
      PAR_SUMM_yMax=1.2)
    annotation (Placement(transformation(extent={{-20,-32},{86,80}})));
  Sources.AirTemperature.PrescribedT_OUT prescribedT_OUT
    annotation (Placement(transformation(extent={{-62,-30},{-42,-10}})));
  Modelica.Blocks.Sources.Constant T_OUT(k=273.15 + 35)
    annotation (Placement(transformation(extent={{-100,-30},{-80,-10}})));
equation
  connect(prescribedT_BMS.u, T_BMS.y) annotation (Line(
      points={{-60,46},{-79,46}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(T_SETPT.y, prescribedT_SETPT.u) annotation (Line(
      points={{-79,12},{-58,12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(T_OUT.y, prescribedT_OUT.u) annotation (Line(
      points={{-79,-20},{-60,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prescribedT_BMS.T_BMS, setpointCalculation.T_BMS) annotation (
      Line(
      points={{-40.1,46},{-32,46},{-32,46.4},{-6.22,46.4}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedT_SETPT.T_SETPT, setpointCalculation.T_SETPT)
    annotation (Line(
      points={{-38.1,12},{-30,12},{-30,12.8},{-5.16,12.8}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedT_OUT.T_OUT, setpointCalculation.T_OUT) annotation (
      Line(
      points={{-40.1,-20},{-30,-20},{-30,-20.24},{-6.22,-20.24}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),preferedView="Info",experiment(StartTime=0, StopTime=1000, Interval=1, Tolerance=1e-6),                                                                     graphics),
      Documentation(info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Block that implements function &QUOT;Setpoint calculation&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.21, p. 68 - 70]</a>.</p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p><br>&QUOT;Given the fact that the various energy modes of the controller functions rely on different setpoints which in turn depend on specific conditions, calculation of these setpoints is required. Each energy mode is allocated one pair of setpoints for the heating and cooling modes. Figure 42 shows the arrangement of the setpoints and the associated P components of the heating and cooling sequences. The centre of the dead band (neutral zone), <i>T</i><sub>ZE</sub>, between the two comfort setpoints is the reference for any setpoint shift by the operator (T_BMS) or the user (T_SETPT). A change made by the operator comprises parallel shifting of the setpoints for the comfort, precomfort and economy modes. Merely the protection mode setpoints remain unchanged. Setpoint adjustments by the room user, however, only have an effect on the occupancy-dependent energy modes Comfort and Precomfort. In any case, the function <i>Setpoint calculation</i> (RA-FL section 6, column 20; informative function block Figure 43) prevents any setpoint overlaps due to shifting by always using the next setpoint as a limit. In order to avoid temperature shocks in summer when entering or leaving the building and, additionally, to reduce the energy required for cooling the building, the comfort and precomfort setpoints are raised continuously as from a specified outdoor temperature (T_OUT). This function is called summer compensation.&QUOT;<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.21, p. 68 - 70]</a></p>
<p><br>Block calculated the setpoints for energy modes protection, economy, precomfort and comfort, heating and cooling respectively. Setpoint shifts may be induced from outside through the operator (T_BMS) or manually by the user (T_SETPT). Parameter of heating and cooling protection serve as boundaries and my not be crossed. Also a setpoint might not cross another setpoint, e.g. the setpoint for heating precomfort may not be larger than the setpoint from heating comfort. Setpoint shifts affect all setpoints equally. Setpoints comfort and precomfort are shiftable from the user and the operator. Setpoints for economy mode may be shifted only by the operator. Additionally setpoint for energy modes cooling comfort and precomfort may be shifted through the outdoor air temperature (T_OUT) termed &QUOT;summer compensation&QUOT;.</p>
<h4><span style=\"color:#008000\">Concept</span></h4>
<p></p>
</html>",
   revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
end TesterSetpointCalculation;
