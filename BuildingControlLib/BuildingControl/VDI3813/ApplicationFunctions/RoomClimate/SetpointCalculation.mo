within BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.RoomClimate;
model SetpointCalculation
  "Calculates heating and cooling setoints for all energy modes depending on user and operator input"
  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Extend from PartialFunctionBlock and insert specific functionality
  extends
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.Partial.PartialFunction(
      redeclare
      BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Internal.SetpointCalculationFunctionality
      functionality(
      PAR_SETPTS_defTComfHeat=PAR_SETPTS_defTComfHeat,
      PAR_SETPTS_defTPreComfHeat=PAR_SETPTS_defTPreComfHeat,
      PAR_SETPTS_defTEconHeat=PAR_SETPTS_defTEconHeat,
      PAR_SETPTS_defTProtHeat=PAR_SETPTS_defTProtHeat,
      PAR_SETPTS_defTComfCool=PAR_SETPTS_defTComfCool,
      PAR_SETPTS_defTPreComfCool=PAR_SETPTS_defTPreComfCool,
      PAR_SETPTS_defTEconCool=PAR_SETPTS_defTEconCool,
      PAR_SETPTS_defTProtCool=PAR_SETPTS_defTProtCool,
      PAR_SUMM_uMin=PAR_SUMM_uMin,
      PAR_SUMM_uMax=PAR_SUMM_uMax,
      PAR_SUMM_yMin=PAR_SUMM_yMin,
      PAR_SUMM_yMax=PAR_SUMM_yMax));

  /***   ***   ***   ***   ***   ***   ***     ***/
  /* PAR_SETPTS i.e. default values of setpoints */
  parameter Modelica.SIunits.Temperature   PAR_SETPTS_defTComfHeat = 273.15 + 21
    "Temperature setpoint for heating in energy mode comfort." annotation(Dialog(group = "Parameterization", descriptionLabel = true));
  parameter Modelica.SIunits.Temperature   PAR_SETPTS_defTPreComfHeat = 273.15 + 19
    "Temperature setpoint for heating in energy mode precomfort." annotation(Dialog(group = "Parameterization", descriptionLabel = true));
  parameter Modelica.SIunits.Temperature   PAR_SETPTS_defTEconHeat = 273.15 + 15
    "Temperature setpoint for heating in energy mode economy." annotation(Dialog(group = "Parameterization", descriptionLabel = true));
  parameter Modelica.SIunits.Temperature   PAR_SETPTS_defTProtHeat = 273.15 + 12
    "Temperature setpoint for heating in energy mode protection." annotation(Dialog(group = "Parameterization", descriptionLabel = true));
  parameter Modelica.SIunits.Temperature   PAR_SETPTS_defTComfCool = 273.15 + 24
    "Temperature setpoint for cooling in energy mode comfort." annotation(Dialog(group = "Parameterization", descriptionLabel = true));
  parameter Modelica.SIunits.Temperature   PAR_SETPTS_defTPreComfCool = 273.15 + 28
    "Temperature setpoint for cooling in energy mode precomfort." annotation(Dialog(group = "Parameterization", descriptionLabel = true));
  parameter Modelica.SIunits.Temperature   PAR_SETPTS_defTEconCool = 273.15 + 35
    "Temperature setpoint for cooling in energy mode economy."    annotation(Dialog(group = "Parameterization", descriptionLabel = true));
  parameter Modelica.SIunits.Temperature   PAR_SETPTS_defTProtCool = 273.15 + 40
    "Temperature setpoint for cooling in energy mode protection." annotation(Dialog(group = "Parameterization", descriptionLabel = true));

   /* PAR_SUMM i.e. parameter to configure summer compensation */
   parameter Modelica.SIunits.Temperature PAR_SUMM_uMin = 273.15 + 25
    "Outdoor air temperature when summer compensation raise starts."    annotation(Dialog(group = "Parameterization", descriptionLabel = true));
   parameter Modelica.SIunits.Temperature PAR_SUMM_uMax = 273.15 + 35
    "Outdoor air temperature when summer compensation raise ends."    annotation(Dialog(group = "Parameterization", descriptionLabel = true));
   parameter Modelica.SIunits.TemperatureDifference PAR_SUMM_yMin = 0
    "Lower limit for raise value of summer compensation."    annotation(Dialog(group = "Parameterization", descriptionLabel = true));
   parameter Modelica.SIunits.TemperatureDifference PAR_SUMM_yMax = 3
    "Upper limit for raise value of summer compensation."    annotation(Dialog(group = "Parameterization", descriptionLabel = true));

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Connectors
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealInput
    T_BMS "Setpoint shift provided by the operator of a building through a Building Management System (BMS)." annotation (Placement(transformation(extent={{-100,60},{-80,80}}),
        iconTransformation(extent={{-100,20},{-48,60}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealInput
    T_SETPT "Setpoint shift provided by the user of a room manually." annotation (Placement(transformation(extent={{-100,20},{-80,40}}),
        iconTransformation(extent={{-100,-40},{-44,0}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealInput
    T_OUT "Array of setpoints for heating and cooling in every energy mode." annotation (Placement(transformation(extent={{-100,-20},{-80,0}}),
        iconTransformation(extent={{-100,-98},{-48,-60}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealOutput[8]
    T_SETPTS "Measured outdoor air temperature value, that can cause summer compensation shift." annotation (Placement(transformation(extent={{100,60},{120,80}}),
        iconTransformation(extent={{100,-20},{154,20}})));


equation
  connect(T_BMS,functionality.T_BMS);
  connect(T_OUT,functionality.T_OUT);
  connect(T_SETPT,functionality.T_SETPT);
  connect(T_SETPTS,functionality.T_SETPTS);

    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),                                                                     graphics), Icon(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}),
        graphics),preferredView="info",
    Documentation(info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<p>Block that implements function &QUOT;Setpoint calculation&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.21, p. 68 - 70]</a>.</p>
<h4><span style=\"color: #008000\">Functional Description</span></h4>
<p><br>&QUOT;Given the fact that the various energy modes of the controller functions rely on different setpoints which in turn depend on specific conditions, calculation of these setpoints is required. Each energy mode is allocated one pair of setpoints for the heating and cooling modes. Figure 42 shows the arrangement of the setpoints and the associated P components of the heating and cooling sequences. The centre of the dead band (neutral zone), <i>T</i><sub>ZE</sub>, between the two comfort setpoints is the reference for any setpoint shift by the operator (T_BMS) or the user (T_SETPT). A change made by the operator comprises parallel shifting of the setpoints for the comfort, precomfort and economy modes. Merely the protection mode setpoints remain unchanged. Setpoint adjustments by the room user, however, only have an effect on the occupancy-dependent energy modes Comfort and Precomfort. In any case, the function <i>Setpoint calculation</i> (RA-FL section 6, column 20; informative function block Figure 43) prevents any setpoint overlaps due to shifting by always using the next setpoint as a limit. In order to avoid temperature shocks in summer when entering or leaving the building and, additionally, to reduce the energy required for cooling the building, the comfort and precomfort setpoints are raised continuously as from a specified outdoor temperature (T_OUT). This function is called summer compensation.&QUOT;<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.21, p. 68 - 70]</a></p>
<p><br>Block calculated the setpoints for energy modes protection, economy, precomfort and comfort, heating and cooling respectively. Setpoint shifts may be induced from outside through the operator (T_BMS) or manually by the user (T_SETPT). Parameter of heating and cooling protection serve as boundaries and my not be crossed. Also a setpoint might not cross another setpoint, e.g. the setpoint for heating precomfort may not be larger than the setpoint from heating comfort. Setpoint shifts affect all setpoints equally. Setpoints comfort and precomfort are shiftable from the user and the operator. Setpoints for economy mode may be shifted only by the operator. Additionally setpoint for energy modes cooling comfort and precomfort may be shifted through the outdoor air temperature (T_OUT) termed &QUOT;summer compensation&QUOT;.</p>
<p><br><br><b>Fig. 1: </b>&QUOT;Setpoints of all energy modes&QUOT;, <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.21, Figure 42, p. 68]</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/docVDI3813_SetpointsEnergyModes.PNG\"/> </p></td>
</tr>
</table>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td></td>
</tr>
</table>
<p><br><br><br><b>Fig. 2: </b>&QUOT;Informative representation of the application function <i>Setpoint calculation</i>&QUOT;, <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.21, Figure 43, p. 69]</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/docVDI3813_SetpointCalculation.PNG\" alt=\"docVDI3813_SetpointCalculation.PNG\"/> </p></td>
</tr>
</table>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>

"));
end SetpointCalculation;
