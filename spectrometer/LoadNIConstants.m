function LoadNIConstants
%******************************************************************************
%*** NI-DAQmx Attributes ******************************************************
%******************************************************************************
% copyright National Instruments
% adapted for use in matlab, by Jens Roesner, jan/25/2005

global NICONST;

NICONST.flag_NIconstants_defined = true;

%********** Calibration Info Attributes **********
NICONST.DAQmx_SelfCal_Supported = hex2dec('1860'); % Indicates whether the device supports self calibration.
NICONST.DAQmx_SelfCal_LastTemp = hex2dec('1864'); % Indicates in degrees Celsius the temperature of the device at the time of the last self calibration. Compare this temperature to the current onboard temperature to determine if you should perform another calibration.
NICONST.DAQmx_ExtCal_RecommendedInterval = hex2dec('1868'); % Indicates in months the National Instruments recommended interval between each external calibration of the device.
NICONST.DAQmx_ExtCal_LastTemp = hex2dec('1867'); % Indicates in degrees Celsius the temperature of the device at the time of the last external calibration. Compare this temperature to the current onboard temperature to determine if you should perform another calibration.
NICONST.DAQmx_Cal_UserDefinedInfo = hex2dec('1861'); % Specifies a string that contains arbitrary, user-defined information. This number of characters in this string can be no more than Max Size.
NICONST.DAQmx_Cal_UserDefinedInfo_MaxSize = hex2dec('191C'); % Indicates the maximum length in characters of Information.
NICONST.DAQmx_Cal_DevTemp = hex2dec('223B'); % Indicates in degrees Celsius the current temperature of the device.

