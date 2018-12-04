$(AS_CPU_PATH)/OpcUaMap.br: \
	$(AS_PROJECT_CPU_PATH)/Connectivity/OpcUA/OpcUaMap.uad \
	$(AS_PROJECT_PATH)/Logical/Source/Code/AxisControl/AxisCtrl/Variables.var \
	$(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/$(AS_PLC)/Cpu.sw \
	$(AS_PROJECT_PATH)/Logical/Source/Code/AxisControl/AxisCtrl/Types.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/MpAxis/MpAxis.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/MpBase/MpBase.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/MpAxis/MpAxis.typ \
	$(AS_PROJECT_PATH)/Logical/Source/Code/Controller/ControllerTask/Variables.var \
	$(AS_PROJECT_PATH)/Logical/Source/Code/Controller/ControllerTask/Types.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/ArProject/ArProject.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/astime/astime.fun \
	$(AS_PROJECT_PATH)/Logical/Source/Code/Chart/ChartTask/Variables.var \
	$(AS_PROJECT_PATH)/Logical/Source/Code/Chart/ChartTask/Types.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Acp10_MC/acp10_mc.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Acp10_MC/acp10_mc.typ \
	$(AS_PROJECT_PATH)/Logical/Source/Code/Logger/LoggerTask/Variables.var \
	$(AS_PROJECT_PATH)/Logical/Source/Code/Logger/LoggerTask/Types.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/ArEventLog/ArEventLog.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/ArEventLog/ArEventLog.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/runtime/runtime.typ \
	$(AS_PROJECT_PATH)/Logical/Source/Code/Memory/MemTask/Variables.var \
	$(AS_PROJECT_PATH)/Logical/Source/Code/Memory/MemTask/Types.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/brsystem/brsystem.fun \
	$(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/$(AS_PLC)/AccessAndSecurity/UserRoleSystem/Role.role
	@'$(AS_BIN_PATH)/BR.OPC.UA.Builder.exe'  '$(AS_PROJECT_CPU_PATH)/Connectivity/OpcUA/OpcUaMap.uad' -o '$(AS_CPU_PATH)/OpcUaMap.br' -H '$(AS_PROJECT_CONFIG_PATH)/Hardware.hw' -B G4.34 -c Config1 -P '$(AS_PROJECT_PATH)'
