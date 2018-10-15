
ACTION Axis1: 
	
	CASE _AxisCtrl.Output.Status.AxisStateMachine OF
		WAIT_FOR_CMD:
			
			IF _AxisCtrl.Input.Commands.SingleAxis.A1.PowerOn THEN
				_AxisCtrl.Input.Commands.SingleAxis.A1.PowerOn := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := POWER_ON;
			
			ELSIF _AxisCtrl.Input.Commands.SingleAxis.A1.PowerOff THEN
				_AxisCtrl.Input.Commands.SingleAxis.A1.PowerOff := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := POWER_OFF;
		
			ELSIF _AxisCtrl.Input.Commands.SingleAxis.A1.Home THEN
				_AxisCtrl.Input.Commands.SingleAxis.A1.Home := FALSE;
				_AxisCtrl.Output.Status.HomingStateMachine := PREPARE_HOME;
				_AxisCtrl.Output.Status.AxisStateMachine := HOME;
	
			ELSIF _AxisCtrl.Input.Commands.SingleAxis.A1.StopOn THEN
				_AxisCtrl.Input.Commands.SingleAxis.A1.StopOn := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := STOP_ON;
		
			ELSIF _AxisCtrl.Input.Commands.SingleAxis.A1.StopOff THEN
				_AxisCtrl.Input.Commands.SingleAxis.A1.StopOff := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := STOP_OFF;
		
			ELSIF _AxisCtrl.Input.Commands.SingleAxis.A1.MoveAbsolute THEN
				_AxisCtrl.Input.Commands.SingleAxis.A1.MoveAbsolute := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := MOVE_ABSOLUTE;
	
			ELSIF _AxisCtrl.Input.Commands.SingleAxis.A1.MoveVelocity THEN
				_AxisCtrl.Input.Commands.SingleAxis.A1.MoveVelocity := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := MOVE_VELOCITY;
		
			ELSIF _AxisCtrl.Input.Commands.SingleAxis.A1.MoveAdditive THEN
				_AxisCtrl.Input.Commands.SingleAxis.A1.MoveAdditive := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := MOVE_ADDITIVE;
				
			ELSIF _AxisCtrl.Input.Commands.SingleAxis.A1.JogPositive THEN
				_AxisCtrl.Output.Status.AxisStateMachine := JOG_POSITIVE;
			
			ELSIF _AxisCtrl.Input.Commands.SingleAxis.A1.JogNegative THEN
				_AxisCtrl.Output.Status.AxisStateMachine := JOG_NEGATIVE;
		
			ELSIF _AxisCtrl.Input.Commands.SingleAxis.A1.ErrorReset THEN
				_AxisCtrl.Input.Commands.SingleAxis.A1.ErrorReset := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := ERROR_RESET;
			
			ELSIF _AxisCtrl.Input.Commands.SingleAxis.A1.Update THEN
				_AxisCtrl.Input.Commands.SingleAxis.A1.Update := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := UPDATE;
			
			END_IF
			
			
		WAIT_FOR_ACTIVE:
			IF _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Active THEN
				_AxisCtrl.Output.Status.AxisStateMachine := WAIT_FOR_CMD;
			ELSIF _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Error THEN
				_AxisCtrl.Output.Status.AxisStateMachine := ERROR;
			END_IF
		
		
		POWER_ON:
			IF _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.PowerOn THEN
				_AxisCtrl.Output.Status.AxisStateMachine := WAIT_FOR_CMD;
				
			ELSIF _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Error THEN
				_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Power := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := ERROR;
			
			ELSE 
				_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Power := TRUE;
					
			END_IF
		
		POWER_OFF:
			IF NOT _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.PowerOn THEN
				_AxisCtrl.Output.Status.AxisStateMachine := WAIT_FOR_CMD;
						
			ELSIF _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Error THEN
				_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Power := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := ERROR;
							
			ELSE 
				_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Power := FALSE;	
			END_IF
		
		HOME:
			CASE _AxisCtrl.Output.Status.HomingStateMachine OF
				PREPARE_HOME:
					_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Home := FALSE;
					_AxisCtrl.Output.Status.HomingStateMachine := HOMING;
				HOMING:
					_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Home := TRUE;
					IF _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.IsHomed THEN
						_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Home := FALSE;
						_AxisCtrl.Output.Status.HomingStateMachine := EXIT_HOME;
					END_IF
				EXIT_HOME:
					_AxisCtrl.Output.Status.AxisStateMachine := WAIT_FOR_CMD;
					_AxisCtrl.Output.Status.HomingStateMachine := PREPARE_HOME;
			END_CASE;	
		
		STOP_ON:
			IF _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Stopped THEN 
				_AxisCtrl.Output.Status.AxisStateMachine := WAIT_FOR_CMD;
			ELSIF _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Error THEN
				_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Stop := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := ERROR;
			ELSE				
				_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Stop := TRUE;
			END_IF
		
		
		STOP_OFF:
			IF NOT _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Stopped THEN 
				_AxisCtrl.Output.Status.AxisStateMachine := WAIT_FOR_CMD;
			ELSIF _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Error THEN
				_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Stop := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := ERROR;
			ELSE				
				_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Stop := FALSE;
			END_IF
		
		MOVE_ABSOLUTE:	
			IF _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.MoveActive AND _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.MoveAbsolute THEN
				_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.MoveAbsolute := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := WAIT_FOR_CMD;
			END_IF
			_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.MoveAbsolute := TRUE;
			
		MOVE_VELOCITY:	
			IF _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.MoveActive AND _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.MoveVelocity THEN
				_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.MoveVelocity := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := WAIT_FOR_CMD;
			END_IF
			_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.MoveVelocity := TRUE;
			
		MOVE_ADDITIVE:
			IF _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.MoveActive AND _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.MoveAdditive THEN
				_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.MoveAdditive := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := WAIT_FOR_CMD;
			END_IF
			_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.MoveAdditive := TRUE;
			
		JOG_POSITIVE:
			IF NOT _AxisCtrl.Input.Commands.SingleAxis.A1.JogPositive THEN
				_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.JogPositive := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := WAIT_FOR_CMD;
			ELSE 
				_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.JogPositive := TRUE;
			END_IF	
		
		JOG_NEGATIVE:
			IF NOT _AxisCtrl.Input.Commands.SingleAxis.A1.JogNegative THEN
				_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.JogNegative := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := WAIT_FOR_CMD;
			ELSE 
				_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.JogNegative := TRUE;
			END_IF
				
		UPDATE:
			IF _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.UpdateDone THEN
				_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Update := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := WAIT_FOR_CMD;
			ELSE 
				_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Update := TRUE;
			END_IF
				
				
		ERROR:	
			IF _AxisCtrl.Input.Commands.SingleAxis.A1.ErrorReset THEN
				_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.ErrorReset := TRUE;
				_AxisCtrl.Output.Status.AxisStateMachine := ERROR_RESET;
			END_IF
	
		ERROR_RESET:
			IF NOT _AxisCtrl.Output.States.SingleAxis.Axis_0.Error THEN
				_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.ErrorReset := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := WAIT_FOR_CMD;
				
			END_IF
		
	END_CASE;
	
	

END_ACTION