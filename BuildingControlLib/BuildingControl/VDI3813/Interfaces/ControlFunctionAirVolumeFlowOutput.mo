within BuildingControlLib.BuildingControl.VDI3813.Interfaces;
connector ControlFunctionAirVolumeFlowOutput = output
    BuildingControlLib.BuildingControl.VDI3813.Types.EnumerationTypes.ControlFunctionsAirVolumeFlow
  "Possible control functions for air volume flow defined in VDI3813." annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={
          Polygon(
          points={{-100,100},{-100,-100},{0,0},{-100,100}},
          lineColor={0,0,0},
          lineThickness=1,
          smooth=Smooth.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-264,88},{-108,-80}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="%name",
          fontName="Arial",
          textStyle={TextStyle.Bold})}));
