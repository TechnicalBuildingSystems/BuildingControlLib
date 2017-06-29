within BuildingControlLib.BuildingControl.VDI3813.Sources.EnergyMode;
model PrescribedM_BMS
  "Model to interface Modelica Standard Library and CommandEnergyModeTimeSchedule"
  extends Interfaces.Partial.PartialSource;

  BuildingControlLib.BuildingControl.VDI3813.Interfaces.EnergyMode.CommandEnergyModeTimeScheduleOutput M_BMS
    annotation (Placement(transformation(extent={{100,-60},{138,-20}}),
        iconTransformation(extent={{100,-60},{138,-20}})));
  Modelica.Blocks.Interfaces.IntegerInput u annotation (Placement(
        transformation(extent={{-100,20},{-60,60}}), iconTransformation(extent={
            {-100,20},{-60,60}})));
algorithm
  if u == 1 then
    M_BMS.commandEnergyModeTimeSchedule :=EM.comfort;
  elseif u == 2 then
        M_BMS.commandEnergyModeTimeSchedule :=EM.precomfort;
  elseif u == 3 then
        M_BMS.commandEnergyModeTimeSchedule :=EM.economy;
  elseif u == 4 then
        M_BMS.commandEnergyModeTimeSchedule :=EM.protection;
  else
    assert( 1 > u or u > 4,  "Error: Input u out of bounds choose integer values in the range 1 < u < 4 ");
  end if;

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end PrescribedM_BMS;
