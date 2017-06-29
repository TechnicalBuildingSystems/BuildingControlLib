within BuildingControlLib.BuildingControl.VDI3813.Sources;
package Examples "Models for functionality test of actuator functions"
  extends Modelica.Icons.ExamplesPackage;
  model TesterSources
      extends Modelica.Icons.Example;

    ActuatorSignal.PrescribedV_SET_VP prescribedV_SET_VP
      annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
    ActuatorSignal.PrescribedV_SET_FS prescribedV_SET_FS
      annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
    ActuatorSignal.PrescribedV_SET_DP prescribedV_SET_DP
      annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
    ActuatorSignal.PrescribedV_STA_VP prescribedV_STA_VP
      annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
    ActuatorSignal.PrescribedV_STA_FS prescribedV_STA_FS
      annotation (Placement(transformation(extent={{-40,-20},{-20,0}})));
    ActuatorSignal.PrescribedV_SET_LCK prescribedV_LCK
      annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
    ActuatorSignal.PrescribedV_MIN prescribedV_MIN
      annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
    Modelica.Blocks.Sources.Constant const(k=1)
      annotation (Placement(transformation(extent={{-100,0},{-80,20}})));
  equation
    connect(const.y, prescribedV_SET_VP.u) annotation (Line(
        points={{-79,10},{-58,10},{-58,70},{-38,70}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const.y, prescribedV_SET_FS.u) annotation (Line(
        points={{-79,10},{-58.5,10},{-58.5,50},{-38,50}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const.y, prescribedV_SET_DP.u) annotation (Line(
        points={{-79,10},{-58,10},{-58,30},{-38,30}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const.y, prescribedV_STA_VP.u) annotation (Line(
        points={{-79,10},{-38,10}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const.y, prescribedV_STA_FS.u) annotation (Line(
        points={{-79,10},{-60,10},{-60,-10},{-38,-10}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const.y, prescribedV_LCK.u) annotation (Line(
        points={{-79,10},{-58,10},{-58,-30},{-38,-30}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(const.y, prescribedV_MIN.u) annotation (Line(
        points={{-79,10},{-58,10},{-58,-50},{-38,-50}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}}), graphics), Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
  end TesterSources;
  annotation (Documentation(revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
end Examples;
