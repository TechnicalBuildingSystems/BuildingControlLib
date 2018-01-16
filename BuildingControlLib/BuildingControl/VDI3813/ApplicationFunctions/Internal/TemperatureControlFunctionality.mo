within BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Internal;
block TemperatureControlFunctionality
  "Algorithm model to provide functionality of TemperatureControl"
  extends
    BuildingControlLib.BuildingControl.VDI3813.Interfaces.Partial.PartialFunctionality;
  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Connectors
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.ControlFunctionAirTemperatureInput
    F_ACT "Valid room air temperature control function." annotation (Placement(transformation(extent={{-100,40},{-60,60}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.EnergyModeInput M_ACT "Valid energy mode."
    annotation (Placement(transformation(extent={{-100,20},{-60,40}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealInput T_ROOM "Measured room air temperature in Kelvin."
    annotation (Placement(transformation(extent={{-100,0},{-60,20}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealInput[8] T_SETPTS "Array of setpoints for heating and cooling in every energy mode."
    annotation (Placement(transformation(extent={{-100,-20},{-56,0}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealInput V_STA_FS "Currently used fan speed."
    annotation (Placement(transformation(extent={{-100,-40},{-58,-20}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealOutput V_SET_VP "New valve position."
    annotation (Placement(transformation(extent={{100,20},{140,60}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealOutput V_SET_LCK "New lock valve position."
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
</html>",
        revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
end TemperatureControlFunctionality;
