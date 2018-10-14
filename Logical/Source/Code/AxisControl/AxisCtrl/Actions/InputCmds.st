
ACTION Input_commands: 
	
	(* ALL AXIS *)
	IF _AxisCtrl.Input.Commands.AllAxis.PowerOn THEN
		_AxisCtrl.Input.Commands.AllAxis.PowerOn := FALSE;
		_AxisCtrl.Output.Status.AxisStateMachine := POWER_ON;
			
	ELSIF _AxisCtrl.Input.Commands.AllAxis.PowerOff THEN
		_AxisCtrl.Input.Commands.AllAxis.PowerOff := FALSE;
		_AxisCtrl.Output.Status.AxisStateMachine := POWER_OFF;
		
	ELSIF _AxisCtrl.Input.Commands.AllAxis.Home THEN
		_AxisCtrl.Input.Commands.AllAxis.Home := FALSE;
		_AxisCtrl.Output.Status.AxisStateMachine := HOME;
	
	ELSIF _AxisCtrl.Input.Commands.AllAxis.StopOn THEN
		_AxisCtrl.Input.Commands.AllAxis.StopOn := FALSE;
		_AxisCtrl.Output.Status.AxisStateMachine := STOP_ON;
		
	ELSIF _AxisCtrl.Input.Commands.AllAxis.StopOff THEN
		_AxisCtrl.Input.Commands.AllAxis.StopOff := FALSE;
		_AxisCtrl.Output.Status.AxisStateMachine := STOP_OFF;
		
	ELSIF _AxisCtrl.Input.Commands.AllAxis.MoveAbsolute THEN
		_AxisCtrl.Input.Commands.AllAxis.MoveAbsolute := FALSE;
		_AxisCtrl.Output.Status.AxisStateMachine := MOVE_ABSOLUTE;
	
	ELSIF _AxisCtrl.Input.Commands.AllAxis.MoveVelocity THEN
		_AxisCtrl.Input.Commands.AllAxis.MoveVelocity := FALSE;
		_AxisCtrl.Output.Status.AxisStateMachine := MOVE_VELOCITY;
		
	ELSIF _AxisCtrl.Input.Commands.AllAxis.MoveAdditive THEN
		_AxisCtrl.Input.Commands.AllAxis.MoveAdditive := FALSE;
		_AxisCtrl.Output.Status.AxisStateMachine := MOVE_ADDITIVE;
				
	ELSIF _AxisCtrl.Input.Commands.AllAxis.JogPositive THEN
		_AxisCtrl.Output.Status.AxisStateMachine := JOG;
		
	ELSIF _AxisCtrl.Input.Commands.AllAxis.JogNegative THEN
		_AxisCtrl.Output.Status.AxisStateMachine := JOG;
		
	ELSIF _AxisCtrl.Input.Commands.AllAxis.ErrorReset THEN
		_AxisCtrl.Input.Commands.AllAxis.ErrorReset := FALSE;
		_AxisCtrl.Output.Status.AxisStateMachine := ERROR_RESET;
		
	(* SINGLE AXIS *)
	ELSIF _AxisCtrl.Input.Commands.SingleAxis.PowerOn THEN
		_AxisCtrl.Input.Commands.SingleAxis.PowerOn := FALSE;
		_AxisCtrl.Output.Status.AxisStateMachine := POWER_ON;
			
	ELSIF _AxisCtrl.Input.Commands.SingleAxis.PowerOff THEN
		_AxisCtrl.Input.Commands.SingleAxis.PowerOff := FALSE;
		_AxisCtrl.Output.Status.AxisStateMachine := POWER_OFF;
		
	ELSIF _AxisCtrl.Input.Commands.SingleAxis.Home THEN
		_AxisCtrl.Input.Commands.SingleAxis.Home := FALSE;
		_AxisCtrl.Output.Status.AxisStateMachine := HOME;
	
	ELSIF _AxisCtrl.Input.Commands.SingleAxis.StopOn THEN
		_AxisCtrl.Input.Commands.SingleAxis.StopOn := FALSE;
		_AxisCtrl.Output.Status.AxisStateMachine := STOP_ON;
		
	ELSIF _AxisCtrl.Input.Commands.SingleAxis.StopOff THEN
		_AxisCtrl.Input.Commands.SingleAxis.StopOff := FALSE;
		_AxisCtrl.Output.Status.AxisStateMachine := STOP_OFF;
		
	ELSIF _AxisCtrl.Input.Commands.SingleAxis.MoveAbsolute THEN
		_AxisCtrl.Input.Commands.SingleAxis.MoveAbsolute := FALSE;
		_AxisCtrl.Output.Status.AxisStateMachine := MOVE_ABSOLUTE;
	
	ELSIF _AxisCtrl.Input.Commands.SingleAxis.MoveVelocity THEN
		_AxisCtrl.Input.Commands.SingleAxis.MoveVelocity := FALSE;
		_AxisCtrl.Output.Status.AxisStateMachine := MOVE_VELOCITY;
		
	ELSIF _AxisCtrl.Input.Commands.SingleAxis.MoveAdditive THEN
		_AxisCtrl.Input.Commands.SingleAxis.MoveAdditive := FALSE;
		_AxisCtrl.Output.Status.AxisStateMachine := MOVE_ADDITIVE;
				
	ELSIF _AxisCtrl.Input.Commands.SingleAxis.JogPositive THEN
		_AxisCtrl.Output.Status.AxisStateMachine := JOG;
		
	ELSIF _AxisCtrl.Input.Commands.SingleAxis.JogNegative THEN
		_AxisCtrl.Output.Status.AxisStateMachine := JOG;
		
	ELSIF _AxisCtrl.Input.Commands.SingleAxis.ErrorReset THEN
		_AxisCtrl.Input.Commands.SingleAxis.ErrorReset := FALSE;
		_AxisCtrl.Output.Status.AxisStateMachine := ERROR_RESET;
		
	END_IF
		
		
	
	
	
END_ACTION
