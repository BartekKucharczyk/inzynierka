
TYPE
	ControllerType : 	STRUCT 
		Input : ControllerInputType;
		Internal : ControllerInternalType;
		Output : ControllerOutputType;
	END_STRUCT;
	ControllerInputType : 	STRUCT 
		GetTime : BOOL;
	END_STRUCT;
	ControllerInternalType : 	STRUCT 
		Fubs : ControllerFubsType;
	END_STRUCT;
	ControllerFubsType : 	STRUCT 
		GetTime : DTGetTime;
	END_STRUCT;
	ControllerOutputType : 	STRUCT 
		Time : DATE_AND_TIME;
	END_STRUCT;
END_TYPE
