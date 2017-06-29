within BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Internal;
block SetpointCalculationFunctionality
  "Algorithm model to provide functionality of SetpointCalculation"
  extends Interfaces.Partial.PartialFunctionality;

 /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  /* PAR_SETPTS i.e. default values of setpoints */
  parameter Modelica.SIunits.Temperature   PAR_SETPTS_defTComfHeat
    "Start value and default value of temperature setpoint of energy mode comfort heating"
                                                                                         annotation(Dialog(group = "Parameterization", descriptionLabel = true));
  parameter Modelica.SIunits.Temperature   PAR_SETPTS_defTPreComfHeat
    "Start value and default value of temperature setpoint of energy mode precomfort heating"    annotation(Dialog(group = "Parameterization", descriptionLabel = true));
  parameter Modelica.SIunits.Temperature   PAR_SETPTS_defTEconHeat
    "Start value and default value of temperature setpoint of energy mode economy heating"    annotation(Dialog(group = "Parameterization", descriptionLabel = true));
  parameter Modelica.SIunits.Temperature   PAR_SETPTS_defTProtHeat
    "Start value and default value of temperature setpoint of energy mode protection heating"    annotation(Dialog(group = "Parameterization", descriptionLabel = true));

  parameter Modelica.SIunits.Temperature   PAR_SETPTS_defTComfCool
    "Start value and default value of temperature setpoint of energy mode comfort Cooling"    annotation(Dialog(group = "Parameterization", descriptionLabel = true));
  parameter Modelica.SIunits.Temperature   PAR_SETPTS_defTPreComfCool
    "Start value and default value of temperature setpoint of energy mode precomfort Cooling"    annotation(Dialog(group = "Parameterization", descriptionLabel = true));
  parameter Modelica.SIunits.Temperature   PAR_SETPTS_defTEconCool
    "Start value and default value of temperature setpoint of energy mode economy Cooling"    annotation(Dialog(group = "Parameterization", descriptionLabel = true));
  parameter Modelica.SIunits.Temperature   PAR_SETPTS_defTProtCool
    "Start value and default value of temperature setpoint of energy mode protection Cooling"    annotation(Dialog(group = "Parameterization", descriptionLabel = true));

   /* PAR_SUMM i.e. parameter to configure summer compensation */
   parameter Modelica.SIunits.Temperature PAR_SUMM_uMin
    "Parameter when minimum of limiter is reached"    annotation(Dialog(group = "Parameterization", descriptionLabel = true));
   parameter Modelica.SIunits.Temperature PAR_SUMM_uMax
    "Parameter when maximum of limiter is reached"    annotation(Dialog(group = "Parameterization", descriptionLabel = true));
   parameter Modelica.SIunits.TemperatureDifference PAR_SUMM_yMin
    "Parameter defining maximum setpoint shift value"    annotation(Dialog(group = "Parameterization", descriptionLabel = true));
   parameter Modelica.SIunits.TemperatureDifference PAR_SUMM_yMax
    "Parameter defining minimum setpoint shift value"    annotation(Dialog(group = "Parameterization", descriptionLabel = true));
  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  /* Variables of model */

    output Modelica.SIunits.Temperature TComfHeat(start=PAR_SETPTS_defTComfHeat,displayUnit="degC")
    "Current value of the setpoint of energy mode comfort heating";
    output Modelica.SIunits.Temperature TPreComfHeat(start=PAR_SETPTS_defTPreComfHeat,displayUnit="degC")
    "Current value of the setpoint of energy mode precomfort heating";
    output Modelica.SIunits.Temperature TEconHeat(start=PAR_SETPTS_defTEconHeat,displayUnit="degC")
    "Current value of the setpoint of energy mode economy heating";

    output Modelica.SIunits.Temperature TComfCool(start=PAR_SETPTS_defTComfCool,displayUnit="degC")
    "Current value of the setpoint of energy mode comfort Cooling";
    output Modelica.SIunits.Temperature TPreComfCool(start=PAR_SETPTS_defTPreComfCool,displayUnit="degC")
    "Current value of the setpoint of energy mode precomfort Cooling";
    output Modelica.SIunits.Temperature TEconCool(start=PAR_SETPTS_defTEconCool,displayUnit="degC")
    "Current value of the setpoint of energy mode economy Cooling";
    output Modelica.SIunits.TemperatureDifference T_OUT_shift(start=0)
    "Setpoint shift from summer compensation";

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  /* Connectors */
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature.SetpointAirTemperatureOperatorInput
    T_BMS "Setpoint shift provided by the operator of a building through a Building Management System (BMS)." annotation (Placement(transformation(extent={{-100,60},{-80,80}}),
        iconTransformation(extent={{-100,20},{-48,60}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature.SetpointAirTemperatureUserInput
    T_SETPT "Setpoint shift provided by the user of a room manually." annotation (Placement(transformation(extent={{-100,20},{-80,40}}),
        iconTransformation(extent={{-100,-40},{-44,0}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature.SetpointHeatCoolEnergyModesOutput
    T_SETPTS "Measured outdoor air temperature value, that can cause summer compensation shift." annotation (Placement(transformation(extent={{100,60},{120,80}}),
        iconTransformation(extent={{100,-20},{154,20}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature.ValueAirTemperatureOutdoorInput
    T_OUT "Array of setpoints for heating and cooling in every energy mode." annotation (Placement(transformation(extent={{-100,-20},{-80,0}}),
        iconTransformation(extent={{-100,-98},{-48,-60}})));
  Nonstandardized.Internal.Limiter
                   summerCompensation(
    uMin=PAR_SUMM_uMin,
    uMax=PAR_SUMM_uMax,
    yMax=PAR_SUMM_yMax,
    yMin=PAR_SUMM_yMin)
    annotation (Placement(transformation(extent={{0,-70},{20,-50}})));
  Sensors.SensorT_OUT sensorT_OUT
    annotation (Placement(transformation(extent={{-32,-88},{-12,-68}})));

equation
  connect(T_OUT,sensorT_OUT.T_OUT);
  connect(sensorT_OUT.y,summerCompensation.u);
  summerCompensation.y=T_OUT_shift;

  /* A implementation of the functionality of control function setpoint calculation
  described in the standard */
  /* TEconHeat */
algorithm
  if T_BMS.setpointAirTemperatureOperator + TEconHeat <= PAR_SETPTS_defTProtHeat then
    TEconHeat := PAR_SETPTS_defTProtHeat;
  elseif T_BMS.setpointAirTemperatureOperator + PAR_SETPTS_defTEconHeat > PAR_SETPTS_defTProtHeat then
    TEconHeat := T_BMS.setpointAirTemperatureOperator + TEconHeat;
  end if;

    /* TEconCool */
  if T_BMS.setpointAirTemperatureOperator + TEconCool >= PAR_SETPTS_defTProtCool then
    TEconCool := PAR_SETPTS_defTProtCool;
  elseif T_BMS.setpointAirTemperatureOperator + TEconCool < PAR_SETPTS_defTProtCool then
    TEconCool := T_BMS.setpointAirTemperatureOperator + TEconCool;
  end if;

  /* TPreComfHeat*/
  if T_SETPT.setpointAirTemperatureUser + T_BMS.setpointAirTemperatureOperator + TPreComfHeat <= TEconHeat then
    TPreComfHeat := TEconHeat;
  else
    TPreComfHeat := T_SETPT.setpointAirTemperatureUser + T_BMS.setpointAirTemperatureOperator + TPreComfHeat;
  end if;

    /* TPreComfCool*/
  if T_SETPT.setpointAirTemperatureUser + T_BMS.setpointAirTemperatureOperator + T_OUT_shift + TPreComfCool >= TEconCool then
    TPreComfCool := TEconCool;
  else
    TPreComfCool := T_SETPT.setpointAirTemperatureUser + T_BMS.setpointAirTemperatureOperator + T_OUT_shift + TPreComfCool;
  end if;

    /* TComfHeat*/
  if T_SETPT.setpointAirTemperatureUser + T_BMS.setpointAirTemperatureOperator + TComfHeat <= TEconHeat then
    TComfHeat := TEconHeat;
  else
    TComfHeat := T_SETPT.setpointAirTemperatureUser + T_BMS.setpointAirTemperatureOperator + TComfHeat;
  end if;

    /* TComfCool*/
  if T_SETPT.setpointAirTemperatureUser + T_BMS.setpointAirTemperatureOperator + T_OUT_shift + TComfCool >= TEconCool then
    TComfCool := TEconCool;
  else
    TComfCool := T_SETPT.setpointAirTemperatureUser + T_BMS.setpointAirTemperatureOperator + T_OUT_shift + TComfCool;
  end if;

  // forward outputs of T_SETPT.setpointAirTemperatureUserS to connector
  T_SETPTS.setpointHeatCoolEnergyModes[1] := PAR_SETPTS_defTProtHeat;
  T_SETPTS.setpointHeatCoolEnergyModes[2] := TEconHeat;
  T_SETPTS.setpointHeatCoolEnergyModes[3] := TPreComfHeat;
  T_SETPTS.setpointHeatCoolEnergyModes[4] := TComfHeat;
  T_SETPTS.setpointHeatCoolEnergyModes[5] := TComfCool;
  T_SETPTS.setpointHeatCoolEnergyModes[6] := TPreComfCool;
  T_SETPTS.setpointHeatCoolEnergyModes[7] := TEconCool;
  T_SETPTS.setpointHeatCoolEnergyModes[8] := PAR_SETPTS_defTProtCool;

  annotation (preferedView="Info",Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),                                                                               Icon(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}),
        graphics),
    Documentation(info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Block that implements function &QUOT;Setpoint calculation&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.21, p. 68 - 70]</a>.</p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p><br>&QUOT;Given the fact that the various energy modes of the controller functions rely on different setpoints which in turn depend on specific conditions, calculation of these setpoints is required. Each energy mode is allocated one pair of setpoints for the heating and cooling modes. Figure 42 shows the arrangement of the setpoints and the associated P components of the heating and cooling sequences. The centre of the dead band (neutral zone), <i>T</i><sub>ZE</sub>, between the two comfort setpoints is the reference for any setpoint shift by the operator (T_BMS) or the user (T_SETPT). A change made by the operator comprises parallel shifting of the setpoints for the comfort, precomfort and economy modes. Merely the protection mode setpoints remain unchanged. Setpoint adjustments by the room user, however, only have an effect on the occupancy-dependent energy modes Comfort and Precomfort. In any case, the function <i>Setpoint calculation</i> (RA-FL section 6, column 20; informative function block Figure 43) prevents any setpoint overlaps due to shifting by always using the next setpoint as a limit. In order to avoid temperature shocks in summer when entering or leaving the building and, additionally, to reduce the energy required for cooling the building, the comfort and precomfort setpoints are raised continuously as from a specified outdoor temperature (T_OUT). This function is called summer compensation.&QUOT;<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.21, p. 68 - 70]</a></p>
<p><br>Block calculated the setpoints for energy modes protection, economy, precomfort and comfort, heating and cooling respectively. Setpoint shifts may be induced from outside through the operator (T_BMS) or manually by the user (T_SETPT). Parameter of heating and cooling protection serve as boundaries and my not be crossed. Also a setpoint might not cross another setpoint, e.g. the setpoint for heating precomfort may not be larger than the setpoint from heating comfort. Setpoint shifts affect all setpoints equally. Setpoints comfort and precomfort are shiftable from the user and the operator. Setpoints for economy mode may be shifted only by the operator. Additionally setpoint for energy modes cooling comfort and precomfort may be shifted through the outdoor air temperature (T_OUT) termed &QUOT;summer compensation&QUOT;.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p> </p></td>
</tr>
</table>
<p><br><b>Fig. 1: </b>UML activity diagram of the application function <i>Setpoint calculation, </i><a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.21, p. 68 - 70]</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/docUMLAkt_SetpointCalculation.PNG\"/> </p></td>
</tr>
</table>
<h4><span style=\"color: #008000\">Input Variables</span></h4>
<p>The following table presents the input variables of the function as specified in the standard. </p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Datatype VDI3813</h4></p></td>
<td><p align=\"center\"><h4>Semantic data type</h4></p></td>
<td><p align=\"center\"><h4>Signal flow direction</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>T_BMS</p></td>
<td valign=\"top\"><p>Temperature</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature.SetpointTemperatureOperatorInput\">SetpointTemperatureOperator</a> </p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Setpoint shift provided by the operator of a building through a Building Management System (BMS).</p></td>
</tr>
<tr>
<td valign=\"top\"><p>T_SETPT</p></td>
<td valign=\"top\"><p>Temperature</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature.SetpointTemperatureUserInput\">SetpointTemperatureUser</a></p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Setpoint shift provided by the user of a room manually.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>T_OUT</p></td>
<td valign=\"top\"><p>Temperature</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature.ValueAirTemperatureOutdoorInput\">ValueTemperatureOutdoor</a></p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Measured outdoor air temperature value, that can cause summer compensation shift.</p></td>
</tr>
</table>
<p><br><h4><span style=\"color: #008000\">Output Variables</span></h4></p>
<p>The following table presents the output variables of the function as specified in the standard.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Datatype VDI3813</h4></p></td>
<td><p align=\"center\"><h4>Semantic data type</h4></p></td>
<td><p align=\"center\"><h4>Signal flow direction</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>T_SETPS</p></td>
<td valign=\"top\"><p>Temperature</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature.SetpointHeatCoolEnergyModesOutput\">SetpointSetpointHeatCoolEnergyModes</a> </p></td>
<td valign=\"top\"><p>Output</p></td>
<td valign=\"top\"><p>Array of setpoints for heating and cooling in every energy mode.</p></td>
</tr>
</table>
<p><br><br><br><br><br><br><br><br><br><b><span style=\"color: #008000;\">Parameters</span></b> </p>
<p>The following table presents the parameters of the function.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_SETPS_defTComfHeat</p></td>
<td valign=\"top\"><p>Temperature setpoint for heating in energy mode comfort.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_SETPS_defTPreComfHeat</p></td>
<td valign=\"top\"><p>Temperature setpoint for heating in energy mode precomfort.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_SETPS_defTEconHeat</p></td>
<td valign=\"top\"><p>Temperature setpoint for heating in energy mode economy.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_SETPS_defTProtHeat</p></td>
<td valign=\"top\"><p>Temperature setpoint for heating in energy mode protection.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_SETPS_defTComfCool</p></td>
<td valign=\"top\"><p>Temperature setpoint for cooling in energy mode comfort.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_SETPS_defTPreComfCool</p></td>
<td valign=\"top\"><p>Temperature setpoint for cooling in energy mode precomfort.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_SETPS_defTEconCool</p></td>
<td valign=\"top\"><p>Temperature setpoint for cooling in energy mode economy.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_SETPS_defTProtCool</p></td>
<td valign=\"top\"><p>Temperature setpoint for cooling in energy mode protection.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_SUMM_uMin</p></td>
<td valign=\"top\"><p>Outdoor air temperature when summer compensation raise starts.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_SUMM_uMax</p></td>
<td valign=\"top\"><p>Outdoor air temperature when summer compensation raise ends.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_SUMM_yMin</p></td>
<td valign=\"top\"><p>Lower limit for raise value of summer compensation.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_SUMM_yMax</p></td>
<td valign=\"top\"><p>Upper limit for raise value of summer compensation.</p></td>
</tr>
</table>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
end SetpointCalculationFunctionality;
