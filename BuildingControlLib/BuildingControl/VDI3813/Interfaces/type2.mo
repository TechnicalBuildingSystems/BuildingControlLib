within BuildingControlLib.BuildingControl.VDI3813.Interfaces;
package type2
  "Signals coming from sensors, switches, etc. or going to displays, actuators, etc."
  connector BooleanInput "Boolean input"
    extends Modelica.Blocks.Interfaces.BooleanInput;
    extends Partial.PartialPhysicalInput;
  end BooleanInput;

  connector BooleanOutput "Boolean output"
    extends Modelica.Blocks.Interfaces.BooleanOutput;
    extends Partial.PartialPhysicalOutput;
  end BooleanOutput;

  connector RealInput "Real input"
    extends Modelica.Blocks.Interfaces.RealInput;
    extends Partial.PartialPhysicalInput;
  end RealInput;

  connector RealOutput "Real output"
    extends Modelica.Blocks.Interfaces.RealOutput;
    extends Partial.PartialPhysicalOutput;
  end RealOutput;

  connector RealInput2
    extends Partial.PartialPhysicalInput;
    input Real u;
  end RealInput2;

  connector RealOutput2
    extends Partial.PartialPhysicalOutput;
    output Real y;
  end RealOutput2;
end type2;
