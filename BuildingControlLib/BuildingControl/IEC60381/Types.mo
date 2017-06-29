within BuildingControlLib.BuildingControl.IEC60381;
package Types "Standard types from IEC60381"
extends Modelica.Icons.TypesPackage;
  package Current
    type StandardSignalCurrent = SI.Current (min = 0, max = 0.02) "Standard current signal between 0 milli ampere and 20 milli ampere"
      annotation (Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
    type StandardSignalCurrentOffset = SI.Current (min = 0.004, max = 0.02) "Standard current signal between 4 milli ampere and 20 milli ampere"
      annotation (Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
    annotation (Icon(graphics={Text(
            extent={{-168,130},{168,-134}},
            lineColor={0,0,0},
            textStyle={TextStyle.Bold},
            textString="I")}),Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
  end Current;

  package Voltage
    type StandardSignalVoltage5V = SI.Voltage (min = 0, max = 5) "Standard voltage signal between 0 Volt and 5 Volt"
      annotation (Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
    type StandardSignalVoltage10V = SI.Voltage (min = 0, max = 10) "Standard voltage signal between 0 Volt and 10 Volt"
      annotation (Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
    type StandardSignalVoltage5VOffset = SI.Voltage (min = 1, max = 5) "Standard voltage signal between 1 Volt and 5 Volt"
      annotation (Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
    type StandardSignalVoltage10VOffset = SI.Voltage ( min = 2, max = 10) "Standard voltage signal between 2 Volt and 10 Volt"
      annotation (Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
    type StandardSignalVoltage10Vpn = SI.Voltage (min = -10, max = 10) "Standard voltage signal between -10 Volt and 10 Volt"
      annotation (Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
    annotation (Icon(graphics={Text(
            extent={{-114,118},{112,-104}},
            lineColor={0,0,0},
            textString="U",
            textStyle={TextStyle.Bold})}), Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));

  end Voltage;
  annotation (Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
end Types;