%********** Channel Attributes **********
NICONST.DAQmx_ChanType = hex2dec('187F'); % Indicates the type of the virtual channel.
NICONST.DAQmx_PhysicalChanName = hex2dec('18F5'); % Indicates the name of the physical channel upon which this virtual channel is based.
NICONST.DAQmx_ChanDescr = hex2dec('1926'); % Specifies a user-defined description for the channel.
NICONST.DAQmx_AI_Max = hex2dec('17DD'); % Specifies the maximum value you expect to measure. This value is in the units you specify with a units property. When you query this property, it returns the coerced maximum value that the device can measure with the current settings.
NICONST.DAQmx_AI_Min = hex2dec('17DE'); % Specifies the minimum value you expect to measure. This value is in the units you specify with a units property.When you query this property, it returns the coerced minimum value that the device can measure with the current settings.
NICONST.DAQmx_AI_CustomScaleName = hex2dec('17E0'); % Specifies the name of a custom scale for the channel.
NICONST.DAQmx_AI_MeasType = hex2dec('0695'); % Indicates the measurement to take with the analog input channel and in some cases, such as for temperature measurements, the sensor to use.
NICONST.DAQmx_AI_Voltage_Units = hex2dec('1094'); % Specifies the units to use to return voltage measurements from the channel.
NICONST.DAQmx_AI_Temp_Units = hex2dec('1033'); % Specifies the units to use to return temperature measurements from the channel.
NICONST.DAQmx_AI_Thrmcpl_Type = hex2dec('1050'); % Specifies the type of thermocouple connected to the channel. Thermocouple types differ in composition and measurement range.
NICONST.DAQmx_AI_Thrmcpl_CJCSrc = hex2dec('1035'); % Indicates the source of cold-junction compensation.
NICONST.DAQmx_AI_Thrmcpl_CJCVal = hex2dec('1036'); % Specifies the temperature of the cold junction if CJC Source is DAQmx_Val_ConstVal. Specify this value in the units of the measurement.
NICONST.DAQmx_AI_Thrmcpl_CJCChan = hex2dec('1034'); % Indicates the channel that acquires the temperature of the cold junction if CJC Source is DAQmx_Val_Chan. If the channel is a temperature channel, NI-DAQmx acquires the temperature in the correct units. Other channel types, such as a resistance channel with a custom sensor, must use a custom scale to scale values to degrees Celsius.
NICONST.DAQmx_AI_RTD_Type = hex2dec('1032'); % Specifies the type of RTD connected to the channel.
NICONST.DAQmx_AI_RTD_R0 = hex2dec('1030'); % Specifies in ohms the sensor resistance at 0 deg C. The Callendar-Van Dusen equation requires this value. Refer to the sensor documentation to determine this value.
NICONST.DAQmx_AI_RTD_A = hex2dec('1010'); % Specifies the 'A' constant of the Callendar-Van Dusen equation. NI-DAQmx requires this value when you use a custom RTD.
NICONST.DAQmx_AI_RTD_B = hex2dec('1011'); % Specifies the 'B' constant of the Callendar-Van Dusen equation. NI-DAQmx requires this value when you use a custom RTD.
NICONST.DAQmx_AI_RTD_C = hex2dec('1013'); % Specifies the 'C' constant of the Callendar-Van Dusen equation. NI-DAQmx requires this value when you use a custom RTD.
NICONST.DAQmx_AI_Thrmstr_A = hex2dec('18C9'); % Specifies the 'A' constant of the Steinhart-Hart thermistor equation.
NICONST.DAQmx_AI_Thrmstr_B = hex2dec('18CB'); % Specifies the 'B' constant of the Steinhart-Hart thermistor equation.
NICONST.DAQmx_AI_Thrmstr_C = hex2dec('18CA'); % Specifies the 'C' constant of the Steinhart-Hart thermistor equation.
NICONST.DAQmx_AI_Thrmstr_R1 = hex2dec('1061'); % Specifies in ohms the value of the reference resistor if you use voltage excitation. NI-DAQmx ignores this value for current excitation.
NICONST.DAQmx_AI_ForceReadFromChan = hex2dec('18F8'); % Specifies whether to read from the channel if it is a cold-junction compensation channel. By default, an NI-DAQmx Read function does not return data from cold-junction compensation channels.Setting this property to TRUE forces read operations to return the cold-junction compensation channel data with the other channels in the task.
NICONST.DAQmx_AI_Current_Units = hex2dec('0701'); % Specifies the units to use to return current measurements from the channel.
NICONST.DAQmx_AI_Strain_Units = hex2dec('0981'); % Specifies the units to use to return strain measurements from the channel.
NICONST.DAQmx_AI_StrainGage_GageFactor = hex2dec('0994'); % Specifies the sensitivity of the strain gage.Gage factor relates the change in electrical resistance to the change in strain. Refer to the sensor documentation for this value.
NICONST.DAQmx_AI_StrainGage_PoissonRatio = hex2dec('0998'); % Specifies the ratio of lateral strain to axial strain in the material you are measuring.
NICONST.DAQmx_AI_StrainGage_Cfg = hex2dec('0982'); % Specifies the bridge configuration of the strain gages.
NICONST.DAQmx_AI_Resistance_Units = hex2dec('0955'); % Specifies the units to use to return resistance measurements.
NICONST.DAQmx_AI_Freq_Units = hex2dec('0806'); % Specifies the units to use to return frequency measurements from the channel.
NICONST.DAQmx_AI_Freq_ThreshVoltage = hex2dec('0815'); % Specifies the voltage level at which to recognize waveform repetitions. You should select a voltage level that occurs only once within the entire period of a waveform. You also can select a voltage that occurs only once while the voltage rises or falls.
NICONST.DAQmx_AI_Freq_Hyst = hex2dec('0814'); % Specifies in volts a window below Threshold Level. The input voltage must pass below Threshold Level minus this value before NI-DAQmx recognizes a waveform repetition at Threshold Level. Hysteresis can improve the measurement accuracy when the signal contains noise or jitter.
NICONST.DAQmx_AI_LVDT_Units = hex2dec('0910'); % Specifies the units to use to return linear position measurements from the channel.
NICONST.DAQmx_AI_LVDT_Sensitivity = hex2dec('0939'); % Specifies the sensitivity of the LVDT. This value is in the units you specify with Sensitivity Units. Refer to the sensor documentation to determine this value.
NICONST.DAQmx_AI_LVDT_SensitivityUnits = hex2dec('219A'); % Specifies the units of Sensitivity.
NICONST.DAQmx_AI_RVDT_Units = hex2dec('0877'); % Specifies the units to use to return angular position measurements from the channel.
NICONST.DAQmx_AI_RVDT_Sensitivity = hex2dec('0903'); % Specifies the sensitivity of the RVDT. This value is in the units you specify with Sensitivity Units. Refer to the sensor documentation to determine this value.
NICONST.DAQmx_AI_RVDT_SensitivityUnits = hex2dec('219B'); % Specifies the units of Sensitivity.
NICONST.DAQmx_AI_SoundPressure_MaxSoundPressureLvl = hex2dec('223A'); % Specifies the maximum instantaneous sound pressure level you expect to measure. This value is in decibels, referenced to 20 micropascals. NI-DAQmx uses the maximum sound pressure level to calculate values in pascals for Maximum Value and Minimum Value for the channel.
NICONST.DAQmx_AI_SoundPressure_Units = hex2dec('1528'); % Specifies the units to use to return sound pressure measurements from the channel.
NICONST.DAQmx_AI_Microphone_Sensitivity = hex2dec('1536'); % Specifies the sensitivity of the microphone. This value is in mV/Pa. Refer to the sensor documentation to determine this value.
NICONST.DAQmx_AI_Accel_Units = hex2dec('0673'); % Specifies the units to use to return acceleration measurements from the channel.
NICONST.DAQmx_AI_Accel_Sensitivity = hex2dec('0692'); % Specifies the sensitivity of the accelerometer. This value is in the units you specify with Sensitivity Units. Refer to the sensor documentation to determine this value.
NICONST.DAQmx_AI_Accel_SensitivityUnits = hex2dec('219C'); % Specifies the units of Sensitivity.
NICONST.DAQmx_AI_TEDS_Units = hex2dec('21E0'); % Indicates the units defined by TEDS information associated with the channel.
NICONST.DAQmx_AI_Coupling = hex2dec('0064'); % Specifies the coupling for the channel.
NICONST.DAQmx_AI_Impedance = hex2dec('0062'); % Specifies the input impedance of the channel.
NICONST.DAQmx_AI_TermCfg = hex2dec('1097'); % Specifies the terminal configuration for the channel.
NICONST.DAQmx_AI_InputSrc = hex2dec('2198'); % Specifies the source of the channel. You can use the signal from the I/O connector or one of several calibration signals. Certain devices have a single calibration signal bus. For these devices, you must specify the same calibration signal for all channels you connect to a calibration signal.
NICONST.DAQmx_AI_ResistanceCfg = hex2dec('1881'); % Specifies the resistance configuration for the channel. NI-DAQmx uses this value for any resistance-based measurements, including temperature measurement using a thermistor or RTD.
NICONST.DAQmx_AI_LeadWireResistance = hex2dec('17EE'); % Specifies in ohms the resistance of the wires that lead to the sensor.
NICONST.DAQmx_AI_Bridge_Cfg = hex2dec('0087'); % Specifies the type of Wheatstone bridge that the sensor is.
NICONST.DAQmx_AI_Bridge_NomResistance = hex2dec('17EC'); % Specifies in ohms the resistance across each arm of the bridge in an unloaded position.
NICONST.DAQmx_AI_Bridge_InitialVoltage = hex2dec('17ED'); % Specifies in volts the output voltage of the bridge in the unloaded condition. NI-DAQmx subtracts this value from any measurements before applying scaling equations.
NICONST.DAQmx_AI_Bridge_ShuntCal_Enable = hex2dec('0094'); % Specifies whether to enable a shunt calibration switch. Use Shunt Cal Select to select the switch(es) to enable.
NICONST.DAQmx_AI_Bridge_ShuntCal_Select = hex2dec('21D5'); % Specifies which shunt calibration switch(es) to enable.Use Shunt Cal Enable to enable the switch(es) you specify with this property.
NICONST.DAQmx_AI_Bridge_ShuntCal_GainAdjust = hex2dec('193F'); % Specifies the result of a shunt calibration. NI-DAQmx multiplies data read from the channel by the value of this property. This value should be close to 1.0.
NICONST.DAQmx_AI_Bridge_Balance_CoarsePot = hex2dec('17F1'); % Specifies by how much to compensate for offset in the signal. This value can be between 0 and 127.
NICONST.DAQmx_AI_Bridge_Balance_FinePot = hex2dec('18F4'); % Specifies by how much to compensate for offset in the signal. This value can be between 0 and 4095.
NICONST.DAQmx_AI_CurrentShunt_Loc = hex2dec('17F2'); % Specifies the shunt resistor location for current measurements.
NICONST.DAQmx_AI_CurrentShunt_Resistance = hex2dec('17F3'); % Specifies in ohms the external shunt resistance for current measurements.
NICONST.DAQmx_AI_Excit_Src = hex2dec('17F4'); % Specifies the source of excitation.
NICONST.DAQmx_AI_Excit_Val = hex2dec('17F5'); % Specifies the amount of excitation that the sensor requires. If Voltage or Current isDAQmx_Val_Voltage, this value is in volts. If Voltage or Current isDAQmx_Val_Current, this value is in amperes.
NICONST.DAQmx_AI_Excit_UseForScaling = hex2dec('17FC'); % Specifies if NI-DAQmx divides the measurement by the excitation. You should typically set this property to TRUE for ratiometric transducers. If you set this property to TRUE, set Maximum Value and Minimum Value to reflect the scaling.
NICONST.DAQmx_AI_Excit_UseMultiplexed = hex2dec('2180'); % Specifies if the SCXI-1122 multiplexes the excitation to the upper half of the channels as it advances through the scan list.
NICONST.DAQmx_AI_Excit_ActualVal = hex2dec('1883'); % Specifies the actual amount of excitation supplied by an internal excitation source.If you read an internal excitation source more precisely with an external device, set this property to the value you read.NI-DAQmx ignores this value for external excitation.
NICONST.DAQmx_AI_Excit_DCorAC = hex2dec('17FB'); % Specifies if the excitation supply is DC or AC.
NICONST.DAQmx_AI_Excit_VoltageOrCurrent = hex2dec('17F6'); % Specifies if the channel uses current or voltage excitation.
NICONST.DAQmx_AI_ACExcit_Freq = hex2dec('0101'); % Specifies the AC excitation frequency in Hertz.
NICONST.DAQmx_AI_ACExcit_SyncEnable = hex2dec('0102'); % Specifies whether to synchronize the AC excitation source of the channel to that of another channel. Synchronize the excitation sources of multiple channels to use multichannel sensors. Set this property to FALSE for the master channel and to TRUE for the slave channels.
NICONST.DAQmx_AI_ACExcit_WireMode = hex2dec('18CD'); % Specifies the number of leads on the LVDT or RVDT. Some sensors require you to tie leads together to create a four- or five- wire sensor. Refer to the sensor documentation for more information.
NICONST.DAQmx_AI_Atten = hex2dec('1801'); % Specifies the amount of attenuation to use.
NICONST.DAQmx_AI_Lowpass_Enable = hex2dec('1802'); % Specifies whether to enable the lowpass filter of the channel.
NICONST.DAQmx_AI_Lowpass_CutoffFreq = hex2dec('1803'); % Specifies the frequency in Hertz that corresponds to the -3dB cutoff of the filter.
NICONST.DAQmx_AI_Lowpass_SwitchCap_ClkSrc = hex2dec('1884'); % Specifies the source of the filter clock. If you need a higher resolution for the filter, you can supply an external clock to increase the resolution. Refer to the SCXI-1141/1142/1143 User Manual for more information.
NICONST.DAQmx_AI_Lowpass_SwitchCap_ExtClkFreq = hex2dec('1885'); % Specifies the frequency of the external clock when you set Clock Source to DAQmx_Val_External.NI-DAQmx uses this frequency to set the pre- and post- filters on the SCXI-1141, SCXI-1142, and SCXI-1143. On those devices, NI-DAQmx determines the filter cutoff by using the equation f/(100*n), where f is the external frequency, and n is the external clock divisor. Refer to the SCXI-1141/1142/1143 User Manual for more...
NICONST.DAQmx_AI_Lowpass_SwitchCap_ExtClkDiv = hex2dec('1886'); % Specifies the divisor for the external clock when you set Clock Source to DAQmx_Val_External. On the SCXI-1141, SCXI-1142, and SCXI-1143, NI-DAQmx determines the filter cutoff by using the equation f/(100*n), where f is the external frequency, and n is the external clock divisor. Refer to the SCXI-1141/1142/1143 User Manual for more information.
NICONST.DAQmx_AI_Lowpass_SwitchCap_OutClkDiv = hex2dec('1887'); % Specifies the divisor for the output clock.NI-DAQmx uses the cutoff frequency to determine the output clock frequency. Refer to the SCXI-1141/1142/1143 User Manual for more information.
NICONST.DAQmx_AI_ResolutionUnits = hex2dec('1764'); % Indicates the units of Resolution Value.
NICONST.DAQmx_AI_Resolution = hex2dec('1765'); % Indicates the resolution of the analog-to-digital converter of the channel. This value is in the units you specify with Resolution Units.
NICONST.DAQmx_AI_Dither_Enable = hex2dec('0068'); % Specifies whether to enable dithering.Dithering adds Gaussian noise to the input signal. You can use dithering to achieve higher resolution measurements by over sampling the input signal and averaging the results.
NICONST.DAQmx_AI_Rng_High = hex2dec('1815'); % Specifies the upper limit of the input range of the device. This value is in the native units of the device. On E Series devices, for example, the native units is volts.
NICONST.DAQmx_AI_Rng_Low = hex2dec('1816'); % Specifies the lower limit of the input range of the device. This value is in the native units of the device. On E Series devices, for example, the native units is volts.
NICONST.DAQmx_AI_Gain = hex2dec('1818'); % Specifies a gain factor to apply to the channel.
NICONST.DAQmx_AI_SampAndHold_Enable = hex2dec('181A'); % Specifies whether to enable the sample and hold circuitry of the device. When you disable sample and hold circuitry, a small voltage offset might be introduced into the signal.You can eliminate this offset by using Auto Zero Mode to perform an auto zero on the channel.
NICONST.DAQmx_AI_AutoZeroMode = hex2dec('1760'); % Specifies when to measure ground. NI-DAQmx subtracts the measured ground voltage from every sample.
NICONST.DAQmx_AI_DataXferMech = hex2dec('1821'); % Specifies the data transfer mode for the device.
NICONST.DAQmx_AI_DataXferReqCond = hex2dec('188B'); % Specifies under what condition to transfer data from the onboard memory of the device to the buffer.
NICONST.DAQmx_AI_MemMapEnable = hex2dec('188C'); % Specifies for NI-DAQmx to map hardware registers to the memory space of the customer process, if possible. Mapping to the memory space of the customer process increases performance. However, memory mapping can adversely affect the operation of the device and possibly result in a system crash if software in the process unintentionally accesses the mapped registers.
NICONST.DAQmx_AI_DevScalingCoeff = hex2dec('1930'); % Indicates the coefficients of a polynomial equation that NI-DAQmx uses to scale values from the native format of the device to volts. Each element of the array corresponds to a term of the equation. For example, if index two of the array is 4, the third term of the equation is 4x^2. Scaling coefficients do not account for any custom scales or sensors contained by the channel.
NICONST.DAQmx_AI_EnhancedAliasRejectionEnable = hex2dec('2294'); % Specifies whether to enable enhanced alias rejection. By default, enhanced alias rejection is enabled on supported devices. Leave this property set to the default value for most applications.
NICONST.DAQmx_AO_Max = hex2dec('1186'); % Specifies the maximum value you expect to generate. The value is in the units you specify with a units property. If you try to write a value larger than the maximum value, NI-DAQmx generates an error. NI-DAQmx might coerce this value to a smaller value if other task settings restrict the device from generating the desired maximum.
NICONST.DAQmx_AO_Min = hex2dec('1187'); % Specifies the minimum value you expect to generate. The value is in the units you specify with a units property. If you try to write a value smaller than the minimum value, NI-DAQmx generates an error. NI-DAQmx might coerce this value to a larger value if other task settings restrict the device from generating the desired minimum.
NICONST.DAQmx_AO_CustomScaleName = hex2dec('1188'); % Specifies the name of a custom scale for the channel.
NICONST.DAQmx_AO_OutputType = hex2dec('1108'); % Indicates whether the channel generates voltage or current.
NICONST.DAQmx_AO_Voltage_Units = hex2dec('1184'); % Specifies in what units to generate voltage on the channel. Write data to the channel in the units you select.
NICONST.DAQmx_AO_Current_Units = hex2dec('1109'); % Specifies in what units to generate current on the channel. Write data to the channel is in the units you select.
NICONST.DAQmx_AO_OutputImpedance = hex2dec('1490'); % Specifies in ohms the impedance of the analog output stage of the device.
NICONST.DAQmx_AO_LoadImpedance = hex2dec('0121'); % Specifies in ohms the load impedance connected to the analog output channel.
NICONST.DAQmx_AO_IdleOutputBehavior = hex2dec('2240'); % Specifies the state of the channel when no generation is in progress.
NICONST.DAQmx_AO_TermCfg = hex2dec('188E'); % Specifies the terminal configuration of the channel.
NICONST.DAQmx_AO_ResolutionUnits = hex2dec('182B'); % Specifies the units of Resolution Value.
NICONST.DAQmx_AO_Resolution = hex2dec('182C'); % Indicates the resolution of the digital-to-analog converter of the channel. This value is in the units you specify with Resolution Units.
NICONST.DAQmx_AO_DAC_Rng_High = hex2dec('182E'); % Specifies the upper limit of the output range of the device. This value is in the native units of the device. On E Series devices, for example, the native units is volts.
NICONST.DAQmx_AO_DAC_Rng_Low = hex2dec('182D'); % Specifies the lower limit of the output range of the device. This value is in the native units of the device. On E Series devices, for example, the native units is volts.
NICONST.DAQmx_AO_DAC_Ref_ConnToGnd = hex2dec('0130'); % Specifies whether to ground the internal DAC reference. Grounding the internal DAC reference has the effect of grounding all analog output channels and stopping waveform generation across all analog output channels regardless of whether the channels belong to the current task. You can ground the internal DAC reference only when Source is DAQmx_Val_Internal and Allow Connecting DAC Reference to Ground at Runtime is...
NICONST.DAQmx_AO_DAC_Ref_AllowConnToGnd = hex2dec('1830'); % Specifies whether to allow grounding the internal DAC reference at run time. You must set this property to TRUE and set Source to DAQmx_Val_Internal before you can set Connect DAC Reference to Ground to TRUE.
NICONST.DAQmx_AO_DAC_Ref_Src = hex2dec('0132'); % Specifies the source of the DAC reference voltage. The value of this voltage source determines the full-scale value of the DAC.
NICONST.DAQmx_AO_DAC_Ref_ExtSrc = hex2dec('2252'); % Specifies the source of the DAC reference voltage if Source is DAQmx_Val_External.
NICONST.DAQmx_AO_DAC_Ref_Val = hex2dec('1832'); % Specifies in volts the value of the DAC reference voltage. This voltage determines the full-scale range of the DAC. Smaller reference voltages result in smaller ranges, but increased resolution.
NICONST.DAQmx_AO_DAC_Offset_Src = hex2dec('2253'); % Specifies the source of the DAC offset voltage. The value of this voltage source determines the full-scale value of the DAC.
NICONST.DAQmx_AO_DAC_Offset_ExtSrc = hex2dec('2254'); % Specifies the source of the DAC offset voltage if Source is DAQmx_Val_External.
NICONST.DAQmx_AO_DAC_Offset_Val = hex2dec('2255'); % Specifies in volts the value of the DAC offset voltage.
NICONST.DAQmx_AO_ReglitchEnable = hex2dec('0133'); % Specifies whether to enable reglitching.The output of a DAC normally glitches whenever the DAC is updated with a new value. The amount of glitching differs from code to code and is generally largest at major code transitions.Reglitching generates uniform glitch energy at each code transition and provides for more uniform glitches.Uniform glitch energy makes it easier to filter out the noise introduced from g...
NICONST.DAQmx_AO_Gain = hex2dec('0118'); % Specifies in decibels the gain factor to apply to the channel.
NICONST.DAQmx_AO_UseOnlyOnBrdMem = hex2dec('183A'); % Specifies whether to write samples directly to the onboard memory of the device, bypassing the memory buffer. Generally, you cannot update onboard memory after you start the task. Onboard memory includes data FIFOs.
NICONST.DAQmx_AO_DataXferMech = hex2dec('0134'); % Specifies the data transfer mode for the device.
NICONST.DAQmx_AO_DataXferReqCond = hex2dec('183C'); % Specifies under what condition to transfer data from the buffer to the onboard memory of the device.
NICONST.DAQmx_AO_MemMapEnable = hex2dec('188F'); % Specifies if NI-DAQmx maps hardware registers to the memory space of the customer process, if possible. Mapping to the memory space of the customer process increases performance. However, memory mapping can adversely affect the operation of the device and possibly result in a system crash if software in the process unintentionally accesses the mapped registers.
NICONST.DAQmx_AO_DevScalingCoeff = hex2dec('1931'); % Indicates the coefficients of a linear equation that NI-DAQmx uses to scale values from a voltage to the native format of the device.Each element of the array corresponds to a term of the equation. For example, if index two of the array is 4, the third term of the equation is 4x^2.Scaling coefficients do not account for any custom scales that may be applied to the channel.
NICONST.DAQmx_DI_InvertLines = hex2dec('0793'); % Specifies whether to invert the lines in the channel. If you set this property to TRUE, the lines are at high logic when off and at low logic when on.
NICONST.DAQmx_DI_NumLines = hex2dec('2178'); % Indicates the number of digital lines in the channel.
NICONST.DAQmx_DI_DigFltr_Enable = hex2dec('21D6'); % Specifies whether to enable the digital filter for the line(s) or port(s). You can enable the filter on a line-by-line basis. You do not have to enable the filter for all lines in a channel.
NICONST.DAQmx_DI_DigFltr_MinPulseWidth = hex2dec('21D7'); % Specifies in seconds the minimum pulse width the filter recognizes as a valid high or low state transition.
NICONST.DAQmx_DI_Tristate = hex2dec('1890'); % Specifies whether to tristate the lines in the channel. If you set this property to TRUE, NI-DAQmx tristates the lines in the channel. If you set this property to FALSE, NI-DAQmx does not modify the configuration of the lines even if the lines were previously tristated. Set this property to FALSE to read lines in other tasks or to read output-only lines.
NICONST.DAQmx_DI_DataXferMech = hex2dec('2263'); % Specifies the data transfer mode for the device.
NICONST.DAQmx_DI_DataXferReqCond = hex2dec('2264'); % Specifies under what condition to transfer data from the onboard memory of the device to the buffer.
NICONST.DAQmx_DO_InvertLines = hex2dec('1133'); % Specifies whether to invert the lines in the channel. If you set this property to TRUE, the lines are at high logic when off and at low logic when on.
NICONST.DAQmx_DO_NumLines = hex2dec('2179'); % Indicates the number of digital lines in the channel.
NICONST.DAQmx_DO_Tristate = hex2dec('18F3'); % Specifies whether to stop driving the channel and set it to a Hi-Z state.
NICONST.DAQmx_DO_UseOnlyOnBrdMem = hex2dec('2265'); % Specifies whether to write samples directly to the onboard memory of the device, bypassing the memory buffer. Generally, you cannot update onboard memory after you start the task. Onboard memory includes data FIFOs.
NICONST.DAQmx_DO_DataXferMech = hex2dec('2266'); % Specifies the data transfer mode for the device.
NICONST.DAQmx_DO_DataXferReqCond = hex2dec('2267'); % Specifies under what condition to transfer data from the buffer to the onboard memory of the device.
NICONST.DAQmx_CI_Max = hex2dec('189C'); % Specifies the maximum value you expect to measure. This value is in the units you specify with a units property. When you query this property, it returns the coerced maximum value that the hardware can measure with the current settings.
NICONST.DAQmx_CI_Min = hex2dec('189D'); % Specifies the minimum value you expect to measure. This value is in the units you specify with a units property. When you query this property, it returns the coerced minimum value that the hardware can measure with the current settings.
NICONST.DAQmx_CI_CustomScaleName = hex2dec('189E'); % Specifies the name of a custom scale for the channel.
NICONST.DAQmx_CI_MeasType = hex2dec('18A0'); % Indicates the measurement to take with the channel.
NICONST.DAQmx_CI_Freq_Units = hex2dec('18A1'); % Specifies the units to use to return frequency measurements.
NICONST.DAQmx_CI_Freq_Term = hex2dec('18A2'); % Specifies the input terminal of the signal to measure.
NICONST.DAQmx_CI_Freq_StartingEdge = hex2dec('0799'); % Specifies between which edges to measure the frequency of the signal.
NICONST.DAQmx_CI_Freq_MeasMeth = hex2dec('0144'); % Specifies the method to use to measure the frequency of the signal.
NICONST.DAQmx_CI_Freq_MeasTime = hex2dec('0145'); % Specifies in seconds the length of time to measure the frequency of the signal if Method is DAQmx_Val_HighFreq2Ctr. Measurement accuracy increases with increased measurement time and with increased signal frequency. If you measure a high-frequency signal for too long, however, the count register could roll over, which results in an incorrect measurement.
NICONST.DAQmx_CI_Freq_Div = hex2dec('0147'); % Specifies the value by which to divide the input signal ifMethod is DAQmx_Val_LargeRng2Ctr. The larger the divisor, the more accurate the measurement. However, too large a value could cause the count register to roll over, which results in an incorrect measurement.
NICONST.DAQmx_CI_Freq_DigFltr_Enable = hex2dec('21E7'); % Specifies whether to apply the pulse width filter to the signal.
NICONST.DAQmx_CI_Freq_DigFltr_MinPulseWidth = hex2dec('21E8'); % Specifies in seconds the minimum pulse width the filter recognizes.
NICONST.DAQmx_CI_Freq_DigFltr_TimebaseSrc = hex2dec('21E9'); % Specifies the input terminal of the signal to use as the timebase of the pulse width filter.
NICONST.DAQmx_CI_Freq_DigFltr_TimebaseRate = hex2dec('21EA'); % Specifies in hertz the rate of the pulse width filter timebase. NI-DAQmx uses this value to compute settings for the filter.
NICONST.DAQmx_CI_Freq_DigSync_Enable = hex2dec('21EB'); % Specifies whether to synchronize recognition of transitions in the signal to the internal timebase of the device.
NICONST.DAQmx_CI_Period_Units = hex2dec('18A3'); % Specifies the unit to use to return period measurements.
NICONST.DAQmx_CI_Period_Term = hex2dec('18A4'); % Specifies the input terminal of the signal to measure.
NICONST.DAQmx_CI_Period_StartingEdge = hex2dec('0852'); % Specifies between which edges to measure the period of the signal.
NICONST.DAQmx_CI_Period_MeasMeth = hex2dec('192C'); % Specifies the method to use to measure the period of the signal.
NICONST.DAQmx_CI_Period_MeasTime = hex2dec('192D'); % Specifies in seconds the length of time to measure the period of the signal if Method is DAQmx_Val_HighFreq2Ctr. Measurement accuracy increases with increased measurement time and with increased signal frequency. If you measure a high-frequency signal for too long, however, the count register could roll over, which results in an incorrect measurement.
NICONST.DAQmx_CI_Period_Div = hex2dec('192E'); % Specifies the value by which to divide the input signal if Method is DAQmx_Val_LargeRng2Ctr. The larger the divisor, the more accurate the measurement. However, too large a value could cause the count register to roll over, which results in an incorrect measurement.
NICONST.DAQmx_CI_Period_DigFltr_Enable = hex2dec('21EC'); % Specifies whether to apply the pulse width filter to the signal.
NICONST.DAQmx_CI_Period_DigFltr_MinPulseWidth = hex2dec('21ED'); % Specifies in seconds the minimum pulse width the filter recognizes.
NICONST.DAQmx_CI_Period_DigFltr_TimebaseSrc = hex2dec('21EE'); % Specifies the input terminal of the signal to use as the timebase of the pulse width filter.
NICONST.DAQmx_CI_Period_DigFltr_TimebaseRate = hex2dec('21EF'); % Specifies in hertz the rate of the pulse width filter timebase. NI-DAQmx uses this value to compute settings for the filter.
NICONST.DAQmx_CI_Period_DigSync_Enable = hex2dec('21F0'); % Specifies whether to synchronize recognition of transitions in the signal to the internal timebase of the device.
NICONST.DAQmx_CI_CountEdges_Term = hex2dec('18C7'); % Specifies the input terminal of the signal to measure.
NICONST.DAQmx_CI_CountEdges_Dir = hex2dec('0696'); % Specifies whether to increment or decrement the counter on each edge.
NICONST.DAQmx_CI_CountEdges_DirTerm = hex2dec('21E1'); % Specifies the source terminal of the digital signal that controls the count direction if Direction is DAQmx_Val_ExtControlled.
NICONST.DAQmx_CI_CountEdges_CountDir_DigFltr_Enable = hex2dec('21F1'); % Specifies whether to apply the pulse width filter to the signal.
NICONST.DAQmx_CI_CountEdges_CountDir_DigFltr_MinPulseWidth = hex2dec('21F2'); % Specifies in seconds the minimum pulse width the filter recognizes.
NICONST.DAQmx_CI_CountEdges_CountDir_DigFltr_TimebaseSrc = hex2dec('21F3'); % Specifies the input terminal of the signal to use as the timebase of the pulse width filter.
NICONST.DAQmx_CI_CountEdges_CountDir_DigFltr_TimebaseRate = hex2dec('21F4'); % Specifies in hertz the rate of the pulse width filter timebase. NI-DAQmx uses this value to compute settings for the filter.
NICONST.DAQmx_CI_CountEdges_CountDir_DigSync_Enable = hex2dec('21F5'); % Specifies whether to synchronize recognition of transitions in the signal to the internal timebase of the device.
NICONST.DAQmx_CI_CountEdges_InitialCnt = hex2dec('0698'); % Specifies the starting value from which to count.
NICONST.DAQmx_CI_CountEdges_ActiveEdge = hex2dec('0697'); % Specifies on which edges to increment or decrement the counter.
NICONST.DAQmx_CI_CountEdges_DigFltr_Enable = hex2dec('21F6'); % Specifies whether to apply the pulse width filter to the signal.
NICONST.DAQmx_CI_CountEdges_DigFltr_MinPulseWidth = hex2dec('21F7'); % Specifies in seconds the minimum pulse width the filter recognizes.
NICONST.DAQmx_CI_CountEdges_DigFltr_TimebaseSrc = hex2dec('21F8'); % Specifies the input terminal of the signal to use as the timebase of the pulse width filter.
NICONST.DAQmx_CI_CountEdges_DigFltr_TimebaseRate = hex2dec('21F9'); % Specifies in hertz the rate of the pulse width filter timebase. NI-DAQmx uses this value to compute settings for the filter.
NICONST.DAQmx_CI_CountEdges_DigSync_Enable = hex2dec('21FA'); % Specifies whether to synchronize recognition of transitions in the signal to the internal timebase of the device.
NICONST.DAQmx_CI_AngEncoder_Units = hex2dec('18A6'); % Specifies the units to use to return angular position measurements from the channel.
NICONST.DAQmx_CI_AngEncoder_PulsesPerRev = hex2dec('0875'); % Specifies the number of pulses the encoder generates per revolution. This value is the number of pulses on either signal A or signal B, not the total number of pulses on both signal A and signal B.
NICONST.DAQmx_CI_AngEncoder_InitialAngle = hex2dec('0881'); % Specifies the starting angle of the encoder. This value is in the units you specify with Units.
NICONST.DAQmx_CI_LinEncoder_Units = hex2dec('18A9'); % Specifies the units to use to return linear encoder measurements from the channel.
NICONST.DAQmx_CI_LinEncoder_DistPerPulse = hex2dec('0911'); % Specifies the distance to measure for each pulse the encoder generates on signal A or signal B. This value is in the units you specify with Units.
NICONST.DAQmx_CI_LinEncoder_InitialPos = hex2dec('0915'); % Specifies the position of the encoder when the measurement begins. This value is in the units you specify with Units.
NICONST.DAQmx_CI_Encoder_DecodingType = hex2dec('21E6'); % Specifies how to count and interpret the pulses the encoder generates on signal A and signal B. DAQmx_Val_X1, DAQmx_Val_X2, and DAQmx_Val_X4 are valid for quadrature encoders only. DAQmx_Val_TwoPulseCounting is valid for two-pulse encoders only.
NICONST.DAQmx_CI_Encoder_AInputTerm = hex2dec('219D'); % Specifies the terminal to which signal A is connected.
NICONST.DAQmx_CI_Encoder_AInput_DigFltr_Enable = hex2dec('21FB'); % Specifies whether to apply the pulse width filter to the signal.
NICONST.DAQmx_CI_Encoder_AInput_DigFltr_MinPulseWidth = hex2dec('21FC'); % Specifies in seconds the minimum pulse width the filter recognizes.
NICONST.DAQmx_CI_Encoder_AInput_DigFltr_TimebaseSrc = hex2dec('21FD'); % Specifies the input terminal of the signal to use as the timebase of the pulse width filter.
NICONST.DAQmx_CI_Encoder_AInput_DigFltr_TimebaseRate = hex2dec('21FE'); % Specifies in hertz the rate of the pulse width filter timebase. NI-DAQmx uses this value to compute settings for the filter.
NICONST.DAQmx_CI_Encoder_AInput_DigSync_Enable = hex2dec('21FF'); % Specifies whether to synchronize recognition of transitions in the signal to the internal timebase of the device.
NICONST.DAQmx_CI_Encoder_BInputTerm = hex2dec('219E'); % Specifies the terminal to which signal B is connected.
NICONST.DAQmx_CI_Encoder_BInput_DigFltr_Enable = hex2dec('2200'); % Specifies whether to apply the pulse width filter to the signal.
NICONST.DAQmx_CI_Encoder_BInput_DigFltr_MinPulseWidth = hex2dec('2201'); % Specifies in seconds the minimum pulse width the filter recognizes.
NICONST.DAQmx_CI_Encoder_BInput_DigFltr_TimebaseSrc = hex2dec('2202'); % Specifies the input terminal of the signal to use as the timebase of the pulse width filter.
NICONST.DAQmx_CI_Encoder_BInput_DigFltr_TimebaseRate = hex2dec('2203'); % Specifies in hertz the rate of the pulse width filter timebase. NI-DAQmx uses this value to compute settings for the filter.
NICONST.DAQmx_CI_Encoder_BInput_DigSync_Enable = hex2dec('2204'); % Specifies whether to synchronize recognition of transitions in the signal to the internal timebase of the device.
NICONST.DAQmx_CI_Encoder_ZInputTerm = hex2dec('219F'); % Specifies the terminal to which signal Z is connected.
NICONST.DAQmx_CI_Encoder_ZInput_DigFltr_Enable = hex2dec('2205'); % Specifies whether to apply the pulse width filter to the signal.
NICONST.DAQmx_CI_Encoder_ZInput_DigFltr_MinPulseWidth = hex2dec('2206'); % Specifies in seconds the minimum pulse width the filter recognizes.
NICONST.DAQmx_CI_Encoder_ZInput_DigFltr_TimebaseSrc = hex2dec('2207'); % Specifies the input terminal of the signal to use as the timebase of the pulse width filter.
NICONST.DAQmx_CI_Encoder_ZInput_DigFltr_TimebaseRate = hex2dec('2208'); % Specifies in hertz the rate of the pulse width filter timebase. NI-DAQmx uses this value to compute settings for the filter.
NICONST.DAQmx_CI_Encoder_ZInput_DigSync_Enable = hex2dec('2209'); % Specifies whether to synchronize recognition of transitions in the signal to the internal timebase of the device.
NICONST.DAQmx_CI_Encoder_ZIndexEnable = hex2dec('0890'); % Specifies whether to use Z indexing for the channel.
NICONST.DAQmx_CI_Encoder_ZIndexVal = hex2dec('0888'); % Specifies the value to which to reset the measurement when signal Z is high and signal A and signal B are at the states you specify with Z Index Phase. Specify this value in the units of the measurement.
NICONST.DAQmx_CI_Encoder_ZIndexPhase = hex2dec('0889'); % Specifies the states at which signal A and signal B must be while signal Z is high for NI-DAQmx to reset the measurement. If signal Z is never high while signal A and signal B are high, for example, you must choose a phase other than DAQmx_Val_AHighBHigh.
NICONST.DAQmx_CI_PulseWidth_Units = hex2dec('0823'); % Specifies the units to use to return pulse width measurements.
NICONST.DAQmx_CI_PulseWidth_Term = hex2dec('18AA'); % Specifies the input terminal of the signal to measure.
NICONST.DAQmx_CI_PulseWidth_StartingEdge = hex2dec('0825'); % Specifies on which edge of the input signal to begin each pulse width measurement.
NICONST.DAQmx_CI_PulseWidth_DigFltr_Enable = hex2dec('220A'); % Specifies whether to apply the pulse width filter to the signal.
NICONST.DAQmx_CI_PulseWidth_DigFltr_MinPulseWidth = hex2dec('220B'); % Specifies in seconds the minimum pulse width the filter recognizes.
NICONST.DAQmx_CI_PulseWidth_DigFltr_TimebaseSrc = hex2dec('220C'); % Specifies the input terminal of the signal to use as the timebase of the pulse width filter.
NICONST.DAQmx_CI_PulseWidth_DigFltr_TimebaseRate = hex2dec('220D'); % Specifies in hertz the rate of the pulse width filter timebase. NI-DAQmx uses this value to compute settings for the filter.
NICONST.DAQmx_CI_PulseWidth_DigSync_Enable = hex2dec('220E'); % Specifies whether to synchronize recognition of transitions in the signal to the internal timebase of the device.
NICONST.DAQmx_CI_TwoEdgeSep_Units = hex2dec('18AC'); % Specifies the units to use to return two-edge separation measurements from the channel.
NICONST.DAQmx_CI_TwoEdgeSep_FirstTerm = hex2dec('18AD'); % Specifies the source terminal of the digital signal that starts each measurement.
NICONST.DAQmx_CI_TwoEdgeSep_FirstEdge = hex2dec('0833'); % Specifies on which edge of the first signal to start each measurement.
NICONST.DAQmx_CI_TwoEdgeSep_First_DigFltr_Enable = hex2dec('220F'); % Specifies whether to apply the pulse width filter to the signal.
NICONST.DAQmx_CI_TwoEdgeSep_First_DigFltr_MinPulseWidth = hex2dec('2210'); % Specifies in seconds the minimum pulse width the filter recognizes.
NICONST.DAQmx_CI_TwoEdgeSep_First_DigFltr_TimebaseSrc = hex2dec('2211'); % Specifies the input terminal of the signal to use as the timebase of the pulse width filter.
NICONST.DAQmx_CI_TwoEdgeSep_First_DigFltr_TimebaseRate = hex2dec('2212'); % Specifies in hertz the rate of the pulse width filter timebase. NI-DAQmx uses this value to compute settings for the filter.
NICONST.DAQmx_CI_TwoEdgeSep_First_DigSync_Enable = hex2dec('2213'); % Specifies whether to synchronize recognition of transitions in the signal to the internal timebase of the device.
NICONST.DAQmx_CI_TwoEdgeSep_SecondTerm = hex2dec('18AE'); % Specifies the source terminal of the digital signal that stops each measurement.
NICONST.DAQmx_CI_TwoEdgeSep_SecondEdge = hex2dec('0834'); % Specifies on which edge of the second signal to stop each measurement.
NICONST.DAQmx_CI_TwoEdgeSep_Second_DigFltr_Enable = hex2dec('2214'); % Specifies whether to apply the pulse width filter to the signal.
NICONST.DAQmx_CI_TwoEdgeSep_Second_DigFltr_MinPulseWidth = hex2dec('2215'); % Specifies in seconds the minimum pulse width the filter recognizes.
NICONST.DAQmx_CI_TwoEdgeSep_Second_DigFltr_TimebaseSrc = hex2dec('2216'); % Specifies the input terminal of the signal to use as the timebase of the pulse width filter.
NICONST.DAQmx_CI_TwoEdgeSep_Second_DigFltr_TimebaseRate = hex2dec('2217'); % Specifies in hertz the rate of the pulse width filter timebase. NI-DAQmx uses this value to compute settings for the filter.
NICONST.DAQmx_CI_TwoEdgeSep_Second_DigSync_Enable = hex2dec('2218'); % Specifies whether to synchronize recognition of transitions in the signal to the internal timebase of the device.
NICONST.DAQmx_CI_SemiPeriod_Units = hex2dec('18AF'); % Specifies the units to use to return semi-period measurements.
NICONST.DAQmx_CI_SemiPeriod_Term = hex2dec('18B0'); % Specifies the input terminal of the signal to measure.
NICONST.DAQmx_CI_SemiPeriod_DigFltr_Enable = hex2dec('2219'); % Specifies whether to apply the pulse width filter to the signal.
NICONST.DAQmx_CI_SemiPeriod_DigFltr_MinPulseWidth = hex2dec('221A'); % Specifies in seconds the minimum pulse width the filter recognizes.
NICONST.DAQmx_CI_SemiPeriod_DigFltr_TimebaseSrc = hex2dec('221B'); % Specifies the input terminal of the signal to use as the timebase of the pulse width filter.
NICONST.DAQmx_CI_SemiPeriod_DigFltr_TimebaseRate = hex2dec('221C'); % Specifies in hertz the rate of the pulse width filter timebase. NI-DAQmx uses this value to compute settings for the filter.
NICONST.DAQmx_CI_SemiPeriod_DigSync_Enable = hex2dec('221D'); % Specifies whether to synchronize recognition of transitions in the signal to the internal timebase of the device.
NICONST.DAQmx_CI_CtrTimebaseSrc = hex2dec('0143'); % Specifies the terminal of the timebase to use for the counter.
NICONST.DAQmx_CI_CtrTimebaseRate = hex2dec('18B2'); % Specifies in Hertz the frequency of the counter timebase. Specifying the rate of a counter timebase allows you to take measurements in terms of time or frequency rather than in ticks of the timebase. If you use an external timebase and do not specify the rate, you can take measurements only in terms of ticks of the timebase.
NICONST.DAQmx_CI_CtrTimebaseActiveEdge = hex2dec('0142'); % Specifies whether a timebase cycle is from rising edge to rising edge or from falling edge to falling edge.
NICONST.DAQmx_CI_CtrTimebase_DigFltr_Enable = hex2dec('2271'); % Specifies whether to apply the pulse width filter to the signal.
NICONST.DAQmx_CI_CtrTimebase_DigFltr_MinPulseWidth = hex2dec('2272'); % Specifies in seconds the minimum pulse width the filter recognizes.
NICONST.DAQmx_CI_CtrTimebase_DigFltr_TimebaseSrc = hex2dec('2273'); % Specifies the input terminal of the signal to use as the timebase of the pulse width filter.
NICONST.DAQmx_CI_CtrTimebase_DigFltr_TimebaseRate = hex2dec('2274'); % Specifies in hertz the rate of the pulse width filter timebase. NI-DAQmx uses this value to compute settings for the filter.
NICONST.DAQmx_CI_CtrTimebase_DigSync_Enable = hex2dec('2275'); % Specifies whether to synchronize recognition of transitions in the signal to the internal timebase of the device.
NICONST.DAQmx_CI_Count = hex2dec('0148'); % Indicates the current value of the count register.
NICONST.DAQmx_CI_OutputState = hex2dec('0149'); % Indicates the current state of the out terminal of the counter.
NICONST.DAQmx_CI_TCReached = hex2dec('0150'); % Indicates whether the counter rolled over. When you query this property, NI-DAQmx resets it to FALSE.
NICONST.DAQmx_CI_CtrTimebaseMasterTimebaseDiv = hex2dec('18B3'); % Specifies the divisor for an external counter timebase. You can divide the counter timebase in order to measure slower signals without causing the count register to roll over.
NICONST.DAQmx_CI_DataXferMech = hex2dec('0200'); % Specifies the data transfer mode for the channel.
NICONST.DAQmx_CI_NumPossiblyInvalidSamps = hex2dec('193C'); % Indicates the number of samples that the device might have overwritten before it could transfer them to the buffer.
NICONST.DAQmx_CI_DupCountPrevent = hex2dec('21AC'); % Specifies whether to enable duplicate count prevention for the channel.
NICONST.DAQmx_CI_Prescaler = hex2dec('2239'); % Specifies the divisor to apply to the signal you connect to the counter source terminal. Scaled data that you read takes this setting into account. You should use a prescaler only when you connect an external signal to the counter source terminal and when that signal has a higher frequency than the fastest onboard timebase.
NICONST.DAQmx_CO_OutputType = hex2dec('18B5'); % Indicates how to define pulses generated on the channel.
NICONST.DAQmx_CO_Pulse_IdleState = hex2dec('1170'); % Specifies the resting state of the output terminal.
NICONST.DAQmx_CO_Pulse_Term = hex2dec('18E1'); % Specifies on which terminal to generate pulses.
NICONST.DAQmx_CO_Pulse_Time_Units = hex2dec('18D6'); % Specifies the units in which to define high and low pulse time.
NICONST.DAQmx_CO_Pulse_HighTime = hex2dec('18BA'); % Specifies the amount of time that the pulse is at a high voltage. This value is in the units you specify with Units or when you create the channel.
NICONST.DAQmx_CO_Pulse_LowTime = hex2dec('18BB'); % Specifies the amount of time that the pulse is at a low voltage. This value is in the units you specify with Units or when you create the channel.
NICONST.DAQmx_CO_Pulse_Time_InitialDelay = hex2dec('18BC'); % Specifies in seconds the amount of time to wait before generating the first pulse.
NICONST.DAQmx_CO_Pulse_DutyCyc = hex2dec('1176'); % Specifies the duty cycle of the pulses. The duty cycle of a signal is the width of the pulse divided by period. NI-DAQmx uses this ratio and the pulse frequency to determine the width of the pulses and the delay between pulses.
NICONST.DAQmx_CO_Pulse_Freq_Units = hex2dec('18D5'); % Specifies the units in which to define pulse frequency.
NICONST.DAQmx_CO_Pulse_Freq = hex2dec('1178'); % Specifies the frequency of the pulses to generate. This value is in the units you specify with Units or when you create the channel.
NICONST.DAQmx_CO_Pulse_Freq_InitialDelay = hex2dec('0299'); % Specifies in seconds the amount of time to wait before generating the first pulse.
NICONST.DAQmx_CO_Pulse_HighTicks = hex2dec('1169'); % Specifies the number of ticks the pulse is high.
NICONST.DAQmx_CO_Pulse_LowTicks = hex2dec('1171'); % Specifies the number of ticks the pulse is low.
NICONST.DAQmx_CO_Pulse_Ticks_InitialDelay = hex2dec('0298'); % Specifies the number of ticks to wait before generating the first pulse.
NICONST.DAQmx_CO_CtrTimebaseSrc = hex2dec('0339'); % Specifies the terminal of the timebase to use for the counter. Typically, NI-DAQmx uses one of the internal counter timebases when generating pulses. Use this property to specify an external timebase and produce custom pulse widths that are not possible using the internal timebases.
NICONST.DAQmx_CO_CtrTimebaseRate = hex2dec('18C2'); % Specifies in Hertz the frequency of the counter timebase. Specifying the rate of a counter timebase allows you to define output pulses in seconds rather than in ticks of the timebase. If you use an external timebase and do not specify the rate, you can define output pulses only in ticks of the timebase.
NICONST.DAQmx_CO_CtrTimebaseActiveEdge = hex2dec('0341'); % Specifies whether a timebase cycle is from rising edge to rising edge or from falling edge to falling edge.
NICONST.DAQmx_CO_CtrTimebase_DigFltr_Enable = hex2dec('2276'); % Specifies whether to apply the pulse width filter to the signal.
NICONST.DAQmx_CO_CtrTimebase_DigFltr_MinPulseWidth = hex2dec('2277'); % Specifies in seconds the minimum pulse width the filter recognizes.
NICONST.DAQmx_CO_CtrTimebase_DigFltr_TimebaseSrc = hex2dec('2278'); % Specifies the input terminal of the signal to use as the timebase of the pulse width filter.
NICONST.DAQmx_CO_CtrTimebase_DigFltr_TimebaseRate = hex2dec('2279'); % Specifies in hertz the rate of the pulse width filter timebase. NI-DAQmx uses this value to compute settings for the filter.
NICONST.DAQmx_CO_CtrTimebase_DigSync_Enable = hex2dec('227A'); % Specifies whether to synchronize recognition of transitions in the signal to the internal timebase of the device.
NICONST.DAQmx_CO_Count = hex2dec('0293'); % Indicates the current value of the count register.
NICONST.DAQmx_CO_OutputState = hex2dec('0294'); % Indicates the current state of the output terminal of the counter.
NICONST.DAQmx_CO_AutoIncrCnt = hex2dec('0295'); % Specifies a number of timebase ticks by which to increment each successive pulse.
NICONST.DAQmx_CO_CtrTimebaseMasterTimebaseDiv = hex2dec('18C3'); % Specifies the divisor for an external counter timebase. You can divide the counter timebase in order to generate slower signals without causing the count register to roll over.
NICONST.DAQmx_CO_PulseDone = hex2dec('190E'); % Indicates if the task completed pulse generation. Use this value for retriggerable pulse generation when you need to determine if the device generated the current pulse. When you query this property, NI-DAQmx resets it to FALSE.
NICONST.DAQmx_CO_Prescaler = hex2dec('226D'); % Specifies the divisor to apply to the signal you connect to the counter source terminal. Pulse generations defined by frequency or time take this setting into account, but pulse generations defined by ticks do not. You should use a prescaler only when you connect an external signal to the counter source terminal and when that signal has a higher frequency than the fastest onboard timebase.

