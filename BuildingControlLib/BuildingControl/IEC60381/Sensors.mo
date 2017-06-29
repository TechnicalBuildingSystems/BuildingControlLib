within BuildingControlLib.BuildingControl.IEC60381;
package Sensors "This package contains a set of models to convert between IEC 60381 compliant connectors and the Modelica Standard Library"
extends Modelica.Icons.SensorsPackage;
  package Current

    block SensorStandardSignalCurrent
      "Model to interface StandardSignalCurrent and Modelica Standard Library"
      extends Interfaces.Partial.PartialSensor;
     BuildingControlLib.BuildingControl.IEC60381.Interfaces.Current.StandardSignalCurrentInput
     I annotation (Placement(transformation(extent={{-100,-20},{-62,20}}),
            iconTransformation(extent={{-100,-20},{-62,20}})));
     Modelica.Blocks.Interfaces.RealOutput y
      annotation (Placement(transformation(extent={{60,-60},{140,20}}),       iconTransformation(extent={{100,-20},
                {140,20}})));

    equation

       assert( I.standardSignalCurrent > 0.0 - Modelica.Constants.eps and I.standardSignalCurrent < 0.02 + Modelica.Constants.eps,
        "Value out of bounds: 0 A < I.standardSignalCurrentLimiter < 0.02 A. However, I.standardSignalCurrent =" + String(I.standardSignalCurrent));

     I.standardSignalCurrent = y;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end SensorStandardSignalCurrent;

    block SensorStandardSignalCurrentOffset
      "Model to interface StandardSignalCurrentOffset and Modelica Standard Library"
      extends Interfaces.Partial.PartialSensor;
     BuildingControlLib.BuildingControl.IEC60381.Interfaces.Current.StandardSignalCurrentOffsetInput
     I annotation (Placement(transformation(extent={{-100,-20},{-62,20}}),
            iconTransformation(extent={{-100,-20},{-62,20}})));
     Modelica.Blocks.Interfaces.RealOutput y
      annotation (Placement(transformation(extent={{60,-60},{140,20}}),       iconTransformation(extent={{100,-20},
                {140,20}})));

    equation


       assert( I.standardSignalCurrentOffset > 0.004 - Modelica.Constants.eps and I.standardSignalCurrentOffset < 0.02 + Modelica.Constants.eps,
        "Value out of bounds: 0.004 A < I.standardSignalCurrentLimiter < 0.02 A. However, I.standardSignalCurrentOffset =" + String(I.standardSignalCurrentOffset));

     I.standardSignalCurrentOffset = y;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end SensorStandardSignalCurrentOffset;
    annotation (Icon(graphics={Text(
            extent={{-168,130},{168,-134}},
            lineColor={0,0,0},
            textStyle={TextStyle.Bold},
            textString="I")}));
  end Current;

  package Voltage

    block SensorStandardSignalVoltage5V
      "Model to interface StandardSignalVoltage5V and Modelica Standard Library"
      extends Interfaces.Partial.PartialSensor;
     BuildingControlLib.BuildingControl.IEC60381.Interfaces.Voltage.StandardSignalVoltage5VInput
     U annotation (Placement(transformation(extent={{-100,-20},{-62,20}}),
            iconTransformation(extent={{-100,-20},{-62,20}})));
     Modelica.Blocks.Interfaces.RealOutput y
      annotation (Placement(transformation(extent={{60,-60},{140,20}}),       iconTransformation(extent={{100,-20},
                {140,20}})));

    equation


       assert(U.standardSignalVoltage5V  > 0.0 - Modelica.Constants.eps and U.standardSignalVoltage5V < 5.0 + Modelica.Constants.eps,
        "Value out of bounds: 0 V < I.standardSignalCurrentLimiter < 5 V. However, I.standardSignalVoltage5V =" + String(U.standardSignalVoltage5V));


      U.standardSignalVoltage5V= y;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end SensorStandardSignalVoltage5V;

    block SensorStandardSignalVoltage5VOffset
      "Model to interface StandardSignalVoltage5VOffset and Modelica Standard Library"
      extends Interfaces.Partial.PartialSensor;
     BuildingControlLib.BuildingControl.IEC60381.Interfaces.Voltage.StandardSignalVoltage5VOffsetInput
     U annotation (Placement(transformation(extent={{-100,-20},{-62,20}}),
            iconTransformation(extent={{-100,-20},{-62,20}})));
     Modelica.Blocks.Interfaces.RealOutput y
      annotation (Placement(transformation(extent={{60,-60},{140,20}}),       iconTransformation(extent={{100,-20},
                {140,20}})));

    equation


       assert(U.standardSignalVoltage5VOffset  > 1.0 - Modelica.Constants.eps and U.standardSignalVoltage5VOffset < 5.0 + Modelica.Constants.eps,
        "Value out of bounds: 1 V < I.standardSignalCurrentLimiter < 5 V. However, I.standardSignalVoltage5VOffset =" + String(U.standardSignalVoltage5VOffset));

      U.standardSignalVoltage5VOffset= y;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end SensorStandardSignalVoltage5VOffset;

    block SensorStandardSignalVoltage10V
      "Model to interface StandardSignalVoltage10V and Modelica Standard Library"
      extends Interfaces.Partial.PartialSensor;
     BuildingControlLib.BuildingControl.IEC60381.Interfaces.Voltage.StandardSignalVoltage10VInput
     U annotation (Placement(transformation(extent={{-100,-20},{-62,20}}),
            iconTransformation(extent={{-100,-20},{-62,20}})));
     Modelica.Blocks.Interfaces.RealOutput y
      annotation (Placement(transformation(extent={{60,-60},{140,20}}),       iconTransformation(extent={{100,-20},
                {140,20}})));

    equation


       assert(U.standardSignalVoltage10V  > 0.0 - Modelica.Constants.eps and U.standardSignalVoltage10V < 10.0 + Modelica.Constants.eps,
        "Value out of bounds: 0 V < I.standardSignalCurrentLimiter < 10 V. However, I.standardSignalVoltage10V =" + String(U.standardSignalVoltage10V));


      U.standardSignalVoltage10V= y;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end SensorStandardSignalVoltage10V;

    block SensorStandardSignalVoltage10VOffset
      "Model to interface StandardSignalVoltage10VOffset and Modelica Standard Library"
      extends Interfaces.Partial.PartialSensor;
     BuildingControlLib.BuildingControl.IEC60381.Interfaces.Voltage.StandardSignalVoltage10VOffsetInput
     U annotation (Placement(transformation(extent={{-100,-20},{-62,20}}),
            iconTransformation(extent={{-100,-20},{-62,20}})));
     Modelica.Blocks.Interfaces.RealOutput y
      annotation (Placement(transformation(extent={{60,-60},{140,20}}),       iconTransformation(extent={{100,-20},
                {140,20}})));

    equation


       assert(U.standardSignalVoltage10VOffset  > 2.0 - Modelica.Constants.eps and U.standardSignalVoltage10VOffset < 10.0 + Modelica.Constants.eps,
        "Value out of bounds: 2 V < I.standardSignalCurrentLimiter < 10 V. However, I.standardSignalVoltage10VOffset =" + String(U.standardSignalVoltage10VOffset));

      U.standardSignalVoltage10VOffset= y;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end SensorStandardSignalVoltage10VOffset;

    block SensorStandardSignalVoltage10Vpn
      "Model to interface StandardSignalVoltage10Vpn and Modelica Standard Library"
      extends Interfaces.Partial.PartialSensor;
     BuildingControlLib.BuildingControl.IEC60381.Interfaces.Voltage.StandardSignalVoltage10VpnInput
     U annotation (Placement(transformation(extent={{-100,-20},{-62,20}}),
            iconTransformation(extent={{-100,-20},{-62,20}})));
     Modelica.Blocks.Interfaces.RealOutput y
      annotation (Placement(transformation(extent={{60,-60},{140,20}}),       iconTransformation(extent={{100,-20},
                {140,20}})));

    equation


       assert(U.standardSignalVoltage10Vpn  > -10.0 - Modelica.Constants.eps and U.standardSignalVoltage10Vpn < 10.0 + Modelica.Constants.eps,
        "Value out of bounds: -10 V < I.standardSignalCurrentLimiter < 10 V. However, I.standardSignalVoltage10Vpn =" + String(U.standardSignalVoltage10Vpn));


      U.standardSignalVoltage10Vpn= y;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end SensorStandardSignalVoltage10Vpn;

    annotation (Icon(graphics={Text(
            extent={{-114,118},{112,-104}},
            lineColor={0,0,0},
            textString="U",
            textStyle={TextStyle.Bold})}));
  end Voltage;
end Sensors;
