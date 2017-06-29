within BuildingControlLib.Utilities.Room;
package Examples
  "This package contains example models to show the use of other library models"
  extends Modelica.Icons.ExamplesPackage;
  model TestRoomWithHeating "Example how to test room with heating"
    extends Modelica.Icons.Example;
    BuildingControlLib.Utilities.Room.Room_withHeatingHighOrder case900FF_HIL
      annotation (Placement(transformation(extent={{-20,18},{42,83}})));
    Modelica.Blocks.Sources.RealExpression valvOpening(y=5.2)
      "Nominal signal to heating valve opening"
      annotation (Placement(transformation(extent={{-76,14},{-56,34}})));
  equation
    connect(valvOpening.y, case900FF_HIL.valveSignalInput) annotation (Line(
        points={{-55,24},{-48,24},{-48,24.3375},{-36.275,24.3375}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics), Documentation(info="<html>
<p>This is room model which provides access to a valve control to influence the heating.</p>
</html>"),
      experiment(StopTime=604800, Interval=60),
      __Dymola_experimentSetupOutput);
  end TestRoomWithHeating;

  model TestRoomSunshade "Example for sunshade automation"
    extends Modelica.Icons.Example;
    Utilities.Room.Room_withSunshadeHighOrder room_withSunshade_1_1
      annotation (Placement(transformation(extent={{-32,18},{44,80}})));
    Modelica.Blocks.Sources.BooleanExpression booleanExpression(y=false)
      "Deploy sunshade (== true, irradiation through window is reduced), else == false"
      annotation (Placement(transformation(extent={{-82,10},{-62,30}})));
  equation
    connect(booleanExpression.y, room_withSunshade_1_1.uSunblind) annotation (
        Line(
        points={{-61,20},{-44,20},{-44,33.5},{-28.2,33.5}},
        color={255,0,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics), Documentation(info="<html>
            <p>This is room model to test room automation simulation library.</p>
</html>"));
  end TestRoomSunshade;
end Examples;
