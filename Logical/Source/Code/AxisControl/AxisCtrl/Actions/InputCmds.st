
ACTION Input_commands: 
	
	(* ALL AXES  *)
	(* POWER ON  *)
	IF _AxisCtrl.Input.Commands.AllAxis.PowerOn THEN
		_AxisCtrl.Input.Commands.AllAxis.PowerOn := FALSE;
		_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Power := TRUE;
		
	(* POWER OFF *)
	ELSIF _AxisCtrl.Input.Commands.AllAxis.PowerOff THEN
		_AxisCtrl.Input.Commands.AllAxis.PowerOff := FALSE;
		_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Power := FALSE;
		
	(* 	 HOME 	 *)
	ELSIF _AxisCtrl.Input.Commands.AllAxis.Home THEN
		_AxisCtrl.Input.Commands.AllAxis.Home := FALSE;
		_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Home := TRUE;
		
	(*	STOP ON	 *)
	ELSIF _AxisCtrl.Input.Commands.AllAxis.StopOn THEN
		_AxisCtrl.Input.Commands.AllAxis.StopOn := FALSE;
		_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Stop := TRUE;
		
	(*	STOP OFF *)	
	ELSIF _AxisCtrl.Input.Commands.AllAxis.StopOff THEN
		_AxisCtrl.Input.Commands.AllAxis.StopOff := FALSE;
		_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Stop := FALSE;
		
	(* MOVE ABSOLUTE *)
	ELSIF _AxisCtrl.Input.Commands.AllAxis.MoveAbsolute THEN
		_AxisCtrl.Input.Commands.AllAxis.MoveAbsolute := FALSE;
		_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.MoveAbsolute := TRUE;
	
	(* MOVE VELOCITY *)	
	ELSIF _AxisCtrl.Input.Commands.AllAxis.MoveVelocity THEN
		_AxisCtrl.Input.Commands.AllAxis.MoveVelocity := FALSE;
		_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.MoveVelocity := TRUE;
		
	(* MOVE ADDITIVE *)
	ELSIF _AxisCtrl.Input.Commands.AllAxis.MoveAdditive THEN
		_AxisCtrl.Input.Commands.AllAxis.MoveAdditive := FALSE;
		_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.MoveAdditive := TRUE;
		
	(* JOG POSITIVE *)
	ELSIF _AxisCtrl.Input.Commands.AllAxis.Jog THEN
		_AxisCtrl.Output.Status.AxisStateMachine := JOG_POSITIVE;
		
	(* ERROR RESET	*)	
	ELSIF _AxisCtrl.Input.Commands.AllAxis.ErrorReset THEN
		_AxisCtrl.Input.Commands.AllAxis.ErrorReset := FALSE;
		_AxisCtrl.Output.Status.AxisStateMachine := ERROR_RESET;
	
	END_IF	

END_ACTION
