
TYPE
	TraceType : 	STRUCT 
		Input : TraceInpType;
		Internal : TraceIntType;
		Output : TraceOutType;
	END_STRUCT;
END_TYPE

(**)

TYPE
	TraceInpType : 	STRUCT 
		Cmd : TraceInpCmdType;
		Params : TraceInpParmsType;
	END_STRUCT;
	TraceInpCmdType : 	STRUCT 
		Start : BOOL;
		ResetError : BOOL;
	END_STRUCT;
	TraceInpParmsType : 	STRUCT 
		NumberOfParams : BOOL;
		NameOfParams : STRING[80];
	END_STRUCT;
END_TYPE

(**)

TYPE
	TraceIntType : 	STRUCT 
		Fubs : TraceIntFubsType;
		Func : TraceIntFuncType;
		Params : TraceIntParamsType;
	END_STRUCT;
	TraceIntFubsType : 	STRUCT 
		Fileread : FileRead;
		Fileopen : FileOpen;
		ParTrace : MC_BR_ParTrace;
	END_STRUCT;
	TraceIntFuncType : 	STRUCT 
		PARTRACECONFIG : MC_PARTRACECONFIG_REF;
	END_STRUCT;
	TraceIntParamsType : 	STRUCT 
		FileLenght : REAL;
		Offset : UDINT;
		VlvTrans : STRING[15];
		Iteration : INT;
		ParamsIn : STRING[1000];
	END_STRUCT;
END_TYPE

(**)

TYPE
	TraceOutType : 	STRUCT 
		StateMachine : TraceSM;
		Status : TraceOutStatusType;
	END_STRUCT;
	TraceOutStatusType : 	STRUCT 
		ParamsOut : STRING[1000];
		ErrorStatus : USINT;
	END_STRUCT;
	TraceSM : 
		(
		WAIT_FOR_CMD_T,
		START_T,
		READ_T,
		ERROR_RESET_T,
		ERROR_T,
		OPEN_T,
		WAIT_FOR_READ_T,
		CONNECT_TXT_T
		);
END_TYPE
