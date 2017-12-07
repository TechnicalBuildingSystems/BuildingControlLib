within BuildingControlLibTest.BuildingControl;

package VDI3813
  extends Modelica.Icons.VariantsPackage;

  package SensorFunctions
    extends Modelica.Icons.VariantsPackage;

    model TesterPresenceDetection
      extends BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Examples.TesterPresenceDetection(sourceP.table = {0, 250, 400}, sourceP.startValue = true, presenceDetection.holdingActive = true, presenceDetection1.holdingActive = false);
    algorithm
      when terminal() then
        assert(presenceDetection.P_AUTO.valuePresenceSensor == false, "ERROR");
        assert(presenceDetection1.P_AUTO.valuePresenceSensor == false, "ERROR");
      end when;
      annotation(
        preferedView = "Info",
        experiment(StartTime = 0, StopTime = 1000, Interval = 1, Tolerance = 1e-6));
    end TesterPresenceDetection;

    model TesterWindowMonitoring
      extends BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Examples.TesterWindowMonitoring(sourceWindow.period = 300, sourceWindow.startTime = 0, sourceWindow.width = 50);
    algorithm
      when terminal() then
        assert(windowMonitoring.B_WINDOW.valueWindow == true, "ERROR");
      end when;
      annotation(
        preferedView = "Info",
        experiment(StartTime = 0, StopTime = 1000, Interval = 1, Tolerance = 1e-6));
    end TesterWindowMonitoring;

    model TesterDewpointMonitoring
      extends BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Examples.TesterDewpointMonitoring(sourceDewpoint.period = 300, sourceDewpoint.startTime = 0, sourceDewpoint.width = 50);
    algorithm
      when terminal() then
        assert(dewpointMonitoring.B_DEW.valueDewpoint == true, "ERROR");
      end when;
      annotation(
        preferedView = "Info",
        experiment(StartTime = 0, StopTime = 1000, Interval = 1, Tolerance = 1e-6));
    end TesterDewpointMonitoring;

    model TesterAirTemperatureMeasurement
      extends BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Examples.TesterAirTemperatureMeasurement;
    algorithm
      when terminal() then
        assert(21.0 - Modelica.Constants.eps < airTemperatureMeasurementRoom.T_ROOM.valueAirTemperatureRoom and airTemperatureMeasurementRoom.T_ROOM.valueAirTemperatureRoom < 21.0 + Modelica.Constants.eps, "ERROR");
        assert(23.0 - Modelica.Constants.eps < airTemperatureMeasurementReturn.T_RETURN.valueAirTemperatureReturn and airTemperatureMeasurementReturn.T_RETURN.valueAirTemperatureReturn < 23.0 + Modelica.Constants.eps, "ERROR");
        assert(24.0 - Modelica.Constants.eps < airTemperatureMeasurementSupply.T_SUPPLY.valueAirTemperatureSupply and airTemperatureMeasurementSupply.T_SUPPLY.valueAirTemperatureSupply < 24.0 + Modelica.Constants.eps, "ERROR");
      end when;
      annotation(
        preferedView = "Info",
        experiment(StartTime = 0, StopTime = 1000, Interval = 1, Tolerance = 1e-6));
    end TesterAirTemperatureMeasurement;

    model TesterAirQualityMeasurement
      extends BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Examples.TesterAirQualityMeasurement(pulse.amplitude = 1, pulse.offset = 0, pulse.period = 300, pulse.startTime = 0, pulse.width = 50);
    algorithm
      when terminal() then
        assert(1.0 - Modelica.Constants.eps < airQualityMeasurement.Q_ROOM.valueAirQuality and airQualityMeasurement.Q_ROOM.valueAirQuality < 1.0 + Modelica.Constants.eps, "ERROR");
      end when;
      annotation(
        preferedView = "Info",
        experiment(StartTime = 0, StopTime = 1000, Interval = 1, Tolerance = 1e-6));
    end TesterAirQualityMeasurement;

    model TesterWindVelocityMeasurement
      extends BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Examples.TesterWindVelocityMeasurement;
    algorithm
      when terminal() then
        assert(1.0 - Modelica.Constants.eps < windVelocityMeasurement.W_ACT.valueWindVelocity and windVelocityMeasurement.W_ACT.valueWindVelocity < 1.0 + Modelica.Constants.eps, "ERROR");
      end when;
      annotation(
        preferedView = "Info",
        experiment(StartTime = 0, StopTime = 1000, Interval = 1, Tolerance = 1e-6));
    end TesterWindVelocityMeasurement;

    model TesterPrecipitationDetection
      extends BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Examples.TesterPrecipitationDetection;
    algorithm
      when terminal() then
        assert(precipitationDetection.R_ACT.valuePrecipitation == true, "ERROR");
      end when;
      annotation(
        preferedView = "Info",
        experiment(StartTime = 0, StopTime = 1000, Interval = 1, Tolerance = 1e-6));
    end TesterPrecipitationDetection;

    model TesterBrightnessMeasurement
      extends BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Examples.TesterBrightnessMeasurement;
    algorithm
      when terminal() then
        assert(1.0 - Modelica.Constants.eps < brightnessMeasurementOutdoor.H_OUT.valueIlluminanceOutdoor and brightnessMeasurementOutdoor.H_OUT.valueIlluminanceOutdoor < 1.0 + Modelica.Constants.eps, "ERROR");
        assert(1.0 - Modelica.Constants.eps < brightnessMeasurementRoom.H_ROOM.valueIlluminanceRoom and brightnessMeasurementRoom.H_ROOM.valueIlluminanceRoom < 1.0 + Modelica.Constants.eps, "ERROR");
      end when;