%********** Export Signal Attributes **********
NICONST.DAQmx_Exported_AIConvClk_OutputTerm = hex2dec('1687'); % Specifies the terminal to which to route the AI Convert Clock.
NICONST.DAQmx_Exported_AIConvClk_Pulse_Polarity = hex2dec('1688'); % Indicates the polarity of the exported AI Convert Clock. The polarity is fixed and independent of the active edge of the source of the AI Convert Clock.
NICONST.DAQmx_Exported_10MHzRefClk_OutputTerm = hex2dec('226E'); % Specifies the terminal to which to route the 10MHz Clock.
NICONST.DAQmx_Exported_20MHzTimebase_OutputTerm = hex2dec('1657'); % Specifies the terminal to which to route the 20MHz Timebase.
NICONST.DAQmx_Exported_SampClk_OutputBehavior = hex2dec('186B'); % Specifies whether the exported Sample Clock issues a pulse at the beginning of a sample or changes to a high state for the duration of the sample.
NICONST.DAQmx_Exported_SampClk_OutputTerm = hex2dec('1663'); % Specifies the terminal to which to route the Sample Clock.
NICONST.DAQmx_Exported_SampClkTimebase_OutputTerm = hex2dec('18F9'); % Specifies the terminal to which to route the Sample Clock Timebase.
NICONST.DAQmx_Exported_DividedSampClkTimebase_OutputTerm = hex2dec('21A1'); % Specifies the terminal to which to route the Divided Sample Clock Timebase.
NICONST.DAQmx_Exported_AdvTrig_OutputTerm = hex2dec('1645'); % Specifies the terminal to which to route the Advance Trigger.
NICONST.DAQmx_Exported_AdvTrig_Pulse_Polarity = hex2dec('1646'); % Indicates the polarity of the exported Advance Trigger.
NICONST.DAQmx_Exported_AdvTrig_Pulse_WidthUnits = hex2dec('1647'); % Specifies the units of Width Value.
NICONST.DAQmx_Exported_AdvTrig_Pulse_Width = hex2dec('1648'); % Specifies the width of an exported Advance Trigger pulse. Specify this value in the units you specify with Width Units.
NICONST.DAQmx_Exported_RefTrig_OutputTerm = hex2dec('0590'); % Specifies the terminal to which to route the Reference Trigger.
NICONST.DAQmx_Exported_StartTrig_OutputTerm = hex2dec('0584'); % Specifies the terminal to which to route the Start Trigger.
NICONST.DAQmx_Exported_AdvCmpltEvent_OutputTerm = hex2dec('1651'); % Specifies the terminal to which to route the Advance Complete Event.
NICONST.DAQmx_Exported_AdvCmpltEvent_Delay = hex2dec('1757'); % Specifies the output signal delay in periods of the sample clock.
NICONST.DAQmx_Exported_AdvCmpltEvent_Pulse_Polarity = hex2dec('1652'); % Specifies the polarity of the exported Advance Complete Event.
NICONST.DAQmx_Exported_AdvCmpltEvent_Pulse_Width = hex2dec('1654'); % Specifies the width of the exported Advance Complete Event pulse.
NICONST.DAQmx_Exported_AIHoldCmpltEvent_OutputTerm = hex2dec('18ED'); % Specifies the terminal to which to route the AI Hold Complete Event.
NICONST.DAQmx_Exported_AIHoldCmpltEvent_PulsePolarity = hex2dec('18EE'); % Specifies the polarity of an exported AI Hold Complete Event pulse.
NICONST.DAQmx_Exported_ChangeDetectEvent_OutputTerm = hex2dec('2197'); % Specifies the terminal to which to route the Change Detection Event.
NICONST.DAQmx_Exported_CtrOutEvent_OutputTerm = hex2dec('1717'); % Specifies the terminal to which to route the Counter Output Event.
NICONST.DAQmx_Exported_CtrOutEvent_OutputBehavior = hex2dec('174F'); % Specifies whether the exported Counter Output Event pulses or changes from one state to the other when the counter reaches terminal count.
NICONST.DAQmx_Exported_CtrOutEvent_Pulse_Polarity = hex2dec('1718'); % Specifies the polarity of the pulses at the output terminal of the counter when Output Behavior is DAQmx_Val_Pulse. NI-DAQmx ignores this property if Output Behavior is DAQmx_Val_Toggle.
NICONST.DAQmx_Exported_CtrOutEvent_Toggle_IdleState = hex2dec('186A'); % Specifies the initial state of the output terminal of the counter when Output Behavior is DAQmx_Val_Toggle. The terminal enters this state when NI-DAQmx commits the task.
NICONST.DAQmx_Exported_SyncPulseEvent_OutputTerm = hex2dec('223C'); % Specifies the terminal to which to route the Synchronization Pulse Event.
NICONST.DAQmx_Exported_WatchdogExpiredEvent_OutputTerm = hex2dec('21AA'); % Specifies the terminalto which to route the Watchdog Timer Expired Event.

%********** Device Attributes **********
NICONST.DAQmx_Dev_ProductType = hex2dec('0631'); % Indicates the product name of the device.
NICONST.DAQmx_Dev_SerialNum = hex2dec('0632'); % Indicates the serial number of the device. This value is zero if the device does not have a serial number.

%********** Read Attributes **********
NICONST.DAQmx_Read_RelativeTo = hex2dec('190A'); % Specifies the point in the buffer at which to begin a read operation. If you also specify an offset with Offset, the read operation begins at that offset relative to the point you select with this property. The default value is DAQmx_Val_CurrReadPos unless you configure a Reference Trigger for the task. If you configure a Reference Trigger, the default value is DAQmx_Val_FirstPretrigSamp.
NICONST.DAQmx_Read_Offset = hex2dec('190B'); % Specifies an offset in samples per channel at which to begin a read operation. This offset is relative to the location you specify with RelativeTo.
NICONST.DAQmx_Read_ChannelsToRead = hex2dec('1823'); % Specifies a subset of channels in the task from which to read.
NICONST.DAQmx_Read_ReadAllAvailSamp = hex2dec('1215'); % Specifies whether subsequent read operations read all samples currently available in the buffer or wait for the buffer to become full before reading. NI-DAQmx uses this setting for finite acquisitions and only when the number of samples to read is -1. For continuous acquisitions when the number of samples to read is -1, a read operation always reads all samples currently available in the buffer.
NICONST.DAQmx_Read_AutoStart = hex2dec('1826'); % Specifies if an NI-DAQmx Read function automatically starts the taskif you did not start the task explicitly by using DAQmxStartTask(). The default value is TRUE. Whenan NI-DAQmx Read function starts a finite acquisition task, it also stops the task after reading the last sample.
NICONST.DAQmx_Read_OverWrite = hex2dec('1211'); % Specifies whether to overwrite samples in the buffer that you have not yet read.
NICONST.DAQmx_Read_CurrReadPos = hex2dec('1221'); % Indicates in samples per channel the current position in the buffer.
NICONST.DAQmx_Read_AvailSampPerChan = hex2dec('1223'); % Indicates the number of samples available to read per channel. This value is the same for all channels in the task.
NICONST.DAQmx_Read_TotalSampPerChanAcquired = hex2dec('192A'); % Indicates the total number of samples acquired by each channel. NI-DAQmx returns a single value because this value is the same for all channels.
NICONST.DAQmx_Read_OverloadedChansExist = hex2dec('2174'); % Indicates if the device detected an overload in any channel in the task. Reading this property clears the overload status for all channels in the task. You must read this property before you read Overloaded Channels. Otherwise, you will receive an error.
NICONST.DAQmx_Read_OverloadedChans = hex2dec('2175'); % Indicates the names of any overloaded virtual channels in the task. You must read Overloaded Channels Exist before you read this property. Otherwise, you will receive an error.
NICONST.DAQmx_Read_ChangeDetect_HasOverflowed = hex2dec('2194'); % Indicates if samples were missed because change detection events occurred faster than the device could handle them. Some devices detect overflows differently than others.
NICONST.DAQmx_Read_RawDataWidth = hex2dec('217A'); % Indicates in bytes the size of a raw sample from the task.
NICONST.DAQmx_Read_NumChans = hex2dec('217B'); % Indicates the number of channels that an NI-DAQmx Read function reads from the task. This value is the number of channels in the task or the number of channels you specify with Channels to Read.
NICONST.DAQmx_Read_DigitalLines_BytesPerChan = hex2dec('217C'); % Indicates the number of bytes per channel that NI-DAQmx returns in a sample for line-based reads. If a channel has fewer lines than this number, the extra bytes are FALSE.
NICONST.DAQmx_ReadWaitMode = hex2dec('2232'); % Specifies how an NI-DAQmx Read function waits for samples to become available.

%********** Switch Channel Attributes **********
NICONST.DAQmx_SwitchChan_Usage = hex2dec('18E4'); % Specifies how you can use the channel. Using this property acts as a safety mechanism to prevent you from connecting two source channels, for example.
NICONST.DAQmx_SwitchChan_MaxACCarryCurrent = hex2dec('0648'); % Indicates in amperes the maximum AC current that the device can carry.
NICONST.DAQmx_SwitchChan_MaxACSwitchCurrent = hex2dec('0646'); % Indicates in amperes the maximum AC current that the device can switch. This current is always against an RMS voltage level.
NICONST.DAQmx_SwitchChan_MaxACCarryPwr = hex2dec('0642'); % Indicates in watts the maximum AC power that the device can carry.
NICONST.DAQmx_SwitchChan_MaxACSwitchPwr = hex2dec('0644'); % Indicates in watts the maximum AC power that the device can switch.
NICONST.DAQmx_SwitchChan_MaxDCCarryCurrent = hex2dec('0647'); % Indicates in amperes the maximum DC current that the device can carry.
NICONST.DAQmx_SwitchChan_MaxDCSwitchCurrent = hex2dec('0645'); % Indicates in amperes the maximum DC current that the device can switch. This current is always against a DC voltage level.
NICONST.DAQmx_SwitchChan_MaxDCCarryPwr = hex2dec('0643'); % Indicates in watts the maximum DC power that the device can carry.
NICONST.DAQmx_SwitchChan_MaxDCSwitchPwr = hex2dec('0649'); % Indicates in watts the maximum DC power that the device can switch.
NICONST.DAQmx_SwitchChan_MaxACVoltage = hex2dec('0651'); % Indicates in volts the maximum AC RMS voltage that the device can switch.
NICONST.DAQmx_SwitchChan_MaxDCVoltage = hex2dec('0650'); % Indicates in volts the maximum DC voltage that the device can switch.
NICONST.DAQmx_SwitchChan_WireMode = hex2dec('18E5'); % Indicates the number of wires that the channel switches.
NICONST.DAQmx_SwitchChan_Bandwidth = hex2dec('0640'); % Indicates in Hertz the maximum frequency of a signal that can pass through the switch without significant deterioration.
NICONST.DAQmx_SwitchChan_Impedance = hex2dec('0641'); % Indicates in ohms the switch impedance. This value is important in the RF domain and should match the impedance of the sources and loads.

%********** Switch Device Attributes **********
NICONST.DAQmx_SwitchDev_SettlingTime = hex2dec('1244'); % Specifies in seconds the amount of time to wait for the switch to settle (or debounce). NI-DAQmx adds this time to the settling time of the motherboard. Modify this property only if the switch does not settle within the settling time of the motherboard. Refer to device documentation for supported settling times.
NICONST.DAQmx_SwitchDev_AutoConnAnlgBus = hex2dec('17DA'); % Specifies if NI-DAQmx routes multiplexed channels to the analog bus backplane. Only the SCXI-1127 and SCXI-1128 support this property.
NICONST.DAQmx_SwitchDev_Settled = hex2dec('1243'); % Indicates when Settling Time expires.
NICONST.DAQmx_SwitchDev_RelayList = hex2dec('17DC'); % Indicates a comma-delimited list of relay names.
NICONST.DAQmx_SwitchDev_NumRelays = hex2dec('18E6'); % Indicates the number of relays on the device. This value matches the number of relay names in Relay List.
NICONST.DAQmx_SwitchDev_SwitchChanList = hex2dec('18E7'); % Indicates a comma-delimited list of channel names for the current topology of the device.
NICONST.DAQmx_SwitchDev_NumSwitchChans = hex2dec('18E8'); % Indicates the number of switch channels for the current topology of the device. This value matches the number of channel names in Switch Channel List.
NICONST.DAQmx_SwitchDev_NumRows = hex2dec('18E9'); % Indicates the number of rows on a device in a matrix switch topology. Indicates the number of multiplexed channels on a device in a mux topology.
NICONST.DAQmx_SwitchDev_NumColumns = hex2dec('18EA'); % Indicates the number of columns on a device in a matrix switch topology. This value is always 1 if the device is in a mux topology.
NICONST.DAQmx_SwitchDev_Topology = hex2dec('193D'); % Indicates the current topology of the device. This value is one of the topology options in DAQmxSwitchSetTopologyAndReset().

%********** Switch Scan Attributes **********
NICONST.DAQmx_SwitchScan_BreakMode = hex2dec('1247'); % Specifies the break mode between each entry in a scan list.
NICONST.DAQmx_SwitchScan_RepeatMode = hex2dec('1248'); % Specifies if the task advances through the scan list multiple times.
NICONST.DAQmx_SwitchScan_WaitingForAdv = hex2dec('17D9'); % Indicates if the switch hardware is waiting for anAdvance Trigger. If the hardware is waiting, it completed the previous entry in the scan list.

%********** Scale Attributes **********
NICONST.DAQmx_Scale_Descr = hex2dec('1226'); % Specifies a description for the scale.
NICONST.DAQmx_Scale_ScaledUnits = hex2dec('191B'); % Specifies the units to use for scaled values. You can use an arbitrary string.
NICONST.DAQmx_Scale_PreScaledUnits = hex2dec('18F7'); % Specifies the units of the values that you want to scale.
NICONST.DAQmx_Scale_Type = hex2dec('1929'); % Indicates the method or equation form that the custom scale uses.
NICONST.DAQmx_Scale_Lin_Slope = hex2dec('1227'); % Specifies the slope, m, in the equation y = mx+b.
NICONST.DAQmx_Scale_Lin_YIntercept = hex2dec('1228'); % Specifies the y-intercept, b, in the equation y = mx+b.
NICONST.DAQmx_Scale_Map_ScaledMax = hex2dec('1229'); % Specifies the largest value in the range of scaled values. NI-DAQmx maps this value to Pre-Scaled Maximum Value. Reads clip samples that are larger than this value. Writes generate errors for samples that are larger than this value.
NICONST.DAQmx_Scale_Map_PreScaledMax = hex2dec('1231'); % Specifies the largest value in the range of pre-scaled values. NI-DAQmx maps this value to Scaled Maximum Value.
NICONST.DAQmx_Scale_Map_ScaledMin = hex2dec('1230'); % Specifies the smallest value in the range of scaled values. NI-DAQmx maps this value to Pre-Scaled Minimum Value. Reads clip samples that are smaller than this value. Writes generate errors for samples that are smaller than this value.
NICONST.DAQmx_Scale_Map_PreScaledMin = hex2dec('1232'); % Specifies the smallest value in the range of pre-scaled values. NI-DAQmx maps this value to Scaled Minimum Value.
NICONST.DAQmx_Scale_Poly_ForwardCoeff = hex2dec('1234'); % Specifies an array of coefficients for the polynomial that converts pre-scaled values to scaled values. Each element of the array corresponds to a term of the equation. For example, if index three of the array is 9, the fourth term of the equation is 9x^3.
NICONST.DAQmx_Scale_Poly_ReverseCoeff = hex2dec('1235'); % Specifies an array of coefficients for the polynomial that converts scaled values to pre-scaled values. Each element of the array corresponds to a term of the equation. For example, if index three of the array is 9, the fourth term of the equation is 9y^3.
NICONST.DAQmx_Scale_Table_ScaledVals = hex2dec('1236'); % Specifies an array of scaled values. These values map directly to the values in Pre-Scaled Values.
NICONST.DAQmx_Scale_Table_PreScaledVals = hex2dec('1237'); % Specifies an array of pre-scaled values. These values map directly to the values in Scaled Values.

%********** System Attributes **********
NICONST.DAQmx_Sys_GlobalChans = hex2dec('1265'); % Indicates an array that contains the names of all global channels saved on the system.
NICONST.DAQmx_Sys_Scales = hex2dec('1266'); % Indicates an array that contains the names of all custom scales saved on the system.
NICONST.DAQmx_Sys_Tasks = hex2dec('1267'); % Indicates an array that contains the names of all tasks saved on the system.
NICONST.DAQmx_Sys_DevNames = hex2dec('193B'); % Indicates an array that contains the names of all devices installed in the system.
NICONST.DAQmx_Sys_NIDAQMajorVersion = hex2dec('1272'); % Indicates the major portion of the installed version of NI-DAQ, such as 7 for version 7.0.
NICONST.DAQmx_Sys_NIDAQMinorVersion = hex2dec('1923'); % Indicates the minor portion of the installed version of NI-DAQ, such as 0 for version 7.0.

%********** Task Attributes **********
NICONST.DAQmx_Task_Name = hex2dec('1276'); % Indicates the name of the task.
NICONST.DAQmx_Task_Channels = hex2dec('1273'); % Indicates the names of all virtual channels in the task.
NICONST.DAQmx_Task_NumChans = hex2dec('2181'); % Indicates the number of virtual channels in the task.
NICONST.DAQmx_Task_Complete = hex2dec('1274'); % Indicates whether the task completed execution.

%********** Timing Attributes **********
NICONST.DAQmx_SampQuant_SampMode = hex2dec('1300'); % Specifies if a task acquires or generates a finite number of samples or if it continuously acquires or generates samples.
NICONST.DAQmx_SampQuant_SampPerChan = hex2dec('1310'); % Specifies the number of samples to acquire or generate for each channel if Sample Mode is DAQmx_Val_FiniteSamps. If Sample Mode is DAQmx_Val_ContSamps, NI-DAQmx uses this value to determine the buffer size.
NICONST.DAQmx_SampTimingType = hex2dec('1347'); % Specifies the type of sample timing to use for the task.
NICONST.DAQmx_SampClk_Rate = hex2dec('1344'); % Specifies the sampling rate in samples per channel per second. If you use an external source for the Sample Clock, set this input to the maximum expected rate of that clock.
NICONST.DAQmx_SampClk_Src = hex2dec('1852'); % Specifies the terminal of the signal to use as the Sample Clock.
NICONST.DAQmx_SampClk_ActiveEdge = hex2dec('1301'); % Specifies on which edge of a clock pulse sampling takes place. This property is useful primarily when the signal you use as the Sample Clock is not a periodic clock.
NICONST.DAQmx_SampClk_TimebaseDiv = hex2dec('18EB'); % Specifies the number of Sample Clock Timebase pulses needed to produce a single Sample Clock pulse.
NICONST.DAQmx_SampClk_Timebase_Rate = hex2dec('1303'); % Specifies the rate of the Sample Clock Timebase. Some applications require that you specify a rate when you use any signal other than the onboard Sample Clock Timebase. NI-DAQmx requires this rate to calculate other timing parameters.
NICONST.DAQmx_SampClk_Timebase_Src = hex2dec('1308'); % Specifies the terminal of the signal to use as the Sample Clock Timebase.
NICONST.DAQmx_SampClk_Timebase_ActiveEdge = hex2dec('18EC'); % Specifies on which edge to recognize a Sample Clock Timebase pulse. This property is useful primarily when the signal you use as the Sample Clock Timebase is not a periodic clock.
NICONST.DAQmx_SampClk_Timebase_MasterTimebaseDiv = hex2dec('1305'); % Specifies the number of pulses of the Master Timebase needed to produce a single pulse of the Sample Clock Timebase.
NICONST.DAQmx_SampClk_DigFltr_Enable = hex2dec('221E'); % Specifies whether to apply the pulse width filter to the signal.
NICONST.DAQmx_SampClk_DigFltr_MinPulseWidth = hex2dec('221F'); % Specifies in seconds the minimum pulse width the filter recognizes.
NICONST.DAQmx_SampClk_DigFltr_TimebaseSrc = hex2dec('2220'); % Specifies the input terminal of the signal to use as the timebase of the pulse width filter.
NICONST.DAQmx_SampClk_DigFltr_TimebaseRate = hex2dec('2221'); % Specifies in hertz the rate of the pulse width filter timebase. NI-DAQmx uses this value to compute settings for the filter.
NICONST.DAQmx_SampClk_DigSync_Enable = hex2dec('2222'); % Specifies whether to synchronize recognition of transitions in the signal to the internal timebase of the device.
NICONST.DAQmx_ChangeDetect_DI_RisingEdgePhysicalChans = hex2dec('2195'); % Specifies the names of the digital lines or ports on which to detect rising edges. The lines or ports must be used by virtual channels in the task. You also can specify a string that contains a list or range of digital lines or ports.
NICONST.DAQmx_ChangeDetect_DI_FallingEdgePhysicalChans = hex2dec('2196'); % Specifies the names of the digital lines or ports on which to detect rising edges. The lines or ports must be used by virtual channels in the task. You also can specify a string that contains a list or range of digital lines or ports.
NICONST.DAQmx_OnDemand_SimultaneousAOEnable = hex2dec('21A0'); % Specifies whether to update all channels in the task simultaneously, rather than updating channels independently when you write a sample to that channel.
NICONST.DAQmx_AIConv_Rate = hex2dec('1848'); % Specifies the rate at which to clock the analog-to-digital converter. This clock is specific to the analog input section of an E Series device.
NICONST.DAQmx_AIConv_Src = hex2dec('1502'); % Specifies the terminal of the signal to use as the AI Convert Clock.
NICONST.DAQmx_AIConv_ActiveEdge = hex2dec('1853'); % Specifies on which edge of the clock pulse an analog-to-digital conversion takes place.
NICONST.DAQmx_AIConv_TimebaseDiv = hex2dec('1335'); % Specifies the number of AI Convert Clock Timebase pulses needed to produce a single AI Convert Clock pulse.
NICONST.DAQmx_AIConv_Timebase_Src = hex2dec('1339'); % Specifies the terminalof the signal to use as the AI Convert Clock Timebase.
NICONST.DAQmx_MasterTimebase_Rate = hex2dec('1495'); % Specifies the rate of the Master Timebase.
NICONST.DAQmx_MasterTimebase_Src = hex2dec('1343'); % Specifies the terminal of the signal to use as the Master Timebase. On an E Series device, you can choose only between the onboard 20MHz Timebase or the RTSI7 terminal.
NICONST.DAQmx_RefClk_Rate = hex2dec('1315'); % Specifies the frequency of the Reference Clock.
NICONST.DAQmx_RefClk_Src = hex2dec('1316'); % Specifies the terminal of the signal to use as the Reference Clock.
NICONST.DAQmx_SyncPulse_Src = hex2dec('223D'); % Specifies the terminal of the signal to use as the synchronization pulse. The synchronization pulse resets the clock dividers and the ADCs/DACs on the device.
NICONST.DAQmx_SyncPulse_SyncTime = hex2dec('223E'); % Indicates in seconds the delay required to reset the ADCs/DACs after the device receives the synchronization pulse.
NICONST.DAQmx_SyncPulse_MinDelayToStart = hex2dec('223F'); % Specifies in seconds the amount of time that elapses after the master device issues the synchronization pulse before the task starts.
NICONST.DAQmx_DelayFromSampClk_DelayUnits = hex2dec('1304'); % Specifies the units of Delay.
NICONST.DAQmx_DelayFromSampClk_Delay = hex2dec('1317'); % Specifies the amount of time to wait after receiving a Sample Clock edge before beginning to acquire the sample. This value is in the units you specify with Delay Units.

