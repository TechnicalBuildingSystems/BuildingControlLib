within BuildingControlLib;
package BuildingControl "This package contains a collection of control functions for building automation referring to VDI3813 standard"


  extends Modelica.Icons.Package;


  annotation(preferredView="info",Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100.0,-100.0},{100.0,100.0}}, initialScale=0.1), graphics={
      Rectangle(
        origin={0.0,35.1488},
        fillColor={255,255,255},
        extent={{-30.0,-20.1488},{30.0,20.1488}}),
      Rectangle(
        origin={0.0,-34.8512},
        fillColor={255,255,255},
        extent={{-30.0,-20.1488},{30.0,20.1488}}),
      Line(
        origin={-51.25,0.0},
        points={{21.25,-35.0},{-13.75,-35.0},{-13.75,35.0},{6.25,35.0}}),
      Polygon(
        origin={-40.0,35.0},
        pattern=LinePattern.None,
        fillPattern=FillPattern.Solid,
        points={{10.0,0.0},{-5.0,5.0},{-5.0,-5.0}}),
      Line(
        origin={51.25,0.0},
        points={{-21.25,35.0},{13.75,35.0},{13.75,-35.0},{-6.25,-35.0}}),
      Polygon(
        origin={40.0,-35.0},
        pattern=LinePattern.None,
        fillPattern=FillPattern.Solid,
        points={{-10.0,0.0},{5.0,5.0},{5.0,-5.0}})}), Documentation(info="<html>
<p>This package contains models to simulate building control. Some models are based on technical directives or standards like <a href=\"modelica://BuildingControlLib.BuildingControl.VDI3813\">BuildingControl.VDI3813</a> and <a href=\"modelica://BuildingControlLib/BuildingControl/VDI3814/package.mo\">BuildingControl.VDI3814</a>. Models without such a source can be found in <a href=\"modelica://BuildingControlLib/BuildingControl/Nonstandardized/package.mo\">BuildingControl.Nonstandardized</a>.</p>
<p><b>Fig. 1: </b>UML use case diagramm of the <code>BuildingControlLib</code>.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/UseCaseBuildingControlLib.png\" alt=\"UseCaseBuildingControlLib.png\"/> </p></td>
</tr>
</table>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>"));
end BuildingControl;
