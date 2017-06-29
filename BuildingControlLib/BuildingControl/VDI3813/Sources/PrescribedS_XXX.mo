within BuildingControlLib.BuildingControl.VDI3813.Sources;
model PrescribedS_XXX
  "Model to interface VDI3813 Models with Modelica Standard Library, SunShade position and angle"
  // Change so that actually connectors are within connect equations
  // Description in Fritzson Book p. 107, Chapter 3.14
  // only works with connect()
  // change enumSunshade to proper
extends Interfaces.Partial.PartialSource;
  Modelica.Blocks.Interfaces.RealInput u[2] annotation (Placement(transformation(extent={{-140,
            -60},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));

   parameter Boolean enumSunshade = true;

  Interfaces.Sunshade.CommandSunshadeProtectionOutput S_PROT if enumSunshade
    annotation (Placement(transformation(extent={{100,-20},{138,20}})));
  Interfaces.Sunshade.CommandSunshadeMaintenanceOutput S_MAINT if not enumSunshade
    annotation (Placement(transformation(extent={{98,-62},{136,-22}})));
equation

    connect(u[1],S_PROT.commandSunshadeProtectionPos);
    connect(u[2],S_PROT.commandSunshadeProtectionSlatAngle);
    connect(u[1], S_MAINT.commandSunshadeMaintenancePos);
    connect(u[2], S_MAINT.commandSunshadeMaintenanceSlatAngle);

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
                                               Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end PrescribedS_XXX;
