within ExtraMathTest;
model testReferenceEquality "compare calculated result with reference result"

  parameter String testName = "";
  parameter Real calculated;
  parameter Real reference;
  parameter AssertionLevel aLevel=AssertionLevel.error;
  parameter Real eps(min=0) = Modelica.Constants.eps;
  Boolean testResult = Modelica.Math.isEqual(calculated, reference, eps);

protected
  String message = "Test " + testName + " failed:\n  calculated=" + String(calculated) + "\n   reference=" + String(reference) + "\n";

algorithm
  assert(testResult, message, level=aLevel);
end testReferenceEquality;