// ModelicaServices.Machine.eps
      annotation(
        preferedView = "Info",
        experiment(StartTime = 0, StopTime = 1000, Interval = 1, Tolerance = 1e-6));
    end TesterBrightnessMeasurement;
  end SensorFunctions;

  package ActuatorFunctions
    extends Modelica.Icons.VariantsPackage;

    model TesterSunshadeActuator
      extends BuildingControlLib.BuildingControl.VDI3813.ActuatorFunctions.Examples.TesterSunshadeActuator;
      annotation(
        preferedView = "Info",
        experiment(StartTime = 0, StopTime = 1000, Interval = 1, Tolerance = 1e-6));
    end TesterSunshadeActuator;

    model TesterControlDriveActuatorValvePosition
      extends BuildingControlLib.BuildingControl.VDI3813.ActuatorFunctions.Examples.TesterControlDriveActuatorValvePosition;
      annotation(
        preferedView = "Info",
        experiment(StartTime = 0, StopTime = 1000, Interval = 1, Tolerance = 1e-6));
    end TesterControlDriveActuatorValvePosition;

    model TesterControlDriveActuatorDamperPosition
      extends BuildingControlLib.BuildingControl.VDI3813.ActuatorFunctions.Examples.TesterControlDriveActuatorDamperPosition;
      annotation(
        preferedView = "Info",
        experiment(StartTime = 0, StopTime = 1000, Interval = 1, Tolerance = 1e-6));
    end TesterControlDriveActuatorDamperPosition;

    model TesterControlDriveActuatorFanSpeed
      extends BuildingControlLib.BuildingControl.VDI3813.ActuatorFunctions.Examples.TesterControlDriveActuatorFanSpeed;
      annotation(
        preferedView = "Info",
        experiment(StartTime = 0, StopTime = 1000, Interval = 1, Tolerance = 1e-6));
    end TesterControlDriveActuatorFanSpeed;

    model TesterControlDriveActuatorLockValvePosition
      extends BuildingControlLib.BuildingControl.VDI3813.ActuatorFunctions.Examples.TesterControlDriveActuatorLockValvePosition;
      annotation(
        preferedView = "Info",
        experiment(StartTime = 0, StopTime = 1000, Interval = 1, Tolerance = 1e-6));
    end TesterControlDriveActuatorLockValvePosition;
  end ActuatorFunctions;

  package OperatorAndDisplayFunctions
    extends Modelica.Icons.VariantsPackage;

    model TesterActuateSunshade
      extends BuildingControlLib.BuildingControl.VDI3813.OperatorAndDisplayFunctions.Examples.TesterActuateSunshade;
      annotation(
        preferedView = "Info",
        experiment(StartTime = 0, StopTime = 1000, Interval = 1, Tolerance = 1e-6));
    end TesterActuateSunshade;

    model TesterAdjustTemperatureSetpoint
      extends BuildingControlLib.BuildingControl.VDI3813.OperatorAndDisplayFunctions.Examples.TesterAdjustTemperatureSetpoint;
      annotation(
        preferedView = "Info",
        experiment(StartTime = 0, StopTime = 50, Interval = 1, Tolerance = 1e-6));
    end TesterAdjustTemperatureSetpoint;
  end OperatorAndDisplayFunctions;

  package ApplicationFunctions
    extends Modelica.Icons.VariantsPackage;

    model TesterOccupancyEvaluation
      extends BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Examples.TesterOccupancyEvaluation;
      annotation(
        preferedView = "Info",
        experiment(StartTime = 0, StopTime = 50, Interval = 1, Tolerance = 1e-6));
    end TesterOccupancyEvaluation;

    model TesterAutomaticTwilightControl
      extends BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Examples.TesterAutomaticTwilightControl;
      annotation(
        preferedView = "Info",
        experiment(StartTime = 0, StopTime = 300, Interval = 1, Tolerance = 1e-6));
    end TesterAutomaticTwilightControl;

    model TesterAutomaticSolarControl
      extends BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Examples.TesterAutomaticSolarControl;
      annotation(
        preferedView = "Info",
        experiment(StartTime = 0, StopTime = 1500, Interval = 1, Tolerance = 1e-6));
    end TesterAutomaticSolarControl;

    model TesterAutomaticThermalControl
      extends BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Examples.TesterAutomaticThermalControl;
      annotation(
        preferedView = "Info",
        experiment(StartTime = 0, StopTime = 2000, Interval = 1, Tolerance = 1e-6));
    end TesterAutomaticThermalControl;

    model TesterEnergyModeSelection
      extends BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Examples.TesterEnergyModeSelection;
      annotation(
        preferedView = "Info",
        experiment(StartTime = 0, StopTime = 100, Interval = 1, Tolerance = 1e-6));
    end TesterEnergyModeSelection;

    model TesterSetpointCalculation
      extends BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Examples.TesterSetpointCalculation;
      annotation(
        preferedView = "Info",
        experiment(StartTime = 0, StopTime = 1000, Interval = 1, Tolerance = 1e-6));
    end TesterSetpointCalculation;
  end ApplicationFunctions;

  package MacroFunctions
    extends Modelica.Icons.VariantsPackage;
  end MacroFunctions;
end VDI3813;
