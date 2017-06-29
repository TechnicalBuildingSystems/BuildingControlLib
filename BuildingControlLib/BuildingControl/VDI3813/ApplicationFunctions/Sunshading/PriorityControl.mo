within BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Sunshading;
block PriorityControl
  "Priorisation unit for positioning signals of the sunshade."
  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Extend from PartialFunctionBlock and insert specific functionality
extends
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.Partial.PartialFunction(
     redeclare
      BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Internal.PriorityControlFunctionality
      functionality(
      PAR_PRIO_S_PROT=PAR_PRIO_S_PROT,
      PAR_PRIO_S_MAINT=PAR_PRIO_S_MAINT,
      PAR_PRIO_S_MAN=PAR_PRIO_S_MAN,
      PAR_PRIO_S_AUTO=PAR_PRIO_S_AUTO));
  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Connectors
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.Binary.ValueWindowInput
  B_WINDOW "Boolean window state (default: true == closed / false == open)." annotation (Placement(transformation(extent={{-100,50},{-80,70}}), iconTransformation(extent={{-100,40},
            {-80,60}})));
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade.CommandSunshadeProtectionInput
      S_PROT "Positioning command for the sunshade from WeatherProtection." annotation (Placement(transformation(extent={{-100,20},{-80,40}}),
          iconTransformation(extent={{-100,10},{-80,30}})));
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade.CommandSunshadeMaintenanceInput
      S_MAINT "Positioning command for the sunshade from operator." annotation (Placement(transformation(extent={{-100,-10},{-80,10}}),
          iconTransformation(extent={{-100,-20},{-80,0}})));

    BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade.CommandSunshadeManualInput
      S_MAN "Positioning command for the sunshade from ActuateSunshade or AutomaticThermalControl." annotation (Placement(transformation(extent={{-100,-40},{-80,-20}}),
          iconTransformation(extent={{-100,-50},{-80,-30}})));

    BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade.CommandSunshadeAutomaticInput
      S_AUTO "Positioning command for the sunshade from other automation functions." annotation (Placement(transformation(extent={{-100,-70},{-80,-50}}),
          iconTransformation(extent={{-100,-80},{-80,-60}})));
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade.CommandSunshadeOutput
      S_SET "New position of the sunshade." annotation (Placement(transformation(extent={{100,-10},{120,10}}),
          iconTransformation(extent={{100,-20},{140,20}})));

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Parameters
  parameter Types.EnumerationTypes.PAR_PRIO PAR_PRIO_S_PROT=Types.EnumerationTypes.PAR_PRIO.highest
    "Parameter to set priority level of S_PROT." annotation (choices(
      choice=Utilities.EnumerationTypes.PAR_PRIO.highest "highest",
      choice=Utilities.EnumerationTypes.PAR_PRIO.high "high",
      choice=Utilities.EnumerationTypes.PAR_PRIO.medium "medium",
      choice=Utilities.EnumerationTypes.PAR_PRIO.low "low"));
  parameter Types.EnumerationTypes.PAR_PRIO PAR_PRIO_S_MAINT=Types.EnumerationTypes.PAR_PRIO.high
    "Parameter to set priority level of S_MAINT." annotation (choices(
      choice=Utilities.EnumerationTypes.PAR_PRIO.highest "highest",
      choice=Utilities.EnumerationTypes.PAR_PRIO.high "high",
      choice=Utilities.EnumerationTypes.PAR_PRIO.medium "medium",
      choice=Utilities.EnumerationTypes.PAR_PRIO.low "low"));
  parameter Types.EnumerationTypes.PAR_PRIO PAR_PRIO_S_MAN=Types.EnumerationTypes.PAR_PRIO.medium
    "Parameter to set priority level of S_MAN." annotation (choices(
      choice=Utilities.EnumerationTypes.PAR_PRIO.highest "highest",
      choice=Utilities.EnumerationTypes.PAR_PRIO.high "high",
      choice=Utilities.EnumerationTypes.PAR_PRIO.medium "medium",
      choice=Utilities.EnumerationTypes.PAR_PRIO.low "low"));
  parameter Types.EnumerationTypes.PAR_PRIO PAR_PRIO_S_AUTO=Types.EnumerationTypes.PAR_PRIO.low
    "Parameter to set priority level of S_AUTO." annotation (choices(
      choice=Utilities.EnumerationTypes.PAR_PRIO.highest "highest",
      choice=Utilities.EnumerationTypes.PAR_PRIO.high "high",
      choice=Utilities.EnumerationTypes.PAR_PRIO.medium "medium",
      choice=Utilities.EnumerationTypes.PAR_PRIO.low "low"));

