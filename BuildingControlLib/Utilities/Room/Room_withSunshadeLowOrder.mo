within BuildingControlLib.Utilities.Room;
model Room_withSunshadeLowOrder
  "Room model to connect a sunshade controller. Derived from Aixlib.Building.LowOrderExamples.VDI6007.Linear.TestCase5"

  output Modelica.SIunits.Conversions.NonSIunits.Temperature_degC referenceTemp[1];
  output Modelica.SIunits.Temp_K simulationTemp;
  Modelica.Blocks.Sources.Constant infiltrationRate(k = 0) annotation(Placement(transformation(extent={{30,-26},{40,
            -16}})));
  Modelica.Blocks.Sources.Constant infiltrationTemp(k = 22) annotation(Placement(transformation(extent={{6,-26},{16,
            -16}})));
  AixLib.Utilities.HeatTransfer.HeatToStar HeatToStar(A=2)
    annotation (Placement(transformation(extent={{42,-100},{62,-80}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow machinesConvective annotation(Placement(transformation(extent = {{10, -52}, {30, -32}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow personsConvective annotation(Placement(transformation(extent = {{10, -72}, {30, -52}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow personsRadiative annotation(Placement(transformation(extent = {{10, -100}, {30, -80}})));
  Modelica.Blocks.Sources.CombiTimeTable innerLoads(extrapolation = Modelica.Blocks.Types.Extrapolation.Periodic, tableOnFile = false, table = [0, 0, 0, 0; 3600, 0, 0, 0; 7200, 0, 0, 0; 10800, 0, 0, 0; 14400, 0, 0, 0; 18000, 0, 0, 0; 21600, 0, 0, 0; 25200, 0, 0, 0; 25200, 80, 80, 200; 28800, 80, 80, 200; 32400, 80, 80, 200; 36000, 80, 80, 200; 39600, 80, 80, 200; 43200, 80, 80, 200; 46800, 80, 80, 200; 50400, 80, 80, 200; 54000, 80, 80, 200; 57600, 80, 80, 200; 61200, 80, 80, 200; 61200, 0, 0, 0; 64800, 0, 0, 0; 72000, 0, 0, 0; 75600, 0, 0, 0; 79200, 0, 0, 0; 82800, 0, 0, 0; 86400, 0, 0, 0], columns = {2, 3, 4}) annotation(Placement(transformation(extent = {{-58, -72}, {-38, -52}})));
  AixLib.Building.LowOrder.BaseClasses.ReducedOrderModel.ReducedOrderModelVDI reducedModel(
    epsi=1,
    epso=1,
    T0all(displayUnit="K") = 295.15,
    splitfac=0.09,
    R1i=0.000595515,
    Ai=75.5,
    epsw=1,
    g=1,
    Ao=10.5,
    C1i=1.48362e+007,
    RRest=0.042768721,
    R1o=0.004367913,
    C1o=1.6008e+006,
    withWindows=true,
    Aw=7,
    alphaiwi=2.23642384) annotation (Placement(transformation(extent={{48,4},{82,44}})));
  Modelica.Blocks.Sources.CombiTimeTable outdoorTemp(extrapolation = Modelica.Blocks.Types.Extrapolation.Periodic, columns = {2, 3, 4}, table = [0, 291.95, 0, 0; 3600, 291.95, 0, 0; 3600, 290.25, 0, 0; 7200, 290.25, 0, 0; 7200, 289.65, 0, 0; 10800, 289.65, 0, 0; 10800, 289.25, 0, 0; 14400, 289.25, 0, 0; 14400, 289.65, 0, 0; 18000, 289.65, 0, 0; 18000, 290.95, 0, 0; 21600, 290.95, 0, 0; 21600, 293.45, 0, 0; 25200, 293.45, 0, 0; 25200, 295.95, 0, 0; 28800, 295.95, 0, 0; 28800, 297.95, 0, 0; 32400, 297.95, 0, 0; 32400, 299.85, 0, 0; 36000, 299.85, 0, 0; 36000, 301.25, 0, 0; 39600, 301.25, 0, 0; 39600, 302.15, 0, 0; 43200, 302.15, 0, 0; 43200, 302.85, 0, 0; 46800, 302.85, 0, 0; 46800, 303.55, 0, 0; 50400, 303.55, 0, 0; 50400, 304.05, 0, 0; 54000, 304.05, 0, 0; 54000, 304.15, 0, 0; 57600, 304.15, 0, 0; 57600, 303.95, 0, 0; 61200, 303.95, 0, 0; 61200, 303.25, 0, 0; 64800, 303.25, 0, 0; 64800, 302.05, 0, 0; 68400, 302.05, 0, 0; 68400, 300.15, 0, 0; 72000, 300.15, 0, 0; 72000, 297.85, 0, 0; 75600, 297.85, 0, 0; 75600, 296.05, 0, 0; 79200, 296.05, 0, 0; 79200, 295.05, 0, 0; 82800, 295.05, 0, 0; 82800, 294.05, 0, 0; 86400, 294.05, 0, 0]) annotation(Placement(transformation(extent={{-62,0},
            {-42,20}})));
  Modelica.Blocks.Sources.CombiTimeTable windowRad(
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic,
    table=[0,0,0,0,0,0.0; 3600,0,0,0,0,0.0; 10800,0,0,0,0,0.0; 14400,0,0,0,0,
        0.0; 14400,0,0,17,0,0.0; 18000,0,0,17,0,0.0; 18000,0,0,38,0,0.0; 21600,
        0,0,38,0,0.0; 21600,0,0,59,0,0.0; 25200,0,0,59,0,0.0; 25200,0,0,98,0,
        0.0; 28800,0,0,98,0,0.0; 28800,0,0,186,0,0.0; 32400,0,0,186,0,0.0;
        32400,0,0,287,0,0.0; 36000,0,0,287,0,0.0; 36000,0,0,359,0,0.0; 39600,0,
        0,359,0,0.0; 39600,0,0,385,0,0.0; 43200,0,0,385,0,0.0; 43200,0,0,359,0,
        0.0; 46800,0,0,359,0,0.0; 46800,0,0,287,0,0.0; 50400,0,0,287,0,0.0;
        50400,0,0,186,0,0.0; 54000,0,0,186,0,0.0; 54000,0,0,98,0,0.0; 57600,0,0,
        98,0,0.0; 57600,0,0,59,0,0.0; 61200,0,0,59,0,0.0; 61200,0,0,38,0,0.0;
        64800,0,0,38,0,0.0; 64800,0,0,17,0,0.0; 68400,0,0,17,0,0.0; 68400,0,0,0,
        0,0.0; 72000,0,0,0,0,0.0; 82800,0,0,0,0,0.0; 86400,0,0,0,0,0.0],
    columns={2,3,4,5,6})
    annotation (Placement(transformation(extent={{-94,46},{-74,66}})));
  AixLib.Utilities.Sources.PrescribedSolarRad PrescribedSolarRad(n=5)
    annotation (Placement(transformation(extent={{-60,46},{-40,66}})));
  Sunblinds.Sunblind_ControlInput sunblind(n=5, gsunblind={0,0,0.15,0,0})
    annotation (Placement(transformation(extent={{-36,45},{-16,65}})));
  AixLib.Building.LowOrder.BaseClasses.SolarRadWeightedSum SolarRadWeightedSum(n=5, weightfactors={0,0,7,0,0})
    annotation (Placement(transformation(extent={{18,46},{38,66}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature varTemp annotation(Placement(transformation(extent={{-8,0},{
            12,20}})));
  Modelica.Blocks.Sources.CombiTimeTable reference( tableOnFile = false, table = [3600, 22; 7200, 22; 10800, 21.9; 14400, 21.9; 18000, 22; 21600, 22.2; 25200, 22.4; 28800, 24.4; 32400, 24.1; 36000, 24.4; 39600, 24.7; 43200, 24.9; 46800, 25.1; 50400, 25.2; 54000, 25.3; 57600, 26; 61200, 25.9; 64800, 24.3; 68400, 24.2; 72000, 24.1; 75600, 24.1; 79200, 24.1; 82800, 24.1; 86400, 24.1; 781200, 34.9; 784800, 34.8; 788400, 34.7; 792000, 34.6; 795600, 34.7; 799200, 34.8; 802800, 34.9; 806400, 36.9; 810000, 36.6; 813600, 36.8; 817200, 37; 820800, 37.2; 824400, 37.3; 828000, 37.4; 831600, 37.4; 835200, 38.1; 838800, 38; 842400, 36.4; 846000, 36.2; 849600, 36.1; 853200, 36.1; 856800, 36; 860400, 35.9; 864000, 35.9; 5101200, 44.9; 5104800, 44.8; 5108400, 44.7; 5112000, 44.6; 5115600, 44.6; 5119200, 44.6; 5122800, 44.8; 5126400, 46.7; 5130000, 46.3; 5133600, 46.5; 5137200, 46.7; 5140800, 46.8; 5144400, 46.9; 5148000, 47; 5151600, 47; 5155200, 47.6; 5158800, 47.5; 5162400, 45.8; 5166000, 45.6; 5169600, 45.4; 5173200, 45.4; 5176800, 45.3; 5180400, 45.2; 5184000, 45.1], columns = {2}, extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint) annotation(Placement(transformation(extent={{78,58},
            {98,77}})));
  AixLib.Building.LowOrder.BaseClasses.SolarRadAdapter solarRadAdapter[5]
    annotation (Placement(transformation(extent={{-8,46},{12,66}})));
  Modelica.Blocks.Interfaces.BooleanInput uOperateSunblind
    "Boolean input, if true then sunshade deployed, irradation reduced" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,100}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,90})));
  Modelica.Blocks.Interfaces.RealOutput RoomTemperature annotation (Placement(transformation(extent={{100,-10},
            {120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
equation
  referenceTemp = reference.y;
  simulationTemp = reducedModel.airload.port.T;
  // Get room air temperature
   RoomTemperature = Modelica.SIunits.Conversions.to_degC(reducedModel.airload.port.T);
  connect(personsRadiative.port, HeatToStar.Therm) annotation(Line(points = {{30, -90}, {42.8, -90}}, color = {191, 0, 0}));
  connect(outdoorTemp.y[1], varTemp.T) annotation(Line(points={{-41,10},{-10,10}},      color = {0, 0, 127}));
  connect(varTemp.port, reducedModel.equalAirTemp) annotation(Line(points={{12,10},{22,10},{22,24.8},{51.4,24.8}},          color = {191, 0, 0}));
  connect(infiltrationTemp.y, reducedModel.ventilationTemperature) annotation(Line(points={{16.5,-21},{16.5,-3.5},{
          51.4,-3.5},{51.4,14.4}},                                                                                                    color = {0, 0, 127}));
  connect(infiltrationRate.y, reducedModel.ventilationRate) annotation(Line(points={{40.5,-21},{40.5,-7.5},{58.54,-7.5},
          {58.54,6}},                                                                                                    color = {0, 0, 127}));
  connect(personsConvective.port, reducedModel.internalGainsConv) annotation(Line(points={{30,-62},{68.4,-62},{68.4,
          6}},                                                                                                    color = {191, 0, 0}));
  connect(machinesConvective.port, reducedModel.internalGainsConv) annotation(Line(points={{30,-42},{68.4,-42},{68.4,
          6}},                                                                                                    color = {191, 0, 0}));
  connect(HeatToStar.Star, reducedModel.internalGainsRad) annotation(Line(points={{61.1,-90},{78,-90},{78,6},{77.75,
          6}},                                                                                                    color = {95, 95, 95}, pattern = LinePattern.Solid));
  connect(innerLoads.y[3], machinesConvective.Q_flow) annotation(Line(points = {{-37, -62}, {-18, -62}, {-18, -42}, {10, -42}}, color = {0, 0, 127}));
  connect(innerLoads.y[2], personsConvective.Q_flow) annotation(Line(points = {{-37, -62}, {10, -62}}, color = {0, 0, 127}));
  connect(innerLoads.y[1], personsRadiative.Q_flow) annotation(Line(points = {{-37, -62}, {-18, -62}, {-18, -90}, {10, -90}}, color = {0, 0, 127}));
  connect(windowRad.y, PrescribedSolarRad.I) annotation (Line(
      points={{-73,56},{-66,56},{-66,64.9},{-58.9,64.9}},
      color={0,0,127}));
  connect(windowRad.y, PrescribedSolarRad.I_dir) annotation (Line(
      points={{-73,56},{-66,56},{-66,61},{-59,61}},
      color={0,0,127}));
  connect(windowRad.y, PrescribedSolarRad.I_diff) annotation (Line(
      points={{-73,56},{-66,56},{-66,57},{-59,57}},
      color={0,0,127}));
  connect(windowRad.y, PrescribedSolarRad.I_gr) annotation (Line(
      points={{-73,56},{-66,56},{-66,52.9},{-58.9,52.9}},
      color={0,0,127}));
  connect(windowRad.y, PrescribedSolarRad.AOI) annotation (Line(
      points={{-73,56},{-66,56},{-66,49},{-59,49}},
      color={0,0,127}));
  connect(solarRadAdapter.solarRad_out, SolarRadWeightedSum.solarRad_in)
    annotation (Line(
      points={{12,56},{19,56}},
      color={0,0,127}));
  connect(SolarRadWeightedSum.solarRad_out, reducedModel.solarRad_in)
    annotation (Line(
      points={{37,56},{57.18,56},{57.18,42.8}},
      color={0,0,127}));
  connect(PrescribedSolarRad.solarRad_out, sunblind.Rad_In) annotation (Line(
      points={{-41,56},{-35,56}},
      color={255,128,0}));
  connect(sunblind.Rad_Out, solarRadAdapter.solarRad_in) annotation (Line(
      points={{-17,56},{-7,56}},
      color={255,128,0}));
  connect(sunblind.uOperate, uOperateSunblind) annotation (Line(
      points={{-26,65},{-26,74},{0,74},{0,100}},
      color={255,0,255},
      smooth=Smooth.None));
  annotation (           experiment(StopTime=5.184e+006,Interval=3600, __Dymola_Algorithm="Lsodar"),
            __Dymola_Commands(file=
                               "modelica://AixLib/Resources/Scripts/Dymola/Building/LowOrder/Examples/Validation/Linear/TestCase5.mos"
        "Simulate and plot"),
            __Dymola_experimentSetupOutput(events=false),
            Documentation(revisions="<html>
<ul>
 <li><i>May 28, 2015 </i> by Marcus Fuchs:<br/>Added unit testing command to annotations</li>
 </ul>
 <p><i>February 2014</i>, by Peter Remmen:</p><p>Implemented</p>
 </html>", info="<html>
<p>Model derived from <code>Derived from Aixlib.Building.LowOrderExamples.VDI6007.Linear.TestCase5</code> </p>
<p><br>Test Case 5 of the VDI6007: <a name=\"result_box\">C</a>alculation of the reaction indoor temperature to radiant and convective heat source for Type room S</p>
<ul>
<li>daily input for outdoor temperature </li>
<li>no shortwave radiation on the outer wall </li>
<li>shortwave radiation through the window </li>
<li>sunblind is closed on command</li>
<li>no longwave radiation exchange between outer wall, window and ambience </li>
</ul>
<p>Reference: Room air temperature </p>
<p>Variable path: <code>reducedModel.airload.T</code></p>
<p>Maximum deviation: 0.2 K</p>
<p>All values are given in the VDI 6007-1. </p>
<p>Same Test Case exists in VDI 6020. </p>
<p>A script to run this test case can be found in AixLib\\Resources\\Scripts\\Dymola\\Building\\LowOrder\\Examples\\Validation\\Linear.</p>
</html>"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}),                                                                  graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={
        Rectangle(
          extent={{-94,80},{100,-100}},
          lineColor={215,215,215},
          fillColor={0,127,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-80,68},{86,-88}},
          lineColor={135,135,135},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-94,18},{-80,-42}},
          lineColor={170,213,255},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-22,12},{22,-12}},
          lineColor={0,0,0},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          textString="Window",
          textStyle={TextStyle.Bold},
          origin={-88,-10},
          rotation=90),
        Text(
          extent={{-48,-62},{60,-84}},
          lineColor={0,0,0},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          textString="Length"),
        Text(
          extent={{-22,11},{22,-11}},
          lineColor={0,0,0},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          textString="width",
          origin={71,-8},
          rotation=90),
        Text(
          extent={{104,26},{164,-2}},
          lineColor={0,0,0},
          textString="RoomTemperature",
          textStyle={TextStyle.Bold}),
        Text(
          extent={{-54,86},{52,62}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="NominalSignalInputSolarShade")}));
end Room_withSunshadeLowOrder;
