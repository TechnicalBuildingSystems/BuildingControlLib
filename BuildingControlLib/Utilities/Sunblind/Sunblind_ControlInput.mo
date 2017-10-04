within BuildingControlLib.Utilities.Sunblind;
model Sunblind_ControlInput
  "Model of a sunblind which reduced the irradiation on a surface. Sunblind operation is given as an boolean input."
  extends
    AixLib.Building.Components.Weather.Sunblinds.BaseClasses.PartialSunblind;

  Modelica.Blocks.Interfaces.BooleanInput uOperate
    "If uOperate == true then sunblind is lowered and amount of irradiation is lowered else irradiation is not altered."
                                                                                                        annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,100})));
equation
   for i in 1:n loop
     if (uOperate) then
       Rad_Out[i].I=Rad_In[i].I*gsunblind[i];
       Rad_Out[i].I_dir=Rad_In[i].I_dir*gsunblind[i];
       Rad_Out[i].I_diff=Rad_In[i].I_diff*gsunblind[i];
       Rad_Out[i].I_gr=Rad_In[i].I_gr*gsunblind[i];
       Rad_Out[i].AOI=Rad_In[i].AOI;
       sunblindonoff[i]=1-gsunblind[i];
     else // quantity of solar radiation remains unchanged
       Rad_Out[i].I=Rad_In[i].I;
       Rad_Out[i].I_dir=Rad_In[i].I_dir;
       Rad_Out[i].I_diff=Rad_In[i].I_diff;
       Rad_Out[i].I_gr=Rad_In[i].I_gr;
       Rad_Out[i].AOI=Rad_In[i].AOI;
       sunblindonoff[i]=0;
     end if;
     end for;
            annotation ( Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                                                graphics={
        Rectangle(
          extent={{-80,80},{80,-80}},
          lineColor={0,0,0},
          fillColor={87,205,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-80,80},{80,66}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.HorizontalCylinder),
        Ellipse(
          extent={{-36,44},{36,-22}},
          lineColor={255,255,0},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-80,16},{80,2}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{-80,32},{80,18}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{-80,48},{80,34}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{-80,64},{80,50}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{-80,80},{-76,2}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={0,0,0}),
        Rectangle(
          extent={{76,80},{80,2}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={0,0,0}),
        Rectangle(
          extent={{-56,-14},{-54,-44}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-59,-17},{-55,-9},{-51,-17}},
          thickness=1),
        Line(
          points={{-51,-41},{-55,-49},{-59,-41}},
          thickness=1),
        Rectangle(
          extent={{-76,-64},{76,-76}},
          lineColor={0,127,0},
          fillColor={0,127,0},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-70,-56},{-12,-70}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          textString="Imax"),
        Rectangle(
          extent={{-2,80},{2,-80}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={0,0,0},
          origin={0,-78},
          rotation=-90),
        Rectangle(
          extent={{-80,2},{-76,-76}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={0,0,0}),
        Rectangle(
          extent={{76,2},{80,-76}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={0,0,0}),
        Rectangle(
          extent={{-2,80},{2,-80}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={0,0,0},
          origin={0,78},
          rotation=-90),
        Rectangle(
          extent={{46,-52},{52,-64}},
          lineColor={144,72,0},
          fillColor={144,72,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{42,-38},{56,-54}},
          lineColor={0,127,0},
          fillColor={0,127,0},
          fillPattern=FillPattern.Solid)}),
    Documentation(info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>This model represents a controllable sunblind to reduce the vectorial radiance on facades, windows. etc. </p>
<h4><span style=\"color:#008000\">Level of Development</span></h4>
<p><img src=\"modelica://AixLib/Resources/Images/Stars/stars3.png\" alt=\"stars: 3 out of 5\"/></p>
<h4><span style=\"color:#008000\">Concept</span></h4>
<ul>
<li>You can define the amount of radiance hitting the facade with gsunblind, which states how much radiance goes through the closed sunblind</li>
<li>Via a boolean input define when it is deployed and when open</li>
<li>The output sunblindonoff can be used to transfer the state of the shading to another model component. It contains 1-gsunblind, which is the amount of radiances, detained by the shading.</li>
</ul>
<h4><span style=\"color:#008000\">Assumptions</span></h4>
<p>All directions are closed at the same time.</p>
<p>All three components of the solar radiation of the tilted surface (direct, diffuse and reflected from ground) are reduced by the same factor.</p>
<p>There is no possibility to disable the sunblind in a specific direction. This isn&apos;t necessary, as you can set gsunblind in this direction to 1, which means, that the whole radiance is passing through the closed sunblind.</p>
<h4><span style=\"color:#008000\">Example Results</span></h4>
<p>To be added.</p>
<h4><span style=\"color:#008000\">Acknowledgements</span></h4>
<p>This model is derived from the model <code><font style=\"color: #ff0000; \">AixLib.Building.Components.Weather.Sunblinds.Sunblind</font></code> from the AixLib library <a href=\"https://www.github.com/RWTH-EBC/AixLib\">https://www.github.com/RWTH-EBC/AixLib</a></p>
</html>",
        revisions="<html>
<ul>
<li><i>September 15, 2016</i> by Georg Ferdinand Schneider:</li>
<p>Implemented boolean input to be controllable</p>
<p>Revision history of origin:</p>
<li><i>January 16, 2015&nbsp;</i> by Ana Constantin:<br>Implemented as extending from PartialSunblind and using the new solar radiation connectors</li>
<li><i>May 02, 2013&nbsp;</i> by Ole Odendahl:<br>Formatted documentation appropriately</li>
<li><i>January 2012,&nbsp;</i> by Moritz Lauster:<br>Implemented.</li>
</ul>
</html>"));
end Sunblind_ControlInput;
