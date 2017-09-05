within ExtraMathTest;
model test_Power "testing the functions from the Power package"
  extends Modelica.Icons.Example;

  ExtraMathTest.testReferenceEquality cbrt1(
    testName="cbrt1",
    calculated=ExtraMath.Power.cbrt(8.0),
    reference=2.0);

  ExtraMathTest.testReferenceEquality cbrt2(
    testName="cbrt2",
    calculated=ExtraMath.Power.cbrt(27.0),
    reference=3.0);

  ExtraMathTest.testReferenceEquality hypot1(
    testName="hypot1",
    calculated=ExtraMath.Power.hypot(3.0,4.0),
    reference=5.0);

  ExtraMathTest.testReferenceEquality hypot2(
    testName="hypot2",
    calculated=ExtraMath.Power.hypot(5.0,12.0),
    reference=13.0);

  ExtraMathTest.testReferenceEquality hypot3(
    testName="hypot3",
    calculated=ExtraMath.Power.hypot(12709.0,13500.0),
    reference=18541.0);

  ExtraMathTest.testReferenceEquality pow1(
    testName="pow1",
    calculated=ExtraMath.Power.pow(2.0,3.0),
    reference=8.0);

  ExtraMathTest.testReferenceEquality pow2(
    testName="pow2",
    calculated=ExtraMath.Power.pow(3.0,0.0),
    reference=1.0);

  ExtraMathTest.testReferenceEquality pow3(
    testName="pow3",
    calculated=ExtraMath.Power.pow(0.0,3.0),
    reference=0.0);

  ExtraMathTest.testReferenceEquality pow4(
    testName="pow4",
    calculated=ExtraMath.Power.pow(0.0,0.0),
    reference=1.0) "dangerous";

end test_Power;