%********** Trigger Attributes **********
NICONST.DAQmx_StartTrig_Type = hex2dec('1393'); % Specifies the type of trigger to use to start a task.
NICONST.DAQmx_DigEdge_StartTrig_Src = hex2dec('1407'); % Specifies the name of a terminal where there is a digital signal to use as the source of the Start Trigger.
NICONST.DAQmx_DigEdge_StartTrig_Edge = hex2dec('1404'); % Specifies on which edge of a digital pulse to start acquiring or generating samples.
NICONST.DAQmx_DigEdge_StartTrig_DigFltr_Enable = hex2dec('2223'); % Specifies whether to apply the pulse width filter to the signal.
NICONST.DAQmx_DigEdge_StartTrig_DigFltr_MinPulseWidth = hex2dec('2224'); % Specifies in seconds the minimum pulse width the filter recognizes.
NICONST.DAQmx_DigEdge_StartTrig_DigFltr_TimebaseSrc = hex2dec('2225'); % Specifies the input terminal of the signal to use as the timebase of the pulse width filter.
NICONST.DAQmx_DigEdge_StartTrig_DigFltr_TimebaseRate = hex2dec('2226'); % Specifies in hertz the rate of the pulse width filter timebase. NI-DAQmx uses this value to compute settings for the filter.
NICONST.DAQmx_DigEdge_StartTrig_DigSync_Enable = hex2dec('2227'); % Specifies whether to synchronize recognition of transitions in the signal to the internal timebase of the device.
NICONST.DAQmx_AnlgEdge_StartTrig_Src = hex2dec('1398'); % Specifies the name of a virtual channel or terminal where there is an analog signal to use as the source of the Start Trigger.
NICONST.DAQmx_AnlgEdge_StartTrig_Slope = hex2dec('1397'); % Specifies on which slope of the trigger signal to start acquiring or generating samples.
NICONST.DAQmx_AnlgEdge_StartTrig_Lvl = hex2dec('1396'); % Specifies at what threshold in the units of the measurement or generation to start acquiring or generating samples. Use Slope to specify on which slope to trigger on this threshold.
NICONST.DAQmx_AnlgEdge_StartTrig_Hyst = hex2dec('1395'); % Specifies a hysteresis level in the units of the measurement or generation. If Slope is DAQmx_Val_RisingSlope, the trigger does not deassert until the source signal passes belowLevel minus the hysteresis. If Slope is DAQmx_Val_FallingSlope, the trigger does not deassert until the source signal passes above Level plus the hysteresis.
NICONST.DAQmx_AnlgEdge_StartTrig_Coupling = hex2dec('2233'); % Specifies the coupling for the source signal of the trigger if the source is a terminal rather than a virtual channel.
NICONST.DAQmx_AnlgWin_StartTrig_Src = hex2dec('1400'); % Specifies the name of a virtual channel or terminal where there is an analog signal to use as the source of the Start Trigger.
NICONST.DAQmx_AnlgWin_StartTrig_When = hex2dec('1401'); % Specifies whether the task starts acquiring or generating samples when the signal enters or leaves the window you specify with Bottom and Top.
NICONST.DAQmx_AnlgWin_StartTrig_Top = hex2dec('1403'); % Specifies the upper limit of the window. Specify this value in the units of the measurement or generation.
NICONST.DAQmx_AnlgWin_StartTrig_Btm = hex2dec('1402'); % Specifies the lower limit of the window. Specify this value in the units of the measurement or generation.
NICONST.DAQmx_AnlgWin_StartTrig_Coupling = hex2dec('2234'); % Specifies the coupling for the source signal of the trigger if the source is a terminal rather than a virtual channel.
NICONST.DAQmx_StartTrig_Delay = hex2dec('1856'); % Specifies an amount of time to wait after the Start Trigger is received before acquiring or generating the first sample. This value is in the units you specify with Delay Units.
NICONST.DAQmx_StartTrig_DelayUnits = hex2dec('18C8'); % Specifies the units of Delay.
NICONST.DAQmx_StartTrig_Retriggerable = hex2dec('190F'); % Specifies whether to enable retriggerable counter pulse generation. When you set this property to TRUE, the device generates pulses each time it receives a trigger. The device ignores a trigger if it is in the process of generating pulses.
NICONST.DAQmx_RefTrig_Type = hex2dec('1419'); % Specifies the type of trigger to use to mark a reference point for the measurement.
NICONST.DAQmx_RefTrig_PretrigSamples = hex2dec('1445'); % Specifies the minimum number of pretrigger samples to acquire from each channel before recognizing the reference trigger. Post-trigger samples per channel are equal to Samples Per Channel minus the number of pretrigger samples per channel.
NICONST.DAQmx_DigEdge_RefTrig_Src = hex2dec('1434'); % Specifies the name of a terminal where there is a digital signal to use as the source of the Reference Trigger.
NICONST.DAQmx_DigEdge_RefTrig_Edge = hex2dec('1430'); % Specifies on what edge of a digital pulse the Reference Trigger occurs.
NICONST.DAQmx_AnlgEdge_RefTrig_Src = hex2dec('1424'); % Specifies the name of a virtual channel or terminal where there is an analog signal to use as the source of the Reference Trigger.
NICONST.DAQmx_AnlgEdge_RefTrig_Slope = hex2dec('1423'); % Specifies on which slope of the source signal the Reference Trigger occurs.
NICONST.DAQmx_AnlgEdge_RefTrig_Lvl = hex2dec('1422'); % Specifies in the units of the measurement the threshold at which the Reference Trigger occurs.Use Slope to specify on which slope to trigger at this threshold.
NICONST.DAQmx_AnlgEdge_RefTrig_Hyst = hex2dec('1421'); % Specifies a hysteresis level in the units of the measurement. If Slope is DAQmx_Val_RisingSlope, the trigger does not deassert until the source signal passes below Level minus the hysteresis. If Slope is DAQmx_Val_FallingSlope, the trigger does not deassert until the source signal passes above Level plus the hysteresis.
NICONST.DAQmx_AnlgEdge_RefTrig_Coupling = hex2dec('2235'); % Specifies the coupling for the source signal of the trigger if the source is a terminal rather than a virtual channel.
NICONST.DAQmx_AnlgWin_RefTrig_Src = hex2dec('1426'); % Specifies the name of a virtual channel or terminal where there is an analog signal to use as the source of the Reference Trigger.
NICONST.DAQmx_AnlgWin_RefTrig_When = hex2dec('1427'); % Specifies whether the Reference Trigger occurs when the source signal enters the window or when it leaves the window. Use Bottom and Top to specify the window.
NICONST.DAQmx_AnlgWin_RefTrig_Top = hex2dec('1429'); % Specifies the upper limit of the window. Specify this value in the units of the measurement.
NICONST.DAQmx_AnlgWin_RefTrig_Btm = hex2dec('1428'); % Specifies the lower limit of the window. Specify this value in the units of the measurement.
NICONST.DAQmx_AnlgWin_RefTrig_Coupling = hex2dec('1857'); % Specifies the coupling for the source signal of the trigger if the source is a terminal rather than a virtual channel.
NICONST.DAQmx_AdvTrig_Type = hex2dec('1365'); % Specifies the type of trigger to use to advance to the next entry in a scan list.
NICONST.DAQmx_DigEdge_AdvTrig_Src = hex2dec('1362'); % Specifies the name of a terminal where there is a digital signal to use as the source of the Advance Trigger.
NICONST.DAQmx_DigEdge_AdvTrig_Edge = hex2dec('1360'); % Specifies on which edge of a digital signal to advance to the next entry in a scan list.
NICONST.DAQmx_DigEdge_AdvTrig_DigFltr_Enable = hex2dec('2238'); % Specifies whether to apply the pulse width filter to the signal.
NICONST.DAQmx_PauseTrig_Type = hex2dec('1366'); % Specifies the type of trigger to use to pause a task.
NICONST.DAQmx_AnlgLvl_PauseTrig_Src = hex2dec('1370'); % Specifies the name of a virtual channel or terminal where there is an analog signal to use as the source of the trigger.
NICONST.DAQmx_AnlgLvl_PauseTrig_When = hex2dec('1371'); % Specifies whether the task pauses above or below the threshold you specify with Level.
NICONST.DAQmx_AnlgLvl_PauseTrig_Lvl = hex2dec('1369'); % Specifies the threshold at which to pause the task. Specify this value in the units of the measurement or generation. Use Pause When to specify whether the task pauses above or below this threshold.
NICONST.DAQmx_AnlgLvl_PauseTrig_Hyst = hex2dec('1368'); % Specifies a hysteresis level in the units of the measurement or generation. If Pause When is DAQmx_Val_AboveLvl, the trigger does not deassert until the source signal passes below Level minus the hysteresis. If Pause When is DAQmx_Val_BelowLvl, the trigger does not deassert until the source signal passes above Level plus the hysteresis.
NICONST.DAQmx_AnlgLvl_PauseTrig_Coupling = hex2dec('2236'); % Specifies the coupling for the source signal of the trigger if the source is a terminal rather than a virtual channel.
NICONST.DAQmx_AnlgWin_PauseTrig_Src = hex2dec('1373'); % Specifies the name of a virtual channel or terminal where there is an analog signal to use as the source of the trigger.
NICONST.DAQmx_AnlgWin_PauseTrig_When = hex2dec('1374'); % Specifies whether the task pauses while the trigger signal is inside or outside the window you specify with Bottom and Top.
NICONST.DAQmx_AnlgWin_PauseTrig_Top = hex2dec('1376'); % Specifies the upper limit of the window. Specify this value in the units of the measurement or generation.
NICONST.DAQmx_AnlgWin_PauseTrig_Btm = hex2dec('1375'); % Specifies the lower limit of the window. Specify this value in the units of the measurement or generation.
NICONST.DAQmx_AnlgWin_PauseTrig_Coupling = hex2dec('2237'); % Specifies the coupling for the source signal of the trigger if the source is a terminal rather than a virtual channel.
NICONST.DAQmx_DigLvl_PauseTrig_Src = hex2dec('1379'); % Specifies the name of a terminal where there is a digital signal to use as the source of the Pause Trigger.
NICONST.DAQmx_DigLvl_PauseTrig_When = hex2dec('1380'); % Specifies whether the task pauses while the signal is high or low.
NICONST.DAQmx_DigLvl_PauseTrig_DigFltr_Enable = hex2dec('2228'); % Specifies whether to apply the pulse width filter to the signal.
NICONST.DAQmx_DigLvl_PauseTrig_DigFltr_MinPulseWidth = hex2dec('2229'); % Specifies in seconds the minimum pulse width the filter recognizes.
NICONST.DAQmx_DigLvl_PauseTrig_DigFltr_TimebaseSrc = hex2dec('222A'); % Specifies the input terminal of the signal to use as the timebase of the pulse width filter.
NICONST.DAQmx_DigLvl_PauseTrig_DigFltr_TimebaseRate = hex2dec('222B'); % Specifies in hertz the rate of the pulse width filter timebase. NI-DAQmx uses this value to compute settings for the filter.
NICONST.DAQmx_DigLvl_PauseTrig_DigSync_Enable = hex2dec('222C'); % Specifies whether to synchronize recognition of transitions in the signal to the internal timebase of the device.
NICONST.DAQmx_ArmStartTrig_Type = hex2dec('1414'); % Specifies the type of trigger to use to arm the task for a Start Trigger. If you configure an Arm Start Trigger, the task does not respond to a Start Trigger until the device receives the Arm Start Trigger.
NICONST.DAQmx_DigEdge_ArmStartTrig_Src = hex2dec('1417'); % Specifies the name of a terminal where there is a digital signal to use as the source of the Arm Start Trigger.
NICONST.DAQmx_DigEdge_ArmStartTrig_Edge = hex2dec('1415'); % Specifies on which edge of a digital signal to arm the task for a Start Trigger.
NICONST.DAQmx_DigEdge_ArmStartTrig_DigFltr_Enable = hex2dec('222D'); % Specifies whether to apply the pulse width filter to the signal.
NICONST.DAQmx_DigEdge_ArmStartTrig_DigFltr_MinPulseWidth = hex2dec('222E'); % Specifies in seconds the minimum pulse width the filter recognizes.
NICONST.DAQmx_DigEdge_ArmStartTrig_DigFltr_TimebaseSrc = hex2dec('222F'); % Specifies the input terminal of the signal to use as the timebase of the pulse width filter.
NICONST.DAQmx_DigEdge_ArmStartTrig_DigFltr_TimebaseRate = hex2dec('2230'); % Specifies in hertz the rate of the pulse width filter timebase. NI-DAQmx uses this value to compute settings for the filter.
NICONST.DAQmx_DigEdge_ArmStartTrig_DigSync_Enable = hex2dec('2231'); % Specifies whether to synchronize recognition of transitions in the signal to the internal timebase of the device.

%********** Watchdog Attributes **********
NICONST.DAQmx_Watchdog_Timeout = hex2dec('21A9'); % Specifies in seconds the amount of time until the watchdog timer expires. A value of -1 means the internal timer never expires. Set this input to -1 if you use an Expiration Trigger to expire the watchdog task.
NICONST.DAQmx_WatchdogExpirTrig_Type = hex2dec('21A3'); % Specifies the type of trigger to use to expire a watchdog task.
NICONST.DAQmx_DigEdge_WatchdogExpirTrig_Src = hex2dec('21A4'); % Specifies the name of a terminal where a digital signal exists to use as the source of the Expiration Trigger.
NICONST.DAQmx_DigEdge_WatchdogExpirTrig_Edge = hex2dec('21A5'); % Specifies on which edge of a digital signal to expire the watchdog task.
NICONST.DAQmx_Watchdog_DO_ExpirState = hex2dec('21A7'); % Specifies the state to which to set the digital physical channels when the watchdog task expires.You cannot modify the expiration state of dedicated digital input physical channels.
NICONST.DAQmx_Watchdog_HasExpired = hex2dec('21A8'); % Indicates if the watchdog timer expired. You can read this property only while the task is running.

%********** Write Attributes **********
NICONST.DAQmx_Write_Offset = hex2dec('190D'); % Specifies in samples per channel an offset at which a write operation begins. This offset is relative to the location you specify with Relative To.
NICONST.DAQmx_Write_RegenMode = hex2dec('1453'); % Specifies whether to allow NI-DAQmx to generate the same data multiple times.
NICONST.DAQmx_Write_CurrWritePos = hex2dec('1458'); % Indicates the number of the next sample for the device to generate. This value is identical for all channels in the task.
NICONST.DAQmx_Write_SpaceAvail = hex2dec('1460'); % Indicates in samples per channel the amount of available space in the buffer.
NICONST.DAQmx_Write_RelativeTo = hex2dec('190C'); % Specifies the point in the buffer at which to write data. If you also specify an offset with Offset, the write operation begins at that offset relative to this point you select with this property.
NICONST.DAQmx_Write_TotalSampPerChanGenerated = hex2dec('192B'); % Indicates the total number of samples generated by each channel in the task. This value is identical for all channels in the task.
NICONST.DAQmx_Write_RawDataWidth = hex2dec('217D'); % Indicates in bytes the required size of a raw sample to write to the task.
NICONST.DAQmx_Write_NumChans = hex2dec('217E'); % Indicates the number of channels that an NI-DAQmx Write function writes to the task. This value is the number of channels in the task.
NICONST.DAQmx_Write_DigitalLines_BytesPerChan = hex2dec('217F'); % Indicates the number of bytes expected per channel in a sample for line-based writes. If a channel has fewer lines than this number, NI-DAQmx ignores the extra bytes.

%********** Physical Channel Attributes **********
NICONST.DAQmx_PhysicalChan_TEDS_MfgID = hex2dec('21DA'); % Indicates the manufacturer ID of the sensor.
NICONST.DAQmx_PhysicalChan_TEDS_ModelNum = hex2dec('21DB'); % Indicates the model number of the sensor.
NICONST.DAQmx_PhysicalChan_TEDS_SerialNum = hex2dec('21DC'); % Indicates the serial number of the sensor.
NICONST.DAQmx_PhysicalChan_TEDS_VersionNum = hex2dec('21DD'); % Indicates the version number of the sensor.
NICONST.DAQmx_PhysicalChan_TEDS_VersionLetter = hex2dec('21DE'); % Indicates the version letter of the sensor.
NICONST.DAQmx_PhysicalChan_TEDS_BitStream = hex2dec('21DF'); % Indicates the TEDS binary bitstream without checksums.
NICONST.DAQmx_PhysicalChan_TEDS_TemplateIDs = hex2dec('228F'); % Indicates the IDs of the templates in the bitstream in BitStream.


%******************************************************************************
% *** NI-DAQmx Values **********************************************************
% ******************************************************************************/

%******************************************************/
%***Non-Attribute Function Parameter Values ***/
%******************************************************/

%*** Values for the Mode parameter of DAQmxTaskControl ***  
NICONST.DAQmx_Val_Task_Start = 0; % Start
NICONST.DAQmx_Val_Task_Stop =1; % Stop
NICONST.DAQmx_Val_Task_Verify =2; % Verify
NICONST.DAQmx_Val_Task_Commit =3; % Commit
NICONST.DAQmx_Val_Task_Reserve = 4; % Reserve
NICONST.DAQmx_Val_Task_Unreserve = 5; % Unreserve
NICONST.DAQmx_Val_Task_Abort = 6; % Abort

%*** Values for the Action parameter of DAQmxControlWatchdogTask ***
NICONST.DAQmx_Val_ResetTimer = 0; % Reset Timer
NICONST.DAQmx_Val_ClearExpiration =1; % Clear Expiration

%*** Values for the Line Grouping parameter of DAQmxCreateDIChan and DAQmxCreateDOChan ***
NICONST.DAQmx_Val_ChanPerLine =0; % One Channel For Each Line
NICONST.DAQmx_Val_ChanForAllLines =1; % One Channel For All Lines

%*** Values for the Fill Mode parameter of DAQmxReadAnalogF64, DAQmxReadBinaryI16, DAQmxReadBinaryU16, DAQmxReadBinaryI32, DAQmxReadBinaryU32,
%DAQmxReadDigitalU8, DAQmxReadDigitalU32, DAQmxReadDigitalLines ***
%*** Values for the Data Layout parameter of DAQmxWriteAnalogF64, DAQmxWriteBinaryI16, DAQmxWriteDigitalU8, DAQmxWriteDigitalU32, DAQmxWriteDigitalLines ***
NICONST.DAQmx_Val_GroupByChannel = 0; % Group by Channel
NICONST.DAQmx_Val_GroupByScanNumber =1; % Group by Scan Number

%*** Values for the Signal Modifiers parameter of DAQmxConnectTerms ***/
NICONST.DAQmx_Val_DoNotInvertPolarity =0; % Do not invert polarity
NICONST.DAQmx_Val_InvertPolarity = 1; % Invert polarity

%*** Values for the Action paramter of DAQmxCloseExtCal ***
NICONST.DAQmx_Val_Action_Commit =0; % Commit
NICONST.DAQmx_Val_Action_Cancel =1; % Cancel

%*** Values for the Trigger ID parameter of DAQmxSendSoftwareTrigger ***
NICONST.DAQmx_Val_AdvanceTrigger = 12488; % Advance Trigger

%*** Value set for the ActiveEdge parameter of DAQmxCfgSampClkTiming ***
NICONST.DAQmx_Val_Rising = 10280; % Rising
NICONST.DAQmx_Val_Falling =10171; % Falling

%*** Value set SwitchPathType ***
%*** Value set for the output Path Status parameter of DAQmxSwitchFindPath ***
NICONST.DAQmx_Val_PathStatus_Available = 10431; % Path Available
NICONST.DAQmx_Val_PathStatus_AlreadyExists = 10432; % Path Already Exists
NICONST.DAQmx_Val_PathStatus_Unsupported = 10433; % Path Unsupported
NICONST.DAQmx_Val_PathStatus_ChannelInUse =10434; % Channel In Use
NICONST.DAQmx_Val_PathStatus_SourceChannelConflict = 10435; % Channel Source Conflict
NICONST.DAQmx_Val_PathStatus_ChannelReservedForRouting = 10436; % Channel Reserved for Routing

%*** Value set for the Units parameter of DAQmxCreateAIThrmcplChan, DAQmxCreateAIRTDChan, DAQmxCreateAIThrmstrChanIex, DAQmxCreateAIThrmstrChanVex and DAQmxCreateAITempBuiltInSensorChan ***
NICONST.DAQmx_Val_DegC = 10143; % Deg C
NICONST.DAQmx_Val_DegF = 10144; % Deg F
NICONST.DAQmx_Val_Kelvins =10325; % Kelvins
NICONST.DAQmx_Val_DegR = 10145; % Deg R

%*** Value set for the state parameter of DAQmxSetDigitalPowerUpStates ***
NICONST.DAQmx_Val_High = 10192; % High
NICONST.DAQmx_Val_Low =10214; % Low
NICONST.DAQmx_Val_Tristate = 10310; % Tristate

%*** Value set RelayPos ***
%*** Value set for the state parameter of DAQmxSwitchGetSingleRelayPos and DAQmxSwitchGetMultiRelayPos ***
NICONST.DAQmx_Val_Open = 10437; % Open
NICONST.DAQmx_Val_Closed = 10438; % Closed

%*** Value for the Terminal Config parameter of DAQmxCreateAIVoltageChan, DAQmxCreateAICurrentChan and DAQmxCreateAIVoltageChanWithExcit ***
NICONST.DAQmx_Val_Cfg_Default =-1; % Default

%*** Value for the Timeout parameter of DAQmxWaitUntilTaskDone
NICONST.DAQmx_Val_WaitInfinitely = -1.0;

%*** Value for the Number of Samples per Channel parameter of DAQmxReadAnalogF64, DAQmxReadBinaryI16, DAQmxReadBinaryU16,
%DAQmxReadBinaryI32, DAQmxReadBinaryU32, DAQmxReadDigitalU8, DAQmxReadDigitalU32,
%DAQmxReadDigitalLines, DAQmxReadCounterF64, DAQmxReadCounterU32 and DAQmxReadRaw ***
NICONST.DAQmx_Val_Auto = -1;

%/******************************************************/
%/*** = Attribute Values = ***/
%/******************************************************/

%*** Values for DAQmx_AI_ACExcit_WireMode ***
%*** Value set ACExcitWireMode ***
NICONST.DAQmx_Val_4Wire =4; % 4-Wire
NICONST.DAQmx_Val_5Wire =5; % 5-Wire

%*** Values for DAQmx_AI_MeasType ***
%*** Value set AIMeasurementType ***
NICONST.DAQmx_Val_Voltage =10322; % Voltage
NICONST.DAQmx_Val_Current =10134; % Current
NICONST.DAQmx_Val_Voltage_CustomWithExcitation = 10323; % More:Voltage:Custom with Excitation
NICONST.DAQmx_Val_Freq_Voltage = 10181; % Frequency
NICONST.DAQmx_Val_Resistance = 10278; % Resistance
NICONST.DAQmx_Val_Temp_TC =10303; % Temperature:Thermocouple
NICONST.DAQmx_Val_Temp_Thrmstr = 10302; % Temperature:Thermistor
NICONST.DAQmx_Val_Temp_RTD = 10301; % Temperature:RTD
NICONST.DAQmx_Val_Temp_BuiltInSensor = 10311; % Temperature:Built-in Sensor
NICONST.DAQmx_Val_Strain_Gage =10300; % Strain Gage
NICONST.DAQmx_Val_Position_LVDT =10352; % Position:LVDT
NICONST.DAQmx_Val_Position_RVDT =10353; % Position:RVDT
NICONST.DAQmx_Val_Accelerometer =10356; % Accelerometer
NICONST.DAQmx_Val_SoundPressure_Microphone = 10354; % Sound Pressure:Microphone
NICONST.DAQmx_Val_TEDS_Sensor =12531; % TEDS Sensor

%*** Values for DAQmx_AO_IdleOutputBehavior ***
%*** Value set AOIdleOutputBehavior ***
NICONST.DAQmx_Val_ZeroVolts =12526; % Zero Volts
NICONST.DAQmx_Val_HighImpedance =12527; % High Impedance
NICONST.DAQmx_Val_MaintainExistingValue =12528; % Maintain Existing Value

%*** Values for DAQmx_AO_OutputType ***
%*** Value set AOOutputChannelType ***
NICONST.DAQmx_Val_Voltage =10322; % Voltage
NICONST.DAQmx_Val_Current =10134; % Current

%*** Values for DAQmx_AI_Accel_SensitivityUnits ***
%*** Value set AccelSensitivityUnits1 ***
NICONST.DAQmx_Val_mVoltsPerG = 12509; % mVolts/g
NICONST.DAQmx_Val_VoltsPerG =12510; % Volts/g

%*** Values for DAQmx_AI_Accel_Units ***
%*** Value set AccelUnits2 ***
NICONST.DAQmx_Val_AccelUnit_g =10186; % g
NICONST.DAQmx_Val_FromCustomScale =10065; % From Custom Scale

%*** Values for DAQmx_SampQuant_SampMode ***
%*** Value set AcquisitionType ***
NICONST.DAQmx_Val_FiniteSamps =10178; % Finite Samples
NICONST.DAQmx_Val_ContSamps =10123; % Continuous Samples
NICONST.DAQmx_Val_HWTimedSinglePoint = 12522; % Hardware Timed Single Point

%*** Values for DAQmx_AnlgLvl_PauseTrig_When ***
%*** Value set ActiveLevel ***
NICONST.DAQmx_Val_AboveLvl = 10093; % Above Level
NICONST.DAQmx_Val_BelowLvl = 10107; % Below Level

%*** Values for DAQmx_AI_RVDT_Units ***
%*** Value set AngleUnits1 ***
NICONST.DAQmx_Val_Degrees =10146; % Degrees
NICONST.DAQmx_Val_Radians =10273; % Radians
NICONST.DAQmx_Val_FromCustomScale =10065; % From Custom Scale

%*** Values for DAQmx_CI_AngEncoder_Units ***
%*** Value set AngleUnits2 ***
NICONST.DAQmx_Val_Degrees =10146; % Degrees
NICONST.DAQmx_Val_Radians =10273; % Radians
NICONST.DAQmx_Val_Ticks =10304; % Ticks
NICONST.DAQmx_Val_FromCustomScale =10065; % From Custom Scale

%*** Values for DAQmx_AI_AutoZeroMode ***
%*** Value set AutoZeroType1 ***
NICONST.DAQmx_Val_None = 10230; % None
NICONST.DAQmx_Val_Once = 10244; % Once

%*** Values for DAQmx_SwitchScan_BreakMode ***
%*** Value set BreakMode ***
NICONST.DAQmx_Val_NoAction = 10227; % No Action
NICONST.DAQmx_Val_BreakBeforeMake =10110; % Break Before Make

%*** Values for DAQmx_AI_Bridge_Cfg ***
%*** Value set BridgeConfiguration1 ***
NICONST.DAQmx_Val_FullBridge = 10182; % Full Bridge
NICONST.DAQmx_Val_HalfBridge = 10187; % Half Bridge
NICONST.DAQmx_Val_QuarterBridge =10270; % Quarter Bridge
NICONST.DAQmx_Val_NoBridge = 10228; % No Bridge

%*** Values for DAQmx_CI_MeasType ***
%*** Value set CIMeasurementType ***
NICONST.DAQmx_Val_CountEdges = 10125; % Count Edges
NICONST.DAQmx_Val_Freq = 10179; % Frequency
NICONST.DAQmx_Val_Period = 10256; % Period
NICONST.DAQmx_Val_PulseWidth = 10359; % Pulse Width
NICONST.DAQmx_Val_SemiPeriod = 10289; % Semi Period
NICONST.DAQmx_Val_Position_AngEncoder =10360; % Position:Angular Encoder
NICONST.DAQmx_Val_Position_LinEncoder =10361; % Position:Linear Encoder
NICONST.DAQmx_Val_TwoEdgeSep = 10267; % Two Edge Separation

%*** Values for DAQmx_AI_Thrmcpl_CJCSrc ***
%*** Value set CJCSource1 ***
NICONST.DAQmx_Val_BuiltIn =10200; % Built-In
NICONST.DAQmx_Val_ConstVal = 10116; % Constant Value
NICONST.DAQmx_Val_Chan = 10113; % Channel

%*** Values for DAQmx_CO_OutputType ***
%*** Value set COOutputType ***
NICONST.DAQmx_Val_Pulse_Time = 10269; % Pulse:Time
NICONST.DAQmx_Val_Pulse_Freq = 10119; % Pulse:Frequency
NICONST.DAQmx_Val_Pulse_Ticks =10268; % Pulse:Ticks

%*** Values for DAQmx_ChanType ***
%*** Value set ChannelType ***
NICONST.DAQmx_Val_AI = 10100; % Analog Input
NICONST.DAQmx_Val_AO = 10102; % Analog Output
NICONST.DAQmx_Val_DI = 10151; % Digital Input
NICONST.DAQmx_Val_DO = 10153; % Digital Output
NICONST.DAQmx_Val_CI = 10131; % Counter Input
NICONST.DAQmx_Val_CO = 10132; % Counter Output

