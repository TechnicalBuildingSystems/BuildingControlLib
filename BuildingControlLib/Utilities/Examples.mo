within BuildingControlLib.Utilities;
package Examples
  "This package contains example models to show the use of other library models"
  extends Modelica.Icons.ExamplesPackage;
  model TestRoomHeating "Example how to test room with heating"
    extends Modelica.Icons.Example;
    BuildingControlLib.Utilities.Rooms.RoomHeating roomHeating
      annotation (Placement(transformation(extent={{-20,18},{42,83}})));
    Modelica.Blocks.Sources.RealExpression valveOpening(y=1)
      "Nominal signal to heating valve opening. 1 == open, 0 closed"
      annotation (Placement(transformation(extent={{-76,14},{-56,34}})));
  equation
    connect(valveOpening.y, roomHeating.valveSignalInput) annotation (Line(
        points={{-55,24},{-48,24},{-48,24.3375},{-36.275,24.3375}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics), Documentation(info="<html>
<h4>Overview</h4>
<p>This is room model can be used to test room temperature control. In this case the room temperature control directly gives the nominalised valve opening to the model.</p>
</html>"),
      experiment(StopTime=604800, Interval=60),
      __Dymola_experimentSetupOutput);
  end TestRoomHeating;

  model TestRoomSunshade "Example for sunshade automation"
    extends Modelica.Icons.Example;
    Rooms.RoomSunshade roomSunshade
      annotation (Placement(transformation(extent={{-32,18},{44,80}})));
    Modelica.Blocks.Sources.BooleanStep       booleanExpression(startTime=39600)
      "Deploy sunshade (== true, irradiation through window is reduced), else == false"
      annotation (Placement(transformation(extent={{-82,10},{-62,30}})));
  equation
    connect(booleanExpression.y, roomSunshade.uSunblind) annotation (Line(
        points={{-61,20},{-44,20},{-44,33.5},{-28.2,33.5}},
        color={255,0,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}})),           Documentation(info="<html>
<h4>Overview</h4>
<p>This room model allows to test control functionalities which deploy or not deploy a sunshade to a window of a room.</p>
</html>"),
      experiment(StopTime=86400),
      __Dymola_experimentSetupOutput);
  end TestRoomSunshade;

  model TestRoomHeatingSunshade "Example for sunshade automation"
    extends Modelica.Icons.Example;
    Rooms.RoomHeatingSunshade roomSunshade
      annotation (Placement(transformation(extent={{-40,-32},{36,30}})));
    Modelica.Blocks.Sources.BooleanStep       booleanExpression(startTime=39600)
      "Deploy sunshade (== true, irradiation through window is reduced), else == false"
      annotation (Placement(transformation(extent={{-80,38},{-60,58}})));
    Modelica.Blocks.Sources.RealExpression valveOpening(y=1)
      "Nominal signal to heating valve opening. 1 == open, 0 closed"
      annotation (Placement(transformation(extent={{-80,-16},{-60,4}})));
  equation
    connect(booleanExpression.y, roomSunshade.uSunblind) annotation (Line(
        points={{-59,48},{-44,48},{-44,-16.5},{-36.2,-16.5}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(valveOpening.y, roomSunshade.uValveSignalInput) annotation (Line(
          points={{-59,-6},{-46,-6},{-46,-22.545},{-36.2,-22.545}}, color={0,0,
            127}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}})),           Documentation(info="<html>
<p>This model combines the previous test and allows to test a room control solution both actuating the valve and the sunshade of a room.</p>
</html>"),
      experiment(StopTime=86400),
      __Dymola_experimentSetupOutput);
  end TestRoomHeatingSunshade;
end Examples;
