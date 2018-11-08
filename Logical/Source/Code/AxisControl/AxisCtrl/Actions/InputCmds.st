
ACTION Input_commands: 
	
	(* ALL AXES  *)
	(* POWER ON  *)
	IF _AxisCtrl.Input.Commands.AllAxis.PowerOn THEN
		_AxisCtrl.Input.Commands.AllAxis.PowerOn := FALSE;
		_AxisCtrl.Input.Commands.SingleAxis.A1.PowerOn := TRUE;
		
	(* POWER OFF *)
	ELSIF _AxisCtrl.Input.Commands.AllAxis.PowerOff THEN
		_AxisCtrl.Input.Commands.AllAxis.PowerOff := FALSE;
		_AxisCtrl.Input.Commands.SingleAxis.A1.PowerOff := TRUE;
		
	(* 	 HOME 	 *)
	ELSIF _AxisCtrl.Input.Commands.AllAxis.Home THEN
		_AxisCtrl.Input.Commands.AllAxis.Home := FALSE;
		_AxisCtrl.Input.Commands.SingleAxis.A1.Home := TRUE;
		
	(*	STOP ON	 *)
	ELSIF _AxisCtrl.Input.Commands.AllAxis.StopOn THEN
		_AxisCtrl.Input.Commands.AllAxis.StopOn := FALSE;
		_AxisCtrl.Input.Commands.SingleAxis.A1.StopOn := TRUE;
		
	(*	STOP OFF *)	
	ELSIF _AxisCtrl.Input.Commands.AllAxis.StopOff THEN
		_AxisCtrl.Input.Commands.AllAxis.StopOff := FALSE;
		_AxisCtrl.Input.Commands.SingleAxis.A1.StopOff := TRUE;
		
	(* MOVE ABSOLUTE *)
	ELSIF _AxisCtrl.Input.Commands.AllAxis.MoveAbsolute THEN
		_AxisCtrl.Input.Commands.AllAxis.MoveAbsolute := FALSE;
		_AxisCtrl.Input.Commands.SingleAxis.A1.MoveAbsolute := TRUE;
	
	(* MOVE VELOCITY *)	
	ELSIF _AxisCtrl.Input.Commands.AllAxis.MoveVelocity THEN
		_AxisCtrl.Input.Commands.AllAxis.MoveVelocity := FALSE;
		_AxisCtrl.Input.Commands.SingleAxis.A1.MoveVelocity := TRUE;
		
	(* MOVE ADDITIVE *)
	ELSIF _AxisCtrl.Input.Commands.AllAxis.MoveAdditive THEN
		_AxisCtrl.Input.Commands.AllAxis.MoveAdditive := FALSE;
		_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.MoveAdditive := TRUE;
		
	(* MOVE TORQUE *)
	ELSIF _AxisCtrl.Input.Commands.AllAxis.MoveTorque THEN
		_AxisCtrl.Input.Commands.AllAxis.MoveTorque := FALSE;
		_AxisCtrl.Input.Commands.SingleAxis.A1.MoveTorque := TRUE;
		
	(* JOG POSITIVE *)
	ELSIF _AxisCtrl.Input.Commands.AllAxis.Jog THEN
		_AxisCtrl.Output.Status.AxisStateMachine := JOG_POSITIVE;
		
	(* ERROR RESET	*)	
	ELSIF _AxisCtrl.Input.Commands.AllAxis.ErrorReset THEN
		_AxisCtrl.Input.Commands.AllAxis.ErrorReset := FALSE;
		_AxisCtrl.Input.Commands.SingleAxis.A1.ErrorReset := TRUE;
	
	END_IF	

END_ACTION
