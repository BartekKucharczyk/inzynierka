SHELL = cmd.exe
export AS_PLC := 4PP065_0571_P74F
export AS_TEMP_PLC := 4PP065_0571_P74F
export AS_CPU_PATH := $(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)
export AS_CPU_PATH_2 := C:/projects/Inzynierka_Kucharczyk_2018/Temp//Objects/$(AS_CONFIGURATION)/$(AS_PLC)
export AS_PROJECT_CONFIG_PATH := $(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)
export AS_PROJECT_CPU_PATH := $(AS_PROJECT_CONFIG_PATH)/$(AS_PLC)
export AS_STATIC_ARCHIVES_PATH := $(AS_TEMP_PATH)/Archives/$(AS_CONFIGURATION)/$(AS_PLC)
export WIN32_AS_CPU_PATH := $(WIN32_AS_TEMP_PATH)\Objects\$(AS_CONFIGURATION)\$(AS_PLC)
export WIN32_AS_ACTIVE_CONFIG_PATH := $(WIN32_AS_PROJECT_PATH)\Physical\$(AS_CONFIGURATION)\$(AS_PLC)
export AS_FILES_TO_TRANSFER := $(AS_TEMP_PATH)/Transfer/$(AS_CONFIGURATION)/$(AS_PLC)/FilesToTransfer


CpuMakeFile: \
$(AS_CPU_PATH)/ashwd.br \
$(AS_CPU_PATH)/asfw.br \
$(AS_CPU_PATH)/sysconf.br \
$(AS_CPU_PATH)/arconfig.br \
$(AS_CPU_PATH)/ashwac.br \
$(AS_CPU_PATH)/acp10cfg.br \
$(AS_CPU_PATH)/acp10map.br \
$(AS_CPU_PATH)/AxisCtrl.br \
$(AS_CPU_PATH)/Controller.br \
$(AS_CPU_PATH)/ChartTask.br \
$(AS_CPU_PATH)/LoggerTask.br \
$(AS_CPU_PATH)/MemTask.br \
$(AS_CPU_PATH)/acp10etxen.br \
$(AS_CPU_PATH)/gAxis01a.br \
$(AS_CPU_PATH)/gAxis01i.br \
$(AS_CPU_PATH)/iomap.br \
$(AS_CPU_PATH)/OpcUaMap.br \
$(AS_CPU_PATH)/Role.br \
$(AS_CPU_PATH)/User.br \
$(AS_CPU_PATH)/Config.br \
$(AS_CPU_PATH)/TCData.br \
$(AS_BINARIES_PATH)/$(AS_CONFIGURATION)/$(AS_PLC)/Transfer.lst


$(AS_BINARIES_PATH)/$(AS_CONFIGURATION)/$(AS_PLC)/Transfer.lst: \
	$(AS_CPU_PATH)/ashwd.br \
	$(AS_CPU_PATH)/asfw.br \
	$(AS_CPU_PATH)/sysconf.br \
	$(AS_CPU_PATH)/arconfig.br \
	$(AS_CPU_PATH)/ashwac.br \
	$(AS_CPU_PATH)/acp10cfg.br \
	$(AS_CPU_PATH)/acp10map.br \
	$(AS_CPU_PATH)/AxisCtrl.br \
	$(AS_CPU_PATH)/Controller.br \
	$(AS_CPU_PATH)/ChartTask.br \
	$(AS_CPU_PATH)/LoggerTask.br \
	$(AS_CPU_PATH)/MemTask.br \
	$(AS_CPU_PATH)/acp10etxen.br \
	$(AS_CPU_PATH)/gAxis01a.br \
	$(AS_CPU_PATH)/gAxis01i.br \
	$(AS_CPU_PATH)/iomap.br \
	$(AS_CPU_PATH)/OpcUaMap.br \
	$(AS_CPU_PATH)/Role.br \
	$(AS_CPU_PATH)/User.br \
	$(AS_CPU_PATH)/Config.br \
	$(AS_CPU_PATH)/TCData.br \
	$(AS_PROJECT_CPU_PATH)/Cpu.sw
	@'$(AS_BIN_PATH)/BR.AS.FinalizeBuild.exe' '$(AS_PROJECT_PATH)/Inzynierka_Kucharczyk_2018.apj' -t '$(AS_TEMP_PATH)' -o '$(AS_BINARIES_PATH)' -c '$(AS_CONFIGURATION)' -i 'D:/AutomatioStudio/AS43' -S '4PP065_0571_P74F'   -A 'PP065' -pil   -swFiles '$(AS_PROJECT_PATH)/Physical/Config1/4PP065_0571_P74F/Cpu.sw' -Z 'Acp10Arnc0: 3.18.2, mapp: 1.62.1, UnitSystem: n.d, TextSystem: n.d, Connectivity: n.d, AAS: n.d' -C '/RT=1000 /AM=*' -D '/IF=COM1 /BD=57600 /PA=2 /IT=20 /RS=0' -M IA32 -T SG4

#nothing to do (just call module make files)

include $(AS_CPU_PATH)/TCData/TCData.mak
include $(AS_CPU_PATH)/Config/Config.mak
include $(AS_CPU_PATH)/User/User.mak
include $(AS_CPU_PATH)/Role/Role.mak
include $(AS_CPU_PATH)/OpcUaMap/OpcUaMap.mak
include $(AS_CPU_PATH)/iomap/iomap.mak
include $(AS_CPU_PATH)/gAxis01i/gAxis01i.mak
include $(AS_CPU_PATH)/gAxis01a/gAxis01a.mak
include $(AS_CPU_PATH)/acp10etxen/acp10etxen.mak
include $(AS_CPU_PATH)/MemTask/MemTask.mak
include $(AS_CPU_PATH)/LoggerTask/LoggerTask.mak
include $(AS_CPU_PATH)/ChartTask/ChartTask.mak
include $(AS_CPU_PATH)/Controller/Controller.mak
include $(AS_CPU_PATH)/AxisCtrl/AxisCtrl.mak
include $(AS_CPU_PATH)/acp10map/acp10map.mak
include $(AS_CPU_PATH)/acp10cfg/acp10cfg.mak
include $(AS_CPU_PATH)/ashwac/ashwac.mak
include $(AS_CPU_PATH)/arconfig/arconfig.mak
include $(AS_CPU_PATH)/sysconf/sysconf.mak
include $(AS_CPU_PATH)/asfw/asfw.mak
include $(AS_CPU_PATH)/ashwd/ashwd.mak

.DEFAULT:
#nothing to do (need this target for prerequisite files that don't exit)

FORCE:
