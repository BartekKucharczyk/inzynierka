
TYPE
	ControllerType : 	STRUCT 
		Input : ControllerInputType;
		Internal : ControllerInternalType;
		Output : ControllerOutputType;
	END_STRUCT;
END_TYPE

(**)

TYPE
	ControllerInputType : 	STRUCT 
		Cmd : ControllerInpCmdType;
		Params : ControllerInpParamsType;
	END_STRUCT;
	ControllerInternalType : 	STRUCT 
		Fubs : ControllerFubsType;
	END_STRUCT;
	ControllerOutputType : 	STRUCT 
		Time : DATE_AND_TIME;
	END_STRUCT;
END_TYPE

(**)

TYPE
	ControllerInpCmdType : 	STRUCT 
		DoReset : BOOL;
		GetTime : BOOL;
	END_STRUCT;
	ControllerInpParamsType : 	STRUCT 
		ResetType : USINT;
	END_STRUCT;
END_TYPE

(**)

TYPE
	ControllerFubsType : 	STRUCT 
		GetTime : DTGetTime;
	END_STRUCT;
END_TYPE