equation
    connect(S_SET, functionality.S_SET) annotation (Line(
        points={{110,0},{45.6,0}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(B_WINDOW, functionality.B_WINDOW) annotation (Line(
        points={{-90,60},{-50,60},{-50,19},{-30.4,19}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(S_PROT, functionality.S_PROT) annotation (Line(
        points={{-90,30},{-60,30},{-60,7.6},{-30.4,7.6}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(S_MAINT, functionality.S_MAINT) annotation (Line(
        points={{-90,0},{-60,0},{-60,-3.8},{-30.4,-3.8}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(S_AUTO, functionality.S_AUTO) annotation (Line(
        points={{-90,-60},{-50,-60},{-50,-26.6},{-30.4,-26.6}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
  connect(S_MAN, functionality.S_MAN) annotation (Line(
      points={{-90,-30},{-64,-30},{-64,-15.2},{-30.4,-15.2}},
      color={0,0,0},
      thickness=1,
      smooth=Smooth.None));

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),      graphics), preferredView="info", Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
      Documentation(info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<p>Block that implements function of &QUOT;Priority control&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.12, p. 49 - 51]</a>. </p>
<h4><span style=\"color: #008000\">Functional Description</span></h4>
<p>&QUOT;By means of the <i>Priority control</i> (RA-FL section 6, column 11; informative function block Figure 33), the order of precedence of different positioning commands from various sensor, operator and application functions is specified. This is to ensure that, on the one hand, damage to sunshades due to weather effects or mechanical collision with windows is avoided and, on the other hand, the user is enabled to override application functions by means of operator functions.&QUOT;<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.12, p. 49 - 51]</a></p>
<h4>TODO</h4>
<p>Add assert() statement to avoid model execution if Values of PAR_PRIO have the same value.</p>
<p><b>Fig. 1: </b>&QUOT;Informative representation of the application function <i>Priority control</i>&QUOT;, <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.12, Figure 33, p. 50]</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/docVDI3813_PriorityControl.PNG\" alt=\"docVDI3813_PriorityControl.PNG\"/> </p></td>
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
<td valign=\"top\"><p>B_WINDOW</p></td>
<td valign=\"top\"><p>Binary</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Binary.ValueWindowInput\">ValueWindow</a> </p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Boolean window state (default: true == closed / false == open).</p></td>
</tr>
<tr>
<td valign=\"top\"><p>S_PROT</p></td>
<td valign=\"top\"><p>Sunshade</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade.CommandSunshadeProtectionInput\">CommandSunshadeProtection</a></p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Positioning command for the sunshade from <i>WeatherProtection</i>.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>S_MAINT</p></td>
<td valign=\"top\"><p>Sunshade</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade.CommandSunshadeMaintenanceInput\">CommandSunshadeMaintenance</a></p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Positioning command for the sunshade from operator.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>S_MAN</p></td>
<td valign=\"top\"><p>Sunshade</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade.CommandSunshadeManualInput\">CommandSunshadeManual</a></p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Positioning command for the sunshade from <i>ActuateSunshade</i> or <i>AutomaticThermalControl</i>.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>S_AUTO</p></td>
<td valign=\"top\"><p>Sunshade</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade.CommandSunshadeAutomaticInput\">CommandSunshadeAutomatic</a></p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Positioning command for the sunshade from other automation functions.</p></td>
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
<td valign=\"top\"><p>S_SET</p></td>
<td valign=\"top\"><p>Sunshade</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade.CommandSunshadeOutput\">CommandSunshade</a> </p></td>
<td valign=\"top\"><p>Output</p></td>
<td valign=\"top\"><p>New position of the sunshade.</p></td>
</tr>
</table>
<p><br><br><br><br><br><br><br><br><br><br><br><b><span style=\"color: #008000;\">Parameters</span></b> </p>
<p>The following table presents the parameter of the function as specified in the standard.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_PRIO_S_PROT</p></td>
<td valign=\"top\"><p>Parameter&nbsp;to&nbsp;set&nbsp;priority&nbsp;level&nbsp;of&nbsp;S_PROT.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_PRIO_S_MAINT</p></td>
<td valign=\"top\"><p>Parameter&nbsp;to&nbsp;set&nbsp;priority&nbsp;level&nbsp;of&nbsp;S_MAINT.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_PRIO_S_MAN</p></td>
<td valign=\"top\"><p>Parameter&nbsp;to&nbsp;set&nbsp;priority&nbsp;level&nbsp;of&nbsp;S_MAN.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_PRIO_S_AUTO</p></td>
<td valign=\"top\"><p>Parameter&nbsp;to&nbsp;set&nbsp;priority&nbsp;level&nbsp;of&nbsp;S_AUTO.</p></td>
</tr>
</table>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
end PriorityControl;
