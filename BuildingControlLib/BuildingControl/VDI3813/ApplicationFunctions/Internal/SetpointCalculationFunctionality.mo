within BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Internal;
block SetpointCalculationFunctionality
  "Algorithm model to provide functionality of SetpointCalculation"
  extends Interfaces.Partial.PartialFunctionality;

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
  Nonstandardized.Internal.Limiter
                   summerCompensation(
    uMin=PAR_SUMM_uMin,
    uMax=PAR_SUMM_uMax,
    yMax=PAR_SUMM_yMax,
    yMin=PAR_SUMM_yMin)
    annotation (Placement(transformation(extent={{0,-70},{20,-50}})));

equation
  connect(T_OUT,summerCompensation.u);
  summerCompensation.y=T_OUT_shift;

  /* A implementation of the functionality of control function setpoint calculation
  described in the standard */
  /* TEconHeat */
algorithm
  if T_BMS + TEconHeat <= PAR_SETPTS_defTProtHeat then
    TEconHeat := PAR_SETPTS_defTProtHeat;
  elseif T_BMS + PAR_SETPTS_defTEconHeat > PAR_SETPTS_defTProtHeat then
    TEconHeat := T_BMS + TEconHeat;
  end if;

    /* TEconCool */
  if T_BMS + TEconCool >= PAR_SETPTS_defTProtCool then
    TEconCool := PAR_SETPTS_defTProtCool;
  elseif T_BMS + TEconCool < PAR_SETPTS_defTProtCool then
    TEconCool := T_BMS + TEconCool;
  end if;

  /* TPreComfHeat*/
  if T_SETPT + T_BMS + TPreComfHeat <= TEconHeat then
    TPreComfHeat := TEconHeat;
  else
    TPreComfHeat := T_SETPT + T_BMS + TPreComfHeat;
  end if;

    /* TPreComfCool*/
  if T_SETPT + T_BMS + T_OUT_shift + TPreComfCool >= TEconCool then
    TPreComfCool := TEconCool;
  else
    TPreComfCool := T_SETPT + T_BMS + T_OUT_shift + TPreComfCool;
  end if;

    /* TComfHeat*/
  if T_SETPT + T_BMS + TComfHeat <= TEconHeat then
    TComfHeat := TEconHeat;
  else
    TComfHeat := T_SETPT + T_BMS + TComfHeat;
  end if;

    /* TComfCool*/
  if T_SETPT + T_BMS + T_OUT_shift + TComfCool >= TEconCool then
    TComfCool := TEconCool;
  else
    TComfCool := T_SETPT + T_BMS + T_OUT_shift + TComfCool;
  end if;

  // forward outputs of T_SETPTS to connector
  T_SETPTS[1] := PAR_SETPTS_defTProtHeat;
  T_SETPTS[2] := TEconHeat;
  T_SETPTS[3] := TPreComfHeat;
  T_SETPTS[4] := TComfHeat;
  T_SETPTS[5] := TComfCool;
  T_SETPTS[6] := TPreComfCool;
  T_SETPTS[7] := TEconCool;
  T_SETPTS[8] := PAR_SETPTS_defTProtCool;

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
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
end SetpointCalculationFunctionality;
