$(AS_CPU_PATH)/OpcUaMap.br: \
	$(AS_PROJECT_CPU_PATH)/Connectivity/OpcUA/OpcUaMap.uad \
	$(AS_PROJECT_PATH)/Logical/Global.var \
	$(AS_PROJECT_PATH)/Logical/Global.typ
	@'$(AS_BIN_PATH)/BR.OPC.UA.Builder.exe'  '$(AS_PROJECT_CPU_PATH)/Connectivity/OpcUA/OpcUaMap.uad' -o '$(AS_CPU_PATH)/OpcUaMap.br' -H '$(AS_PROJECT_CONFIG_PATH)/Hardware.hw' -B G4.34 -c Config1 -P '$(AS_PROJECT_PATH)'
