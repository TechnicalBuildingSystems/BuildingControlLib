within BuildingControlLib.BuildingControl.IEC60381;
package Interfaces "Contains connectors of standard signals from IEC60381"
  extends Modelica.Icons.InterfacesPackage;
  package Current
    connector StandardSignalCurrentInput
      "Standardised electrical current between 0 mA and 20 mA for information transmission."
      input BuildingControlLib.BuildingControl.IEC60381.Types.Current.StandardSignalCurrent standardSignalCurrent;
      annotation (Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
    end StandardSignalCurrentInput;

    connector StandardSignalCurrentOutput
      "Standardised electrical current between 0 mA and 20 mA for information transmission."
       output BuildingControlLib.BuildingControl.IEC60381.Types.Current.StandardSignalCurrent standardSignalCurrent;
      annotation (Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
    end StandardSignalCurrentOutput;

    connector StandardSignalCurrentOffsetInput
      "Standardised electrical current between 4 mA and 20 mA for information transmission."
       input
        BuildingControlLib.BuildingControl.IEC60381.Types.Current.StandardSignalCurrentOffset  standardSignalCurrentOffset;
      annotation (Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
    end StandardSignalCurrentOffsetInput;

    connector StandardSignalCurrentOffsetOutput
      "Standardised electrical current between 4 mA and 20 mA for information transmission."
       output
        BuildingControlLib.BuildingControl.IEC60381.Types.Current.StandardSignalCurrentOffset standardSignalCurrentOffset;
      annotation (Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
    end StandardSignalCurrentOffsetOutput;
    annotation (Icon(graphics={Text(
            extent={{-168,130},{168,-134}},
            lineColor={0,0,0},
            textStyle={TextStyle.Bold},
            textString="I")}), Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
  end Current;

  package Voltage
    connector StandardSignalVoltage5VInput
      "Standardised electrical potential difference between 0 V and 5 V for information transmission."
       input BuildingControlLib.BuildingControl.IEC60381.Types.Voltage.StandardSignalVoltage5V standardSignalVoltage5V;
      annotation (Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
    end StandardSignalVoltage5VInput;

    connector StandardSignalVoltage5VOutput
      "Standardised electrical potential difference between 0 V and 5 V for information transmission."
       output BuildingControlLib.BuildingControl.IEC60381.Types.Voltage.StandardSignalVoltage5V standardSignalVoltage5V;
      annotation (Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
    end StandardSignalVoltage5VOutput;

    connector StandardSignalVoltage5VOffsetInput
      "Standardised electrical potential difference between 1 V and 5 V for information transmission."
       input
        BuildingControlLib.BuildingControl.IEC60381.Types.Voltage.StandardSignalVoltage5VOffset      standardSignalVoltage5VOffset;
      annotation (Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
    end StandardSignalVoltage5VOffsetInput;

    connector StandardSignalVoltage5VOffsetOutput
      "Standardised electrical potential difference between 1 V and 5 V for information transmission."
       output
        BuildingControlLib.BuildingControl.IEC60381.Types.Voltage.StandardSignalVoltage5VOffset       standardSignalVoltage5VOffset;
      annotation (Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
    end StandardSignalVoltage5VOffsetOutput;

    connector StandardSignalVoltage10VInput
      "Standardised electrical potential difference between 0 V and 10 V for information transmission."
       input BuildingControlLib.BuildingControl.IEC60381.Types.Voltage.StandardSignalVoltage10V standardSignalVoltage10V;
      annotation (Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
    end StandardSignalVoltage10VInput;

      connector StandardSignalVoltage10VOutput
      "Standardised electrical potential difference between 0 V and 10 V for information transmission."
       output
        BuildingControlLib.BuildingControl.IEC60381.Types.Voltage.StandardSignalVoltage10V       standardSignalVoltage10V;
      annotation (Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
      end StandardSignalVoltage10VOutput;

    connector StandardSignalVoltage10VOffsetInput
      "Standardised electrical potential difference between 2 V and 10 V for information transmission."
       input
        BuildingControlLib.BuildingControl.IEC60381.Types.Voltage.StandardSignalVoltage10VOffset      standardSignalVoltage10VOffset;
      annotation (Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
    end StandardSignalVoltage10VOffsetInput;

      connector StandardSignalVoltage10VOffsetOutput
      "Standardised electrical potential difference between 2 V and 10 V for information transmission."
       output
        BuildingControlLib.BuildingControl.IEC60381.Types.Voltage.StandardSignalVoltage10VOffset       standardSignalVoltage10VOffset;
      annotation (Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
      end StandardSignalVoltage10VOffsetOutput;

    connector StandardSignalVoltage10VpnInput
      "Standardised electrical potential difference between -10 V and 10 V for information transmission."
       input
        BuildingControlLib.BuildingControl.IEC60381.Types.Voltage.StandardSignalVoltage10Vpn      standardSignalVoltage10Vpn;
      annotation (Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
    end StandardSignalVoltage10VpnInput;

      connector StandardSignalVoltage10VpnOutput
      "Standardised electrical potential difference between -10 V and 10 V for information transmission."
       output
        BuildingControlLib.BuildingControl.IEC60381.Types.Voltage.StandardSignalVoltage10Vpn       standardSignalVoltage10Vpn;
      annotation (Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
      end StandardSignalVoltage10VpnOutput;

    annotation (Icon(graphics={Text(
            extent={{-114,118},{112,-104}},
            lineColor={0,0,0},
            textString="U",
            textStyle={TextStyle.Bold})}),Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
  end Voltage;

  package Partial "Contains models that provide important attributes to others or enforce their implementation by using them as superclass"
   extends Modelica.Icons.InternalPackage;

  partial block PartialSource
    "Superclass for all source blocks to provide graphics"
  equation

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}),       graphics={Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid), Line(
            points={{-100,-100},{100,100}},
            color={0,0,0},
            smooth=Smooth.None),
          Text(
            extent={{-88,98},{-14,68}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            textString="Std_Type"),
          Text(
            extent={{-30,-38},{80,-100}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
              textString="IEC60381_Type")}));
  end PartialSource;

  partial block PartialSensor
    "Superclass for all sensor blocks to provide graphics"
  equation

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}), graphics={
          Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Line(
            points={{-100,-100},{100,100}},
            color={0,0,0},
            smooth=Smooth.None),
          Text(
            extent={{2,-66},{80,-100}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            textString="Std_Type"),
          Text(
            extent={{-80,100},{30,38}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
              textString="IEC60381_Type")}));
  end PartialSensor;
  end Partial;

  annotation (Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
end Interfaces;
