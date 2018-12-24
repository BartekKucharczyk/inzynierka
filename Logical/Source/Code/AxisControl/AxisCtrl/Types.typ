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
		CyclicSetParameter : AxisCtrlInpParamsCyclicType;
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
		ErrorReset : BOOL;
		MoveVelocity : BOOL;
		MoveVelocityOff : BOOL;
		MoveAdditive : BOOL;
		MoveAdditiveOff : BOOL;
		MoveAbsolute : BOOL;
		MoveAbsoluteOff : BOOL;
		StopOn : BOOL;
		StopOff : BOOL;
		JogPositive : BOOL;
		JogNegative : BOOL;
		UpdateJogParams : BOOL;
		Update : BOOL;
		Autotune : BOOL;
		ReleaseBreak : BOOL;
		TorqControl : AxCtrlInpCmdSinAxATorType;
	END_STRUCT;
	AxCtrlInpCmdSinAxATorType : 	STRUCT 
		ErrorReset : BOOL;
		CyclicTorqueOff : BOOL;
		CyclicTorqueOn : BOOL;
		CyclicVelocityOn : BOOL;
		CyclicVelocityOff : BOOL;
		CyclicPositionOff : BOOL;
		CyclicPositionOn : BOOL;
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
	AxisCtrlInpParamsCyclicType : 	STRUCT 
		Torque : LREAL;
		Velocity : LREAL;
		Position : LREAL;
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
	END_STRUCT;
	AxisCtrlOutStatesSingAxType : 	STRUCT 
		Active : BOOL;
		UpdateDone : BOOL;
		PowerOn : BOOL;
		IsHomed : BOOL;
		InVelocity : BOOL;
		InPosition : BOOL;
		MoveActive : BOOL;
		Stopped : BOOL;
		StatusID : DINT;
		Error : BOOL;
		Params : AxisCtrlOutStatesSingAxParType;
		CyclicSet : AxisCtrlOutStatesSingAxCycSeTyp;
	END_STRUCT;
	AxisCtrlOutStatesSingAxParType : 	STRUCT 
		PositionAct : LREAL;
		VelocityAct : LREAL;
		Position : LREAL;
		Velocity : LREAL;
		Acceleration : LREAL;
		Deceleration : LREAL;
		Distance : LREAL;
		CycParams : AxisCtrlOutStateSinAxParCycType;
		TorqueLimit : LREAL;
	END_STRUCT;
	AxisCtrlOutStatesSingAxCycSeTyp : 	STRUCT 
		Active : BOOL;
		Error : BOOL;
		StatusID : UDINT;
		UpdateDone : BOOL;
		CyclicSetActive : BOOL;
		CommandAborted : BOOL;
		CommandBusy : BOOL;
	END_STRUCT;
	AxisCtrlOutStatesDiagType : 	STRUCT 
		A0 : AxisCtrlOutStatesDiagAxType;
	END_STRUCT;
	AxisCtrlOutStateSinAxParCycType : 	STRUCT 
		Torque : LREAL;
		Velocity : LREAL;
		Position : LREAL;
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
		MOVE_ADDITIVE_OFF,
		MOVE_VELOCITY,
		MOVE_VELOCITY_OFF,
		MOVE_ABSOLUTE,
		MOVE_ABSOLUTE_OFF,
		STOP_OFF,
		STOP_ON,
		HOME,
		POWER_OFF,
		POWER_ON,
		WAIT_FOR_ACTIVE,
		ERROR,
		ERROR_RESET,
		UPDATE_MP_AXIS_BASIC,
		CYCLIC_POSITION_ON,
		CYCLIC_TORQUE_ON,
		CYCLIC_VELOCITY_ON,
		CYCLIC_TORQUE_OFF,
		CYCLIC_VELOCITY_OFF,
		CYCLIC_POSITION_OFF,
		UPDATE_CYCLIC_SET,
		UPDATE_JOG_PARAMS
		);
	HomingEnum : 
		(
		PREPARE_HOME,
		HOMING,
		EXIT_HOME
		);
END_TYPE
