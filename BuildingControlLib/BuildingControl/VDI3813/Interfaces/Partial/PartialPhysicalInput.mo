within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Partial;
partial connector PartialPhysicalInput
  "Superclass for physical function block inputs to provide graphics"

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),
                         graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{20,0},{200,92}},
          lineColor={0,0,0},
          textString="%name")}));
end PartialPhysicalInput;
