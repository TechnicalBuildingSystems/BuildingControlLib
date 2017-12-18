within BuildingControlLib.BuildingControl.VDI3813.Interfaces.Partial;
partial connector PartialPhysicalOutput
  "Superclass for physical function block outputs to provide graphics"

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),
                         graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{8,0},{208,90}},
          lineColor={0,0,0},
          textString="%name")}));
end PartialPhysicalOutput;
