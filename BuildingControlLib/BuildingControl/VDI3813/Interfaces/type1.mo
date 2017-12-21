within BuildingControlLib.BuildingControl.VDI3813.Interfaces;
package type1 "Control signals, passed between room automation functions"
  connector RealInput "Real input"
    extends Partial.PartialInput;
    input Real u;
  end RealInput;

  connector RealOutput "Real output"
    extends Partial.PartialOutput;
    output Real y;
  end RealOutput;

  connector BooleanOutput2 "Boolean output"
    extends Partial.PartialOutput;
    output Boolean y;
  end BooleanOutput2;

  connector BooleanInput2 "Boolean input"
    extends Partial.PartialInput;
    input Boolean u;
  end BooleanInput2;

  connector BooleanOutput "Boolean output"
    extends Modelica.Blocks.Interfaces.BooleanOutput;
    extends Partial.PartialOutput;
  end BooleanOutput;

  connector BooleanInput "Boolean input"
    extends Modelica.Blocks.Interfaces.BooleanInput;
    extends Partial.PartialInput;
  end BooleanInput;
end type1;
