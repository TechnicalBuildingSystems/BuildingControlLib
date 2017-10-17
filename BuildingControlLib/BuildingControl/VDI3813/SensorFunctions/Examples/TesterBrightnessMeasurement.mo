within BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Examples;
model TesterBrightnessMeasurement
  "Model for testing the functionality of BrightnessMeasurement"
  extends Modelica.Icons.Example;
  BrightnessMeasurementFunctions.BrightnessMeasurementRoom
    brightnessMeasurementRoom
    annotation (Placement(transformation(extent={{-100,-80},{-40,-40}})));
  BrightnessMeasurementFunctions.BrightnessMeasurementOutdoor
    brightnessMeasurementOutdoor
    annotation (Placement(transformation(extent={{0,-80},{60,-40}})));
  Sources.Analog.PrescribedH
    prescribedPhysicalIlluminance annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-10,10})));
  Modelica.Blocks.Sources.Pulse pulse(period= 300)
    annotation (Placement(transformation(extent={{-78,28},{-58,50}})));
equation
  connect(prescribedPhysicalIlluminance.H, brightnessMeasurementOutdoor.H)
    annotation (Line(
      points={{-10,-1.9},{-12,-1.9},{-12,-16},{32,-16},{32,-40},{30,-40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(prescribedPhysicalIlluminance.H, brightnessMeasurementRoom.H)
    annotation (Line(
      points={{-10,-1.9},{-12,-1.9},{-12,-16},{-62,-16},{-62,-40},{-70,-40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(pulse.y, prescribedPhysicalIlluminance.u) annotation (Line(
      points={{-57,39},{-10.5,39},{-10.5,18},{-10,18}},
      color={0,0,127},
      smooth=Smooth.None));
      annotation ( preferredView="info", experiment(StartTime=0, StopTime=1000, Interval=1, Tolerance=1e-6),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics),
    __Dymola_experimentSetupOutput,
    Documentation(info="<html>
<h4><span style=\"color:#008000\">Overview</span></h4>
<p>Simulation to check the behaviour of the function model of &QUOT;Brightness measurement&QUOT; from VDI 3813 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.6, p. 14]</a>. </p>
<h4><span style=\"color:#008000\">Functional Description</span></h4>
<p>&QUOT;The function <i>Brightness measurement</i> (RA-FL section 2, column 5; informative function block Figure 7) is required for measuring the illuminance in rooms as well as for determining the illuminance of daylight. The former is used for lighting functions, whereas the intensity of daylight influences particularly the sunshading functions.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.6, p. 14]</a></p>
<h4><span style=\"color:#008000\">Concept</span></h4>
<p>The simulation contains a pulse signal source to imitate a brightness sensor. The signal is passed to a converter for changing the signal type from Modelica standard type to VDI 3813 semantic type. From there the signal goes to the brightness measurement functions. For both the chosen parameters are the same (slope = 1, y intercept = 0). Both outputs should show identical values and they should be similar to the input pulse. </p>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));



end TesterBrightnessMeasurement;
