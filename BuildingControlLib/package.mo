within ;
package BuildingControlLib "Library for building control"

       /*****************************************************************************************/
      /*  ___       _ _     _ _               ___            _             _   __ _ _          */
     /*  / __\_   _(_) | __| (_)_ __   __ _  / __\___  _ __ | |_ _ __ ___ | | / /(_) |__      */
    /*  /__\// | | | | |/ _` | | '_ \ / _` |/ /  / _ \| '_ \| __| '__/ _ \| |/ / | | '_ \    */
   /*  / \/  \ |_| | | | (_| | | | | | (_| / /__| (_) | | | | |_| | | (_) | / /__| | |_) |  */
  /*   \_____/\__,_|_|_|\__,_|_|_| |_|\__, \____/\___/|_| |_|\__|_|  \___/|_\____/_|_.__/  */
 /*                                   |___/                                               */
/*****************************************************************************************/






  annotation (version = "0.1.0", uses(AixLib(version="0.4.0"),Buildings(version="4.0.0"),
    Modelica_StateGraph2(version="2.0.2"),
    Modelica(version="3.2.2")),                                        preferredView="info",
    Documentation(info="<html>
<p>Welcome to <code>BuildingControlLib,</code> a Modelica library for modelling an simulation of standardized and non-standardized building control functions from Building Automation Systems. Please refer to the <a href=\"modelica://BuildingControlLib.UsersGuide\">UsersGuide</a> for a introduction to the library.</p>
<p>The library is developed at the <a href=\"https://www.ibp.fraunhofer.de/en.html\">Fraunhofer Institute for Building Physics IBP</a>.</p>
<p><b>Fig. 1: </b>UML use case diagramm of the <code>BuildingControlLib</code>.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"0\"><tr>
<td><p><img src=\"modelica://BuildingControlLib/Resources/Images/UseCaseBuildingControlLib.png\" alt=\"UseCaseBuildingControlLib.png\"/> </p></td>
</tr>
</table>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"),
  Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={Bitmap(extent={{-100,102},{100,-102}}, fileName=
            "modelica://BuildingControlLib/Resources/Images/BuildingControlLib.png")}));
end BuildingControlLib;
