within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Partial;
partial block PartialSource
  "Superclass for all source blocks to provide graphics"
equation

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}),       graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Line(
          points={{-100,-100},{100,100}},
          color={0,0,0},
          smooth=Smooth.None),
        Text(
          extent={{-88,98},{-14,68}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Std_Type"),
        Text(
          extent={{-30,-38},{80,-100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="VDI3813_Type")}));
end PartialSource;
