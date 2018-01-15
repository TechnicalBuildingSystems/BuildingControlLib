within BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Internal;
block TemperatureControlFunctionality
  "Algorithm model to provide functionality of TemperatureControl"
  extends
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.Partial.PartialFunctionality;
  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Connectors
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealInput T_ROOM
    annotation (Placement(transformation(extent={{-100,0},{-60,20}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealInput[8] T_SETPTS
    annotation (Placement(transformation(extent={{-100,-20},{-56,0}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.ControlFunctionAirTemperatureInput
    F_ACT annotation (Placement(transformation(extent={{-100,40},{-60,60}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.EnergyModeInput M_ACT
    annotation (Placement(transformation(extent={{-100,20},{-60,40}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealOutput V_SET_VP
    annotation (Placement(transformation(extent={{100,20},{140,60}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealInput V_STA_VP
    annotation (Placement(transformation(extent={{-100,-40},{-58,-20}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealOutput V_SET_LCK
    annotation (Placement(transformation(extent={{100,-20},{140,20}})));

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Parameter
  parameter Boolean PAR_CTL = true "Parameter specifying if controller is used
   for heating (==true) or cooling (== false)";

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Components
  Modelica.Blocks.Sources.Constant dummyV_LCK(k=0)
    annotation (Placement(transformation(extent={{0,-70},{20,-50}})));
  Modelica.Blocks.Math.Add add(k2=-1)
    annotation (Placement(transformation(extent={{-36,70},{-28,78}})));
  Modelica.Blocks.Math.Gain gain(k=1)
    annotation (Placement(transformation(extent={{-12,68},{-2,78}})));
  Modelica.Blocks.Nonlinear.Limiter
                           limiter(                      strict=true, limitsAtInit=true,
    uMax=1,
    uMin=0)
    annotation (Placement(transformation(extent={{18,66},{38,86}},  rotation=
            0)));
algorithm

  if PAR_CTL then
    if M_ACT == EM.protection then
      add.u2 :=  T_SETPTS[1];
    elseif M_ACT == EM.economy then
      add.u2 :=  T_SETPTS[2];
    elseif M_ACT == EM.precomfort then
      add.u2 :=  T_SETPTS[3];
    elseif M_ACT == EM.comfort then
      add.u2 :=  T_SETPTS[4];
    end if;
  else
    if M_ACT == EM.comfort then
      add.u2 :=  T_SETPTS[5];
    elseif M_ACT == EM.precomfort then
      add.u2 :=  T_SETPTS[6];
    elseif M_ACT == EM.economy then
      add.u2 :=  T_SETPTS[7];
    elseif M_ACT == EM.protection then
      add.u2 :=  T_SETPTS[8];
    end if;
  end if;

equation
  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Auto generated
  connect(add.y, gain.u) annotation (Line(
      points={{-27.6,74},{-24,74},{-24,72},{-20,72},{-20,73},{-13,73}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain.y, limiter.u) annotation (Line(
      points={{-1.5,73},{7.25,73},{7.25,76},{16,76}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(dummyV_LCK.y, V_SET_LCK) annotation (Line(points={{21,-60},{62,-60},{62,
          0},{120,0}}, color={0,0,127}));
  connect(limiter.y, V_SET_VP) annotation (Line(points={{39,76},{72,76},{72,40},
          {120,40}}, color={0,0,127}));
  connect(T_ROOM, add.u1) annotation (Line(
      points={{-80,10},{-58,10},{-58,76.4},{-36.8,76.4}},
      color={0,0,0},
      thickness=1));
  annotation (preferedView="Info",Icon(coordinateSystem(preserveAspectRatio=false, extent={{
            -100,-100},{100,100}}), graphics), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
",        info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<p>Block that implements functionality of &QUOT;Temperature control&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.23, p. 72 - 74]</a>. </p>
<h4><span style=\"color: #008000\">Functional Description</span></h4>
<p>&QUOT;The <i>Temperature control</i> (RA-FL section 6, column 22; informative function block Figure 46) is used to maintain a room temperature by means of constantly determining the temperature offset from the setpoint and adjusting the valve position (manipulated variable) of a heating or cooling register. In systems with separate heating and cooling equipment, one separate <i>Temperature control</i> function shall be used each for heating and for cooling.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.23, p. 72 - 74]</a></p>
<p><b>Fig. 1: </b>UML activity diagram of the application function <i>Temperature control</i>, <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.23, p. 72 - 74]</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/docUMLAkt_TemperatureControl.PNG\"/> </p></td>
</tr>
</table>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td></td>
</tr>
</table>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td></td>
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
<td valign=\"top\"><p>F_ACT</p></td>
<td valign=\"top\"><p>Funktion</p></td>
<td valign=\"top\"></td>
<td valign=\"top\"><p><br><br>Input</p></td>
<td valign=\"top\"><p>Valid room air temperature control function.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>M_ACT</p></td>
<td valign=\"top\"><p>Niveau</p></td>
<td valign=\"top\"></td>
<td valign=\"top\"><p><br><br>Input</p></td>
<td valign=\"top\"><p>Valid energy mode.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>T_ROOM</p></td>
<td valign=\"top\"><p>Temp</p></td>
<td valign=\"top\"></td>
<td valign=\"top\"><p><br><br>Input</p></td>
<td valign=\"top\"><p>Measured room air temperature in Kelvin.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>M_SETPTS</p></td>
<td valign=\"top\"><p>Temp[x]</p></td>
<td valign=\"top\"></td>
<td valign=\"top\"><p><br><br>Input</p></td>
<td valign=\"top\"><p>Array of setpoints for heating and cooling in every energy mode.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>V_STA_FS</p></td>
<td valign=\"top\"><p>Pos</p></td>
<td valign=\"top\"></td>
<td valign=\"top\"><p><br><br>Input</p></td>
<td valign=\"top\"><p>Currently used fan speed.</p></td>
</tr>
</table>
<h4><span style=\"color: #008000\">Output Variables</span></h4>
<p>The following table presents the output variables of the function as specified in the standard.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Datatype VDI3813</h4></p></td>
<td><p align=\"center\"><h4>Semantic data type</h4></p></td>
<td><p align=\"center\"><h4>Signal flow direction</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>V_SET_VP</p></td>
<td valign=\"top\"><p>Pos </p></td>
<td valign=\"top\"></td>
<td valign=\"top\"><p><br><br>Output</p></td>
<td valign=\"top\"><p>New valve position.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>V_SET_LCK</p></td>
<td valign=\"top\"><p>Pos</p></td>
<td valign=\"top\"></td>
<td valign=\"top\"><p><br><br>Output</p></td>
<td valign=\"top\"><p>New lock valve position.</p></td>
</tr>
</table>
<p><br><br><br><br><b><span style=\"color: #008000;\">Parameter</span></b> </p>
<p>The following table presents the parameter of the function as specified in the standard.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_XXX</p></td>
<td valign=\"top\"><p>Provide description</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_XXX</p></td>
<td valign=\"top\"><p>Provide description</p></td>
</tr>
</table>
</html>"));
end TemperatureControlFunctionality;
