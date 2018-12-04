UnmarkedObjectFolder := C:/projects/Inzynierka_Kucharczyk_2018/Physical/Config1/4PP065_0571_P74F/mapp
MarkedObjectFolder := C:/projects/Inzynierka_Kucharczyk_2018/Physical/Config1/4PP065_0571_P74F/mapp

$(AS_CPU_PATH)/Config.br: \
	$(AS_PROJECT_CPU_PATH)/mapp/Config.mpaxisbasic
	@'$(AS_BIN_PATH)/BR.AS.SystemConfiguration.Builder.exe'   '$(AS_PROJECT_CPU_PATH)/mapp/Config.mpaxisbasic' -o '$(AS_CPU_PATH)/Config.br' -zip -B G4.34 -L 'MpAxis: V1.62.1, MpCom: V1.62.1' -z 1.62.1 -P '$(AS_PROJECT_PATH)' -c '$(AS_CONFIGURATION)' -secret '$(AS_PROJECT_PATH)_br.as.systemconfiguration.builder.exe'

