within BuildingControlLib.BuildingControl.VDI3813.Sources.Time;
model PrescribedD_ACT
  "Model to interface Modelica Standard Library and ValueCurrentTimeAndDate"
  extends Interfaces.Partial.PartialSource;
 Modelica.Blocks.Interfaces.RealInput u
  annotation (Placement(transformation(extent={{-140,    -60},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
 BuildingControlLib.BuildingControl.VDI3813.Interfaces.Time.ValueCurrentTimeAndDateOutput
 D_ACT annotation (Placement(transformation(extent={{100,-20},{138,20}})));
equation
 u = D_ACT.valueCurrentTimeAndDate;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end PrescribedD_ACT;
