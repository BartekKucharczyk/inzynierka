(*Main structure*)

TYPE
	AxisCtrlType : 	STRUCT 
		Input : AxisCtrlInpType; (*Inputs: ex. commands*)
		Internal : AxisCtrlInternalType; (*Fubs, funs*)
		Output : AxisCtrlOutType; (*States, status*)
	END_STRUCT;
END_TYPE

(**)
(*Inputs*)

TYPE
	AxisCtrlInpType : 	STRUCT 
		Commands : {REDUND_UNREPLICABLE} AxisCtrlInpCmdType;
		Parameters : AxisCtrlInpParamsType;
	END_STRUCT;
END_TYPE

(**)

TYPE
	AxisCtrlInpCmdType : 	STRUCT 
		SingleAxis : AxisCtrlInpCmdSigAxType;
		AllAxis : AxisCtrlInpCmdAllAxType;
	END_STRUCT;
	AxisCtrlInpParamsType : 	STRUCT 
		Acceleration : REAL;
		Deceleration : REAL;
		Distance : REAL;
		Velocity : REAL;
		Position : REAL;
		JogParams : AxisCtrlInpParmsJogPType;
	END_STRUCT;
END_TYPE

(**)

TYPE
	AxisCtrlInpCmdSigAxType : 	STRUCT 
		PowerOn : BOOL;
		PowerOff : BOOL;
		Home : BOOL;
		MoveVelocity : BOOL;
		MoveAdditive : BOOL;
		MoveAbsolute : BOOL;
		StopOn : BOOL;
		StopOff : BOOL;
		JogNegative : BOOL;
		JogPositive : BOOL;
		ErrorReset : BOOL;
	END_STRUCT;
	AxisCtrlInpCmdAllAxType : 	STRUCT 
		PowerOn : BOOL;
		PowerOff : BOOL;
		Home : BOOL;
		MoveVelocity : BOOL;
		MoveAdditive : BOOL;
		MoveAbsolute : BOOL;
		StopOn : BOOL;
		StopOff : BOOL;
		JogNegative : BOOL;
		JogPositive : BOOL;
		ErrorReset : BOOL;
	END_STRUCT;
	AxisCtrlInpParmsJogPType : 	STRUCT 
		JogVelocity : REAL;
		Acceleration : REAL;
		Deceleration : REAL;
		UpperLimit : LREAL;
		LowerLimit : LREAL;
	END_STRUCT;
END_TYPE

(**)
(*Internal*)

TYPE
	AxisCtrlInternalType : 	STRUCT 
		FunctionsBlock : AxisCtrlInternalFubsType;
		Functions : AxisCtrlInternalFunsType;
	END_STRUCT;
END_TYPE

(**)

TYPE
	AxisCtrlInternalFubsType : 	STRUCT 
		MpAxisBasic_0 : MpAxisBasic;
	END_STRUCT;
	AxisCtrlInternalFunsType : 	STRUCT 
		MpAxisBasicParType_0 : MpAxisBasicParType;
	END_STRUCT;
END_TYPE

(**)
(*Output*)

TYPE
	AxisCtrlOutType : 	STRUCT 
		Status : AxisCtrlOutStatusType;
		States : AxisCtrlOutStatesType;
	END_STRUCT;
	AxisCtrlOutStatusType : 	STRUCT 
		HomingStateMachine : HomingEnum;
		AxisStateMachine : AxisCtrlEnum;
	END_STRUCT;
	AxisCtrlOutStatesType : 	STRUCT 
		SingleAxis : AxisCtrlOutStatesSingType;
		AllAxis : AxisCtrlOutStatesAllType;
	END_STRUCT;
END_TYPE

(**)

TYPE
	AxisCtrlOutStatesAllType : 	STRUCT 
		InPosition : BOOL;
		InVelocity : BOOL;
		UpdateDone : BOOL;
		Active : BOOL;
		Error : BOOL;
		Stopped : BOOL;
		MoveActive : BOOL;
		IsHomed : BOOL;
		PowerOn : BOOL;
	END_STRUCT;
	AxisCtrlOutStatesSingType : 	STRUCT 
		Axis_0 : AxisCtrlOutStatesSingAxType;
		Axis_1 : AxisCtrlOutStatesSingAxType;
	END_STRUCT;
	AxisCtrlOutStatesSingAxType : 	STRUCT 
		InPosition : BOOL;
		InVelocity : BOOL;
		StatusID : DINT;
		UpdateDone : BOOL;
		Active : BOOL;
		Error : BOOL;
		Stopped : BOOL;
		MoveActive : BOOL;
		IsHomed : BOOL;
		PowerOn : BOOL;
	END_STRUCT;
END_TYPE

(**)
(*Enumerators*)

TYPE
	HomingEnum : 
		(
		PREPARE_HOME,
		HOMING,
		EXIT_HOME
		);
	AxisCtrlEnum : 
		(
		WAIT_FOR_CMD,
		JOG,
		MOVE_ADDITIVE,
		MOVE_VELOCITY,
		MOVE_ABSOLUTE,
		STOP_OFF,
		STOP_ON,
		HOME,
		POWER_OFF,
		POWER_ON,
		WAIT_FOR_ACTIVE,
		ERROR_RESET
		);
END_TYPE