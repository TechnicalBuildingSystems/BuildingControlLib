within BuildingControlLib.Utilities.AirHandlingUnit.AHU.BaseClasses;
partial model partialAHU
  "Provides required connectors for AHUs with supply and return fan, mixing box, heating coil valve and cooling coil valve"

  Modelica.Blocks.Interfaces.RealInput yMixBoxDmp
    "Nominalized control signal of mixing box damper, y == 1 -> No exhaust air is recirculated, y == 0 All return air is recirculated"
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-50,-100})));
  Modelica.Blocks.Interfaces.RealInput yHeaVlv
    "Nominalized control signal of heating coil valve, y == 1 full heating power, y == 0 no heating power"
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-10,-100})));
  Modelica.Blocks.Interfaces.RealInput nomRetFanCtrl
    "Nominalized return fan control signal y== 1 Fan is running y == 0 Fan is off"
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={70,100})));
  Modelica.Blocks.Interfaces.RealInput yCooVlv
    "Nominalized control signal of cooling coil valve, y == 1 full cooling power, y == 0 no coolting power"
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={30,-100})));
  Modelica.Blocks.Interfaces.RealInput nomFanSupCtrl
    "Nominalized supply fan control signal y== 1 Fan is running y == 0 Fan is off"
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={70,-100})));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end partialAHU;
