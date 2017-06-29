within BuildingControlLib.BuildingControl.VDI3813.Sources.EnergyMode;
model PrescribedM_ACT
  "Model to interface Modelica Standard Library and ValueEnergyModeCurrently"
  extends Interfaces.Partial.PartialSource;
 Modelica.Blocks.Interfaces.IntegerInput u
  annotation (Placement(transformation(extent={{-140,    -60},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
 BuildingControlLib.BuildingControl.VDI3813.Interfaces.EnergyMode.ValueEnergyModeCurrentlyOutput
 M_ACT annotation (Placement(transformation(extent={{100,-20},{138,20}})));
algorithm
  if u == 1 then
    M_ACT.valueEnergyModeCurrently :=EM.comfort;
  elseif u == 2 then
       M_ACT.valueEnergyModeCurrently :=EM.precomfort;
  elseif u == 3 then
        M_ACT.valueEnergyModeCurrently :=EM.economy;
  elseif u == 4 then
        M_ACT.valueEnergyModeCurrently :=EM.protection;
  else
    assert( 1 > u or u > 4,   "Error: Input u out of bounds choose integer values in the range 1 < u < 4 ");
  end if;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end PrescribedM_ACT;
