within BuildingControlLib.BuildingControl;
package IEC60381 "Analogue signals for process control systems"

    extends Modelica.Icons.VariantsPackage;
import SI = Modelica.SIunits;





  annotation (preferredView="info",Documentation(info="<html>
<p>This package provides models to convert typical standardised control signals from automation systems to Modelica Standard Library compliant connectors and vice versa.</p>
<h4>Analogue signals for process control systems</h4>
<p>Direct current signals according to DIN IEC 60381-1 [1]:</p>
<p>0 mA &hellip; 20 mA</p>
<p>4 mA &hellip; 20 mA (offset from zero)</p>
<p>Direct voltage signals according to DIN IEC 60381-2 [2]:</p>
<p>0 V &hellip; 5 V</p>
<p>0 V &hellip; 10 V</p>
<p>1 V &hellip; 5 V (offset from zero)</p>
<p>2 V &hellip; 10 V (offset from zero)</p>
<p>-10 V &hellip; 10 V</p>
<p><b>References</b> </p>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"><tr>
<td><p>[1]</p></td>
<td><p>DIN IEC 60381-1 <i>Analogue signals for process control systems - Direct current signals</i>, Beuth Verlag GmbH, Berlin, 1980.</p></td>
</tr>
<tr>
<td><p>[2]</p></td>
<td><p>DIN IEC 60381-2 <i>Analogue signals for process control systems - Direct voltage signals</i>, Beuth Verlag GmbH, Berlin, 1978.</p></td>
</tr>
</table>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
end IEC60381;
