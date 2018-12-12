SHELL := cmd.exe
CYGWIN=nontsec
export PATH := C:\WINDOWS;C:\Program Files\Common Files\Siemens\Automation\Simatic OAM\bin;C:\ProgramData\Oracle\Java\javapath;C:\Program Files (x86)\Intel\OpenCL SDK\6.3\bin\x64;C:\Program Files (x86)\Intel\OpenCL SDK\6.3\bin\x86;C:\Program Files (x86)\Intel\OpenCL SDK\6.3\bin\Pin;C:\Program Files (x86)\Intel\OpenCL SDK\6.3\bin\GTPin;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\Program Files (x86)\GtkSharp\2.12\bin;C:\Program Files\SourceGear\Common\DiffMerge\;C:\Program Files (x86)\Skype\Phone\;C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\110\Tools\Binn\;C:\Program Files (x86)\Microsoft SQL Server\120\Tools\Binn\;C:\Program Files\Microsoft SQL Server\120\Tools\Binn\;C:\Program Files\Microsoft SQL Server\120\DTS\Binn\;C:\Program Files (x86)\Windows Kits\8.1\Windows Performance Toolkit\;C:\Program Files\TortoiseGit\bin;D:\Git\cmd;C:\Program Files\dotnet\;C:\Users\Bartłomiej\AppData\Local\Microsoft\WindowsApps;C:\Program Files (x86)\Common Files\Hilscher GmbH\TLRDecode;C:\Users\Bartłomiej\AppData\Local\Microsoft\WindowsApps;C:\Program Files (x86)\Common Files\Hilscher GmbH\TLRDecode
export AS_BUILD_MODE := BuildAndCreateCompactFlash
export AS_VERSION := 4.3.7.46 SP
export AS_COMPANY_NAME := Microsoft
export AS_USER_NAME := Bartłomiej
export AS_PATH := D:/AutomatioStudio/AS43
export AS_BIN_PATH := D:/AutomatioStudio/AS43/bin-en
export AS_PROJECT_PATH := C:/projects/Inzynierka_Kucharczyk_2018
export AS_PROJECT_NAME := Inzynierka_Kucharczyk_2018
export AS_SYSTEM_PATH := D:/AutomatioStudio/AS/System
export AS_VC_PATH := D:/AutomatioStudio/AS43/AS/VC
export AS_TEMP_PATH := C:/projects/Inzynierka_Kucharczyk_2018/Temp
export AS_CONFIGURATION := Config1
export AS_BINARIES_PATH := C:/projects/Inzynierka_Kucharczyk_2018/Binaries
export AS_GNU_INST_PATH := D:/AutomatioStudio/AS43/AS/GnuInst/V4.1.2
export AS_GNU_BIN_PATH := $(AS_GNU_INST_PATH)/bin
export AS_GNU_INST_PATH_SUB_MAKE := D:/AutomatioStudio/AS43/AS/GnuInst/V4.1.2
export AS_GNU_BIN_PATH_SUB_MAKE := $(AS_GNU_INST_PATH_SUB_MAKE)/bin
export AS_INSTALL_PATH := D:/AutomatioStudio/AS43
export WIN32_AS_PATH := "D:\AutomatioStudio\AS43"
export WIN32_AS_BIN_PATH := "D:\AutomatioStudio\AS43\bin-en"
export WIN32_AS_PROJECT_PATH := "C:\projects\Inzynierka_Kucharczyk_2018"
export WIN32_AS_SYSTEM_PATH := "D:\AutomatioStudio\AS\System"
export WIN32_AS_VC_PATH := "D:\AutomatioStudio\AS43\AS\VC"
export WIN32_AS_TEMP_PATH := "C:\projects\Inzynierka_Kucharczyk_2018\Temp"
export WIN32_AS_BINARIES_PATH := "C:\projects\Inzynierka_Kucharczyk_2018\Binaries"
export WIN32_AS_GNU_INST_PATH := "D:\AutomatioStudio\AS43\AS\GnuInst\V4.1.2"
export WIN32_AS_GNU_BIN_PATH := "$(WIN32_AS_GNU_INST_PATH)\\bin" 
export WIN32_AS_INSTALL_PATH := "D:\AutomatioStudio\AS43"

.suffixes:

ProjectMakeFile:

	@'$(AS_BIN_PATH)/BR.AS.AnalyseProject.exe' '$(AS_PROJECT_PATH)/Inzynierka_Kucharczyk_2018.apj' -t '$(AS_TEMP_PATH)' -c '$(AS_CONFIGURATION)' -o '$(AS_BINARIES_PATH)'   -sfas -buildMode 'BuildAndCreateCompactFlash'   

	@$(AS_GNU_BIN_PATH)/mingw32-make.exe -r -f 'C:/projects/Inzynierka_Kucharczyk_2018/Temp/Objects/$(AS_CONFIGURATION)/4PP065_0571_P74F/#cpu.mak' -k 

