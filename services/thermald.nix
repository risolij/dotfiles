{ pkgs, lib, config, ... }:

{
  services.thermald = {
    enable = true;
    configFile = builtins.toFile "thermal.xml" ''
    <?xml version="1.0"?> 
    <ThermalConfiguration> 
    <Platform>
        <Name> Auto generated </Name>
        <ProductName>81Q9</ProductName>
        <Preference>QUIET</Preference>
        <PPCC>
                <PowerLimitIndex>0</PowerLimitIndex>
                <PowerLimitMinimum>12000</PowerLimitMinimum>
                <PowerLimitMaximum>23000</PowerLimitMaximum>
                <TimeWindowMinimum>28000</TimeWindowMinimum>
                <TimeWindowMaximum>32000</TimeWindowMaximum>
                <StepSize>500</StepSize>
        </PPCC>
        <ThermalZones>
                <ThermalZone>
                        <Type>auto_zone_0</Type>
                        <TripPoints>
                                <TripPoint>
                                        <SensorType>SEN2</SensorType>
                                        <Temperature>63000</Temperature>
                                        <Type>Passive</Type>
                                        <CoolingDevice>
                                                <Type>B0D4</Type>
                                                <SamplingPeriod>8</SamplingPeriod>
                                                <TargetState>2147483647</TargetState>
                                        </CoolingDevice>
                                </TripPoint>
                                <TripPoint>
                                        <SensorType>SEN2</SensorType>
                                        <Temperature>64000</Temperature>
                                        <Type>Passive</Type>
                                        <CoolingDevice>
                                                <Type>B0D4</Type>
                                                <SamplingPeriod>8</SamplingPeriod>
                                        </CoolingDevice>
                                </TripPoint>
                                <TripPoint>
                                        <SensorType>SEN4</SensorType>
                                        <Temperature>74000</Temperature>
                                        <Type>Passive</Type>
                                        <CoolingDevice>
                                                <Type>B0D4</Type>
                                                <SamplingPeriod>8</SamplingPeriod>
                                        </CoolingDevice>
                                </TripPoint>
                        </TripPoints>
                </ThermalZone>
        </ThermalZones>
    </Platform>
    </ThermalConfiguration>
    '';
  };
}

