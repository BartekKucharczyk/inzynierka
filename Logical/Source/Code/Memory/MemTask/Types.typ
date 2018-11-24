
TYPE
	MemTaskType : 	STRUCT 
		Input : MemTaskInputType;
		Internal : MemTaskInterType;
		Output : MemTaskOutputType;
	END_STRUCT;
END_TYPE

(**)

TYPE
	MemTaskInputType : 	STRUCT 
		Cmd : MemTaskInputCmdType;
		Params : MemTaskInputParmsType;
	END_STRUCT;
END_TYPE

(**)

TYPE
	MemTaskInputCmdType : 	STRUCT 
		Start : BOOL;
		RepeatAll : BOOL;
		ReapetOnce : BOOL;
		Ack : BOOL;
	END_STRUCT;
	MemTaskInputParmsType : 	STRUCT 
		MemType : USINT;
	END_STRUCT;
END_TYPE

(**)

TYPE
	MemTaskInterType : 	STRUCT 
		memXInfo : MEMxInfo;
		memBuffor : STRING[20];
		iter : USINT;
	END_STRUCT;
END_TYPE

(**)

TYPE
	MemTaskOutputType : 	STRUCT 
		States : MemTaskOutputStatesType;
		MemStateMachine : MemoryTaskEnum;
	END_STRUCT;
	MemTaskOutputStatesType : 	STRUCT 
		Status : STRING[20];
		brUSRROM : STRING[50];
		brUSRRAM : STRING[50];
		brSYSROM : STRING[50];
		brDRAM : STRING[50];
	END_STRUCT;
END_TYPE

(**)

TYPE
	MemoryTaskEnum : 
		(
		WAIT_FOR_CMD_MT,
		START_MT,
		READ_ONCE_MT,
		READ_MT,
		WRITE_IN_OUTPUT_MT,
		DONE_MT
		);
END_TYPE
