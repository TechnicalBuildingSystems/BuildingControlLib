within BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Internal;
block AutomaticThermalControlFunctionality
  "Algorithm model to provide functionality of AutomaticThermalControl"
  extends Interfaces.Partial.PartialFunctionality;

  /***   ***   ***   ***   ***   ***   ***   ***   ***   ***/
  // Connector
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.BooleanInput
    P_ACT
    "Evaluated presence signal (true = occupied / false = unoccupied)."
    annotation (Placement(transformation(extent={{-100,60},{-80,80}}),
        iconTransformation(extent={{-100,40},{-60,60}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealInput
    H_OUT "Measured outdoor illuminance in Lux." annotation (Placement(transformation(extent={{-100,20},{-80,40}}),
        iconTransformation(extent={{-100,0},{-60,20}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealInput
    T_ROOM "Measured room air temperature in Kelvin." annotation (Placement(transformation(extent={{-100,-20},{-80,0}}),
        iconTransformation(extent={{-100,-40},{-60,-20}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealInput[8]
    T_SETPTS "Array of setpoints for heating and cooling in every energy mode." annotation (Placement(transformation(extent={{-100,-60},{-80,
            -40}}), iconTransformation(extent={{-100,-80},{-60,-60}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.RealOutput[2]
    S_MAN "New position of sunshade." annotation (Placement(transformation(extent={{100,60},{120,80}}),
        iconTransformation(extent={{100,-10},{140,10}})));

  parameter Modelica.SIunits.Illuminance PAR_H_ACT
    "Threshold value of outdoor illuminance in lux";
  parameter Real[2] PAR_S_HEAT "Heating mode setpoints for sun shade position in percent and slat angle in degree.";
  parameter Real[2] PAR_S_COOL
    "Cooling mode setpoints for sun shade position in percent and slat angle in degree.";

  inner Modelica.StateGraph.StateGraphRoot stateGraphRoot
    annotation (Placement(transformation(extent={{86,86},{94,94}})));
  Modelica.StateGraph.InitialStep initialStep annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-75,91})));
  Modelica.StateGraph.StepWithSignal start(nOut=2, nIn=2)
                                                   annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=270,
        origin={-5,73})));
  Modelica.StateGraph.StepWithSignal activated(nOut=3)
    "No presence detected, automatic thermal control active" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=270,
        origin={-33,39})));
  Modelica.StateGraph.StepWithSignal deactivated(nOut=1, nIn=4)
    "if room is occupied in active signal (y=-1) is send"       annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={19,35})));
  Modelica.StateGraph.StepWithSignal cooling annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={-41,5})));
  Modelica.StateGraph.StepWithSignal heating annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-1,-5})));

          Modelica.StateGraph.Transition t0
    annotation (Placement(transformation(extent={{-52,88},{-44,96}})));
  Modelica.StateGraph.Transition t1(condition=not P_ACT)
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=270,
        origin={-34,58})));

  Modelica.StateGraph.Transition t2(condition=P_ACT)
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=270,
        origin={4,54})));
  Modelica.StateGraph.Transition t3(condition=H_OUT <
        PAR_H_ACT)
    "if the outside illuminance is to low in activity signal is sent"
                   annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=0,
        origin={-12,26})));
  Modelica.StateGraph.Transition t4(condition=H_OUT >=
        PAR_H_ACT and T_ROOM >= T_SETPTS[5])
    "If outdoor illuminance is higher then PAR_H_ACT and if room air temperature is lower than setpoint of comfort heating energy level set point"
            annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={-43,21})));
  Modelica.StateGraph.Transition t5(condition=H_OUT >=
        PAR_H_ACT and T_ROOM <= T_SETPTS[4])
    "If outdoor illuminance is higher then PAR_H_ACT and  if room air temperature is higher than comfort cooling energy level set point"
                                                 annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=270,
        origin={-18,4})));
  Modelica.StateGraph.Transition t6(condition=not T_ROOM
         <= T_SETPTS[4] + 1)                     annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=0,
        origin={12,-4})));

  Modelica.StateGraph.Transition t7(
    condition=true,
    enableTimer=true,
    waitTime=60)  annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={25,55})));
  Modelica.Blocks.Math.MultiSum sumSunPos(nu=3)
    annotation (Placement(transformation(extent={{72,54},{78,60}})));
  Modelica.Blocks.Math.MultiSum sumSunAng(nu=3)
    annotation (Placement(transformation(extent={{72,36},{78,42}})));
  sunShadeUtility inActivePos(valTrue(y=-1), valFalse(y=0))
    annotation (Placement(transformation(extent={{32,14},{38,20}})));
  sunShadeUtility inActiveAng(valFalse(y=0), valTrue(y=0))
    annotation (Placement(transformation(extent={{32,24},{38,30}})));
  sunShadeUtility heatingPos(valTrue(y=PAR_S_HEAT[1]), valFalse(y=0))
                             annotation (Placement(transformation(
        extent={{-3,-3},{3,3}},
        rotation=270,
        origin={-1,-21})));
  sunShadeUtility heatingAng(valTrue(y=PAR_S_HEAT[2]), valFalse(y=0))
                             annotation (Placement(transformation(
        extent={{-3,-3},{3,3}},
        rotation=270,
        origin={-11,-21})));
  sunShadeUtility coolingPos(valTrue(y=PAR_S_COOL[1]), valFalse(y=0))
                             annotation (Placement(transformation(
        extent={{-3,-3},{3,3}},
        rotation=270,
        origin={-53,-1})));
  sunShadeUtility coolingAng(valTrue(y=PAR_S_COOL[2]), valFalse(y=0))
                             annotation (Placement(transformation(
        extent={{-3,-3},{3,3}},
        rotation=270,
        origin={-63,-1})));
  Modelica.StateGraph.Transition t8(condition=not T_ROOM
         >= T_SETPTS[5] - 1)
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=0,
        origin={-34,-32})));



