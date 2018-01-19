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
  Modelica.Blocks.Sources.IntegerConstant SourceM_BMS(k=3)
    annotation (Placement(transformation(extent={{-116,76},{-96,96}})));
  Utilities.Converters.IntegerToEnergyMode integerToEnergyMode
    annotation (Placement(transformation(extent={{-76,74},{-56,94}})));
equation
  connect(sourceB_WINDOW.y, energyModeSelection.B_WINDOW) annotation (Line(
        points={{-105,54},{-76,54},{-76,31},{-31.6,31}}, color={255,0,255}));
  connect(sourceP_ACT.y, energyModeSelection.P_ACT) annotation (Line(points={{
          -123,16},{-84,16},{-84,18.6},{-31.6,18.6}}, color={255,0,255}));
  connect(SourceM_BMS.y, integerToEnergyMode.u) annotation (Line(points={{-95,
          86},{-82,86},{-82,88},{-74,88}}, color={255,127,0}));
  connect(integerToEnergyMode.M, energyModeSelection.M_BMS) annotation (Line(
      points={{-54.1,80},{-48,80},{-48,43.4},{-31.6,43.4}},
      color={0,0,0},
      thickness=1));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),
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
