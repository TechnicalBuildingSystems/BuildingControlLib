within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Partial;
partial block PartialSensor
  "Superclass for all sensor blocks to provide graphics"
equation

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-100,-100},{100,100}},
          color={0,0,0},
          smooth=Smooth.None),
        Text(
          extent={{2,-66},{80,-100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Std_Type"),
        Text(
          extent={{-80,100},{30,38}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="VDI3813_Type")}));
end PartialSensor;
