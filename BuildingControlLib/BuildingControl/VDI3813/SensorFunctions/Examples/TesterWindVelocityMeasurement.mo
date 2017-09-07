within BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Examples;
model TesterWindVelocityMeasurement
  "Model for testing the functionality of WindVelocityMeasurement"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Pulse pulse(period=100)
    annotation (Placement(transformation(extent={{-100,40},{-80,62}})));
  Sources.Analog.PrescribedW
    prescribedPhysicalWindVelocity
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
  WindVelocityMeasurement windVelocityMeasurement
    annotation (Placement(transformation(extent={{-38,0},{42,30}})));
equation
  connect(prescribedPhysicalWindVelocity.u, pulse.y) annotation (Line(
      points={{-58,50},{-68,50},{-68,51},{-79,51}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(windVelocityMeasurement.W, prescribedPhysicalWindVelocity.W);

algorithm
when terminal() then

  assert( 1.0 - Modelica.Constants.eps < windVelocityMeasurement.W_ACT.valueWindVelocity and windVelocityMeasurement.W_ACT.valueWindVelocity < 1.0 + Modelica.Constants.eps , "ERROR") ;
// ModelicaServices.Machine.eps 
if 1.0 - Modelica.Constants.eps < windVelocityMeasurement.W_ACT.valueWindVelocity and windVelocityMeasurement.W_ACT.valueWindVelocity < 1.0 + Modelica.Constants.eps then
//terminate("Successful test of BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Examples.TesterWindVelocityMeasurement");
terminate("SUCCESS");
else
//terminate("ERROR in  BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Examples.TesterWindVelocityMeasurement");
terminate("ERROR");
end if;  
  
end when;

    annotation (preferredView="info",experiment(StopTime=1000, Interval=1),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics),
    __Dymola_experimentSetupOutput,
    Documentation(info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Simulation to check the behaviour of the function model of &QUOT;Wind velocity measurement&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.8, p. 16]</a>.</p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p>&QUOT;The sensor function <i>Wind velocity measurement</i> (RA-FL section 2, column 7; informative function block Figure 9) provides information about the flow velocity of outdoor air at the measuring site (e. g. a building facade). This information is used to protect, e. g. particularly external sunshades from damage due to wind conditions.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.8, p. 16]</a></p>
<h4><span style=\"color:#008000\">Concept</span></h4>
<p>The simulation contains a pulse signal source to immitate wind velocity sensor. The signal is passed to a converter for changing the signal type from Modelica standard type to VDI 3813 semantic type. From there the signal goes to the wind velocity measurement function. Because the parameter slope = 1 and y intercept = 0 the output should show the same pulse curve as the input pulse.</p>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
      annotation (Line(
      points={{2,30},{2,50},{-38.1,50}},
      color={0,0,0},
      smooth=Smooth.None));
end TesterWindVelocityMeasurement;
