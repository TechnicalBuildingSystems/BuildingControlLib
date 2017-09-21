within BuildingControlLibTest.BuildingControl;

package VDI3813
  extends Modelica.Icons.VariantsPackage;


  package SensorFunctions
    extends Modelica.Icons.VariantsPackage;

    model TesterPresenceDetection
      extends BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Examples.TesterPresenceDetection;
      algorithm
    when terminal() then
      assert( presenceDetection.P_AUTO.valuePresenceSensor == false, "ERROR") ;
      assert( presenceDetection1.P_AUTO.valuePresenceSensor == false, "ERROR") ;
    end when;
    end TesterPresenceDetection;

    
    model TesterWindowMonitoring
      extends BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Examples.TesterWindowMonitoring;
      algorithm
    when terminal() then
      assert( windowMonitoring.B_WINDOW.valueWindow == true, "ERROR") ;
    end when;
    end TesterWindowMonitoring;

    
    model TesterDewpointMonitoring
      extends BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Examples.TesterDewpointMonitoring;
      algorithm
    when terminal() then
      assert( dewpointMonitoring.B_DEW.valueDewpoint == true, "ERROR") ;
    end when;
    end TesterDewpointMonitoring;

    
    model TesterAirTemperatureMeasurement
      extends BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Examples.TesterAirTemperatureMeasurement;
      algorithm
    when terminal() then
      assert( 21.0 - Modelica.Constants.eps < airTemperatureMeasurementRoom.T_ROOM.valueAirTemperatureRoom and airTemperatureMeasurementRoom.T_ROOM.valueAirTemperatureRoom < 21.0 + Modelica.Constants.eps , "ERROR") ;
      assert( 23.0 - Modelica.Constants.eps < airTemperatureMeasurementReturn.T_RETURN.valueAirTemperatureReturn and airTemperatureMeasurementReturn.T_RETURN.valueAirTemperatureReturn < 23.0 + Modelica.Constants.eps , "ERROR") ;
      assert( 24.0 - Modelica.Constants.eps < airTemperatureMeasurementSupply.T_SUPPLY.valueAirTemperatureSupply and airTemperatureMeasurementSupply.T_SUPPLY.valueAirTemperatureSupply < 24.0 + Modelica.Constants.eps , "ERROR") ;
    end when;
    end TesterAirTemperatureMeasurement;

    
    model TesterAirQualityMeasurement
      extends BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Examples.TesterAirQualityMeasurement;
      algorithm
    when terminal() then
      assert( 1.0 - Modelica.Constants.eps < airQualityMeasurement.Q_ROOM.valueAirQuality and airQualityMeasurement.Q_ROOM.valueAirQuality < 1.0 + Modelica.Constants.eps , "ERROR") ;
    end when;
    end TesterAirQualityMeasurement;

    
    model TesterWindVelocityMeasurement
      extends BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Examples.TesterWindVelocityMeasurement;
      algorithm
    when terminal() then
      assert( 1.0 - Modelica.Constants.eps < windVelocityMeasurement.W_ACT.valueWindVelocity and windVelocityMeasurement.W_ACT.valueWindVelocity < 1.0 + Modelica.Constants.eps , "ERROR") ;
    // ModelicaServices.Machine.eps   
    end when;
    end TesterWindVelocityMeasurement;

    
    model TesterPrecipitationDetection
      extends BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Examples.TesterPrecipitationDetection;
      algorithm
    when terminal() then
      assert( precipitationDetection.R_ACT.valuePrecipitation == true, "ERROR") ;
    end when;
    end TesterPrecipitationDetection;

    
    model TesterBrightnessMeasurement
      extends BuildingControlLib.BuildingControl.VDI3813.SensorFunctions.Examples.TesterBrightnessMeasurement;
      algorithm
    when terminal() then
      assert( 1.0 - Modelica.Constants.eps < brightnessMeasurementOutdoor.H_OUT.valueIlluminanceOutdoor and brightnessMeasurementOutdoor.H_OUT.valueIlluminanceOutdoor < 1.0 + Modelica.Constants.eps , "ERROR") ;
        assert( 1.0 - Modelica.Constants.eps < brightnessMeasurementRoom.H_ROOM.valueIlluminanceRoom and brightnessMeasurementRoom.H_ROOM.valueIlluminanceRoom < 1.0 + Modelica.Constants.eps , "ERROR") ;
    // ModelicaServices.Machine.eps   
    end when;
    end TesterBrightnessMeasurement;


  end SensorFunctions;

  package ActuatorFunctions
  extends Modelica.Icons.VariantsPackage;

    model TesterSunshadeActuator
      extends BuildingControlLib.BuildingControl.VDI3813.ActuatorFunctions.Examples.TesterSunshadeActuator;
    end TesterSunshadeActuator;
    
    model TesterControlDriveActuatorValvePosition
      extends BuildingControlLib.BuildingControl.VDI3813.ActuatorFunctions.Examples.TesterControlDriveActuatorValvePosition;
    end TesterControlDriveActuatorValvePosition;
    
    model TesterControlDriveActuatorDamperPosition
      extends BuildingControlLib.BuildingControl.VDI3813.ActuatorFunctions.Examples.TesterControlDriveActuatorDamperPosition;
    end TesterControlDriveActuatorDamperPosition;
    
    model TesterControlDriveActuatorLockFanSpeed
      extends BuildingControlLib.BuildingControl.VDI3813.ActuatorFunctions.Examples.TesterControlDriveActuatorLockFanSpeed;
    end TesterControlDriveActuatorLockFanSpeed;
    
    model TesterControlDriveActuatorLockValvePosition
      extends BuildingControlLib.BuildingControl.VDI3813.ActuatorFunctions.Examples.TesterControlDriveActuatorLockValvePosition;
    end TesterControlDriveActuatorLockValvePosition;
    
  end ActuatorFunctions;

  package OperatorAndDisplayFunctions
  extends Modelica.Icons.VariantsPackage;
    
    model TesterActuateSunshade
      extends BuildingControlLib.BuildingControl.VDI3813.OperatorAndDisplayFunctions.Examples.TesterActuateSunshade;
    end TesterActuateSunshade;
    
    model TesterAdjustTemperatureSetpoint
      extends BuildingControlLib.BuildingControl.VDI3813.OperatorAndDisplayFunctions.Examples.TesterAdjustTemperatureSetpoint;
    end TesterAdjustTemperatureSetpoint;
    
  end OperatorAndDisplayFunctions;


  package ApplicationFunctions
  extends Modelica.Icons.VariantsPackage;

    model TesterOccupancyEvaluation
      extends BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Examples.TesterOccupancyEvaluation;
    end TesterOccupancyEvaluation;
    
    model TesterTimeProgramEnergyMode
      extends BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Examples.TesterTimeProgramEnergyMode;
    end TesterTimeProgramEnergyMode;
    
    model TesterPriorityControl
      extends BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Examples.TesterPriorityControl;
    end TesterPriorityControl;
    
    model TesterAutomaticTwilightControl
      extends BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Examples.TesterAutomaticTwilightControl;
    end TesterAutomaticTwilightControl;
    
    model TesterAutomaticSolarControl
      extends BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Examples.TesterAutomaticSolarControl;
    end TesterAutomaticSolarControl;
    
    model TesterAutomaticThermalControl
      extends BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Examples.TesterAutomaticThermalControl;
    end TesterAutomaticThermalControl;
    
    model TesterEnergyModeSelection
      extends BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Examples.TesterEnergyModeSelection;
    end TesterEnergyModeSelection;
    
    model TesterSetpointCalculation
      extends BuildingControlLib.BuildingControl.VDI3813.ApplicationFunctions.Examples.TesterSetpointCalculation;
    end TesterSetpointCalculation;
    
  end ApplicationFunctions;


  package MacroFunctions
  extends Modelica.Icons.VariantsPackage;

    model TesterMacroSunblind
      extends BuildingControlLib.BuildingControl.VDI3813.MacroFunctions.Examples.TesterMacroSunblind;
    end TesterMacroSunblind;
    
  end MacroFunctions;

end VDI3813;