equation
  connect(t1.outPort, activated.inPort[1]) annotation (Line(
      points={{-34,57.4},{-34,48},{-33,48},{-33,44.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(t1.inPort, start.outPort[1]) annotation (Line(
      points={{-34,59.6},{-34,64},{-5.125,64},{-5.125,67.75}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(t2.outPort, deactivated.inPort[1]) annotation (Line(
      points={{4,53.4},{4,26},{18,26},{18,29.5},{18.625,29.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(t2.inPort, start.outPort[2]) annotation (Line(
      points={{4,55.6},{4,64},{-4.875,64},{-4.875,67.75}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(t3.outPort, deactivated.inPort[2]) annotation (Line(
      points={{-11.4,26},{18,26},{18,29.5},{18.875,29.5}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(t3.inPort, activated.outPort[1]) annotation (Line(
      points={{-13.6,26},{-30,26},{-30,33.75},{-33.1667,33.75}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(t4.outPort, cooling.inPort[1]) annotation (Line(
      points={{-43,20.25},{-42,20.25},{-42,14},{-41,14},{-41,10.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(t4.inPort, activated.outPort[2]) annotation (Line(
      points={{-43,23},{-44,23},{-44,30},{-32,30},{-32,33.75},{-33,33.75}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(t5.outPort, heating.inPort[1]) annotation (Line(
      points={{-18,3.4},{-18,-5},{-6.5,-5}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(t6.inPort, heating.outPort[1]) annotation (Line(
      points={{10.4,-4},{10.4,-5},{4.25,-5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(deactivated.inPort[3], t6.outPort) annotation (Line(
      points={{19.125,29.5},{19.125,28},{20,28},{20,-4},{12.6,-4}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(initialStep.outPort[1], t0.inPort) annotation (Line(
      points={{-69.75,91},{-54.875,91},{-54.875,92},{-49.6,92}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(t0.outPort, start.inPort[1]) annotation (Line(
      points={{-47.4,92},{-4,92},{-4,78.5},{-5.25,78.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(t7.outPort, start.inPort[2]) annotation (Line(
      points={{25,55.75},{28,55.75},{28,92},{-4,92},{-4,78.5},{-4.75,78.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(deactivated.outPort[1], t7.inPort) annotation (Line(
      points={{19,40.25},{25,40.25},{25,53}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inActivePos.u, deactivated.active) annotation (Line(
      points={{31.4,17},{26,17},{26,35},{24.5,35}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(inActiveAng.u, deactivated.active) annotation (Line(
      points={{31.4,27},{31.4,26},{24.5,26},{24.5,35}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(heatingPos.u, heating.active) annotation (Line(
      points={{-1,-17.4},{-1,-10.5}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(heatingAng.u, heating.active) annotation (Line(
      points={{-11,-17.4},{0,-17.4},{0,-12},{0,-10},{0,-10.5},{-1,-10.5}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(coolingPos.u, cooling.active) annotation (Line(
      points={{-53,2.6},{-49.5,2.6},{-49.5,5},{-46.5,5}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(coolingAng.u, cooling.active) annotation (Line(
      points={{-63,2.6},{-55.5,2.6},{-55.5,5},{-46.5,5}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(inActivePos.y, sumSunPos.u[1]) annotation (Line(
      points={{38.3,17},{38.3,18},{46,18},{46,56},{72,56},{72,58.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(heatingPos.y, sumSunPos.u[2]) annotation (Line(
      points={{-1,-24.3},{-1,-54},{46,-54},{46,56},{72,56},{72,57}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(coolingPos.y, sumSunPos.u[3]) annotation (Line(
      points={{-53,-4.3},{-52,-4.3},{-52,-54},{46,-54},{46,55.6},{72,55.6}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(inActiveAng.y, sumSunAng.u[1]) annotation (Line(
      points={{38.3,27},{38.3,28},{62,28},{62,38},{72,38},{72,40.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(heatingAng.y, sumSunAng.u[2]) annotation (Line(
      points={{-11,-24.3},{-22,-24.3},{-22,-80},{62,-80},{62,39},{72,39}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(coolingAng.y, sumSunAng.u[3]) annotation (Line(
      points={{-63,-4.3},{-66,-4.3},{-66,-80},{62,-80},{62,38},{68,38},{68,37.6},
          {72,37.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(t5.inPort, activated.outPort[3]) annotation (Line(
      points={{-18,5.6},{-18,14},{-34,14},{-34,33.75},{-32.8333,33.75}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(t8.inPort, cooling.outPort[1]) annotation (Line(
      points={{-35.6,-32},{-38,-32},{-38,-0.25},{-41,-0.25}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(t8.outPort, deactivated.inPort[4]) annotation (Line(
      points={{-33.4,-32},{20,-32},{20,29.5},{19.375,29.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(sumSunPos.y, S_MAN[1]) annotation (Line(points={{78.51,57},{90.255,57},
          {90.255,65},{110,65}}, color={0,0,127}));
  connect(sumSunAng.y, S_MAN[2]) annotation (Line(points={{78.51,39},{78.51,
          53.5},{110,53.5},{110,75}}, color={0,0,127}));
  annotation (preferedView="Info",Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),                Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
",        info="<html>
<h4><span style=\"color: #008000\">Overview</span></h4>
<p>Block that implements functionality of &QUOT;Automatic thermal control&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.17, p. 59 - 61]</a>. </p>
<h4><span style=\"color: #008000\">Functional Description</span></h4>
<p>&QUOT;By means of <i>Automatic thermal control </i>(RA-FL section 6, column 16; informative function block Figure 38), the sunshade is used in unoccupied rooms to support heating or cooling by deliberately admitting or preventing solar heat inputs. This helps avoiding overheating in summer and reducing the heating load in winter. To this end, the application function processes the input information about the occupancy state of the room (<i>Occupancy evaluation</i>), the outdoor brightness (<i>Brightness measurement</i>), the room temperature (<i>Temperature measurement</i>) and the setpoints (<i>Setpoint calculation</i>) and, on this basis, generates positioning commands for the sunshade.&QUOT;<a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.17, p. 59 - 61]</a></p>
<p><br><br><b>Fig. 1: </b>UML activity diagram of the application function <i>Automatic thermal control,</i><a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.17, p. 59 - 61]</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/docUMLAkt_AutomaticThermalControl.PNG\"/> </p></td>
</tr>
</table>
<p><br><h4><span style=\"color: #008000\">Modelling Assumptions</span></h4></p>
<p><br>A time constant t = 60 s has been introduced in transition t7 to avoid oscillations in sunshade actuation. </p>
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
<td valign=\"top\"><p>P_ACT</p></td>
<td valign=\"top\"><p>Presence</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Presence.ValuePresenceEvaluationInput\">ValuePresenceEvaluation</a> </p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Evaluated presence signal.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>H_OUT</p></td>
<td valign=\"top\"><p>Illuminance</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Illuminance.ValueIlluminanceOutdoorInput\">ValueIlluminanceOutdoor</a></p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Outdoor illuminance in Lux.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>T_ROOM</p></td>
<td valign=\"top\"><p>Temperature</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature.ValueAirTemperatureRoomInput\">ValueAirTemperatureRoom</a></p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Measured room air temperature in Kelvin.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>T_SETPS</p></td>
<td valign=\"top\"><p>Temperature</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.AirTemperature.SetpointHeatCoolEnergyModesInput\">SetpointHeatCoolEnergyModes</a></p></td>
<td valign=\"top\"><p>Input</p></td>
<td valign=\"top\"><p>Array of setpoints for heating and cooling in every energy mode.</p></td>
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
<td valign=\"top\"><p>S_MAN</p></td>
<td valign=\"top\"><p>Sunshade</p></td>
<td valign=\"top\"><p><a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813.Interfaces.Sunshade.CommandSunshadeManualOutput\">CommandSunshadeManual</a> </p></td>
<td valign=\"top\"><p>Output</p></td>
<td valign=\"top\"><p>New position of the sunshade.</p></td>
</tr>
</table>
<p><br><br><br><br><br><br><b><span style=\"color: #008000;\">Parameters</span></b> </p>
<p>The following table presents the parameter of the function as specified in the standard.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Acronym</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_H_ACT</p></td>
<td valign=\"top\"><p>Threshold&nbsp;value&nbsp;of&nbsp;outdoor&nbsp;illuminance&nbsp;in&nbsp;lux.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_S_HEAT</p></td>
<td valign=\"top\"><p>Heating mode setpoints for sun shade position in percent and slat angle in degree.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>PAR_S_COOL</p></td>
<td valign=\"top\"><p>Cooling mode setpoints for sun shade position in percent and slat angle in degree.</p></td>
</tr>
</table>
</html>"));
end AutomaticThermalControlFunctionality;
