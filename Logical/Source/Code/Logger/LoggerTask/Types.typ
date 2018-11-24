
TYPE
	LoggerHandlingType : 	STRUCT 
		Input : LoggerHandlingInpType;
		Internal : LoggerHandlingInterType;
		Output : LoggerHandlingOutType;
	END_STRUCT;
END_TYPE

(**)

TYPE
	LoggerHandlingInpType : 	STRUCT 
		Commands : LoggerHandlingInpCmdType;
		Parameters : LoggerHandlingInpParsType;
	END_STRUCT;
	LoggerHandlingInpCmdType : 	STRUCT 
		GET_ID : BOOL;
		ERROR_RESET : BOOL;
		DELETE : BOOL;
		CREATE : BOOL;
		READ_DESC : BOOL;
		READ_ERROR_NUMBER : BOOL;
		READ : BOOL;
		GET_LATEST_RECORD : BOOL;
		GET_PREVIOUS : BOOL;
		ACK : BOOL;
		REL_START : BOOL;
	END_STRUCT;
	LoggerHandlingInpParsType : 	STRUCT 
		NumberOfLogbook : USINT;
		NumberOfLog : USINT;
		IDentLogToDelete : ArEventLogIdentType;
		NameOfNewLogbook : STRING[80];
		RecordID : UDINT;
		NameOfLogbook : STRING[80];
	END_STRUCT;
END_TYPE

(**)

TYPE
	LoggerHandlingInterType : 	STRUCT 
		Fubs : LoggerHandlingInterFubsType;
		FuncAndParams : LoggerHandlingInterFuncAParsType;
	END_STRUCT;
	LoggerHandlingInterFubsType : 	STRUCT 
		_ArEventLogCreate : ArEventLogCreate;
		_ArEventLogDelete : ArEventLogDelete;
		_ArEventLogGetIdent : ArEventLogGetIdent;
		_ArEventLogReadErrorNumber : ArEventLogReadErrorNumber;
		_ArEventLogReadDescription : ArEventLogReadDescription;
		_ArEventLogGetPreviousRecordID : ArEventLogGetPreviousRecordID;
		_ArEventLogGetLatestRecordID : ArEventLogGetLatestRecordID;
		_ArEventLogRead : ArEventLogRead;
		_ArEventLogReadObjectID : ArEventLogReadObjectID;
	END_STRUCT;
	LoggerHandlingInterFuncAParsType : 	STRUCT 
		_ArEventLogIdentType : ArEventLogIdentType;
		_ArEventLogRecordIDType : ArEventLogRecordIDType;
		EventID : STRING[20];
		ConvTime : STRING[30];
		TimeLog : ArEventLogTimeStampType;
		TextBuffor : STRING[80];
		ErrorBuffor : STRING[30];
		ObjectID : STRING[36];
		i : UINT;
	END_STRUCT;
END_TYPE

(**)

TYPE
	LoggerHandlingOutType : 	STRUCT 
		MainStep : MainStepEnum;
		ReadList : ReadErrorList;
		States : LoggerHandlingOutStatesType;
	END_STRUCT;
	LoggerHandlingOutStatesType : 	STRUCT 
		LogList : STRING[450];
		LogDesc : STRING[1500];
		LogTime : STRING[1150];
		LogSeverity : STRING[150];
		EndStateCmd : STRING[80];
	END_STRUCT;
END_TYPE

(**)

TYPE
	ReadErrorList : 
		(
		START_REL,
		INIT_REL,
		GET_LATEST_REL,
		READ_REL,
		WAIT_FOR_EXE_REL,
		WAIT_FOR_DESC_REL,
		WAIT_FOR_ERROR_NUMBER_REL,
		CONVERSION_REL,
		NEXT_REL,
		END_REL
		);
	MainStepEnum : 
		(
		WAIT_FOR_CMD_LH,
		CREATE_LOGBOOK_LH,
		GET_ID_LH,
		DELETE_LOGBOOK_LH,
		READ_LH,
		READ_ERROR_NUMBER_LH,
		READ_DESC_LH,
		ERROR_LH,
		ERROR_RESET_LH,
		GET_LATEST_RECORD_ID_LH,
		GET_PREVIOUS_RECORD_LH,
		ADD_TO_INTERNAL_LH,
		READ_OBJ_ID_LH
		);
END_TYPE