%*** Values for DAQmx_CI_CountEdges_Dir ***
%*** Value set CountDirection1 ***
NICONST.DAQmx_Val_CountUp =10128; % Count Up
NICONST.DAQmx_Val_CountDown =10124; % Count Down
NICONST.DAQmx_Val_ExtControlled =10326; % Externally Controlled

%*** Values for DAQmx_CI_Freq_MeasMeth ***
%*** Values for DAQmx_CI_Period_MeasMeth ***
%*** Value set CounterFrequencyMethod ***
NICONST.DAQmx_Val_LowFreq1Ctr =10105; % Low Frequency with 1 Counter
NICONST.DAQmx_Val_HighFreq2Ctr = 10157; % High Frequency with 2 Counters
NICONST.DAQmx_Val_LargeRng2Ctr = 10205; % Large Range with 2 Counters

%*** Values for DAQmx_AI_Coupling ***
%*** Value set Coupling1 ***
NICONST.DAQmx_Val_AC = 10045; % AC
NICONST.DAQmx_Val_DC = 10050; % DC
NICONST.DAQmx_Val_GND =10066; % GND

%*** Values for DAQmx_AnlgEdge_StartTrig_Coupling ***
%*** Values for DAQmx_AnlgWin_StartTrig_Coupling ***
%*** Values for DAQmx_AnlgEdge_RefTrig_Coupling ***
%*** Values for DAQmx_AnlgWin_RefTrig_Coupling ***
%*** Values for DAQmx_AnlgLvl_PauseTrig_Coupling ***
%*** Values for DAQmx_AnlgWin_PauseTrig_Coupling ***
%*** Value set Coupling2 ***
NICONST.DAQmx_Val_AC = 10045; % AC
NICONST.DAQmx_Val_DC = 10050; % DC

%*** Values for DAQmx_AI_CurrentShunt_Loc ***
%*** Value set CurrentShuntResistorLocation1 ***
NICONST.DAQmx_Val_Internal = 10200; % Internal
NICONST.DAQmx_Val_External = 10167; % External

%*** Values for DAQmx_AI_Current_Units ***
%*** Values for DAQmx_AO_Current_Units ***
%*** Value set CurrentUnits1 ***
NICONST.DAQmx_Val_Amps = 10342; % Amps
NICONST.DAQmx_Val_FromCustomScale =10065; % From Custom Scale
NICONST.DAQmx_Val_FromTEDS = 12516; % From TEDS

%*** Value set CurrentUnits2 ***
NICONST.DAQmx_Val_Amps = 10342; % Amps
NICONST.DAQmx_Val_FromCustomScale =10065; % From Custom Scale

%*** Values for DAQmx_AI_DataXferMech ***
%*** Values for DAQmx_AO_DataXferMech ***
%*** Values for DAQmx_DI_DataXferMech ***
%*** Values for DAQmx_DO_DataXferMech ***
%*** Values for DAQmx_CI_DataXferMech ***
%*** Value set DataTransferMechanism ***
NICONST.DAQmx_Val_DMA =10054; % DMA
NICONST.DAQmx_Val_Interrupts = 10204; % Interrupts
NICONST.DAQmx_Val_ProgrammedIO = 10264; % Programmed I/O

%*** Values for DAQmx_Watchdog_DO_ExpirState ***
%*** Value set DigitalLineState ***
NICONST.DAQmx_Val_High = 10192; % High
NICONST.DAQmx_Val_Low =10214; % Low
NICONST.DAQmx_Val_Tristate = 10310; % Tristate
NICONST.DAQmx_Val_NoChange = 10160; % No Change

%*** Values for DAQmx_StartTrig_DelayUnits ***
%*** Value set DigitalWidthUnits1 ***
NICONST.DAQmx_Val_SampClkPeriods = 10286; % Sample Clock Periods
NICONST.DAQmx_Val_Seconds =10364; % Seconds
NICONST.DAQmx_Val_Ticks =10304; % Ticks

%*** Values for DAQmx_DelayFromSampClk_DelayUnits ***
%*** Value set DigitalWidthUnits2 ***
NICONST.DAQmx_Val_Seconds =10364; % Seconds
NICONST.DAQmx_Val_Ticks =10304; % Ticks

%*** Values for DAQmx_Exported_AdvTrig_Pulse_WidthUnits ***
%*** Value set DigitalWidthUnits3 ***
NICONST.DAQmx_Val_Seconds =10364; % Seconds

%*** Values for DAQmx_CI_Freq_StartingEdge ***
%*** Values for DAQmx_CI_Period_StartingEdge ***
%*** Values for DAQmx_CI_CountEdges_ActiveEdge ***
%*** Values for DAQmx_CI_PulseWidth_StartingEdge ***
%*** Values for DAQmx_CI_TwoEdgeSep_FirstEdge ***
%*** Values for DAQmx_CI_TwoEdgeSep_SecondEdge ***
%*** Values for DAQmx_CI_CtrTimebaseActiveEdge ***
%*** Values for DAQmx_CO_CtrTimebaseActiveEdge ***
%*** Values for DAQmx_SampClk_ActiveEdge ***
%*** Values for DAQmx_SampClk_Timebase_ActiveEdge ***
%*** Values for DAQmx_AIConv_ActiveEdge ***
%*** Values for DAQmx_DigEdge_StartTrig_Edge ***
%*** Values for DAQmx_DigEdge_RefTrig_Edge ***
%*** Values for DAQmx_DigEdge_AdvTrig_Edge ***
%*** Values for DAQmx_DigEdge_ArmStartTrig_Edge ***
%*** Values for DAQmx_DigEdge_WatchdogExpirTrig_Edge ***
%*** Value set Edge1 ***
NICONST.DAQmx_Val_Rising = 10280; % Rising
NICONST.DAQmx_Val_Falling =10171; % Falling

%*** Values for DAQmx_CI_Encoder_DecodingType ***
%*** Value set EncoderType2 ***
NICONST.DAQmx_Val_X1 = 10090; % X1
NICONST.DAQmx_Val_X2 = 10091; % X2
NICONST.DAQmx_Val_X4 = 10092; % X4
NICONST.DAQmx_Val_TwoPulseCounting = 10313; % Two Pulse Counting

%*** Values for DAQmx_CI_Encoder_ZIndexPhase ***
%*** Value set EncoderZIndexPhase1 ***
NICONST.DAQmx_Val_AHighBHigh = 10040; % A High B High
NICONST.DAQmx_Val_AHighBLow =10041; % A High B Low
NICONST.DAQmx_Val_ALowBHigh =10042; % A Low B High
NICONST.DAQmx_Val_ALowBLow = 10043; % A Low B Low

%*** Values for DAQmx_AI_Excit_DCorAC ***
%*** Value set ExcitationDCorAC ***
NICONST.DAQmx_Val_DC = 10050; % DC
NICONST.DAQmx_Val_AC = 10045; % AC

%*** Values for DAQmx_AI_Excit_Src ***
%*** Value set ExcitationSource ***
NICONST.DAQmx_Val_Internal = 10200; % Internal
NICONST.DAQmx_Val_External = 10167; % External
NICONST.DAQmx_Val_None = 10230; % None

%*** Values for DAQmx_AI_Excit_VoltageOrCurrent ***
%*** Value set ExcitationVoltageOrCurrent ***
NICONST.DAQmx_Val_Voltage =10322; % Voltage
NICONST.DAQmx_Val_Current =10134; % Current

%*** Values for DAQmx_Exported_CtrOutEvent_OutputBehavior ***
%*** Value set ExportActions2 ***
NICONST.DAQmx_Val_Pulse =10265; % Pulse
NICONST.DAQmx_Val_Toggle = 10307; % Toggle

%*** Values for DAQmx_Exported_SampClk_OutputBehavior ***
%*** Value set ExportActions3 ***
NICONST.DAQmx_Val_Pulse =10265; % Pulse
NICONST.DAQmx_Val_Lvl =10210; % Level

%*** Values for DAQmx_AI_Freq_Units ***
%*** Value set FrequencyUnits ***
NICONST.DAQmx_Val_Hz = 10373; % Hz
NICONST.DAQmx_Val_FromCustomScale =10065; % From Custom Scale

%*** Values for DAQmx_CO_Pulse_Freq_Units ***
%*** Value set FrequencyUnits2 ***
NICONST.DAQmx_Val_Hz = 10373; % Hz

%*** Values for DAQmx_CI_Freq_Units ***
%*** Value set FrequencyUnits3 ***
NICONST.DAQmx_Val_Hz = 10373; % Hz
NICONST.DAQmx_Val_Ticks =10304; % Ticks
NICONST.DAQmx_Val_FromCustomScale =10065; % From Custom Scale


%*** Values for DAQmx_AI_DataXferReqCond ***
%*** Values for DAQmx_DI_DataXferReqCond ***
%*** Value set InputDataTransferCondition ***
NICONST.DAQmx_Val_OnBrdMemMoreThanHalfFull = 10237; % On Board Memory More than Half Full
NICONST.DAQmx_Val_OnBrdMemNotEmpty = 10241; % On Board Memory Not Empty

%*** Values for DAQmx_AI_TermCfg ***
%*** Value set InputTermCfg ***
NICONST.DAQmx_Val_RSE =10083; % RSE
NICONST.DAQmx_Val_NRSE = 10078; % NRSE
NICONST.DAQmx_Val_Diff = 10106; % Differential
NICONST.DAQmx_Val_PseudoDiff = 12529; % Pseudodifferential

%*** Values for DAQmx_AI_LVDT_SensitivityUnits ***
%*** Value set LVDTSensitivityUnits1 ***
NICONST.DAQmx_Val_mVoltsPerVoltPerMillimeter = 12506; % mVolts/Volt/mMeter
NICONST.DAQmx_Val_mVoltsPerVoltPerMilliInch =12505; % mVolts/Volt/0.001 Inch

%*** Values for DAQmx_AI_LVDT_Units ***
%*** Value set LengthUnits2 ***
NICONST.DAQmx_Val_Meters = 10219; % Meters
NICONST.DAQmx_Val_Inches = 10379; % Inches
NICONST.DAQmx_Val_FromCustomScale =10065; % From Custom Scale

%*** Values for DAQmx_CI_LinEncoder_Units ***
%*** Value set LengthUnits3 ***
NICONST.DAQmx_Val_Meters = 10219; % Meters
NICONST.DAQmx_Val_Inches = 10379; % Inches
NICONST.DAQmx_Val_Ticks =10304; % Ticks
NICONST.DAQmx_Val_FromCustomScale =10065; % From Custom Scale

%*** Values for DAQmx_CI_OutputState ***
%*** Values for DAQmx_CO_Pulse_IdleState ***
%*** Values for DAQmx_CO_OutputState ***
%*** Values for DAQmx_Exported_CtrOutEvent_Toggle_IdleState ***
%*** Values for DAQmx_DigLvl_PauseTrig_When ***
%*** Value set Level1 ***
NICONST.DAQmx_Val_High = 10192; % High
NICONST.DAQmx_Val_Low =10214; % Low

%*** Values for DAQmx_AIConv_Timebase_Src ***
%*** Value set MIOAIConvertTbSrc ***
NICONST.DAQmx_Val_SameAsSampTimebase = 10284; % Same as Sample Timebase
NICONST.DAQmx_Val_SameAsMasterTimebase = 10282; % Same as Master Timebase
NICONST.DAQmx_Val_20MHzTimebase =12537; % 20MHz Timebase

%*** Values for DAQmx_AO_DataXferReqCond ***
%*** Values for DAQmx_DO_DataXferReqCond ***
%*** Value set OutputDataTransferCondition ***
NICONST.DAQmx_Val_OnBrdMemEmpty =10235; % On Board Memory Empty
NICONST.DAQmx_Val_OnBrdMemHalfFullOrLess = 10239; % On Board Memory Half Full or Less
NICONST.DAQmx_Val_OnBrdMemNotFull =10242; % On Board Memory Less than Full

%*** Values for DAQmx_AO_TermCfg ***
%*** Value set OutputTermCfg ***
NICONST.DAQmx_Val_RSE =10083; % RSE
NICONST.DAQmx_Val_Diff = 10106; % Differential
NICONST.DAQmx_Val_PseudoDiff = 12529; % Pseudodifferential

%*** Values for DAQmx_Read_OverWrite ***
%*** Value set OverwriteMode1 ***
NICONST.DAQmx_Val_OverwriteUnreadSamps = 10252; % Overwrite Unread Samples
NICONST.DAQmx_Val_DoNotOverwriteUnreadSamps =10159; % Do Not Overwrite Unread Samples

%*** Values for DAQmx_Exported_AIConvClk_Pulse_Polarity ***
%*** Values for DAQmx_Exported_AdvTrig_Pulse_Polarity ***
%*** Values for DAQmx_Exported_AdvCmpltEvent_Pulse_Polarity ***
%*** Values for DAQmx_Exported_AIHoldCmpltEvent_PulsePolarity ***
%*** Values for DAQmx_Exported_CtrOutEvent_Pulse_Polarity ***
%*** Value set Polarity2 ***
NICONST.DAQmx_Val_ActiveHigh = 10095; % Active High
NICONST.DAQmx_Val_ActiveLow =10096; % Active Low


%*** Values for DAQmx_AI_RTD_Type ***
%*** Value set RTDType1 ***
NICONST.DAQmx_Val_Pt3750 = 12481; % Pt3750
NICONST.DAQmx_Val_Pt3851 = 10071; % Pt3851
NICONST.DAQmx_Val_Pt3911 = 12482; % Pt3911
NICONST.DAQmx_Val_Pt3916 = 10069; % Pt3916
NICONST.DAQmx_Val_Pt3920 = 10053; % Pt3920
NICONST.DAQmx_Val_Pt3928 = 12483; % Pt3928
NICONST.DAQmx_Val_Custom = 10137; % Custom

%*** Values for DAQmx_AI_RVDT_SensitivityUnits ***
%*** Value set RVDTSensitivityUnits1 ***
NICONST.DAQmx_Val_mVoltsPerVoltPerDegree = 12507; % mVolts/Volt/Degree
NICONST.DAQmx_Val_mVoltsPerVoltPerRadian = 12508; % mVolts/Volt/Radian

%*** Values for DAQmx_Read_RelativeTo ***
%*** Value set ReadRelativeTo ***
NICONST.DAQmx_Val_FirstSample =10424; % First Sample
NICONST.DAQmx_Val_CurrReadPos =10425; % Current Read Position
NICONST.DAQmx_Val_RefTrig =10426; % Reference Trigger
NICONST.DAQmx_Val_FirstPretrigSamp = 10427; % First Pretrigger Sample
NICONST.DAQmx_Val_MostRecentSamp = 10428; % Most Recent Sample


%*** Values for DAQmx_Write_RegenMode ***
%*** Value set RegenerationMode1 ***
NICONST.DAQmx_Val_AllowRegen = 10097; % Allow Regeneration
NICONST.DAQmx_Val_DoNotAllowRegen =10158; % Do Not Allow Regeneration

%*** Values for DAQmx_AI_ResistanceCfg ***
%*** Value set ResistanceConfiguration ***
NICONST.DAQmx_Val_2Wire =2; % 2-Wire
NICONST.DAQmx_Val_3Wire =3; % 3-Wire
NICONST.DAQmx_Val_4Wire =4; % 4-Wire

%*** Values for DAQmx_AI_Resistance_Units ***
%*** Value set ResistanceUnits1 ***
NICONST.DAQmx_Val_Ohms = 10384; % Ohms
NICONST.DAQmx_Val_FromCustomScale =10065; % From Custom Scale
NICONST.DAQmx_Val_FromTEDS = 12516; % From TEDS

%*** Value set ResistanceUnits2 ***
NICONST.DAQmx_Val_Ohms = 10384; % Ohms
NICONST.DAQmx_Val_FromCustomScale =10065; % From Custom Scale

%*** Values for DAQmx_AI_ResolutionUnits ***
%*** Values for DAQmx_AO_ResolutionUnits ***
%*** Value set ResolutionType1 ***
NICONST.DAQmx_Val_Bits = 10109; % Bits

%*** Values for DAQmx_SampTimingType ***
%*** Value set SampleTimingType ***
NICONST.DAQmx_Val_SampClk =10388; % Sample Clock
NICONST.DAQmx_Val_Handshake =10389; % Handshake
NICONST.DAQmx_Val_Implicit = 10451; % Implicit
NICONST.DAQmx_Val_OnDemand = 10390; % On Demand
NICONST.DAQmx_Val_ChangeDetection =12504; % Change Detection

%*** Values for DAQmx_Scale_Type ***
%*** Value set ScaleType ***
NICONST.DAQmx_Val_Linear = 10447; % Linear
NICONST.DAQmx_Val_MapRanges =10448; % Map Ranges
NICONST.DAQmx_Val_Polynomial = 10449; % Polynomial
NICONST.DAQmx_Val_Table =10450; % Table

%*** Values for DAQmx_AI_Bridge_ShuntCal_Select ***
%*** Value set ShuntCalSelect ***
NICONST.DAQmx_Val_A =12513; % A
NICONST.DAQmx_Val_B =12514; % B
NICONST.DAQmx_Val_AandB =12515; % A and B

%*** Value set Signal ***
NICONST.DAQmx_Val_AIConvertClock = 12484; % AI Convert Clock
NICONST.DAQmx_Val_10MHzRefClock =12536; % 10MHz Reference Clock
NICONST.DAQmx_Val_20MHzTimebaseClock = 12486; % 20MHz Timebase Clock
NICONST.DAQmx_Val_SampleClock =12487; % Sample Clock
NICONST.DAQmx_Val_AdvanceTrigger = 12488; % Advance Trigger
NICONST.DAQmx_Val_ReferenceTrigger = 12490; % Reference Trigger
NICONST.DAQmx_Val_StartTrigger = 12491; % Start Trigger
NICONST.DAQmx_Val_AdvCmpltEvent =12492; % Advance Complete Event
NICONST.DAQmx_Val_AIHoldCmpltEvent = 12493; % AI Hold Complete Event
NICONST.DAQmx_Val_CounterOutputEvent = 12494; % Counter Output Event
NICONST.DAQmx_Val_ChangeDetectionEvent = 12511; % Change Detection Event
NICONST.DAQmx_Val_WDTExpiredEvent =12512; % Watchdog Timer Expired Event

%*** Values for DAQmx_AnlgEdge_StartTrig_Slope ***
%*** Values for DAQmx_AnlgEdge_RefTrig_Slope ***
%*** Value set Slope1 ***
NICONST.DAQmx_Val_RisingSlope =10280; % Rising
NICONST.DAQmx_Val_FallingSlope = 10171; % Falling

%*** Values for DAQmx_AI_SoundPressure_Units ***
%*** Value set SoundPressureUnits1 ***
NICONST.DAQmx_Val_Pascals =10081; % Pascals
NICONST.DAQmx_Val_FromCustomScale =10065; % From Custom Scale

%*** Values for DAQmx_AI_Lowpass_SwitchCap_ClkSrc ***
%*** Values for DAQmx_AO_DAC_Ref_Src ***
%*** Values for DAQmx_AO_DAC_Offset_Src ***
%*** Value set SourceSelection ***
NICONST.DAQmx_Val_Internal = 10200; % Internal
NICONST.DAQmx_Val_External = 10167; % External

%*** Values for DAQmx_AI_StrainGage_Cfg ***
%*** Value set StrainGageBridgeType1 ***
NICONST.DAQmx_Val_FullBridgeI =10183; % Full Bridge I
NICONST.DAQmx_Val_FullBridgeII = 10184; % Full Bridge II
NICONST.DAQmx_Val_FullBridgeIII =10185; % Full Bridge III
NICONST.DAQmx_Val_HalfBridgeI =10188; % Half Bridge I
NICONST.DAQmx_Val_HalfBridgeII = 10189; % Half Bridge II
NICONST.DAQmx_Val_QuarterBridgeI = 10271; % Quarter Bridge I
NICONST.DAQmx_Val_QuarterBridgeII =10272; % Quarter Bridge II

%*** Values for DAQmx_AI_Strain_Units ***
%*** Value set StrainUnits1 ***
NICONST.DAQmx_Val_Strain = 10299; % Strain
NICONST.DAQmx_Val_FromCustomScale =10065; % From Custom Scale

%*** Values for DAQmx_SwitchScan_RepeatMode ***
%*** Value set SwitchScanRepeatMode ***
NICONST.DAQmx_Val_Finite = 10172; % Finite
NICONST.DAQmx_Val_Cont = 10117; % Continuous

%*** Values for DAQmx_SwitchChan_Usage ***
%*** Value set SwitchUsageTypes ***
NICONST.DAQmx_Val_Source = 10439; % Source
NICONST.DAQmx_Val_Load = 10440; % Load
NICONST.DAQmx_Val_ReservedForRouting = 10441; % Reserved for Routing

%*** Value set TEDSUnits ***
NICONST.DAQmx_Val_FromCustomScale =10065; % From Custom Scale
NICONST.DAQmx_Val_FromTEDS = 12516; % From TEDS

%*** Values for DAQmx_AI_Temp_Units ***
%*** Value set TemperatureUnits1 ***
NICONST.DAQmx_Val_DegC = 10143; % Deg C
NICONST.DAQmx_Val_DegF = 10144; % Deg F
NICONST.DAQmx_Val_Kelvins =10325; % Kelvins
NICONST.DAQmx_Val_DegR = 10145; % Deg R
NICONST.DAQmx_Val_FromCustomScale =10065; % From Custom Scale

%*** Values for DAQmx_AI_Thrmcpl_Type ***
%*** Value set ThermocoupleType1 ***
NICONST.DAQmx_Val_J_Type_TC =10072; % J
NICONST.DAQmx_Val_K_Type_TC =10073; % K
NICONST.DAQmx_Val_N_Type_TC =10077; % N
NICONST.DAQmx_Val_R_Type_TC =10082; % R
NICONST.DAQmx_Val_S_Type_TC =10085; % S
NICONST.DAQmx_Val_T_Type_TC =10086; % T
NICONST.DAQmx_Val_B_Type_TC =10047; % B
NICONST.DAQmx_Val_E_Type_TC =10055; % E

%*** Values for DAQmx_CO_Pulse_Time_Units ***
%*** Value set TimeUnits2 ***
NICONST.DAQmx_Val_Seconds =10364; % Seconds

%*** Values for DAQmx_CI_Period_Units ***
%*** Values for DAQmx_CI_PulseWidth_Units ***
%*** Values for DAQmx_CI_TwoEdgeSep_Units ***
%*** Values for DAQmx_CI_SemiPeriod_Units ***
%*** Value set TimeUnits3 ***
NICONST.DAQmx_Val_Seconds =10364; % Seconds
NICONST.DAQmx_Val_Ticks =10304; % Ticks
NICONST.DAQmx_Val_FromCustomScale =10065; % From Custom Scale

%*** Values for DAQmx_RefTrig_Type ***
%*** Value set TriggerType1 ***
NICONST.DAQmx_Val_AnlgEdge = 10099; % Analog Edge
NICONST.DAQmx_Val_DigEdge =10150; % Digital Edge
NICONST.DAQmx_Val_AnlgWin =10103; % Analog Window
NICONST.DAQmx_Val_None = 10230; % None

%*** Values for DAQmx_ArmStartTrig_Type ***
%*** Values for DAQmx_WatchdogExpirTrig_Type ***
%*** Value set TriggerType4 ***
NICONST.DAQmx_Val_DigEdge =10150; % Digital Edge
NICONST.DAQmx_Val_None = 10230; % None

%*** Values for DAQmx_AdvTrig_Type ***
%*** Value set TriggerType5 ***
NICONST.DAQmx_Val_DigEdge =10150; % Digital Edge
NICONST.DAQmx_Val_Software = 10292; % Software
NICONST.DAQmx_Val_None = 10230; % None

%*** Values for DAQmx_PauseTrig_Type ***
%*** Value set TriggerType6 ***
NICONST.DAQmx_Val_AnlgLvl =10101; % Analog Level
NICONST.DAQmx_Val_AnlgWin =10103; % Analog Window
NICONST.DAQmx_Val_DigLvl = 10152; % Digital Level
NICONST.DAQmx_Val_None = 10230; % None

%*** Values for DAQmx_StartTrig_Type ***
%*** Value set TriggerType8 ***
NICONST.DAQmx_Val_AnlgEdge = 10099; % Analog Edge
NICONST.DAQmx_Val_DigEdge =10150; % Digital Edge
NICONST.DAQmx_Val_AnlgWin =10103; % Analog Window
NICONST.DAQmx_Val_None = 10230; % None

%*** Values for DAQmx_Scale_PreScaledUnits ***
%*** Value set UnitsPreScaled ***
NICONST.DAQmx_Val_Volts =10348; % Volts
NICONST.DAQmx_Val_Amps = 10342; % Amps
NICONST.DAQmx_Val_DegF = 10144; % Deg F
NICONST.DAQmx_Val_DegC = 10143; % Deg C
NICONST.DAQmx_Val_DegR = 10145; % Deg R
NICONST.DAQmx_Val_Kelvins =10325; % Kelvins
NICONST.DAQmx_Val_Strain = 10299; % Strain
NICONST.DAQmx_Val_Ohms = 10384; % Ohms
NICONST.DAQmx_Val_Hz = 10373; % Hz
NICONST.DAQmx_Val_Seconds =10364; % Seconds
NICONST.DAQmx_Val_Meters = 10219; % Meters
NICONST.DAQmx_Val_Inches = 10379; % Inches
NICONST.DAQmx_Val_Degrees =10146; % Degrees
NICONST.DAQmx_Val_Radians =10273; % Radians
NICONST.DAQmx_Val_g =10186; % g
NICONST.DAQmx_Val_Pascals =10081; % Pascals
NICONST.DAQmx_Val_FromTEDS = 12516; % From TEDS

%*** Values for DAQmx_AI_Voltage_Units ***
%*** Value set VoltageUnits1 ***
NICONST.DAQmx_Val_Volts =10348; % Volts
NICONST.DAQmx_Val_FromCustomScale =10065; % From Custom Scale
NICONST.DAQmx_Val_FromTEDS = 12516; % From TEDS

%*** Values for DAQmx_AO_Voltage_Units ***
%*** Value set VoltageUnits2 ***
NICONST.DAQmx_Val_Volts =10348; % Volts
NICONST.DAQmx_Val_FromCustomScale =10065; % From Custom Scale

%*** Values for DAQmx_ReadWaitMode ***
%*** Value set WaitMode ***
NICONST.DAQmx_Val_WaitForInterrupt = 12523; % Wait For Interrupt
NICONST.DAQmx_Val_Poll = 12524; % Poll
NICONST.DAQmx_Val_Yield =12525; % Yield

