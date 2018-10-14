UnmarkedObjectFolder := C:/projects/Inzynierka_Kucharczyk_2018/Logical/Source/Code/Package1/Program
MarkedObjectFolder := C:/projects/Inzynierka_Kucharczyk_2018/Logical/Source/Code/Package1/Program

$(AS_CPU_PATH)/Program.br: \
	$(AS_PROJECT_CPU_PATH)/Cpu.per \
	FORCE \
	$(AS_CPU_PATH)/Program/Program.ox
	@'$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe' '$(AS_CPU_PATH)/Program/Program.ox' -o '$(AS_CPU_PATH)/Program.br' -v V1.00.0 -f '$(AS_CPU_PATH)/NT.ofs' -offsetLT '$(AS_BINARIES_PATH)/$(AS_CONFIGURATION)/$(AS_PLC)/LT.ofs' -T SG4  -M IA32  -B G4.34 -extConstants -d 'runtime: V* - V*,asieccon: V* - V*' -r Cyclic4 -p 3 -s 'Source.Code.Package1.Program' -L 'Acp10_MC: V3.18.2, Acp10man: V3.18.2, Acp10par: V3.18.2, AsIecCon: V*, astime: V*, brsystem: V*, MpAxis: V1.62.1, MpBase: V5.00.0, MpCom: V1.62.1, NcGlobal: V3.18.2, operator: V*, runtime: V*, sys_lib: V*' -P '$(AS_PROJECT_PATH)' -secret '$(AS_PROJECT_PATH)_br.as.taskbuilder.exe'

$(AS_CPU_PATH)/Program/Program.ox: \
	$(AS_CPU_PATH)/Program/a.out
	@'$(AS_BIN_PATH)/BR.AS.Backend.exe' '$(AS_CPU_PATH)/Program/a.out' -o '$(AS_CPU_PATH)/Program/Program.ox' -T SG4 -r Cyclic4   -G V4.1.2  -B G4.34 -secret '$(AS_PROJECT_PATH)_br.as.backend.exe'

$(AS_CPU_PATH)/Program/a.out: \
	$(AS_CPU_PATH)/Program/Main.st.o \
	$(AS_CPU_PATH)/Program/_bur_pvdef.st.o
	@'$(AS_BIN_PATH)/BR.AS.CCompiler.exe' -link '$(AS_CPU_PATH)/Program/Main.st.o' '$(AS_CPU_PATH)/Program/_bur_pvdef.st.o'  -o '$(AS_CPU_PATH)/Program/a.out'  -G V4.1.2  -T SG4  -M IA32  '-Wl,$(AS_PROJECT_PATH)/Logical/Libraries/MpAxis/SG4/IA32/libMpAxis.a' '-Wl,$(AS_PROJECT_PATH)/Logical/Libraries/Acp10_MC/SG4/IA32/libacp10_mc.a' '-Wl,$(AS_PROJECT_PATH)/Logical/Libraries/MpCom/SG4/IA32/libMpCom.a' '-Wl,$(AS_SYSTEM_PATH)/G0434/SG4/IA32/libsys_lib.a' '-Wl,$(AS_SYSTEM_PATH)/G0434/SG4/IA32/libbrsystem.a' '-Wl,$(AS_PROJECT_PATH)/Logical/Libraries/NcGlobal/SG4/IA32/libncglobal.a' '-Wl,$(AS_PROJECT_PATH)/Logical/Libraries/MpBase/SG4/IA32/libMpBase.a' '-Wl,$(AS_SYSTEM_PATH)/G0434/SG4/IA32/libAsIecCon.a' '-Wl,$(AS_SYSTEM_PATH)/G0434/SG4/IA32/libastime.a' '-Wl,$(AS_SYSTEM_PATH)/G0434/SG4/IA32/libruntime.a' '-Wl,$(AS_SYSTEM_PATH)/G0434/SG4/IA32/liboperator.a' -specs=I386specs_brelf -nostdlib -secret '$(AS_PROJECT_PATH)_br.as.ccompiler.exe'

$(AS_CPU_PATH)/Program/Main.st.o: \
	$(AS_PROJECT_PATH)/Logical/Source/Code/Package1/Program/Main.st \
	FORCE 
	@'$(AS_BIN_PATH)/BR.AS.IecCompiler.exe' '$(AS_PROJECT_PATH)/Logical/Source/Code/Package1/Program/Main.st' -o '$(AS_CPU_PATH)/Program/Main.st.o'  -O '$(AS_CPU_PATH)//Program/Main.st.o.opt' -secret '$(AS_PROJECT_PATH)_br.as.ieccompiler.exe'

$(AS_CPU_PATH)/Program/_bur_pvdef.st.o: \
	FORCE 
	@'$(AS_BIN_PATH)/BR.AS.IecCompiler.exe' '$(AS_PATH)/AS/GnuInst/V4.1.2/i386-elf/include/bur/_bur_pvdef.st' -o '$(AS_CPU_PATH)/Program/_bur_pvdef.st.o'  -O '$(AS_CPU_PATH)//Program/_bur_pvdef.st.opt' -secret '$(AS_PROJECT_PATH)_br.as.ieccompiler.exe'

-include $(AS_CPU_PATH)/Force.mak 



FORCE: