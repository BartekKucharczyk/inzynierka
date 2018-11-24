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
		TorqueLimit : REAL;
		Position : REAL;
		TorqueWindow : REAL;
		JogParams : AxisCtrlInpParmsJogPType;
	END_STRUCT;
END_TYPE

(**)

TYPE
	AxisCtrlInpCmdSigAxType : 	STRUCT 
		A1 : AxisCtrlInpCmdSingAxAType;
	END_STRUCT;
	AxisCtrlInpCmdSingAxAType : 	STRUCT 
		PowerOn : BOOL;
		PowerOff : BOOL;
		Home : BOOL;
		MoveVelocity : BOOL;
		MoveAdditive : BOOL;
		MoveOff : BOOL;
		MoveAbsolute : BOOL;
		MoveTorque : BOOL;
		StopOn : BOOL;
		StopOff : BOOL;
		JogPositive : BOOL;
		JogNegative : BOOL;
		ErrorReset : BOOL;
		Update : BOOL;
	END_STRUCT;
	AxisCtrlInpCmdAllAxType : 	STRUCT 
		PowerOn : BOOL;
		PowerOff : BOOL;
		Home : BOOL;
		MoveVelocity : BOOL;
		MoveAdditive : BOOL;
		MoveAbsolute : BOOL;
		MoveTorque : BOOL;
		StopOn : BOOL;
		StopOff : BOOL;
		Jog : BOOL;
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
		TorqueControl : MpAxisCyclicSet;
		MpAxisBasic_0 : MpAxisBasic;
	END_STRUCT;
	AxisCtrlInternalFunsType : 	STRUCT 
		MpTorqueParams : MpAxisCyclicSetParType;
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
		Diagnosis : AxisCtrlOutStatesDiagType;
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
		Params : AxisCtrlOutStatesSingAxParType;
	END_STRUCT;
	AxisCtrlOutStatesSingAxParType : 	STRUCT 
		PositionAct : LREAL;
		Deceleration : LREAL;
		Acceleration : LREAL;
		Position : LREAL;
		TorqueLimit : LREAL;
		Distance : LREAL;
		Velocity : LREAL;
		VelocityAct : LREAL;
	END_STRUCT;
	AxisCtrlOutStatesDiagType : 	STRUCT 
		A0 : AxisCtrlOutStatesDiagAxType;
	END_STRUCT;
	AxisCtrlOutStatesDiagAxType : 	STRUCT 
		DriveRestarted : BOOL;
		TorqueLimitActive : BOOL;
		JogLimited : BOOL;
		AxisInitialized : BOOL;
		ReadyToOPowerOn : BOOL;
		PLCopenStateAx0 : STRING[80];
	END_STRUCT;
END_TYPE

(**)
(*Enumerators*)

TYPE
	AxisCtrlEnum : 
		(
		WAIT_FOR_CMD,
		JOG_NEGATIVE,
		JOG_POSITIVE,
		MOVE_ADDITIVE,
		MOVE_VELOCITY,
		MOVE_ABSOLUTE,
		MOVE_TORQUE,
		STOP_OFF,
		STOP_ON,
		HOME,
		POWER_OFF,
		POWER_ON,
		WAIT_FOR_ACTIVE,
		ERROR,
		ERROR_RESET,
		UPDATE,
		MOVE_OFF
		);
	HomingEnum : 
		(
		PREPARE_HOME,
		HOMING,
		EXIT_HOME
		);
END_TYPE