%*** Values for DAQmx_AnlgWin_StartTrig_When ***
%*** Values for DAQmx_AnlgWin_RefTrig_When ***
%*** Value set WindowTriggerCondition1 ***
NICONST.DAQmx_Val_EnteringWin =10163; % Entering Window
NICONST.DAQmx_Val_LeavingWin = 10208; % Leaving Window

%*** Values for DAQmx_AnlgWin_PauseTrig_When ***
%*** Value set WindowTriggerCondition2 ***
NICONST.DAQmx_Val_InsideWin =10199; % Inside Window
NICONST.DAQmx_Val_OutsideWin = 10251; % Outside Window

%*** Value set WriteBasicTEDSOptions ***
NICONST.DAQmx_Val_WriteToEEPROM =12538; % Write To EEPROM
NICONST.DAQmx_Val_WriteToPROM =12539; % Write To PROM Once
NICONST.DAQmx_Val_DoNotWrite = 12540; % Do Not Write

%*** Values for DAQmx_Write_RelativeTo ***
%*** Value set WriteRelativeTo ***
NICONST.DAQmx_Val_FirstSample =10424; % First Sample
NICONST.DAQmx_Val_CurrWritePos = 10430; % Current Write Position



%/******************************************************************************
% *** NI-DAQmx Error Codes *****************************************************
% ******************************************************************************/

NICONST.DAQmxSuccess = (0);

%DAQmxFailed(error); = ((error);<0);

