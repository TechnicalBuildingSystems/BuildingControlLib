within BuildingControlLib.Utilities.AirHandlingUnit.AHU;
model AhuAsUnitWithCtrl
  "Air handling unit with heating coil, cooling coil and economizer"
  import Buildings;
  replaceable package MediumA =
      Buildings.Media.Air(T_default=293.15);
  package MediumW = Buildings.Media.Water "Medium model for water";

  parameter Modelica.SIunits.Volume VRooCor=2698 "Room volume corridor";
  parameter Modelica.SIunits.Volume VRooSou=568.77 "Room volume south";
  parameter Modelica.SIunits.Volume VRooNor=568.77 "Room volume north";
  parameter Modelica.SIunits.Volume VRooEas=360.08 "Room volume east";
  parameter Modelica.SIunits.Volume VRooWes=360.08 "Room volume west";

  constant Real conv=1.2/3600 "Conversion factor for nominal mass flow rate";
  parameter Modelica.SIunits.MassFlowRate m0_flow_cor=6*VRooCor*conv
    "Design mass flow rate core";
  parameter Modelica.SIunits.MassFlowRate m0_flow_sou=7*VRooSou*conv
    "Design mass flow rate perimeter 1";
  parameter Modelica.SIunits.MassFlowRate m0_flow_eas=10*VRooEas*conv
    "Design mass flow rate perimeter 2";
  parameter Modelica.SIunits.MassFlowRate m0_flow_nor=7*VRooNor*conv
    "Design mass flow rate perimeter 3";
  parameter Modelica.SIunits.MassFlowRate m0_flow_wes=10*VRooWes*conv
    "Design mass flow rate perimeter 4";
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal=m0_flow_cor +
      m0_flow_sou + m0_flow_eas + m0_flow_nor + m0_flow_wes
    "Nominal mass flow rate";
   parameter Modelica.SIunits.Angle lat=41.98*3.14159/180 "Latitude";

  Modelica.Blocks.Sources.Constant yMixDmp(k=0.7)
    "Wenn y = 1 dann keine Rckzirkulation von return air!" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={100,-154})));
  Modelica.Blocks.Sources.Constant yHeatCoilVlv(k=1) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={138,-154})));
  Modelica.Blocks.Sources.Constant yCoolCoilVlv(k=0) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={178,-152})));
  AhuAsUnit ahuAsUnit
    annotation (Placement(transformation(extent={{74,-74},{194,28}})));
  Buildings.Controls.SetPoints.OccupancySchedule occSch(occupancy=3600*{7,17})
    annotation (Placement(transformation(
        extent={{-97,-97},{97,97}},
        rotation=180,
        origin={657,-83})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal annotation (Placement(
        transformation(
        extent={{-13,-13},{13,13}},
        rotation=180,
        origin={447,-21})));
  Controls.ModeSelector_VDI3814 modeSelector_VDI3814_1
    annotation (Placement(transformation(extent={{264,-72},{358,38}})));
equation
  connect(yMixDmp.y, ahuAsUnit.yMixBoxDmp) annotation (Line(
      points={{100,-143},{100,-124},{110,-124},{110,-74},{104,-74}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(yHeatCoilVlv.y, ahuAsUnit.yHeaVlv) annotation (Line(
      points={{138,-143},{138,-74},{128,-74}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(yCoolCoilVlv.y, ahuAsUnit.yCooVlv) annotation (Line(
      points={{178,-141},{160,-141},{160,-74},{152,-74}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanToReal.u, occSch.occupied) annotation (Line(
      points={{462.6,-21},{516,-21},{516,-26},{550.3,-26},{550.3,-24.8}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(modeSelector_VDI3814_1.cb, ahuAsUnit.weaBus) annotation (Line(
      points={{318.622,-14.4419},{244.311,-14.4419},{244.311,-2.6},{170,-2.6}},
      color={255,204,51},
      thickness=0.5));

  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-400,-400},{
            1400,600}})),
    Documentation(info="<html>
<p>
This model consist of an HVAC system, a building envelope model and a model
for air flow through building leakage and through open doors based
on wind pressure and flow imbalance of the HVAC system.
</p>
<p>
The HVAC system is a variable air volume (VAV) flow system with economizer
and a heating and cooling coil in the air handler unit. There is also a
reheat coil and an air damper in each of the five zone inlet branches.
The figure below shows the schematic diagram of the HVAC system
</p>
<p align=\"center\">
<img alt=\"image\" src=\"modelica://Buildings/Resources/Images/Examples/VAVReheat/vavSchematics.png\" border=\"1\"/>
</p>
<p>
The control is an implementation of the control sequence
<i>VAV 2A2-21232</i> of the Sequences of Operation for
Common HVAC Systems (ASHRAE, 2006). In this control sequence, the
supply fan speed is regulated based on the duct static pressure.
The return fan controller tracks the supply fan air flow rate
reduced by a fixed offset. The duct static pressure is adjusted
so that at least one VAV damper is 90% open. The economizer dampers
are modulated to track the setpoint for the mixed air dry bulb temperature.
Priority is given to maintain a minimum outside air volume flow rate.
In each zone, the VAV damper is adjusted to meet the room temperature
setpoint for cooling, or fully opened during heating.
The room temperature setpoint for heating is tracked by varying
the water flow rate through the reheat coil. There is also a
finite state machine that transitions the mode of operation of
the HVAC system between the modes
<i>occupied</i>, <i>unoccupied off</i>, <i>unoccupied night set back</i>,
<i>unoccupied warm-up</i> and <i>unoccupied pre-cool</i>.
In the VAV model, all air flows are computed based on the
duct static pressure distribution and the performance curves of the fans.
Local loop control is implemented using proportional and proportional-integral
controllers, while the supervisory control is implemented
using a finite state machine.
</p>
<p>
To model the heat transfer through the building envelope,
a model of five interconnected rooms is used.
The five room model is representative of one floor of the
new construction medium office building for Chicago, IL,
as described in the set of DOE Commercial Building Benchmarks
(Deru et al, 2009). There are four perimeter zones and one core zone.
The envelope thermal properties meet ASHRAE Standard 90.1-2004.
The thermal room model computes transient heat conduction through
walls, floors and ceilings and long-wave radiative heat exchange between
surfaces. The convective heat transfer coefficient is computed based
on the temperature difference between the surface and the room air.
There is also a layer-by-layer short-wave radiation,
long-wave radiation, convection and conduction heat transfer model for the
windows. The model is similar to the
Window 5 model and described in TARCOG 2006.
</p>
<p>
Each thermal zone can have air flow from the HVAC system, through leakages of the building envelope (except for the core zone) and through bi-directional air exchange through open doors that connect adjacent zones. The bi-directional air exchange is modeled based on the differences in static pressure between adjacent rooms at a reference height plus the difference in static pressure across the door height as a function of the difference in air density.
There is also wind pressure acting on each facade. The wind pressure is a function
of the wind speed and wind direction. Therefore, infiltration is a function of the
flow imbalance of the HVAC system and of the wind conditions.
</p>
<h4>References</h4>
<p>
ASHRAE.
<i>Sequences of Operation for Common HVAC Systems</i>.
ASHRAE, Atlanta, GA, 2006.
</p>
<p>
Deru M., K. Field, D. Studer, K. Benne, B. Griffith, P. Torcellini,
 M. Halverson, D. Winiarski, B. Liu, M. Rosenberg, J. Huang, M. Yazdanian, and D. Crawley.
<i>DOE commercial building research benchmarks for commercial buildings</i>.
Technical report, U.S. Department of Energy, Energy Efficiency and
Renewable Energy, Office of Building Technologies, Washington, DC, 2009.
</p>
<p>
TARCOG 2006: Carli, Inc., TARCOG: Mathematical models for calculation
of thermal performance of glazing systems with our without
shading devices, Technical Report, Oct. 17, 2006.
</p>
</html>", revisions="<html>
<ul>
<li>
May 19, 2016, by Michael Wetter:<br/>
Changed chilled water supply temperature to <i>6&circ;C</i>.
This is
for <a href=\"https://github.com/iea-annex60/modelica-annex60/issues/509\">#509</a>.
</li>
<li>
April 26, 2016, by Michael Wetter:<br/>
Changed controller for freeze protection as the old implementation closed
the outdoor air damper during summer.
This is
for <a href=\"https://github.com/iea-annex60/modelica-annex60/issues/511\">#511</a>.
</li>
<li>
January 22, 2016, by Michael Wetter:<br/>
Corrected type declaration of pressure difference.
This is
for <a href=\"https://github.com/iea-annex60/modelica-annex60/issues/404\">#404</a>.
</li>
<li>
September 24, 2015 by Michael Wetter:<br/>
Set default temperature for medium to avoid conflicting
start values for alias variables of the temperature
of the building and the ambient air.
This is for
<a href=\"https://github.com/lbl-srg/modelica-buildings/issues/426\">issue 426</a>.
</li>
</ul>
</html>"),
__Dymola_Commands(file="modelica://Buildings/Resources/Scripts/Dymola/Examples/VAVReheat/ClosedLoop.mos"
        "Simulate and plot"),
    experiment(
      StopTime=604800,
      Interval=60,
      Tolerance=1e-006,
      __Dymola_Algorithm="Radau"),
    __Dymola_experimentSetupOutput);
end AhuAsUnitWithCtrl;
