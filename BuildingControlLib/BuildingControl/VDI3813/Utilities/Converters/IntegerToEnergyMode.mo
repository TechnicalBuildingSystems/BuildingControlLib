within BuildingControlLib.BuildingControl.VDI3813.Utilities.Converters;
block IntegerToEnergyMode
  "Converts an integer value into one of the specified energy mode enumeration types."
  extends Interfaces.Partial.PartialSource;
  BuildingControlLib.BuildingControl.VDI3813.Interfaces.EnergyModeOutput M
    annotation (Placement(transformation(extent={{100,-60},{138,-20}}),
        iconTransformation(extent={{100,-60},{138,-20}})));
  Modelica.Blocks.Interfaces.IntegerInput u annotation (Placement(
        transformation(extent={{-100,20},{-60,60}}), iconTransformation(extent={
            {-100,20},{-60,60}})));

algorithm
  if u == 1 then
    M := EM.comfort;
  elseif u == 2 then
    M := EM.precomfort;
  elseif u == 3 then
    M := EM.economy;
  elseif u == 4 then
    M := EM.protection;
  else
    assert( 1 > u or u > 4,  "Error: Input u out of bounds choose integer values in the range 1 <= u <= 4 ");
  end if;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end IntegerToEnergyMode;
