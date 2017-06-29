within BuildingControlLib.BuildingControl.IEC60381;
package Sources
extends Modelica.Icons.SourcesPackage;
  package Current

    block SourceStandardSignalCurrent
      "Model to interface Modelica Standard Library and StandardSignalCurrent"
      extends Interfaces.Partial.PartialSource;
     Modelica.Blocks.Interfaces.RealInput u
      annotation (Placement(transformation(extent={{-140,    -60},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
     BuildingControlLib.BuildingControl.IEC60381.Interfaces.Current.StandardSignalCurrentOutput
     I annotation (Placement(transformation(extent={{100,-20},{138,20}})));
    equation
     u = I.standardSignalCurrent;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end SourceStandardSignalCurrent;

    block SourceStandardSignalCurrentOffset
      "Model to interface Modelica Standard Library and StandardSignalCurrentOffset"
      extends Interfaces.Partial.PartialSource;
     Modelica.Blocks.Interfaces.RealInput u
      annotation (Placement(transformation(extent={{-140,    -60},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
     BuildingControlLib.BuildingControl.IEC60381.Interfaces.Current.StandardSignalCurrentOffsetOutput
     I annotation (Placement(transformation(extent={{100,-20},{138,20}})));
    equation
     u = I.standardSignalCurrentOffset;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end SourceStandardSignalCurrentOffset;
    annotation (Icon(graphics={Text(
            extent={{-168,130},{168,-134}},
            lineColor={0,0,0},
            textStyle={TextStyle.Bold},
            textString="I")}));
  end Current;

  package Voltage

    block SourceStandardSignalVoltage5V
      "Model to interface Modelica Standard Library and StandardSignalVoltage5V"
      extends Interfaces.Partial.PartialSource;
     Modelica.Blocks.Interfaces.RealInput u
      annotation (Placement(transformation(extent={{-140,    -60},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
     BuildingControlLib.BuildingControl.IEC60381.Interfaces.Voltage.StandardSignalVoltage5VOutput
     U annotation (Placement(transformation(extent={{100,-20},{138,20}})));
    equation
     u = U.standardSignalVoltage5V;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end SourceStandardSignalVoltage5V;

    block SourceStandardSignalVoltage5VOffset
      "Model to interface Modelica Standard Library and StandardSignalVoltage5VOffset"
      extends Interfaces.Partial.PartialSource;
     Modelica.Blocks.Interfaces.RealInput u
      annotation (Placement(transformation(extent={{-140,    -60},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
     BuildingControlLib.BuildingControl.IEC60381.Interfaces.Voltage.StandardSignalVoltage5VOffsetOutput
     U annotation (Placement(transformation(extent={{100,-20},{138,20}})));
    equation
     u = U.standardSignalVoltage5VOffset;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end SourceStandardSignalVoltage5VOffset;

    block SourceStandardSignalVoltage10V
      "Model to interface Modelica Standard Library and StandardSignalVoltage10V"
      extends Interfaces.Partial.PartialSource;
     Modelica.Blocks.Interfaces.RealInput u
      annotation (Placement(transformation(extent={{-140,    -60},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
     BuildingControlLib.BuildingControl.IEC60381.Interfaces.Voltage.StandardSignalVoltage10VOutput
     U annotation (Placement(transformation(extent={{100,-20},{138,20}})));
    equation
     u = U.standardSignalVoltage10V;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end SourceStandardSignalVoltage10V;

    block SourceStandardSignalVoltage10VOffset
      "Model to interface Modelica Standard Library and StandardSignalVoltage10VOffset"
      extends Interfaces.Partial.PartialSource;
     Modelica.Blocks.Interfaces.RealInput u
      annotation (Placement(transformation(extent={{-140,    -60},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
     BuildingControlLib.BuildingControl.IEC60381.Interfaces.Voltage.StandardSignalVoltage10VOffsetOutput
     U annotation (Placement(transformation(extent={{100,-20},{138,20}})));
    equation
     u = U.standardSignalVoltage10VOffset;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end SourceStandardSignalVoltage10VOffset;

    block SourceStandardSignalVoltage10Vpn
      "Model to interface Modelica Standard Library and StandardSignalVoltage10Vpn"
      extends Interfaces.Partial.PartialSource;
     Modelica.Blocks.Interfaces.RealInput u
      annotation (Placement(transformation(extent={{-140,    -60},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
     BuildingControlLib.BuildingControl.IEC60381.Interfaces.Voltage.StandardSignalVoltage10VpnOutput
     U annotation (Placement(transformation(extent={{100,-20},{138,20}})));
    equation
     u = U.standardSignalVoltage10Vpn;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end SourceStandardSignalVoltage10Vpn;

    annotation (Icon(graphics={Text(
            extent={{-114,118},{112,-104}},
            lineColor={0,0,0},
            textString="U",
            textStyle={TextStyle.Bold})}));
  end Voltage;
end Sources;
