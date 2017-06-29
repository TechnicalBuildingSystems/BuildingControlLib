within BuildingControlLib.BuildingControl.VDI3813.Sources.ControlFunction;
model PrescribedF_ACT
  "Model to interface Modelica Standard Library and ValueControlFunctionCurrently"
  extends Interfaces.Partial.PartialSource;
 Modelica.Blocks.Interfaces.IntegerInput u
  annotation (Placement(transformation(extent={{-140,    -60},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.ControlFunction.ValueControlFunctionAirTemperatureCurrentlyOutput
    F_ACT annotation (Placement(transformation(extent={{100,-20},{138,20}})));
algorithm
  if u == 1 then
    F_ACT.valueControlFunctionAirTemperatureCurrently :=CF.off;
  elseif u == 2 then
       F_ACT.valueControlFunctionAirTemperatureCurrently :=CF.auto;
  elseif u == 3 then
        F_ACT.valueControlFunctionAirTemperatureCurrently :=CF.heating;
  elseif u == 4 then
        F_ACT.valueControlFunctionAirTemperatureCurrently :=CF.cooling;
  elseif u == 5 then
        F_ACT.valueControlFunctionAirTemperatureCurrently :=CF.precool;
  elseif u == 6 then
        F_ACT.valueControlFunctionAirTemperatureCurrently :=CF.nightcool;
  else
    assert( 1 > u or u > 6,  "Error: Input u out of bounds choose integer values in the range 1 < u < 6 ");
  end if;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end PrescribedF_ACT;
