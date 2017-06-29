within BuildingControlLib.BuildingControl.IEC60381;
package Examples
  extends Modelica.Icons.ExamplesPackage;
  model TesterStandardSignalCurrent
    extends Modelica.Icons.Example;
    Sensors.Current.SensorStandardSignalCurrent sensorStandardSignalCurrent
      annotation (Placement(transformation(extent={{20,-10},{40,10}})));
    Sources.Current.SourceStandardSignalCurrent sourceStandardSignalCurrent
      annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
    Modelica.Blocks.Sources.Pulse compliantInput(
      width=50,
      period=10,
      nperiod=1,
      startTime=5,
      amplitude=0.005,
      offset=0.01) "Sources sending compliant inputs"
      annotation (Placement(transformation(extent={{-84,20},{-64,40}})));
    Modelica.Blocks.Sources.Pulse nonCompliantUpperLimit(
      width=50,
      nperiod=1,
      amplitude=0.022,
      period=10,
      startTime=20) "Non compliant input for upper limit"
      annotation (Placement(transformation(extent={{-84,-12},{-64,8}})));
    Modelica.Blocks.Math.MultiSum multiSum(nu=2)
      annotation (Placement(transformation(extent={{-42,-6},{-30,6}})));
  equation
    connect(sensorStandardSignalCurrent.I, sourceStandardSignalCurrent.I)
      annotation (Line(points={{21.9,0},{1.9,0}}));
    connect(multiSum.u[1], compliantInput.y)
      annotation (Line(points={{-42,2.1},{-52,2.1},{-52,30},{-63,30}}, color={0,0,127}));
    connect(multiSum.u[2], nonCompliantUpperLimit.y)
      annotation (Line(points={{-42,-2.1},{-54,-2.1},{-54,-2},{-63,-2}}, color={0,0,127}));
    connect(multiSum.y, sourceStandardSignalCurrent.u)
      annotation (Line(points={{-28.98,0},{-28.98,0},{-18,0}}, color={0,0,127}));
    annotation (experiment(StopTime=40));
  end TesterStandardSignalCurrent;

    model TesterStandardSignalCurrentOffset
    extends Modelica.Icons.Example;
    Sensors.Current.SensorStandardSignalCurrentOffset sensorStandardSignalCurrentOffset
      annotation (Placement(transformation(extent={{20,-10},{40,10}})));
    Sources.Current.SourceStandardSignalCurrentOffset sourceStandardSignalCurrentOffset
      annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
    Modelica.Blocks.Sources.Pulse compliantInput(
      width=50,
      period=10,
      nperiod=1,
      startTime=5,
      amplitude=0.005,
      offset=0.01) "Sources sending compliant inputs"
      annotation (Placement(transformation(extent={{-84,20},{-64,40}})));
    Modelica.Blocks.Sources.Pulse nonCompliantUpperLimit(
      width=50,
      nperiod=1,
      amplitude=0.022,
      period=10,
      startTime=20) "Non compliant input for upper limit"
      annotation (Placement(transformation(extent={{-84,-12},{-64,8}})));
    Modelica.Blocks.Math.MultiSum multiSum(nu=2)
      annotation (Placement(transformation(extent={{-42,-6},{-30,6}})));
    equation
    connect(sensorStandardSignalCurrentOffset.I, sourceStandardSignalCurrentOffset.I)
      annotation (Line(points={{21.9,0},{1.9,0}}));
    connect(multiSum.u[1], compliantInput.y)
      annotation (Line(points={{-42,2.1},{-52,2.1},{-52,30},{-63,30}}, color={0,0,127}));
    connect(multiSum.u[2], nonCompliantUpperLimit.y)
      annotation (Line(points={{-42,-2.1},{-54,-2.1},{-54,-2},{-63,-2}}, color={0,0,127}));
    connect(multiSum.y, sourceStandardSignalCurrentOffset.u)
      annotation (Line(points={{-28.98,0},{-28.98,0},{-18,0}}, color={0,0,127}));
    annotation (experiment(StopTime=40));
    end TesterStandardSignalCurrentOffset;

      model TesterStandardSignalVoltage5V
    extends Modelica.Icons.Example;
    Modelica.Blocks.Sources.Pulse compliantInput(
      width=50,
      period=10,
      nperiod=1,
      startTime=5,
      amplitude=2,
      offset=3) "Sources sending compliant inputs"
      annotation (Placement(transformation(extent={{-84,20},{-64,40}})));
    Modelica.Blocks.Sources.Pulse nonCompliantUpperLimit(
      width=50,
      nperiod=1,
      period=10,
      startTime=20,
      amplitude=6) "Non compliant input for upper limit"
      annotation (Placement(transformation(extent={{-84,-12},{-64,8}})));
    Modelica.Blocks.Math.MultiSum multiSum(nu=2)
      annotation (Placement(transformation(extent={{-42,-6},{-30,6}})));
    Sensors.Voltage.SensorStandardSignalVoltage5V sensorStandardSignalVoltage5V
      annotation (Placement(transformation(extent={{20,-10},{40,10}})));
    Sources.Voltage.SourceStandardSignalVoltage5V sourceStandardSignalVoltage5V
      annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
      equation
    connect(multiSum.u[1], compliantInput.y)
      annotation (Line(points={{-42,2.1},{-52,2.1},{-52,30},{-63,30}}, color={0,0,127}));
    connect(multiSum.u[2], nonCompliantUpperLimit.y)
      annotation (Line(points={{-42,-2.1},{-54,-2.1},{-54,-2},{-63,-2}}, color={0,0,127}));
    connect(multiSum.y, sourceStandardSignalVoltage5V.u)
      annotation (Line(points={{-28.98,0},{-18,0}}, color={0,0,127}));
    connect(sensorStandardSignalVoltage5V.U, sourceStandardSignalVoltage5V.U)
      annotation (Line(points={{21.9,0},{1.9,0}}));
      end TesterStandardSignalVoltage5V;


      model TesterStandardSignalVoltage5VOffset
    extends Modelica.Icons.Example;
    Modelica.Blocks.Sources.Pulse compliantInput(
      width=50,
      period=10,
      nperiod=1,
      startTime=5,
      amplitude=2,
      offset=2) "Sources sending compliant inputs"
      annotation (Placement(transformation(extent={{-84,20},{-64,40}})));
    Modelica.Blocks.Sources.Pulse nonCompliantLowerLimit(
      width=50,
      nperiod=1,
      period=10,
      startTime=20,
      amplitude=-5) "Non compliant input for lower limit"
      annotation (Placement(transformation(extent={{-84,-12},{-64,8}})));
    Modelica.Blocks.Math.MultiSum multiSum(nu=2)
      annotation (Placement(transformation(extent={{-42,-6},{-30,6}})));
    Sensors.Voltage.SensorStandardSignalVoltage5VOffset
      sensorStandardSignalVoltage5VOffset
      annotation (Placement(transformation(extent={{20,-10},{40,10}})));
    Sources.Voltage.SourceStandardSignalVoltage5VOffset
      sourceStandardSignalVoltage5VOffset
      annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
      equation
    connect(multiSum.u[1], compliantInput.y)
      annotation (Line(points={{-42,2.1},{-52,2.1},{-52,30},{-63,30}}, color={0,0,127}));
    connect(multiSum.u[2], nonCompliantLowerLimit.y)
      annotation (Line(points={{-42,-2.1},{-54,-2.1},{-54,-2},{-63,-2}}, color={0,0,127}));
    connect(sensorStandardSignalVoltage5VOffset.U,
      sourceStandardSignalVoltage5VOffset.U)
      annotation (Line(points={{21.9,0},{21.9,0},{1.9,0}}));
    connect(multiSum.y, sourceStandardSignalVoltage5VOffset.u)
      annotation (Line(points={{-28.98,0},{-24,0},{-18,0}}, color={0,0,127}));
      end TesterStandardSignalVoltage5VOffset;


      model TesterStandardSignalVoltage10V
    extends Modelica.Icons.Example;
    Modelica.Blocks.Sources.Pulse compliantInput(
      width=50,
      period=10,
      nperiod=1,
      startTime=5,
      amplitude=2,
      offset=2) "Sources sending compliant inputs"
      annotation (Placement(transformation(extent={{-84,20},{-64,40}})));
    Modelica.Blocks.Sources.Pulse nonCompliantLowerLimit(
      width=50,
      nperiod=1,
      period=10,
      startTime=20,
      amplitude=-10) "Non compliant input for lower limit"
      annotation (Placement(transformation(extent={{-84,-12},{-64,8}})));
    Modelica.Blocks.Math.MultiSum multiSum(nu=2)
      annotation (Placement(transformation(extent={{-42,-6},{-30,6}})));
    Sensors.Voltage.SensorStandardSignalVoltage10V
      sensorStandardSignalVoltage10V
      annotation (Placement(transformation(extent={{20,-10},{40,10}})));
    Sources.Voltage.SourceStandardSignalVoltage10V
      sourceStandardSignalVoltage10V
      annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
      equation
    connect(multiSum.u[1], compliantInput.y)
      annotation (Line(points={{-42,2.1},{-52,2.1},{-52,30},{-63,30}}, color={0,0,127}));
    connect(multiSum.u[2], nonCompliantLowerLimit.y)
      annotation (Line(points={{-42,-2.1},{-54,-2.1},{-54,-2},{-63,-2}}, color={0,0,127}));
    connect(sensorStandardSignalVoltage10V.U, sourceStandardSignalVoltage10V.U)
      annotation (Line(points={{21.9,0},{12,0},{1.9,0}}));
    connect(multiSum.y, sourceStandardSignalVoltage10V.u)
      annotation (Line(points={{-28.98,0},{-24,0},{-18,0}}, color={0,0,127}));
      end TesterStandardSignalVoltage10V;


      model TesterStandardSignalVoltage10VOffset
    extends Modelica.Icons.Example;
    Modelica.Blocks.Sources.Pulse compliantInput(
      width=50,
      period=10,
      nperiod=1,
      startTime=5,
      amplitude=2,
      offset=2) "Sources sending compliant inputs"
      annotation (Placement(transformation(extent={{-84,20},{-64,40}})));
    Modelica.Blocks.Sources.Pulse nonCompliantLowerLimit(
      width=50,
      nperiod=1,
      period=10,
      startTime=20,
      amplitude=-10) "Non compliant input for lower limit"
      annotation (Placement(transformation(extent={{-84,-12},{-64,8}})));
    Modelica.Blocks.Math.MultiSum multiSum(nu=2)
      annotation (Placement(transformation(extent={{-42,-6},{-30,6}})));
    Sensors.Voltage.SensorStandardSignalVoltage10VOffset
      sensorStandardSignalVoltage10VOffset
      annotation (Placement(transformation(extent={{20,-10},{40,10}})));
    Sources.Voltage.SourceStandardSignalVoltage10VOffset
      sourceStandardSignalVoltage10VOffset
      annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
      equation
    connect(multiSum.u[1], compliantInput.y)
      annotation (Line(points={{-42,2.1},{-52,2.1},{-52,30},{-63,30}}, color={0,0,127}));
    connect(multiSum.u[2], nonCompliantLowerLimit.y)
      annotation (Line(points={{-42,-2.1},{-54,-2.1},{-54,-2},{-63,-2}}, color={0,0,127}));
    connect(multiSum.y, sourceStandardSignalVoltage10VOffset.u)
      annotation (Line(points={{-28.98,0},{-24,0},{-18,0}}, color={0,0,127}));
    connect(sensorStandardSignalVoltage10VOffset.U,
      sourceStandardSignalVoltage10VOffset.U)
      annotation (Line(points={{21.9,0},{18,0},{1.9,0}}));
      end TesterStandardSignalVoltage10VOffset;


      model TesterStandardSignalVoltage10Vpn
    extends Modelica.Icons.Example;
    Modelica.Blocks.Sources.Pulse compliantInput(
      width=50,
      period=10,
      nperiod=1,
      startTime=5,
      amplitude=2,
      offset=2) "Sources sending compliant inputs"
      annotation (Placement(transformation(extent={{-84,20},{-64,40}})));
    Modelica.Blocks.Sources.Pulse CompliantLimit2(
      width=50,
      nperiod=1,
      period=10,
      amplitude=-10,
      startTime=11) "compliant input  limit"
      annotation (Placement(transformation(extent={{-84,-12},{-64,8}})));
    Modelica.Blocks.Math.MultiSum multiSum(nu=3)
      annotation (Placement(transformation(extent={{-42,-6},{-30,6}})));
    Modelica.Blocks.Sources.Pulse nonCompliantLowerLimit1(
      width=50,
      nperiod=1,
      period=10,
      startTime=20,
      amplitude=-20) "Non compliant input for lower limit"
      annotation (Placement(transformation(extent={{-84,-48},{-64,-28}})));
    Sensors.Voltage.SensorStandardSignalVoltage10Vpn
      sensorStandardSignalVoltage10Vpn
      annotation (Placement(transformation(extent={{20,-10},{40,10}})));
    Sources.Voltage.SourceStandardSignalVoltage10Vpn
      sourceStandardSignalVoltage10Vpn
      annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
      equation
    connect(multiSum.u[1], compliantInput.y)
      annotation (Line(points={{-42,2.8},{-52,2.8},{-52,30},{-63,30}}, color={0,0,127}));
    connect(multiSum.u[2], CompliantLimit2.y) annotation (Line(points={{-42,
            4.44089e-016},{-54,4.44089e-016},
            {-54,-2},{-63,-2}}, color={0,0,127}));
    connect(nonCompliantLowerLimit1.y, multiSum.u[3]) annotation (Line(points={
            {-63,-38},{-54,-38},{-54,-2},
            {-42,-2},{-42,-2.8}}, color={0,0,127}));
    connect(sensorStandardSignalVoltage10Vpn.U,
      sourceStandardSignalVoltage10Vpn.U)
      annotation (Line(points={{21.9,0},{12,0},{1.9,0}}));
    connect(multiSum.y, sourceStandardSignalVoltage10Vpn.u)
      annotation (Line(points={{-28.98,0},{-24,0},{-18,0}}, color={0,0,127}));
      end TesterStandardSignalVoltage10Vpn;


end Examples;
