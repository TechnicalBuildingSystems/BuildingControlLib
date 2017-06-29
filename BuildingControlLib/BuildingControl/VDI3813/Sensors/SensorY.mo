within BuildingControlLib.BuildingControl.VDI3813.Sensors;
model SensorY
  extends Interfaces.Partial.PartialSensor;
  Interfaces.Analog.CommandPhysicalControlDriveInput Y
    annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(
          extent={{100,-20},{140,20}}), iconTransformation(extent={{100,-20},{140,
            20}})));
equation
  y = Y.commandPhysicalControlDrive;
end SensorY;
