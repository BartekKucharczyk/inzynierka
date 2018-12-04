UnmarkedObjectFolder := C:/projects/Inzynierka_Kucharczyk_2018/Logical/acp10etxen
MarkedObjectFolder := C:/projects/Inzynierka_Kucharczyk_2018/Logical/acp10etxen

$(AS_CPU_PATH)/acp10etxen.br: \
	$(AS_PROJECT_PATH)/Logical/acp10etxen/acp10etxen.ett
	@'$(AS_BIN_PATH)/BR.MC.Builder.exe'   '$(AS_PROJECT_PATH)/Logical/acp10etxen/acp10etxen.ett' -o '$(AS_CPU_PATH)/acp10etxen.br' -T SG4  -B G4.34 -v V1.00.0 -s 'acp10etxen' -L 'Acp10_MC: V3.18.2, Acp10man: V3.18.2, Acp10par: V3.18.2, NcGlobal: V3.18.2' -P '$(AS_PROJECT_PATH)' -secret '$(AS_PROJECT_PATH)_br.mc.builder.exe'

