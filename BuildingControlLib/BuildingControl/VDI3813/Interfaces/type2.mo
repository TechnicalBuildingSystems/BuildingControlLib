within BuildingControlLib.BuildingControl.VDI3813.Interfaces;
package type2
  "Signals coming from sensors, switches, etc. or going to displays, actuators, etc."
  connector BooleanInput
    extends Modelica.Blocks.Interfaces.BooleanInput;
    extends Partial.PartialPhysicalInput;
  end BooleanInput;

  connector BooleanOutput
    extends Modelica.Blocks.Interfaces.BooleanOutput;
    extends Partial.PartialPhysicalOutput;
  end BooleanOutput;

  connector RealInput
    extends Modelica.Blocks.Interfaces.RealInput;
    extends Partial.PartialPhysicalInput;

  end RealInput;

  connector RealOutput
    extends Modelica.Blocks.Interfaces.RealOutput;
    extends Partial.PartialPhysicalOutput;
  end RealOutput;
end type2;
