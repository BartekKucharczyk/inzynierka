$(AS_CPU_PATH)/OpcUaMap.br: \
	$(AS_PROJECT_CPU_PATH)/Connectivity/OpcUA/OpcUaMap.uad \
	$(AS_PROJECT_PATH)/Logical/Source/Code/AxisControl/Variables.var \
	$(AS_PROJECT_PATH)/Logical/Source/Code/AxisControl/Types.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/MpAxis/MpAxis.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/MpBase/MpBase.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/MpAxis/MpAxis.typ \
	$(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/$(AS_PLC)/AccessAndSecurity/UserRoleSystem/Role.role
	@'$(AS_BIN_PATH)/BR.OPC.UA.Builder.exe'  '$(AS_PROJECT_CPU_PATH)/Connectivity/OpcUA/OpcUaMap.uad' -o '$(AS_CPU_PATH)/OpcUaMap.br' -H '$(AS_PROJECT_CONFIG_PATH)/Hardware.hw' -B G4.34 -c Config1 -P '$(AS_PROJECT_PATH)'
