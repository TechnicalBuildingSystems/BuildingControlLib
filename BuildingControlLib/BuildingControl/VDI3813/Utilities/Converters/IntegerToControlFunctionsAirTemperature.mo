within BuildingControlLib.BuildingControl.VDI3813.Utilities.Converters;
block IntegerToControlFunctionsAirTemperature
  extends Interfaces.Partial.PartialSource;
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.ControlFunctionAirTemperatureOutput
    F annotation (Placement(transformation(extent={{100,-60},{138,-20}}),
        iconTransformation(extent={{100,-60},{138,-20}})));
  Modelica.Blocks.Interfaces.IntegerInput u annotation (Placement(
        transformation(extent={{-100,20},{-60,60}}), iconTransformation(extent={
            {-100,20},{-60,60}})));

algorithm
  if u == 1 then
    F := CFAT.off;
  elseif u == 2 then
    F := CFAT.auto;
  elseif u == 3 then
    F := CFAT.heating;
  elseif u == 4 then
    F := CFAT.cooling;
  elseif u == 5 then
    F := CFAT.precool;
  elseif u == 6 then
    F := CFAT.nightcool;
  else
    assert( 1 > u or u > 6,  "Error: Input u out of bounds choose integer values in the range 1 <= u <= 6 ");
  end if;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end IntegerToControlFunctionsAirTemperature;