% Error and Warning Codes
NICONST.DAQmxErrorWriteNotCompleteBeforeSampClk =(-209801);
NICONST.DAQmxErrorReadNotCompleteBeforeSampClk = (-209800);
NICONST.DAQmxErrorEveryNSamplesEventNotSupportedForNonBufferedTasks =(-200848);
NICONST.DAQmxErrorBufferedAndDataXferPIO = (-200847);
NICONST.DAQmxErrorCannotWriteWhenAutoStartFalseAndTaskNotRunning = (-200846);
NICONST.DAQmxErrorNonBufferedAndDataXferInterrupts = (-200845);
NICONST.DAQmxErrorWriteFailedMultipleCtrsWithFREQOUT = (-200844);
NICONST.DAQmxErrorReadNotCompleteBefore3SampClkEdges = (-200843);
NICONST.DAQmxErrorCtrHWTimedSinglePointAndDataXferNotProgIO =(-200842);
NICONST.DAQmxErrorPrescalerNot1ForInputTerminal =(-200841);
NICONST.DAQmxErrorPrescalerNot1ForTimebaseSrc =(-200840);
NICONST.DAQmxErrorSampClkTimingTypeWhenTristateIsFalse = (-200839);
NICONST.DAQmxErrorOutputBufferSizeNotMultOfXferSize =(-200838);
NICONST.DAQmxErrorSampPerChanNotMultOfXferSize = (-200837);
NICONST.DAQmxErrorWriteToTEDSFailed =(-200836);
NICONST.DAQmxErrorSCXIDevNotUsablePowerTurnedOff = (-200835);
NICONST.DAQmxErrorCannotReadWhenAutoStartFalseBufSizeZeroAndTaskNotRunning = (-200834);
NICONST.DAQmxErrorCannotReadWhenAutoStartFalseHWTimedSinglePtAndTaskNotRunning = (-200833);
NICONST.DAQmxErrorCannotReadWhenAutoStartFalseOnDemandAndTaskNotRunning =(-200832);
NICONST.DAQmxErrorSimultaneousAOWhenNotOnDemandTiming =(-200831);
NICONST.DAQmxErrorMemMapAndSimultaneousAO =(-200830);
NICONST.DAQmxErrorWriteFailedMultipleCOOutputTypes = (-200829);
NICONST.DAQmxErrorWriteToTEDSNotSupportedOnRT =(-200828);
NICONST.DAQmxErrorVirtualTEDSDataFileError = (-200827);
NICONST.DAQmxErrorTEDSSensorDataError =(-200826);
NICONST.DAQmxErrorDataSizeMoreThanSizeOfEEPROMOnTEDS = (-200825);
NICONST.DAQmxErrorPROMOnTEDSContainsBasicTEDSData =(-200824);
NICONST.DAQmxErrorPROMOnTEDSAlreadyWritten = (-200823);
NICONST.DAQmxErrorTEDSDoesNotContainPROM = (-200822);
NICONST.DAQmxErrorHWTimedSinglePointNotSupportedAI = (-200821);
NICONST.DAQmxErrorHWTimedSinglePointOddNumChansInAITask =(-200820);
NICONST.DAQmxErrorCantUseOnlyOnBoardMemWithProgrammedIO =(-200819);
NICONST.DAQmxErrorSwitchDevShutDownDueToHighTemp = (-200818);
NICONST.DAQmxErrorExcitationNotSupportedWhenTermCfgDiff =(-200817);
NICONST.DAQmxErrorTEDSMinElecValGEMaxElecVal = (-200816);
NICONST.DAQmxErrorTEDSMinPhysValGEMaxPhysVal = (-200815);
NICONST.DAQmxErrorCIOnboardClockNotSupportedAsInputTerm =(-200814);
NICONST.DAQmxErrorInvalidSampModeForPositionMeas = (-200813);
NICONST.DAQmxErrorTrigWhenAOHWTimedSinglePtSampMode =(-200812);
NICONST.DAQmxErrorDAQmxCantUseStringDueToUnknownChar = (-200811);
NICONST.DAQmxErrorDAQmxCantRetrieveStringDueToUnknownChar =(-200810);
NICONST.DAQmxErrorClearTEDSNotSupportedOnRT =(-200809);
NICONST.DAQmxErrorCfgTEDSNotSupportedOnRT =(-200808);
NICONST.DAQmxErrorProgFilterClkCfgdToDifferentMinPulseWidthBySameTask1PerDev = (-200807);
NICONST.DAQmxErrorProgFilterClkCfgdToDifferentMinPulseWidthByAnotherTask1PerDev = (-200806);
NICONST.DAQmxErrorNoLastExtCalDateTimeLastExtCalNotDAQmx = (-200804);
NICONST.DAQmxErrorCannotWriteNotStartedAutoStartFalseNotOnDemandHWTimedSglPt = (-200803);
NICONST.DAQmxErrorCannotWriteNotStartedAutoStartFalseNotOnDemandBufSizeZero =(-200802);
NICONST.DAQmxErrorCOInvalidTimingSrcDueToSignal =(-200801);
NICONST.DAQmxErrorCIInvalidTimingSrcForSampClkDueToSampTimingType =(-200800);
NICONST.DAQmxErrorCIInvalidTimingSrcForEventCntDueToSampMode = (-200799);
NICONST.DAQmxErrorNoChangeDetectOnNonInputDigLineForDev =(-200798);
NICONST.DAQmxErrorEmptyStringTermNameNotSupported =(-200797);
NICONST.DAQmxErrorMemMapEnabledForHWTimedNonBufferedAO = (-200796);
NICONST.DAQmxErrorDevOnboardMemOverflowDuringHWTimedNonBufferedGen = (-200795);
NICONST.DAQmxErrorCODAQmxWriteMultipleChans =(-200794);
NICONST.DAQmxErrorCantMaintainExistingValueAOSync =(-200793);
NICONST.DAQmxErrorMStudioMultiplePhysChansNotSupported = (-200792);
NICONST.DAQmxErrorCantConfigureTEDSForChan = (-200791);
NICONST.DAQmxErrorWriteDataTypeTooSmall =(-200790);
NICONST.DAQmxErrorReadDataTypeTooSmall = (-200789);
NICONST.DAQmxErrorMeasuredBridgeOffsetTooHigh =(-200788);
NICONST.DAQmxErrorStartTrigConflictWithCOHWTimedSinglePt = (-200787);
NICONST.DAQmxErrorSampClkRateExtSampClkTimebaseRateMismatch =(-200786);
NICONST.DAQmxErrorInvalidTimingSrcDueToSampTimingType =(-200785);
NICONST.DAQmxErrorVirtualTEDSFileNotFound =(-200784);
NICONST.DAQmxErrorMStudioNoForwardPolyScaleCoeffs =(-200783);
NICONST.DAQmxErrorMStudioNoReversePolyScaleCoeffs =(-200782);
NICONST.DAQmxErrorMStudioNoPolyScaleCoeffsUseCalc =(-200781);
NICONST.DAQmxErrorMStudioNoForwardPolyScaleCoeffsUseCalc = (-200780);
NICONST.DAQmxErrorMStudioNoReversePolyScaleCoeffsUseCalc = (-200779);
NICONST.DAQmxErrorCOSampModeSampTimingTypeSampClkConflict =(-200778);
NICONST.DAQmxErrorDevCannotProduceMinPulseWidth =(-200777);
NICONST.DAQmxErrorCannotProduceMinPulseWidthGivenPropertyValues =(-200776);
NICONST.DAQmxErrorTermCfgdToDifferentMinPulseWidthByAnotherTask =(-200775);
NICONST.DAQmxErrorTermCfgdToDifferentMinPulseWidthByAnotherProperty =(-200774);
NICONST.DAQmxErrorDigSyncNotAvailableOnTerm =(-200773);
NICONST.DAQmxErrorDigFilterNotAvailableOnTerm =(-200772);
NICONST.DAQmxErrorDigFilterEnabledMinPulseWidthNotCfg =(-200771);
NICONST.DAQmxErrorDigFilterAndSyncBothEnabled =(-200770);
NICONST.DAQmxErrorHWTimedSinglePointAOAndDataXferNotProgIO = (-200769);
NICONST.DAQmxErrorNonBufferedAOAndDataXferNotProgIO =(-200768);
NICONST.DAQmxErrorProgIODataXferForBufferedAO =(-200767);
NICONST.DAQmxErrorTEDSLegacyTemplateIDInvalidOrUnsupported = (-200766);
NICONST.DAQmxErrorTEDSMappingMethodInvalidOrUnsupported =(-200765);
NICONST.DAQmxErrorTEDSLinearMappingSlopeZero = (-200764);
NICONST.DAQmxErrorAIInputBufferSizeNotMultOfXferSize = (-200763);
NICONST.DAQmxErrorNoSyncPulseExtSampClkTimebase =(-200762);
NICONST.DAQmxErrorNoSyncPulseAnotherTaskRunning =(-200761);
NICONST.DAQmxErrorAOMinMaxNotInGainRange = (-200760);
NICONST.DAQmxErrorAOMinMaxNotInDACRange =(-200759);
NICONST.DAQmxErrorDevOnlySupportsSampClkTimingAO = (-200758);
NICONST.DAQmxErrorDevOnlySupportsSampClkTimingAI = (-200757);
NICONST.DAQmxErrorTEDSIncompatibleSensorAndMeasType =(-200756);
NICONST.DAQmxErrorTEDSMultipleCalTemplatesNotSupported = (-200755);
NICONST.DAQmxErrorTEDSTemplateParametersNotSupported = (-200754);
NICONST.DAQmxErrorParsingTEDSData =(-200753);
NICONST.DAQmxErrorMultipleActivePhysChansNotSupported =(-200752);
NICONST.DAQmxErrorNoChansSpecdForChangeDetect =(-200751);
NICONST.DAQmxErrorInvalidCalVoltageForGivenGain =(-200750);
NICONST.DAQmxErrorInvalidCalGain = (-200749);
NICONST.DAQmxErrorMultipleWritesBetweenSampClks =(-200748);
NICONST.DAQmxErrorInvalidAcqTypeForFREQOUT = (-200747);
NICONST.DAQmxErrorSuitableTimebaseNotFoundTimeCombo2 = (-200746);
NICONST.DAQmxErrorSuitableTimebaseNotFoundFrequencyCombo2 =(-200745);
NICONST.DAQmxErrorRefClkRateRefClkSrcMismatch =(-200744);
NICONST.DAQmxErrorNoTEDSTerminalBlock =(-200743);
NICONST.DAQmxErrorCorruptedTEDSMemory =(-200742);
NICONST.DAQmxErrorTEDSNotSupported = (-200741);
NICONST.DAQmxErrorTimingSrcTaskStartedBeforeTimedLoop =(-200740);
NICONST.DAQmxErrorPropertyNotSupportedForTimingSrc = (-200739);
NICONST.DAQmxErrorTimingSrcDoesNotExist =(-200738);
NICONST.DAQmxErrorInputBufferSizeNotEqualSampsPerChanForFiniteSampMode = (-200737);
NICONST.DAQmxErrorFREQOUTCannotProduceDesiredFrequency2 =(-200736);
NICONST.DAQmxErrorExtRefClkRateNotSpecified =(-200735);
NICONST.DAQmxErrorDeviceDoesNotSupportDMADataXferForNonBufferedAcq = (-200734);
NICONST.DAQmxErrorDigFilterMinPulseWidthSetWhenTristateIsFalse = (-200733);
NICONST.DAQmxErrorDigFilterEnableSetWhenTristateIsFalse =(-200732);
NICONST.DAQmxErrorNoHWTimingWithOnDemand = (-200731);
NICONST.DAQmxErrorCannotDetectChangesWhenTristateIsFalse = (-200730);
NICONST.DAQmxErrorCannotHandshakeWhenTristateIsFalse = (-200729);
NICONST.DAQmxErrorLinesUsedForStaticInputNotForHandshakingControl =(-200728);
NICONST.DAQmxErrorLinesUsedForHandshakingControlNotForStaticInput =(-200727);
NICONST.DAQmxErrorLinesUsedForStaticInputNotForHandshakingInput =(-200726);
NICONST.DAQmxErrorLinesUsedForHandshakingInputNotForStaticInput =(-200725);
NICONST.DAQmxErrorDifferentDITristateValsForChansInTask =(-200724);
NICONST.DAQmxErrorTimebaseCalFreqVarianceTooLarge =(-200723);
NICONST.DAQmxErrorTimebaseCalFailedToConverge =(-200722);
NICONST.DAQmxErrorInadequateResolutionForTimebaseCal = (-200721);
NICONST.DAQmxErrorInvalidAOGainCalConst =(-200720);
NICONST.DAQmxErrorInvalidAOOffsetCalConst =(-200719);
NICONST.DAQmxErrorInvalidAIGainCalConst =(-200718);
NICONST.DAQmxErrorInvalidAIOffsetCalConst =(-200717);
NICONST.DAQmxErrorDigOutputOverrun = (-200716);
NICONST.DAQmxErrorDigInputOverrun =(-200715);
NICONST.DAQmxErrorAcqStoppedDriverCantXferDataFastEnough = (-200714);
NICONST.DAQmxErrorChansCantAppearInSameTask =(-200713);
NICONST.DAQmxErrorInputCfgFailedBecauseWatchdogExpired = (-200712);
NICONST.DAQmxErrorAnalogTrigChanNotExternal =(-200711);
NICONST.DAQmxErrorTooManyChansForInternalAIInputSrc =(-200710);
NICONST.DAQmxErrorTEDSSensorNotDetected =(-200709);
NICONST.DAQmxErrorPrptyGetSpecdActiveItemFailedDueToDifftValues =(-200708);
NICONST.DAQmxErrorRoutingDestTermPXIClk10InNotInSlot2 =(-200706);
NICONST.DAQmxErrorRoutingDestTermPXIStarXNotInSlot2 =(-200705);
NICONST.DAQmxErrorRoutingSrcTermPXIStarXNotInSlot2 = (-200704);
NICONST.DAQmxErrorRoutingSrcTermPXIStarInSlot16AndAbove =(-200703);
NICONST.DAQmxErrorRoutingDestTermPXIStarInSlot16AndAbove = (-200702);
NICONST.DAQmxErrorRoutingDestTermPXIStarInSlot2 =(-200701);
NICONST.DAQmxErrorRoutingSrcTermPXIStarInSlot2 = (-200700);
NICONST.DAQmxErrorRoutingDestTermPXIChassisNotIdentified = (-200699);
NICONST.DAQmxErrorRoutingSrcTermPXIChassisNotIdentified =(-200698);
NICONST.DAQmxErrorFailedToAcquireCalData = (-200697);
NICONST.DAQmxErrorBridgeOffsetNullingCalNotSupported = (-200696);
NICONST.DAQmxErrorAIMaxNotSpecified =(-200695);
NICONST.DAQmxErrorAIMinNotSpecified =(-200694);
NICONST.DAQmxErrorOddTotalBufferSizeToWrite =(-200693);
NICONST.DAQmxErrorOddTotalNumSampsToWrite =(-200692);
NICONST.DAQmxErrorBufferWithWaitMode = (-200691);
NICONST.DAQmxErrorBufferWithHWTimedSinglePointSampMode = (-200690);
NICONST.DAQmxErrorCOWritePulseLowTicksNotSupported = (-200689);
NICONST.DAQmxErrorCOWritePulseHighTicksNotSupported =(-200688);
NICONST.DAQmxErrorCOWritePulseLowTimeOutOfRange =(-200687);
NICONST.DAQmxErrorCOWritePulseHighTimeOutOfRange = (-200686);
NICONST.DAQmxErrorCOWriteFreqOutOfRange =(-200685);
NICONST.DAQmxErrorCOWriteDutyCycleOutOfRange = (-200684);
NICONST.DAQmxErrorInvalidInstallation =(-200683);
NICONST.DAQmxErrorRefTrigMasterSessionUnavailable =(-200682);
NICONST.DAQmxErrorRouteFailedBecauseWatchdogExpired =(-200681);
NICONST.DAQmxErrorDeviceShutDownDueToHighTemp =(-200680);
NICONST.DAQmxErrorNoMemMapWhenHWTimedSinglePoint = (-200679);
NICONST.DAQmxErrorWriteFailedBecauseWatchdogExpired =(-200678);
NICONST.DAQmxErrorDifftInternalAIInputSrcs = (-200677);
NICONST.DAQmxErrorDifftAIInputSrcInOneChanGroup =(-200676);
NICONST.DAQmxErrorInternalAIInputSrcInMultChanGroups = (-200675);
NICONST.DAQmxErrorSwitchOpFailedDueToPrevError = (-200674);
NICONST.DAQmxErrorWroteMultiSampsUsingSingleSampWrite =(-200673);
NICONST.DAQmxErrorMismatchedInputArraySizes =(-200672);
NICONST.DAQmxErrorCantExceedRelayDriveLimit =(-200671);
NICONST.DAQmxErrorDACRngLowNotEqualToMinusRefVal = (-200670);
NICONST.DAQmxErrorCantAllowConnectDACToGnd = (-200669);
NICONST.DAQmxErrorWatchdogTimeoutOutOfRangeAndNotSpecialVal =(-200668);
NICONST.DAQmxErrorNoWatchdogOutputOnPortReservedForInput = (-200667);
NICONST.DAQmxErrorNoInputOnPortCfgdForWatchdogOutput = (-200666);
NICONST.DAQmxErrorWatchdogExpirationStateNotEqualForLinesInPort =(-200665);
NICONST.DAQmxErrorCannotPerformOpWhenTaskNotReserved = (-200664);
NICONST.DAQmxErrorPowerupStateNotSupported = (-200663);
NICONST.DAQmxErrorWatchdogTimerNotSupported =(-200662);
NICONST.DAQmxErrorOpNotSupportedWhenRefClkSrcNone =(-200661);
NICONST.DAQmxErrorSampClkRateUnavailable = (-200660);
NICONST.DAQmxErrorPrptyGetSpecdSingleActiveChanFailedDueToDifftVals =(-200659);
NICONST.DAQmxErrorPrptyGetImpliedActiveChanFailedDueToDifftVals =(-200658);
NICONST.DAQmxErrorPrptyGetSpecdActiveChanFailedDueToDifftVals =(-200657);
NICONST.DAQmxErrorNoRegenWhenUsingBrdMem = (-200656);
NICONST.DAQmxErrorNonbufferedReadMoreThanSampsPerChan =(-200655);
NICONST.DAQmxErrorWatchdogExpirationTristateNotSpecdForEntirePort =(-200654);
NICONST.DAQmxErrorPowerupTristateNotSpecdForEntirePort = (-200653);
NICONST.DAQmxErrorPowerupStateNotSpecdForEntirePort =(-200652);
NICONST.DAQmxErrorCantSetWatchdogExpirationOnDigInChan = (-200651);
NICONST.DAQmxErrorCantSetPowerupStateOnDigInChan = (-200650);
NICONST.DAQmxErrorPhysChanNotInTask =(-200649);
NICONST.DAQmxErrorPhysChanDevNotInTask = (-200648);
NICONST.DAQmxErrorDigInputNotSupported = (-200647);
NICONST.DAQmxErrorDigFilterIntervalNotEqualForLines =(-200646);
NICONST.DAQmxErrorDigFilterIntervalAlreadyCfgd = (-200645);
NICONST.DAQmxErrorCantResetExpiredWatchdog = (-200644);
NICONST.DAQmxErrorActiveChanTooManyLinesSpecdWhenGettingPrpty =(-200643);
NICONST.DAQmxErrorActiveChanNotSpecdWhenGetting1LinePrpty =(-200642);
NICONST.DAQmxErrorDigPrptyCannotBeSetPerLine = (-200641);
NICONST.DAQmxErrorSendAdvCmpltAfterWaitForTrigInScanlist = (-200640);
NICONST.DAQmxErrorDisconnectionRequiredInScanlist =(-200639);
NICONST.DAQmxErrorTwoWaitForTrigsAfterConnectionInScanlist = (-200638);
NICONST.DAQmxErrorActionSeparatorRequiredAfterBreakingConnectionInScanlist = (-200637);
NICONST.DAQmxErrorConnectionInScanlistMustWaitForTrig =(-200636);
NICONST.DAQmxErrorActionNotSupportedTaskNotWatchdog =(-200635);
NICONST.DAQmxErrorWfmNameSameAsScriptName =(-200634);
NICONST.DAQmxErrorScriptNameSameAsWfmName =(-200633);
NICONST.DAQmxErrorDSFStopClock = (-200632);
NICONST.DAQmxErrorDSFReadyForStartClock =(-200631);
NICONST.DAQmxErrorWriteOffsetNotMultOfIncr = (-200630);
NICONST.DAQmxErrorDifferentPrptyValsNotSupportedOnDev =(-200629);
NICONST.DAQmxErrorRefAndPauseTrigConfigured =(-200628);
NICONST.DAQmxErrorFailedToEnableHighSpeedInputClock =(-200627);
NICONST.DAQmxErrorEmptyPhysChanInPowerUpStatesArray =(-200626);
NICONST.DAQmxErrorActivePhysChanTooManyLinesSpecdWhenGettingPrpty =(-200625);
NICONST.DAQmxErrorActivePhysChanNotSpecdWhenGetting1LinePrpty =(-200624);
NICONST.DAQmxErrorPXIDevTempCausedShutDown = (-200623);
NICONST.DAQmxErrorInvalidNumSampsToWrite = (-200622);
NICONST.DAQmxErrorOutputFIFOUnderflow2 = (-200621);
NICONST.DAQmxErrorRepeatedAIPhysicalChan = (-200620);
NICONST.DAQmxErrorMultScanOpsInOneChassis =(-200619);
NICONST.DAQmxErrorInvalidAIChanOrder = (-200618);
NICONST.DAQmxErrorReversePowerProtectionActivated =(-200617);
NICONST.DAQmxErrorInvalidAsynOpHandle =(-200616);
NICONST.DAQmxErrorFailedToEnableHighSpeedOutput =(-200615);
NICONST.DAQmxErrorCannotReadPastEndOfRecord =(-200614);
NICONST.DAQmxErrorAcqStoppedToPreventInputBufferOverwriteOneDataXferMech = (-200613);
NICONST.DAQmxErrorZeroBasedChanIndexInvalid =(-200612);
NICONST.DAQmxErrorNoChansOfGivenTypeInTask = (-200611);
NICONST.DAQmxErrorSampClkSrcInvalidForOutputValidForInput =(-200610);
NICONST.DAQmxErrorOutputBufSizeTooSmallToStartGen =(-200609);
NICONST.DAQmxErrorInputBufSizeTooSmallToStartAcq = (-200608);
NICONST.DAQmxErrorExportTwoSignalsOnSameTerminal = (-200607);
NICONST.DAQmxErrorChanIndexInvalid = (-200606);
NICONST.DAQmxErrorRangeSyntaxNumberTooBig =(-200605);
NICONST.DAQmxErrorNULLPtr =(-200604);
NICONST.DAQmxErrorScaledMinEqualMax =(-200603);
NICONST.DAQmxErrorPreScaledMinEqualMax = (-200602);
NICONST.DAQmxErrorPropertyNotSupportedForScaleType = (-200601);
NICONST.DAQmxErrorChannelNameGenerationNumberTooBig =(-200600);
NICONST.DAQmxErrorRepeatedNumberInScaledValues = (-200599);
NICONST.DAQmxErrorRepeatedNumberInPreScaledValues =(-200598);
NICONST.DAQmxErrorLinesAlreadyReservedForOutput =(-200597);
NICONST.DAQmxErrorSwitchOperationChansSpanMultipleDevsInList = (-200596);
NICONST.DAQmxErrorInvalidIDInListAtBeginningOfSwitchOperation =(-200595);
NICONST.DAQmxErrorMStudioInvalidPolyDirection =(-200594);
NICONST.DAQmxErrorMStudioPropertyGetWhileTaskNotVerified = (-200593);
NICONST.DAQmxErrorRangeWithTooManyObjects =(-200592);
NICONST.DAQmxErrorCppDotNetAPINegativeBufferSize = (-200591);
NICONST.DAQmxErrorCppCantRemoveInvalidEventHandler = (-200590);
NICONST.DAQmxErrorCppCantRemoveEventHandlerTwice = (-200589);
NICONST.DAQmxErrorCppCantRemoveOtherObjectsEventHandler =(-200588);
NICONST.DAQmxErrorDigLinesReservedOrUnavailable =(-200587);
NICONST.DAQmxErrorDSFFailedToResetStream = (-200586);
NICONST.DAQmxErrorDSFReadyForOutputNotAsserted = (-200585);
NICONST.DAQmxErrorSampToWritePerChanNotMultipleOfIncr =(-200584);
NICONST.DAQmxErrorAOPropertiesCauseVoltageBelowMin = (-200583);
NICONST.DAQmxErrorAOPropertiesCauseVoltageOverMax =(-200582);
NICONST.DAQmxErrorPropertyNotSupportedWhenRefClkSrcNone =(-200581);
NICONST.DAQmxErrorAIMaxTooSmall =(-200580);
NICONST.DAQmxErrorAIMaxTooLarge =(-200579);
NICONST.DAQmxErrorAIMinTooSmall =(-200578);
NICONST.DAQmxErrorAIMinTooLarge =(-200577);
NICONST.DAQmxErrorBuiltInCJCSrcNotSupported =(-200576);
NICONST.DAQmxErrorTooManyPostTrigSampsPerChan =(-200575);
NICONST.DAQmxErrorTrigLineNotFoundSingleDevRoute = (-200574);
NICONST.DAQmxErrorDifferentInternalAIInputSources =(-200573);
NICONST.DAQmxErrorDifferentAIInputSrcInOneChanGroup =(-200572);
NICONST.DAQmxErrorInternalAIInputSrcInMultipleChanGroups = (-200571);
NICONST.DAQmxErrorCAPIChanIndexInvalid = (-200570);
NICONST.DAQmxErrorCollectionDoesNotMatchChanType = (-200569);
NICONST.DAQmxErrorOutputCantStartChangedRegenerationMode = (-200568);
NICONST.DAQmxErrorOutputCantStartChangedBufferSize = (-200567);
NICONST.DAQmxErrorChanSizeTooBigForU32PortWrite =(-200566);
NICONST.DAQmxErrorChanSizeTooBigForU8PortWrite = (-200565);
NICONST.DAQmxErrorChanSizeTooBigForU32PortRead = (-200564);
NICONST.DAQmxErrorChanSizeTooBigForU8PortRead =(-200563);
NICONST.DAQmxErrorInvalidDigDataWrite =(-200562);
NICONST.DAQmxErrorInvalidAODataWrite = (-200561);
NICONST.DAQmxErrorWaitUntilDoneDoesNotIndicateDone = (-200560);
NICONST.DAQmxErrorMultiChanTypesInTask = (-200559);
NICONST.DAQmxErrorMultiDevsInTask =(-200558);
NICONST.DAQmxErrorCannotSetPropertyWhenTaskRunning = (-200557);
NICONST.DAQmxErrorCannotGetPropertyWhenTaskNotCommittedOrRunning = (-200556);
NICONST.DAQmxErrorLeadingUnderscoreInString =(-200555);
NICONST.DAQmxErrorTrailingSpaceInString =(-200554);
NICONST.DAQmxErrorLeadingSpaceInString = (-200553);
NICONST.DAQmxErrorInvalidCharInString =(-200552);
NICONST.DAQmxErrorDLLBecameUnlocked =(-200551);
NICONST.DAQmxErrorDLLLock =(-200550);
NICONST.DAQmxErrorSelfCalConstsInvalid = (-200549);
NICONST.DAQmxErrorInvalidTrigCouplingExceptForExtTrigChan =(-200548);
NICONST.DAQmxErrorWriteFailsBufferSizeAutoConfigured = (-200547);
NICONST.DAQmxErrorExtCalAdjustExtRefVoltageFailed =(-200546);
NICONST.DAQmxErrorSelfCalFailedExtNoiseOrRefVoltageOutOfCal =(-200545);
NICONST.DAQmxErrorExtCalTemperatureNotDAQmx =(-200544);
NICONST.DAQmxErrorExtCalDateTimeNotDAQmx = (-200543);
NICONST.DAQmxErrorSelfCalTemperatureNotDAQmx = (-200542);
NICONST.DAQmxErrorSelfCalDateTimeNotDAQmx =(-200541);
NICONST.DAQmxErrorDACRefValNotSet =(-200540);
NICONST.DAQmxErrorAnalogMultiSampWriteNotSupported = (-200539);
NICONST.DAQmxErrorInvalidActionInControlTask = (-200538);
NICONST.DAQmxErrorPolyCoeffsInconsistent = (-200537);
NICONST.DAQmxErrorSensorValTooLow =(-200536);
NICONST.DAQmxErrorSensorValTooHigh = (-200535);
NICONST.DAQmxErrorWaveformNameTooLong =(-200534);
NICONST.DAQmxErrorIdentifierTooLongInScript =(-200533);
NICONST.DAQmxErrorUnexpectedIDFollowingSwitchChanName =(-200532);
NICONST.DAQmxErrorRelayNameNotSpecifiedInList =(-200531);
NICONST.DAQmxErrorUnexpectedIDFollowingRelayNameInList = (-200530);
NICONST.DAQmxErrorUnexpectedIDFollowingSwitchOpInList =(-200529);
NICONST.DAQmxErrorInvalidLineGrouping =(-200528);
NICONST.DAQmxErrorCtrMinMax =(-200527);
NICONST.DAQmxErrorWriteChanTypeMismatch =(-200526);
NICONST.DAQmxErrorReadChanTypeMismatch = (-200525);
NICONST.DAQmxErrorWriteNumChansMismatch =(-200524);
NICONST.DAQmxErrorOneChanReadForMultiChanTask =(-200523);
NICONST.DAQmxErrorCannotSelfCalDuringExtCal =(-200522);
NICONST.DAQmxErrorMeasCalAdjustOscillatorPhaseDAC =(-200521);
NICONST.DAQmxErrorInvalidCalConstCalADCAdjustment =(-200520);
NICONST.DAQmxErrorInvalidCalConstOscillatorFreqDACValue =(-200519);
NICONST.DAQmxErrorInvalidCalConstOscillatorPhaseDACValue = (-200518);
NICONST.DAQmxErrorInvalidCalConstOffsetDACValue =(-200517);
NICONST.DAQmxErrorInvalidCalConstGainDACValue =(-200516);
NICONST.DAQmxErrorInvalidNumCalADCReadsToAverage = (-200515);
NICONST.DAQmxErrorInvalidCfgCalAdjustDirectPathOutputImpedance = (-200514);
NICONST.DAQmxErrorInvalidCfgCalAdjustMainPathOutputImpedance = (-200513);
NICONST.DAQmxErrorInvalidCfgCalAdjustMainPathPostAmpGainAndOffset =(-200512);
NICONST.DAQmxErrorInvalidCfgCalAdjustMainPathPreAmpGain =(-200511);
NICONST.DAQmxErrorInvalidCfgCalAdjustMainPreAmpOffset =(-200510);
NICONST.DAQmxErrorMeasCalAdjustCalADC =(-200509);
NICONST.DAQmxErrorMeasCalAdjustOscillatorFrequency = (-200508);
NICONST.DAQmxErrorMeasCalAdjustDirectPathOutputImpedance = (-200507);
NICONST.DAQmxErrorMeasCalAdjustMainPathOutputImpedance = (-200506);
NICONST.DAQmxErrorMeasCalAdjustDirectPathGain =(-200505);
NICONST.DAQmxErrorMeasCalAdjustMainPathPostAmpGainAndOffset =(-200504);
NICONST.DAQmxErrorMeasCalAdjustMainPathPreAmpGain =(-200503);
NICONST.DAQmxErrorMeasCalAdjustMainPathPreAmpOffset =(-200502);
NICONST.DAQmxErrorInvalidDateTimeInEEPROM =(-200501);
NICONST.DAQmxErrorUnableToLocateErrorResources = (-200500);
NICONST.DAQmxErrorDotNetAPINotUnsigned32BitNumber =(-200499);
NICONST.DAQmxErrorInvalidRangeOfObjectsSyntaxInString =(-200498);
NICONST.DAQmxErrorAttemptToEnableLineNotPreviouslyDisabled = (-200497);
NICONST.DAQmxErrorInvalidCharInPattern = (-200496);
NICONST.DAQmxErrorIntermediateBufferFull = (-200495);
NICONST.DAQmxErrorLoadTaskFailsBecauseNoTimingOnDev =(-200494);
NICONST.DAQmxErrorCAPIReservedParamNotNULLNorEmpty = (-200493);
NICONST.DAQmxErrorCAPIReservedParamNotNULL = (-200492);
NICONST.DAQmxErrorCAPIReservedParamNotZero = (-200491);
NICONST.DAQmxErrorSampleValueOutOfRange =(-200490);
NICONST.DAQmxErrorChanAlreadyInTask =(-200489);
NICONST.DAQmxErrorVirtualChanDoesNotExist =(-200488);
NICONST.DAQmxErrorChanNotInTask =(-200486);
NICONST.DAQmxErrorTaskNotInDataNeighborhood =(-200485);
NICONST.DAQmxErrorCantSaveTaskWithoutReplace = (-200484);
NICONST.DAQmxErrorCantSaveChanWithoutReplace = (-200483);
NICONST.DAQmxErrorDevNotInTask = (-200482);
NICONST.DAQmxErrorDevAlreadyInTask = (-200481);
NICONST.DAQmxErrorCanNotPerformOpWhileTaskRunning =(-200479);
NICONST.DAQmxErrorCanNotPerformOpWhenNoChansInTask = (-200478);
NICONST.DAQmxErrorCanNotPerformOpWhenNoDevInTask = (-200477);
NICONST.DAQmxErrorCannotPerformOpWhenTaskNotRunning =(-200475);
NICONST.DAQmxErrorOperationTimedOut =(-200474);
NICONST.DAQmxErrorCannotReadWhenAutoStartFalseAndTaskNotRunningOrCommitted = (-200473);
NICONST.DAQmxErrorCannotWriteWhenAutoStartFalseAndTaskNotRunningOrCommitted =(-200472);
NICONST.DAQmxErrorTaskVersionNew = (-200470);
NICONST.DAQmxErrorChanVersionNew = (-200469);
NICONST.DAQmxErrorEmptyString =(-200467);
NICONST.DAQmxErrorChannelSizeTooBigForPortReadType = (-200466);
NICONST.DAQmxErrorChannelSizeTooBigForPortWriteType =(-200465);
NICONST.DAQmxErrorExpectedNumberOfChannelsVerificationFailed = (-200464);
NICONST.DAQmxErrorNumLinesMismatchInReadOrWrite =(-200463);
NICONST.DAQmxErrorOutputBufferEmpty =(-200462);
NICONST.DAQmxErrorInvalidChanName =(-200461);
NICONST.DAQmxErrorReadNoInputChansInTask = (-200460);
NICONST.DAQmxErrorWriteNoOutputChansInTask = (-200459);
NICONST.DAQmxErrorPropertyNotSupportedNotInputTask = (-200457);
NICONST.DAQmxErrorPropertyNotSupportedNotOutputTask =(-200456);
NICONST.DAQmxErrorGetPropertyNotInputBufferedTask =(-200455);
NICONST.DAQmxErrorGetPropertyNotOutputBufferedTask = (-200454);
NICONST.DAQmxErrorInvalidTimeoutVal =(-200453);
NICONST.DAQmxErrorAttributeNotSupportedInTaskContext = (-200452);
NICONST.DAQmxErrorAttributeNotQueryableUnlessTaskIsCommitted = (-200451);
NICONST.DAQmxErrorAttributeNotSettableWhenTaskIsRunning =(-200450);
NICONST.DAQmxErrorDACRngLowNotMinusRefValNorZero = (-200449);
NICONST.DAQmxErrorDACRngHighNotEqualRefVal = (-200448);
NICONST.DAQmxErrorUnitsNotFromCustomScale =(-200447);
NICONST.DAQmxErrorInvalidVoltageReadingDuringExtCal =(-200446);
NICONST.DAQmxErrorCalFunctionNotSupported =(-200445);
NICONST.DAQmxErrorInvalidPhysicalChanForCal =(-200444);
NICONST.DAQmxErrorExtCalNotComplete =(-200443);
NICONST.DAQmxErrorCantSyncToExtStimulusFreqDuringCal = (-200442);
NICONST.DAQmxErrorUnableToDetectExtStimulusFreqDuringCal = (-200441);
NICONST.DAQmxErrorInvalidCloseAction = (-200440);
NICONST.DAQmxErrorExtCalFunctionOutsideExtCalSession = (-200439);
NICONST.DAQmxErrorInvalidCalArea = (-200438);
NICONST.DAQmxErrorExtCalConstsInvalid =(-200437);
NICONST.DAQmxErrorStartTrigDelayWithExtSampClk = (-200436);
NICONST.DAQmxErrorDelayFromSampClkWithExtConv =(-200435);
NICONST.DAQmxErrorFewerThan2PreScaledVals =(-200434);
NICONST.DAQmxErrorFewerThan2ScaledValues = (-200433);
NICONST.DAQmxErrorPhysChanOutputType = (-200432);
NICONST.DAQmxErrorPhysChanMeasType = (-200431);
NICONST.DAQmxErrorInvalidPhysChanType =(-200430);
NICONST.DAQmxErrorLabVIEWEmptyTaskOrChans =(-200429);
NICONST.DAQmxErrorLabVIEWInvalidTaskOrChans =(-200428);
NICONST.DAQmxErrorInvalidRefClkRate =(-200427);
NICONST.DAQmxErrorInvalidExtTrigImpedance =(-200426);
NICONST.DAQmxErrorHystTrigLevelAIMax = (-200425);
NICONST.DAQmxErrorLineNumIncompatibleWithVideoSignalFormat = (-200424);
NICONST.DAQmxErrorTrigWindowAIMinAIMaxCombo =(-200423);
NICONST.DAQmxErrorTrigAIMinAIMax = (-200422);
NICONST.DAQmxErrorHystTrigLevelAIMin = (-200421);
NICONST.DAQmxErrorInvalidSampRateConsiderRIS = (-200420);
NICONST.DAQmxErrorInvalidReadPosDuringRIS =(-200419);
NICONST.DAQmxErrorImmedTrigDuringRISMode = (-200418);
NICONST.DAQmxErrorTDCNotEnabledDuringRISMode = (-200417);
NICONST.DAQmxErrorMultiRecWithRIS =(-200416);
NICONST.DAQmxErrorInvalidRefClkSrc = (-200415);
NICONST.DAQmxErrorInvalidSampClkSrc =(-200414);
NICONST.DAQmxErrorInsufficientOnBoardMemForNumRecsAndSamps = (-200413);
NICONST.DAQmxErrorInvalidAIAttenuation = (-200412);
NICONST.DAQmxErrorACCouplingNotAllowedWith50OhmImpedance = (-200411);
NICONST.DAQmxErrorInvalidRecordNum = (-200410);
NICONST.DAQmxErrorZeroSlopeLinearScale = (-200409);
NICONST.DAQmxErrorZeroReversePolyScaleCoeffs = (-200408);
NICONST.DAQmxErrorZeroForwardPolyScaleCoeffs = (-200407);
NICONST.DAQmxErrorNoReversePolyScaleCoeffs = (-200406);
NICONST.DAQmxErrorNoForwardPolyScaleCoeffs = (-200405);
NICONST.DAQmxErrorNoPolyScaleCoeffs =(-200404);
NICONST.DAQmxErrorReversePolyOrderLessThanNumPtsToCompute =(-200403);
NICONST.DAQmxErrorReversePolyOrderNotPositive =(-200402);
NICONST.DAQmxErrorNumPtsToComputeNotPositive = (-200401);
NICONST.DAQmxErrorWaveformLengthNotMultipleOfIncr =(-200400);
NICONST.DAQmxErrorCAPINoExtendedErrorInfoAvailable = (-200399);
NICONST.DAQmxErrorCVIFunctionNotFoundInDAQmxDLL =(-200398);
NICONST.DAQmxErrorCVIFailedToLoadDAQmxDLL =(-200397);
NICONST.DAQmxErrorNoCommonTrigLineForImmedRoute =(-200396);
NICONST.DAQmxErrorNoCommonTrigLineForTaskRoute = (-200395);
NICONST.DAQmxErrorF64PrptyValNotUnsignedInt =(-200394);
NICONST.DAQmxErrorRegisterNotWritable =(-200393);
NICONST.DAQmxErrorInvalidOutputVoltageAtSampClkRate =(-200392);
NICONST.DAQmxErrorStrobePhaseShiftDCMBecameUnlocked =(-200391);
NICONST.DAQmxErrorDrivePhaseShiftDCMBecameUnlocked = (-200390);
NICONST.DAQmxErrorClkOutPhaseShiftDCMBecameUnlocked =(-200389);
NICONST.DAQmxErrorOutputBoardClkDCMBecameUnlocked =(-200388);
NICONST.DAQmxErrorInputBoardClkDCMBecameUnlocked = (-200387);
NICONST.DAQmxErrorInternalClkDCMBecameUnlocked = (-200386);
NICONST.DAQmxErrorDCMLock =(-200385);
NICONST.DAQmxErrorDataLineReservedForDynamicOutput = (-200384);
NICONST.DAQmxErrorInvalidRefClkSrcGivenSampClkSrc =(-200383);
NICONST.DAQmxErrorNoPatternMatcherAvailable =(-200382);
NICONST.DAQmxErrorInvalidDelaySampRateBelowPhaseShiftDCMThresh = (-200381);
NICONST.DAQmxErrorStrainGageCalibration =(-200380);
NICONST.DAQmxErrorInvalidExtClockFreqAndDivCombo = (-200379);
NICONST.DAQmxErrorCustomScaleDoesNotExist =(-200378);
NICONST.DAQmxErrorOnlyFrontEndChanOpsDuringScan =(-200377);
NICONST.DAQmxErrorInvalidOptionForDigitalPortChannel = (-200376);
NICONST.DAQmxErrorUnsupportedSignalTypeExportSignal =(-200375);
NICONST.DAQmxErrorInvalidSignalTypeExportSignal =(-200374);
NICONST.DAQmxErrorUnsupportedTrigTypeSendsSWTrig = (-200373);
NICONST.DAQmxErrorInvalidTrigTypeSendsSWTrig = (-200372);
NICONST.DAQmxErrorRepeatedPhysicalChan = (-200371);
NICONST.DAQmxErrorResourcesInUseForRouteInTask = (-200370);
NICONST.DAQmxErrorResourcesInUseForRoute = (-200369);
NICONST.DAQmxErrorRouteNotSupportedByHW =(-200368);
NICONST.DAQmxErrorResourcesInUseForExportSignalPolarity =(-200367);
NICONST.DAQmxErrorResourcesInUseForInversionInTask = (-200366);
NICONST.DAQmxErrorResourcesInUseForInversion = (-200365);
NICONST.DAQmxErrorExportSignalPolarityNotSupportedByHW = (-200364);
NICONST.DAQmxErrorInversionNotSupportedByHW =(-200363);
NICONST.DAQmxErrorOverloadedChansExistNotRead =(-200362);
NICONST.DAQmxErrorInputFIFOOverflow2 = (-200361);
NICONST.DAQmxErrorCJCChanNotSpecd =(-200360);
NICONST.DAQmxErrorCtrExportSignalNotPossible = (-200359);
NICONST.DAQmxErrorRefTrigWhenContinuous =(-200358);
NICONST.DAQmxErrorIncompatibleSensorOutputAndDeviceInputRanges = (-200357);
NICONST.DAQmxErrorCustomScaleNameUsed =(-200356);
NICONST.DAQmxErrorPropertyValNotSupportedByHW =(-200355);
NICONST.DAQmxErrorPropertyValNotValidTermName =(-200354);
NICONST.DAQmxErrorResourcesInUseForProperty =(-200353);
NICONST.DAQmxErrorCJCChanAlreadyUsed = (-200352);
NICONST.DAQmxErrorForwardPolynomialCoefNotSpecd =(-200351);
NICONST.DAQmxErrorTableScaleNumPreScaledAndScaledValsNotEqual =(-200350);
NICONST.DAQmxErrorTableScalePreScaledValsNotSpecd =(-200349);
NICONST.DAQmxErrorTableScaleScaledValsNotSpecd = (-200348);
NICONST.DAQmxErrorIntermediateBufferSizeNotMultipleOfIncr =(-200347);
NICONST.DAQmxErrorEventPulseWidthOutOfRange =(-200346);
NICONST.DAQmxErrorEventDelayOutOfRange = (-200345);
NICONST.DAQmxErrorSampPerChanNotMultipleOfIncr = (-200344);
NICONST.DAQmxErrorCannotCalculateNumSampsTaskNotStarted =(-200343);
NICONST.DAQmxErrorScriptNotInMem = (-200342);
NICONST.DAQmxErrorOnboardMemTooSmall = (-200341);
NICONST.DAQmxErrorReadAllAvailableDataWithoutBuffer =(-200340);
NICONST.DAQmxErrorPulseActiveAtStart = (-200339);
NICONST.DAQmxErrorCalTempNotSupported =(-200338);
NICONST.DAQmxErrorDelayFromSampClkTooLong =(-200337);
NICONST.DAQmxErrorDelayFromSampClkTooShort = (-200336);
NICONST.DAQmxErrorAIConvRateTooHigh =(-200335);
NICONST.DAQmxErrorDelayFromStartTrigTooLong =(-200334);
NICONST.DAQmxErrorDelayFromStartTrigTooShort = (-200333);
NICONST.DAQmxErrorSampRateTooHigh =(-200332);
NICONST.DAQmxErrorSampRateTooLow = (-200331);
NICONST.DAQmxErrorPFI0UsedForAnalogAndDigitalSrc = (-200330);
NICONST.DAQmxErrorPrimingCfgFIFO = (-200329);
NICONST.DAQmxErrorCannotOpenTopologyCfgFile =(-200328);
NICONST.DAQmxErrorInvalidDTInsideWfmDataType = (-200327);
NICONST.DAQmxErrorRouteSrcAndDestSame =(-200326);
NICONST.DAQmxErrorReversePolynomialCoefNotSpecd =(-200325);
NICONST.DAQmxErrorDevAbsentOrUnavailable = (-200324);
NICONST.DAQmxErrorNoAdvTrigForMultiDevScan = (-200323);
NICONST.DAQmxErrorInterruptsInsufficientDataXferMech = (-200322);
NICONST.DAQmxErrorInvalidAttentuationBasedOnMinMax = (-200321);
NICONST.DAQmxErrorCabledModuleCannotRouteSSH = (-200320);
NICONST.DAQmxErrorCabledModuleCannotRouteConvClk = (-200319);
NICONST.DAQmxErrorInvalidExcitValForScaling =(-200318);
NICONST.DAQmxErrorNoDevMemForScript =(-200317);
NICONST.DAQmxErrorScriptDataUnderflow =(-200316);
NICONST.DAQmxErrorNoDevMemForWaveform =(-200315);
NICONST.DAQmxErrorStreamDCMBecameUnlocked =(-200314);
NICONST.DAQmxErrorStreamDCMLock =(-200313);
NICONST.DAQmxErrorWaveformNotInMem = (-200312);
NICONST.DAQmxErrorWaveformWriteOutOfBounds = (-200311);
NICONST.DAQmxErrorWaveformPreviouslyAllocated =(-200310);
NICONST.DAQmxErrorSampClkTbMasterTbDivNotAppropriateForSampTbSrc = (-200309);
NICONST.DAQmxErrorSampTbRateSampTbSrcMismatch =(-200308);
NICONST.DAQmxErrorMasterTbRateMasterTbSrcMismatch =(-200307);
NICONST.DAQmxErrorSampsPerChanTooBig = (-200306);
NICONST.DAQmxErrorFinitePulseTrainNotPossible =(-200305);
NICONST.DAQmxErrorExtMasterTimebaseRateNotSpecified =(-200304);
NICONST.DAQmxErrorExtSampClkSrcNotSpecified =(-200303);
NICONST.DAQmxErrorInputSignalSlowerThanMeasTime =(-200302);
NICONST.DAQmxErrorCannotUpdatePulseGenProperty = (-200301);
NICONST.DAQmxErrorInvalidTimingType =(-200300);
NICONST.DAQmxErrorPropertyUnavailWhenUsingOnboardMemory =(-200297);
NICONST.DAQmxErrorCannotWriteAfterStartWithOnboardMemory = (-200295);
NICONST.DAQmxErrorNotEnoughSampsWrittenForInitialXferRqstCondition = (-200294);
NICONST.DAQmxErrorNoMoreSpace =(-200293);
NICONST.DAQmxErrorSamplesCanNotYetBeWritten =(-200292);
NICONST.DAQmxErrorGenStoppedToPreventIntermediateBufferRegenOfOldSamples = (-200291);
NICONST.DAQmxErrorGenStoppedToPreventRegenOfOldSamples = (-200290);
NICONST.DAQmxErrorSamplesNoLongerWriteable = (-200289);
NICONST.DAQmxErrorSamplesWillNeverBeGenerated =(-200288);
NICONST.DAQmxErrorNegativeWriteSampleNumber =(-200287);
NICONST.DAQmxErrorNoAcqStarted = (-200286);
NICONST.DAQmxErrorSamplesNotYetAvailable = (-200284);
NICONST.DAQmxErrorAcqStoppedToPreventIntermediateBufferOverflow =(-200283);
NICONST.DAQmxErrorNoRefTrigConfigured =(-200282);
NICONST.DAQmxErrorCannotReadRelativeToRefTrigUntilDone = (-200281);
NICONST.DAQmxErrorSamplesNoLongerAvailable = (-200279);
NICONST.DAQmxErrorSamplesWillNeverBeAvailable =(-200278);
NICONST.DAQmxErrorNegativeReadSampleNumber = (-200277);
NICONST.DAQmxErrorExternalSampClkAndRefClkThruSameTerm = (-200276);
NICONST.DAQmxErrorExtSampClkRateTooLowForClkIn = (-200275);
NICONST.DAQmxErrorExtSampClkRateTooHighForBackplane =(-200274);
NICONST.DAQmxErrorSampClkRateAndDivCombo = (-200273);
NICONST.DAQmxErrorSampClkRateTooLowForDivDown =(-200272);
NICONST.DAQmxErrorProductOfAOMinAndGainTooSmall =(-200271);
NICONST.DAQmxErrorInterpolationRateNotPossible = (-200270);
NICONST.DAQmxErrorOffsetTooLarge = (-200269);
NICONST.DAQmxErrorOffsetTooSmall = (-200268);
NICONST.DAQmxErrorProductOfAOMaxAndGainTooLarge =(-200267);
NICONST.DAQmxErrorMinAndMaxNotSymmetric =(-200266);
NICONST.DAQmxErrorInvalidAnalogTrigSrc = (-200265);
NICONST.DAQmxErrorTooManyChansForAnalogRefTrig = (-200264);
NICONST.DAQmxErrorTooManyChansForAnalogPauseTrig = (-200263);
NICONST.DAQmxErrorTrigWhenOnDemandSampTiming = (-200262);
NICONST.DAQmxErrorInconsistentAnalogTrigSettings = (-200261);
NICONST.DAQmxErrorMemMapDataXferModeSampTimingCombo =(-200260);
NICONST.DAQmxErrorInvalidJumperedAttr =(-200259);
NICONST.DAQmxErrorInvalidGainBasedOnMinMax = (-200258);
NICONST.DAQmxErrorInconsistentExcit =(-200257);
NICONST.DAQmxErrorTopologyNotSupportedByCfgTermBlock = (-200256);
NICONST.DAQmxErrorBuiltInTempSensorNotSupported =(-200255);
NICONST.DAQmxErrorInvalidTerm =(-200254);
NICONST.DAQmxErrorCannotTristateTerm = (-200253);
NICONST.DAQmxErrorCannotTristateBusyTerm = (-200252);
NICONST.DAQmxErrorNoDMAChansAvailable =(-200251);
NICONST.DAQmxErrorInvalidWaveformLengthWithinLoopInScript =(-200250);
NICONST.DAQmxErrorInvalidSubsetLengthWithinLoopInScript =(-200249);
NICONST.DAQmxErrorMarkerPosInvalidForLoopInScript =(-200248);
NICONST.DAQmxErrorIntegerExpectedInScript =(-200247);
NICONST.DAQmxErrorPLLBecameUnlocked =(-200246);
NICONST.DAQmxErrorPLLLock =(-200245);
NICONST.DAQmxErrorDDCClkOutDCMBecameUnlocked = (-200244);
NICONST.DAQmxErrorDDCClkOutDCMLock = (-200243);
NICONST.DAQmxErrorClkDoublerDCMBecameUnlocked =(-200242);
NICONST.DAQmxErrorClkDoublerDCMLock =(-200241);
NICONST.DAQmxErrorSampClkDCMBecameUnlocked = (-200240);
NICONST.DAQmxErrorSampClkDCMLock = (-200239);
NICONST.DAQmxErrorSampClkTimebaseDCMBecameUnlocked = (-200238);
NICONST.DAQmxErrorSampClkTimebaseDCMLock = (-200237);
NICONST.DAQmxErrorAttrCannotBeReset =(-200236);
NICONST.DAQmxErrorExplanationNotFound =(-200235);
NICONST.DAQmxErrorWriteBufferTooSmall =(-200234);
NICONST.DAQmxErrorSpecifiedAttrNotValid =(-200233);
NICONST.DAQmxErrorAttrCannotBeRead = (-200232);
NICONST.DAQmxErrorAttrCannotBeSet =(-200231);
NICONST.DAQmxErrorNULLPtrForC_Api =(-200230);
NICONST.DAQmxErrorReadBufferTooSmall = (-200229);
NICONST.DAQmxErrorBufferTooSmallForString =(-200228);
NICONST.DAQmxErrorNoAvailTrigLinesOnDevice = (-200227);
NICONST.DAQmxErrorTrigBusLineNotAvail =(-200226);
NICONST.DAQmxErrorCouldNotReserveRequestedTrigLine = (-200225);
NICONST.DAQmxErrorTrigLineNotFound = (-200224);
NICONST.DAQmxErrorSCXI1126ThreshHystCombination =(-200223);
NICONST.DAQmxErrorAcqStoppedToPreventInputBufferOverwrite =(-200222);
NICONST.DAQmxErrorTimeoutExceeded =(-200221);
NICONST.DAQmxErrorInvalidDeviceID =(-200220);
NICONST.DAQmxErrorInvalidAOChanOrder = (-200219);
NICONST.DAQmxErrorSampleTimingTypeAndDataXferMode =(-200218);
NICONST.DAQmxErrorBufferWithOnDemandSampTiming = (-200217);
NICONST.DAQmxErrorBufferAndDataXferMode =(-200216);
NICONST.DAQmxErrorMemMapAndBuffer =(-200215);
NICONST.DAQmxErrorNoAnalogTrigHW = (-200214);
NICONST.DAQmxErrorTooManyPretrigPlusMinPostTrigSamps = (-200213);
NICONST.DAQmxErrorInconsistentUnitsSpecified = (-200212);
NICONST.DAQmxErrorMultipleRelaysForSingleRelayOp = (-200211);
NICONST.DAQmxErrorMultipleDevIDsPerChassisSpecifiedInList =(-200210);
NICONST.DAQmxErrorDuplicateDevIDInList = (-200209);
NICONST.DAQmxErrorInvalidRangeStatementCharInList =(-200208);
NICONST.DAQmxErrorInvalidDeviceIDInList =(-200207);
NICONST.DAQmxErrorTriggerPolarityConflict =(-200206);
NICONST.DAQmxErrorCannotScanWithCurrentTopology =(-200205);
NICONST.DAQmxErrorUnexpectedIdentifierInFullySpecifiedPathInList = (-200204);
NICONST.DAQmxErrorSwitchCannotDriveMultipleTrigLines = (-200203);
NICONST.DAQmxErrorInvalidRelayName = (-200202);
NICONST.DAQmxErrorSwitchScanlistTooBig = (-200201);
NICONST.DAQmxErrorSwitchChanInUse =(-200200);
NICONST.DAQmxErrorSwitchNotResetBeforeScan = (-200199);
NICONST.DAQmxErrorInvalidTopology =(-200198);
NICONST.DAQmxErrorAttrNotSupported = (-200197);
NICONST.DAQmxErrorUnexpectedEndOfActionsInList = (-200196);
NICONST.DAQmxErrorPowerBudgetExceeded =(-200195);
NICONST.DAQmxErrorHWUnexpectedlyPoweredOffAndOn =(-200194);
NICONST.DAQmxErrorSwitchOperationNotSupported =(-200193);
NICONST.DAQmxErrorOnlyContinuousScanSupported =(-200192);
NICONST.DAQmxErrorSwitchDifferentTopologyWhenScanning =(-200191);
NICONST.DAQmxErrorDisconnectPathNotSameAsExistingPath =(-200190);
NICONST.DAQmxErrorConnectionNotPermittedOnChanReservedForRouting = (-200189);
NICONST.DAQmxErrorCannotConnectSrcChans =(-200188);
NICONST.DAQmxErrorCannotConnectChannelToItself = (-200187);
NICONST.DAQmxErrorChannelNotReservedForRouting = (-200186);
NICONST.DAQmxErrorCannotConnectChansDirectly = (-200185);
NICONST.DAQmxErrorChansAlreadyConnected =(-200184);
NICONST.DAQmxErrorChanDuplicatedInPath = (-200183);
NICONST.DAQmxErrorNoPathToDisconnect = (-200182);
NICONST.DAQmxErrorInvalidSwitchChan =(-200181);
NICONST.DAQmxErrorNoPathAvailableBetween2SwitchChans = (-200180);
NICONST.DAQmxErrorExplicitConnectionExists = (-200179);
NICONST.DAQmxErrorSwitchDifferentSettlingTimeWhenScanning =(-200178);
NICONST.DAQmxErrorOperationOnlyPermittedWhileScanning =(-200177);
NICONST.DAQmxErrorOperationNotPermittedWhileScanning = (-200176);
NICONST.DAQmxErrorHardwareNotResponding =(-200175);
NICONST.DAQmxErrorInvalidSampAndMasterTimebaseRateCombo =(-200173);
NICONST.DAQmxErrorNonZeroBufferSizeInProgIOXfer =(-200172);
NICONST.DAQmxErrorVirtualChanNameUsed =(-200171);
NICONST.DAQmxErrorPhysicalChanDoesNotExist = (-200170);
NICONST.DAQmxErrorMemMapOnlyForProgIOXfer =(-200169);
NICONST.DAQmxErrorTooManyChans = (-200168);
NICONST.DAQmxErrorCannotHaveCJTempWithOtherChans = (-200167);
NICONST.DAQmxErrorOutputBufferUnderwrite = (-200166);
NICONST.DAQmxErrorSensorInvalidCompletionResistance =(-200163);
NICONST.DAQmxErrorVoltageExcitIncompatibleWith2WireCfg = (-200162);
NICONST.DAQmxErrorIntExcitSrcNotAvailable =(-200161);
NICONST.DAQmxErrorCannotCreateChannelAfterTaskVerified = (-200160);
NICONST.DAQmxErrorLinesReservedForSCXIControl =(-200159);
NICONST.DAQmxErrorCouldNotReserveLinesForSCXIControl = (-200158);
NICONST.DAQmxErrorCalibrationFailed =(-200157);
NICONST.DAQmxErrorReferenceFrequencyInvalid =(-200156);
NICONST.DAQmxErrorReferenceResistanceInvalid = (-200155);
NICONST.DAQmxErrorReferenceCurrentInvalid =(-200154);
NICONST.DAQmxErrorReferenceVoltageInvalid =(-200153);
NICONST.DAQmxErrorEEPROMDataInvalid =(-200152);
NICONST.DAQmxErrorCabledModuleNotCapableOfRoutingAI =(-200151);
NICONST.DAQmxErrorChannelNotAvailableInParallelMode =(-200150);
NICONST.DAQmxErrorExternalTimebaseRateNotKnownForDelay = (-200149);
NICONST.DAQmxErrorFREQOUTCannotProduceDesiredFrequency = (-200148);
NICONST.DAQmxErrorMultipleCounterInputTask = (-200147);
NICONST.DAQmxErrorCounterStartPauseTriggerConflict = (-200146);
NICONST.DAQmxErrorCounterInputPauseTriggerAndSampleClockInvalid =(-200145);
NICONST.DAQmxErrorCounterOutputPauseTriggerInvalid = (-200144);
NICONST.DAQmxErrorCounterTimebaseRateNotSpecified =(-200143);
NICONST.DAQmxErrorCounterTimebaseRateNotFound =(-200142);
NICONST.DAQmxErrorCounterOverflow =(-200141);
NICONST.DAQmxErrorCounterNoTimebaseEdgesBetweenGates = (-200140);
NICONST.DAQmxErrorCounterMaxMinRangeFreq = (-200139);
NICONST.DAQmxErrorCounterMaxMinRangeTime = (-200138);
NICONST.DAQmxErrorSuitableTimebaseNotFoundTimeCombo =(-200137);
NICONST.DAQmxErrorSuitableTimebaseNotFoundFrequencyCombo = (-200136);
NICONST.DAQmxErrorInternalTimebaseSourceDivisorCombo = (-200135);
NICONST.DAQmxErrorInternalTimebaseSourceRateCombo =(-200134);
NICONST.DAQmxErrorInternalTimebaseRateDivisorSourceCombo = (-200133);
NICONST.DAQmxErrorExternalTimebaseRateNotknownForRate =(-200132);
NICONST.DAQmxErrorAnalogTrigChanNotFirstInScanList = (-200131);
NICONST.DAQmxErrorNoDivisorForExternalSignal = (-200130);
NICONST.DAQmxErrorAttributeInconsistentAcrossRepeatedPhysicalChannels =(-200128);
NICONST.DAQmxErrorCannotHandshakeWithPort0 = (-200127);
NICONST.DAQmxErrorControlLineConflictOnPortC = (-200126);
NICONST.DAQmxErrorLines4To7ConfiguredForOutput = (-200125);
NICONST.DAQmxErrorLines4To7ConfiguredForInput =(-200124);
NICONST.DAQmxErrorLines0To3ConfiguredForOutput = (-200123);
NICONST.DAQmxErrorLines0To3ConfiguredForInput =(-200122);
NICONST.DAQmxErrorPortConfiguredForOutput =(-200121);
NICONST.DAQmxErrorPortConfiguredForInput = (-200120);
NICONST.DAQmxErrorPortConfiguredForStaticDigitalOps =(-200119);
NICONST.DAQmxErrorPortReservedForHandshaking = (-200118);
NICONST.DAQmxErrorPortDoesNotSupportHandshakingDataIO =(-200117);
NICONST.DAQmxErrorCannotTristate8255OutputLines =(-200116);
NICONST.DAQmxErrorTemperatureOutOfRangeForCalibration =(-200113);
NICONST.DAQmxErrorCalibrationHandleInvalid = (-200112);
NICONST.DAQmxErrorPasswordRequired = (-200111);
NICONST.DAQmxErrorIncorrectPassword =(-200110);
NICONST.DAQmxErrorPasswordTooLong =(-200109);
NICONST.DAQmxErrorCalibrationSessionAlreadyOpen =(-200108);
NICONST.DAQmxErrorSCXIModuleIncorrect =(-200107);
NICONST.DAQmxErrorAttributeInconsistentAcrossChannelsOnDevice =(-200106);
NICONST.DAQmxErrorSCXI1122ResistanceChanNotSupportedForCfg = (-200105);
NICONST.DAQmxErrorBracketPairingMismatchInList = (-200104);
NICONST.DAQmxErrorInconsistentNumSamplesToWrite =(-200103);
NICONST.DAQmxErrorIncorrectDigitalPattern =(-200102);
NICONST.DAQmxErrorIncorrectNumChannelsToWrite =(-200101);
NICONST.DAQmxErrorIncorrectReadFunction =(-200100);
NICONST.DAQmxErrorPhysicalChannelNotSpecified =(-200099);
NICONST.DAQmxErrorMoreThanOneTerminal =(-200098);
NICONST.DAQmxErrorMoreThanOneActiveChannelSpecified =(-200097);
NICONST.DAQmxErrorInvalidNumberSamplesToRead = (-200096);
NICONST.DAQmxErrorAnalogWaveformExpected = (-200095);
NICONST.DAQmxErrorDigitalWaveformExpected =(-200094);
NICONST.DAQmxErrorActiveChannelNotSpecified =(-200093);
NICONST.DAQmxErrorFunctionNotSupportedForDeviceTasks = (-200092);
NICONST.DAQmxErrorFunctionNotInLibrary = (-200091);
NICONST.DAQmxErrorLibraryNotPresent =(-200090);
NICONST.DAQmxErrorDuplicateTask =(-200089);
NICONST.DAQmxErrorInvalidTask =(-200088);
NICONST.DAQmxErrorInvalidChannel = (-200087);
NICONST.DAQmxErrorInvalidSyntaxForPhysicalChannelRange = (-200086);
NICONST.DAQmxErrorMinNotLessThanMax =(-200082);
NICONST.DAQmxErrorSampleRateNumChansConvertPeriodCombo = (-200081);
NICONST.DAQmxErrorAODuringCounter1DMAConflict =(-200079);
NICONST.DAQmxErrorAIDuringCounter0DMAConflict =(-200078);
NICONST.DAQmxErrorInvalidAttributeValue =(-200077);
NICONST.DAQmxErrorSuppliedCurrentDataOutsideSpecifiedRange = (-200076);
NICONST.DAQmxErrorSuppliedVoltageDataOutsideSpecifiedRange = (-200075);
NICONST.DAQmxErrorCannotStoreCalConst =(-200074);
NICONST.DAQmxErrorSCXIModuleNotFound = (-200073);
NICONST.DAQmxErrorDuplicatePhysicalChansNotSupported = (-200072);
NICONST.DAQmxErrorTooManyPhysicalChansInList = (-200071);
NICONST.DAQmxErrorInvalidAdvanceEventTriggerType = (-200070);
NICONST.DAQmxErrorDeviceIsNotAValidSwitch =(-200069);
NICONST.DAQmxErrorDeviceDoesNotSupportScanning = (-200068);
NICONST.DAQmxErrorScanListCannotBeTimed =(-200067);
NICONST.DAQmxErrorConnectOperatorInvalidAtPointInList =(-200066);
NICONST.DAQmxErrorUnexpectedSwitchActionInList = (-200065);
NICONST.DAQmxErrorUnexpectedSeparatorInList =(-200064);
NICONST.DAQmxErrorExpectedTerminatorInList = (-200063);
NICONST.DAQmxErrorExpectedConnectOperatorInList =(-200062);
NICONST.DAQmxErrorExpectedSeparatorInList =(-200061);
NICONST.DAQmxErrorFullySpecifiedPathInListContainsRange =(-200060);
NICONST.DAQmxErrorConnectionSeparatorAtEndOfList = (-200059);
NICONST.DAQmxErrorIdentifierInListTooLong =(-200058);
NICONST.DAQmxErrorDuplicateDeviceIDInListWhenSettling =(-200057);
NICONST.DAQmxErrorChannelNameNotSpecifiedInList =(-200056);
NICONST.DAQmxErrorDeviceIDNotSpecifiedInList = (-200055);
NICONST.DAQmxErrorSemicolonDoesNotFollowRangeInList =(-200054);
NICONST.DAQmxErrorSwitchActionInListSpansMultipleDevices = (-200053);
NICONST.DAQmxErrorRangeWithoutAConnectActionInList = (-200052);
NICONST.DAQmxErrorInvalidIdentifierFollowingSeparatorInList =(-200051);
NICONST.DAQmxErrorInvalidChannelNameInList = (-200050);
NICONST.DAQmxErrorInvalidNumberInRepeatStatementInList = (-200049);
NICONST.DAQmxErrorInvalidTriggerLineInList = (-200048);
NICONST.DAQmxErrorInvalidIdentifierInListFollowingDeviceID = (-200047);
NICONST.DAQmxErrorInvalidIdentifierInListAtEndOfSwitchAction = (-200046);
NICONST.DAQmxErrorDeviceRemoved =(-200045);
NICONST.DAQmxErrorRoutingPathNotAvailable =(-200044);
NICONST.DAQmxErrorRoutingHardwareBusy =(-200043);
NICONST.DAQmxErrorRequestedSignalInversionForRoutingNotPossible =(-200042);
NICONST.DAQmxErrorInvalidRoutingDestinationTerminalName =(-200041);
NICONST.DAQmxErrorInvalidRoutingSourceTerminalName = (-200040);
NICONST.DAQmxErrorRoutingNotSupportedForDevice = (-200039);
NICONST.DAQmxErrorWaitIsLastInstructionOfLoopInScript =(-200038);
NICONST.DAQmxErrorClearIsLastInstructionOfLoopInScript = (-200037);
NICONST.DAQmxErrorInvalidLoopIterationsInScript =(-200036);
NICONST.DAQmxErrorRepeatLoopNestingTooDeepInScript = (-200035);
NICONST.DAQmxErrorMarkerPositionOutsideSubsetInScript =(-200034);
NICONST.DAQmxErrorSubsetStartOffsetNotAlignedInScript =(-200033);
NICONST.DAQmxErrorInvalidSubsetLengthInScript =(-200032);
NICONST.DAQmxErrorMarkerPositionNotAlignedInScript = (-200031);
NICONST.DAQmxErrorSubsetOutsideWaveformInScript =(-200030);
NICONST.DAQmxErrorMarkerOutsideWaveformInScript =(-200029);
NICONST.DAQmxErrorWaveformInScriptNotInMem = (-200028);
NICONST.DAQmxErrorKeywordExpectedInScript =(-200027);
NICONST.DAQmxErrorBufferNameExpectedInScript = (-200026);
NICONST.DAQmxErrorProcedureNameExpectedInScript =(-200025);
NICONST.DAQmxErrorScriptHasInvalidIdentifier = (-200024);
NICONST.DAQmxErrorScriptHasInvalidCharacter =(-200023);
NICONST.DAQmxErrorResourceAlreadyReserved =(-200022);
NICONST.DAQmxErrorSelfTestFailed = (-200020);
NICONST.DAQmxErrorADCOverrun = (-200019);
NICONST.DAQmxErrorDACUnderflow = (-200018);
NICONST.DAQmxErrorInputFIFOUnderflow = (-200017);
NICONST.DAQmxErrorOutputFIFOUnderflow =(-200016);
NICONST.DAQmxErrorSCXISerialCommunication =(-200015);
NICONST.DAQmxErrorDigitalTerminalSpecifiedMoreThanOnce = (-200014);
NICONST.DAQmxErrorDigitalOutputNotSupported =(-200012);
NICONST.DAQmxErrorInconsistentChannelDirections =(-200011);
NICONST.DAQmxErrorInputFIFOOverflow =(-200010);
NICONST.DAQmxErrorTimeStampOverwritten = (-200009);
NICONST.DAQmxErrorStopTriggerHasNotOccurred =(-200008);
NICONST.DAQmxErrorRecordNotAvailable = (-200007);
NICONST.DAQmxErrorRecordOverwritten =(-200006);
NICONST.DAQmxErrorDataNotAvailable = (-200005);
NICONST.DAQmxErrorDataOverwrittenInDeviceMemory =(-200004);
NICONST.DAQmxErrorDuplicatedChannel =(-200003);
NICONST.DAQmxWarningTimestampCounterRolledOver =(200003);
NICONST.DAQmxWarningInputTerminationOverloaded =(200004);
NICONST.DAQmxWarningADCOverloaded = (200005);
NICONST.DAQmxWarningPLLUnlocked = (200007);
NICONST.DAQmxWarningCounter0DMADuringAIConflict = (200008);
NICONST.DAQmxWarningCounter1DMADuringAOConflict = (200009);
NICONST.DAQmxWarningStoppedBeforeDone = (200010);
NICONST.DAQmxWarningRateViolatesSettlingTime =(200011);
NICONST.DAQmxWarningRateViolatesMaxADCRate =(200012);
NICONST.DAQmxWarningUserDefInfoStringTooLong =(200013);
NICONST.DAQmxWarningTooManyInterruptsPerSecond =(200014);
NICONST.DAQmxWarningPotentialGlitchDuringWrite =(200015);
NICONST.DAQmxWarningDevNotSelfCalibratedWithDAQmx = (200016);
NICONST.DAQmxWarningAISampRateTooLow =(200017);
NICONST.DAQmxWarningAIConvRateTooLow =(200018);
NICONST.DAQmxWarningReadOffsetCoercion =(200019);
NICONST.DAQmxWarningPretrigCoercion = (200020);
NICONST.DAQmxWarningSampValCoercedToMax = (200021);
NICONST.DAQmxWarningSampValCoercedToMin = (200022);
NICONST.DAQmxWarningPropertyVersionNew =(200024);
NICONST.DAQmxWarningUserDefinedInfoTooLong =(200025);
NICONST.DAQmxWarningCAPIStringTruncatedToFitBuffer =(200026);
NICONST.DAQmxWarningSampClkRateTooLow = (200027);
NICONST.DAQmxWarningPossiblyInvalidCTRSampsInFiniteDMAAcq = (200028);
NICONST.DAQmxWarningRISAcqCompletedSomeBinsNotFilled =(200029);
NICONST.DAQmxWarningPXIDevTempExceedsMaxOpTemp =(200030);
NICONST.DAQmxWarningOutputGainTooLowForRFFreq = (200031);
NICONST.DAQmxWarningOutputGainTooHighForRFFreq =(200032);
NICONST.DAQmxWarningMultipleWritesBetweenSampClks = (200033);
NICONST.DAQmxWarningDeviceMayShutDownDueToHighTemp =(200034);
NICONST.DAQmxWarningRateViolatesMinADCRate =(200035);
NICONST.DAQmxWarningSampClkRateAboveDevSpecs =(200036);
NICONST.DAQmxWarningCOPrevDAQmxWriteSettingsOverwrittenForHWTimedSinglePoint = (200037);
NICONST.DAQmxWarningLowpassFilterSettlingTimeExceedsUserTimeBetween2ADCConversions = (200038);
NICONST.DAQmxWarningLowpassFilterSettlingTimeExceedsDriverTimeBetween2ADCConversions = (200039);
NICONST.DAQmxWarningSampClkRateViolatesSettlingTimeForGen = (200040);
NICONST.DAQmxWarningReadNotCompleteBeforeSampClk =(209800);
NICONST.DAQmxWarningWriteNotCompleteBeforeSampClk = (209801);
NICONST.DAQmxErrorInvalidSignalModifier_Routing = (-89150);
NICONST.DAQmxErrorRoutingDestTermPXIClk10InNotInSlot2_Routing = (-89149);
NICONST.DAQmxErrorRoutingDestTermPXIStarXNotInSlot2_Routing = (-89148);
NICONST.DAQmxErrorRoutingSrcTermPXIStarXNotInSlot2_Routing =(-89147);
NICONST.DAQmxErrorRoutingSrcTermPXIStarInSlot16AndAbove_Routing = (-89146);
NICONST.DAQmxErrorRoutingDestTermPXIStarInSlot16AndAbove_Routing =(-89145);
NICONST.DAQmxErrorRoutingDestTermPXIStarInSlot2_Routing = (-89144);
NICONST.DAQmxErrorRoutingSrcTermPXIStarInSlot2_Routing =(-89143);
NICONST.DAQmxErrorRoutingDestTermPXIChassisNotIdentified_Routing =(-89142);
NICONST.DAQmxErrorRoutingSrcTermPXIChassisNotIdentified_Routing = (-89141);
NICONST.DAQmxErrorTrigLineNotFoundSingleDevRoute_Routing =(-89140);
NICONST.DAQmxErrorNoCommonTrigLineForRoute_Routing =(-89139);
NICONST.DAQmxErrorResourcesInUseForRouteInTask_Routing =(-89138);
NICONST.DAQmxErrorResourcesInUseForRoute_Routing =(-89137);
NICONST.DAQmxErrorRouteNotSupportedByHW_Routing = (-89136);
NICONST.DAQmxErrorResourcesInUseForInversionInTask_Routing =(-89135);
NICONST.DAQmxErrorResourcesInUseForInversion_Routing =(-89134);
NICONST.DAQmxErrorInversionNotSupportedByHW_Routing = (-89133);
NICONST.DAQmxErrorResourcesInUseForProperty_Routing = (-89132);
NICONST.DAQmxErrorRouteSrcAndDestSame_Routing = (-89131);
NICONST.DAQmxErrorDevAbsentOrUnavailable_Routing =(-89130);
NICONST.DAQmxErrorInvalidTerm_Routing = (-89129);
NICONST.DAQmxErrorCannotTristateTerm_Routing =(-89128);
NICONST.DAQmxErrorCannotTristateBusyTerm_Routing =(-89127);
NICONST.DAQmxErrorCouldNotReserveRequestedTrigLine_Routing =(-89126);
NICONST.DAQmxErrorTrigLineNotFound_Routing =(-89125);
NICONST.DAQmxErrorRoutingPathNotAvailable_Routing = (-89124);
NICONST.DAQmxErrorRoutingHardwareBusy_Routing = (-89123);
NICONST.DAQmxErrorRequestedSignalInversionForRoutingNotPossible_Routing = (-89122);
NICONST.DAQmxErrorInvalidRoutingDestinationTerminalName_Routing = (-89121);
NICONST.DAQmxErrorInvalidRoutingSourceTerminalName_Routing =(-89120);
NICONST.DAQmxStatusCouldNotConnectToServer_Routing =(-88900);
NICONST.DAQmxStatusDeviceNameNotFound_Routing = (-88717);
NICONST.DAQmxStatusLocalRemoteDriverVersionMismatch_Routing = (-88716);
NICONST.DAQmxStatusDuplicateDeviceName_Routing =(-88715);
NICONST.DAQmxStatusRuntimeAborting_Routing = (-88710);
NICONST.DAQmxStatusRuntimeAborted_Routing = (-88709);
NICONST.DAQmxStatusResourceNotInPool_Routing = (-88708);
NICONST.DAQmxStatusDriverDeviceGUIDNotFound_Routing = (-88705);

