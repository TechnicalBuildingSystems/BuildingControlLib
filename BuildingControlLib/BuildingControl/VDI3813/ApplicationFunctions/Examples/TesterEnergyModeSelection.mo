within BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Examples;
model TesterEnergyModeSelection
  "Model for testing the functionality of EnergyModeSelection"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.BooleanStep sourceP_ACT(startTime=20, startValue=true)
    annotation (Placement(transformation(extent={{-144,6},{-124,26}})));
  Modelica.Blocks.Sources.BooleanStep sourceB_WINDOW(startTime=10, startValue=
        true)
    annotation (Placement(transformation(extent={{-126,44},{-106,64}})));
  RoomClimate.EnergyModeSelection energyModeSelection
    annotation (Placement(transformation(extent={{-48,0},{116,62}})));
  Sources.EnergyMode.PrescribedM_BMS prescribedM_BMS
    annotation (Placement(transformation(extent={{-78,72},{-58,92}})));
  Sources.Presence.PrescribedP_ACT prescribedP_ACT
    annotation (Placement(transformation(extent={{-104,8},{-84,28}})));
  Sources.Binary.PrescribedB_WINDOW prescribedB_WINDOW
    annotation (Placement(transformation(extent={{-86,42},{-66,62}})));
  Modelica.Blocks.Sources.IntegerConstant SourceM_BMS(k=3)
    annotation (Placement(transformation(extent={{-116,76},{-96,96}})));
equation
  connect(prescribedP_ACT.P_ACT, energyModeSelection.P_ACT) annotation (Line(
      points={{-82.1,18},{-86,18},{-86,18.6},{-31.6,18.6}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(prescribedB_WINDOW.B_WINDOW, energyModeSelection.B_WINDOW)
    annotation (Line(
      points={{-64.1,52},{-58,52},{-58,31},{-31.6,31}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(sourceP_ACT.y, prescribedP_ACT.u) annotation (Line(
      points={{-123,16},{-138,16},{-138,18},{-102,18}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(sourceB_WINDOW.y, prescribedB_WINDOW.u) annotation (Line(
      points={{-105,54},{-94,54},{-94,52},{-84,52}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(prescribedM_BMS.M_BMS, energyModeSelection.M_BMS) annotation (Line(
      points={{-56.1,78},{-52,78},{-52,43.4},{-31.6,43.4}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));
  connect(SourceM_BMS.y, prescribedM_BMS.u) annotation (Line(
      points={{-95,86},{-76,86}},
      color={255,127,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),      graphics),
    experiment(StopTime=100),
    __Dymola_experimentSetupOutput,preferedView="Info",
    Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>

", info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Block that implements functionality of &QUOT;Energy mode selection&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.19, p. 63 - 65]</a>. </p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p>&QUOT;Selection of the energy mode for a room climate function (RA-FL section 6, column 18; informative function block Figure 40) serves for matching the energy output with the room utilisation. Instead of, e. g., keeping the room at a comfort temperature constantly and irrespective of the actual utilisation, the setpoints (see Section 6.5.21) vary depending on utilisation type, room type and any further boundary conditions such as the room occupancy planning (see VDI 3813 Part 1, Section 7). Each of the various utilisations is assigned an energy mode. The following energy modes are possible: COMFORT: Comfort mode represents the state of an occupied room. Temperature and air quality are within the comfortable range. Depending on the heating or cooling mode, the controller operates on the basis of the respective comfort setpoints. Changeover to the comfort mode is triggered by any room check-in or <i>Presence detection</i>, or can optionally be controlled by time program. PRE COMFORT: Precomfort mode represents the energy-saving state of an unoccupied room which, however, is to reach comfort mode within a short time. The controller operates on the basis of suitably deviating setpoints for heating or cooling mode and at reduced air change rate. Changeover to the precomfort mode is usually controlled by a time program. ECONOMY: Economy mode represents the energy-saving state of a room unoccupied for an extended period, e. g. during night-time. The controller operates on the basis of heating or cooling mode setpoints deviating even further and at reduced air change rate. Changeover to the economy mode is usually controlled by a time program. PROTECTION: Protection mode represents the state of a room, which merely keeps the building fabric and the mechanical equipment free from damage at minimum energy input. The controller, therefore, operates on the basis of minimumenergy setpoints for the heating or cooling mode. Changeover to this energy mode is triggered either in case of temporary disuse of the building (e. g. holidays) or by windows being opened.&QUOT;<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.19, p. 63 - 65]</a></p>
<h4><span style=\"color:#008000\">Concept</span></h4>
<p></p>
</html>"));
end TesterEnergyModeSelection;
