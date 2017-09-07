within BuildingControlLibTest;
model test_BuildingControlVDI3813OperatorAndDisplayFunctions "testing the operator and display functions from the VDI3813 package"
  extends Modelica.Icons.Example;

  BuildingControlLibTest.testReferenceEquality test1(
    testName="test1",
    calculated=BuildingControlLib.BuildingControl.VDI3813.OperatorAndDisplayFunctions.ActuateSunshade(8.0),
    reference=2.0);

  BuildingControlLibTest.testReferenceEquality test2(
    testName="test2",
    calculated=BuildingControlLib.BuildingControl.VDI3813.OperatorAndDisplayFunctions.AdjustTemperatureSetpoint(27.0),
    reference=3.0);

end test_BuildingControlVDI3813OperatorAndDisplayFunctions;