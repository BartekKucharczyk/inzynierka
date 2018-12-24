
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
	
			ELSIF _AxisCtrl.Input.Commands.SingleAxis.A1.MoveAbsoluteOff THEN
				_AxisCtrl.Input.Commands.SingleAxis.A1.MoveAbsoluteOff := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := MOVE_ABSOLUTE_OFF;
				
			ELSIF _AxisCtrl.Input.Commands.SingleAxis.A1.MoveVelocity THEN
				_AxisCtrl.Input.Commands.SingleAxis.A1.MoveVelocity := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := MOVE_VELOCITY;
				
			ELSIF _AxisCtrl.Input.Commands.SingleAxis.A1.MoveVelocityOff THEN
				_AxisCtrl.Input.Commands.SingleAxis.A1.MoveVelocityOff := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := MOVE_VELOCITY_OFF;
		
			ELSIF _AxisCtrl.Input.Commands.SingleAxis.A1.MoveAdditive THEN
				_AxisCtrl.Input.Commands.SingleAxis.A1.MoveAdditive := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := MOVE_ADDITIVE;
				
			ELSIF _AxisCtrl.Input.Commands.SingleAxis.A1.MoveAdditiveOff THEN
				_AxisCtrl.Input.Commands.SingleAxis.A1.MoveAdditiveOff := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := MOVE_ADDITIVE_OFF;
				
			ELSIF _AxisCtrl.Input.Commands.SingleAxis.A1.JogPositive THEN
				_AxisCtrl.Output.Status.AxisStateMachine := JOG_POSITIVE;
			
			ELSIF _AxisCtrl.Input.Commands.SingleAxis.A1.JogNegative THEN
				_AxisCtrl.Output.Status.AxisStateMachine := JOG_NEGATIVE;
			
			ELSIF _AxisCtrl.Input.Commands.SingleAxis.A1.Update THEN
				_AxisCtrl.Input.Commands.SingleAxis.A1.Update := FALSE;
				_AxisCtrl.Internal.Functions.MpAxisBasicParType_0.Acceleration := _AxisCtrl.Input.Parameters.Acceleration;
				_AxisCtrl.Internal.Functions.MpAxisBasicParType_0.Deceleration := _AxisCtrl.Input.Parameters.Deceleration;
				_AxisCtrl.Internal.Functions.MpAxisBasicParType_0.Distance	   := _AxisCtrl.Input.Parameters.Distance;
				_AxisCtrl.Internal.Functions.MpAxisBasicParType_0.Position 	   := _AxisCtrl.Input.Parameters.Position;
				_AxisCtrl.Internal.Functions.MpAxisBasicParType_0.Velocity 	   := _AxisCtrl.Input.Parameters.Velocity;
			//	_AxisCtrl.Internal.Functions.MpAxisBasicParType_0.Torque.Limit  := _AxisCtrl.Input.Parameters.TorqueLimit;
			//	_AxisCtrl.Internal.Functions.MpAxisBasicParType_0.Torque.Window := _AxisCtrl.Input.Parameters.TorqueWindow;
				
				_AxisCtrl.Output.Status.AxisStateMachine := UPDATE_MP_AXIS_BASIC;
				
			ELSIF _AxisCtrl.Input.Commands.SingleAxis.A1.UpdateJogParams THEN
				_AxisCtrl.Input.Commands.SingleAxis.A1.UpdateJogParams := FALSE;
				_AxisCtrl.Internal.Functions.MpAxisBasicParType_0.Jog.Acceleration := _AxisCtrl.Input.Parameters.JogParams.Acceleration;
				_AxisCtrl.Internal.Functions.MpAxisBasicParType_0.Jog.Deceleration := _AxisCtrl.Input.Parameters.JogParams.Deceleration;
				_AxisCtrl.Internal.Functions.MpAxisBasicParType_0.Jog.LowerLimit   := _AxisCtrl.Input.Parameters.JogParams.LowerLimit;
			//	_AxisCtrl.Internal.Functions.MpAxisBasicParType_0.Jog.UpperLimit   := _AxisCtrl.Input.Parameters.JogParams.UpperLimit;
				_AxisCtrl.Internal.Functions.MpAxisBasicParType_0.Jog.Velocity     := _AxisCtrl.Input.Parameters.JogParams.JogVelocity;
				
				_AxisCtrl.Output.Status.AxisStateMachine := UPDATE_JOG_PARAMS;
				
				(* CYCLIC SET FUBS *)
			ELSIF _AxisCtrl.Input.Commands.SingleAxis.A1.TorqControl.CyclicPositionOn THEN
				_AxisCtrl.Input.Commands.SingleAxis.A1.TorqControl.CyclicPositionOn := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := CYCLIC_POSITION_ON;
				
			ELSIF _AxisCtrl.Input.Commands.SingleAxis.A1.TorqControl.CyclicTorqueOn THEN
				_AxisCtrl.Input.Commands.SingleAxis.A1.TorqControl.CyclicTorqueOff := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := CYCLIC_TORQUE_ON;
				
			ELSIF _AxisCtrl.Input.Commands.SingleAxis.A1.TorqControl.CyclicVelocityOn THEN
				_AxisCtrl.Input.Commands.SingleAxis.A1.TorqControl.CyclicVelocityOff := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := CYCLIC_VELOCITY_ON;
		 
			ELSIF _AxisCtrl.Input.Commands.SingleAxis.A1.TorqControl.CyclicPositionOff THEN
				_AxisCtrl.Input.Commands.SingleAxis.A1.TorqControl.CyclicPositionOff := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := CYCLIC_POSITION_OFF;
				
			ELSIF _AxisCtrl.Input.Commands.SingleAxis.A1.TorqControl.CyclicTorqueOff THEN
				_AxisCtrl.Input.Commands.SingleAxis.A1.TorqControl.CyclicTorqueOff := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := CYCLIC_TORQUE_OFF;
				
			ELSIF _AxisCtrl.Input.Commands.SingleAxis.A1.TorqControl.CyclicVelocityOff THEN
				_AxisCtrl.Input.Commands.SingleAxis.A1.TorqControl.CyclicVelocityOff := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := CYCLIC_VELOCITY_OFF;
					
			ELSIF _AxisCtrl.Input.Commands.SingleAxis.A1.TorqControl.Update THEN
				
				_AxisCtrl.Internal.FunctionsBlock.TorqueControl.Position := _AxisCtrl.Input.Parameters.CyclicSetParameter.Position;
				_AxisCtrl.Internal.FunctionsBlock.TorqueControl.Torque 	 := _AxisCtrl.Input.Parameters.CyclicSetParameter.Torque;
				_AxisCtrl.Internal.FunctionsBlock.TorqueControl.Velocity := _AxisCtrl.Input.Parameters.CyclicSetParameter.Velocity;
						
				_AxisCtrl.Input.Commands.SingleAxis.A1.TorqControl.Update := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := UPDATE_CYCLIC_SET;
				
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
		
			_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.MoveAbsolute := TRUE;
			_AxisCtrl.Output.Status.AxisStateMachine := WAIT_FOR_CMD;
						
		MOVE_ABSOLUTE_OFF:
		
			_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.MoveAbsolute := FALSE;
			_AxisCtrl.Output.Status.AxisStateMachine := WAIT_FOR_CMD;
					
		MOVE_VELOCITY:	
		
			_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.MoveVelocity := TRUE;	
			_AxisCtrl.Output.Status.AxisStateMachine := WAIT_FOR_CMD;
		
		MOVE_VELOCITY_OFF:
			
			_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.MoveVelocity := FALSE;	
			_AxisCtrl.Output.Status.AxisStateMachine := WAIT_FOR_CMD;
		
		MOVE_ADDITIVE:
			
			_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.MoveAdditive := TRUE;
			_AxisCtrl.Output.Status.AxisStateMachine := WAIT_FOR_CMD;
			
		MOVE_ADDITIVE_OFF:
			
			_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.MoveAdditive := FALSE;
			_AxisCtrl.Output.Status.AxisStateMachine := WAIT_FOR_CMD;
			
			
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
				
		UPDATE_MP_AXIS_BASIC:
			IF _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.UpdateDone THEN
				_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Update := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := WAIT_FOR_CMD;
			ELSE 
				_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Update := TRUE;
			END_IF
				
		UPDATE_JOG_PARAMS:
			IF _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.UpdateDone THEN
				_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Update := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := WAIT_FOR_CMD;
			ELSE 
				_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Update := TRUE;
			END_IF
			
		ERROR:	
			IF _AxisCtrl.Input.Commands.SingleAxis.A1.ErrorReset OR _AxisCtrl.Input.Commands.SingleAxis.A1.TorqControl.ErrorReset THEN
				_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.ErrorReset := TRUE;
				_AxisCtrl.Internal.FunctionsBlock.TorqueControl.ErrorReset := TRUE;
				_AxisCtrl.Output.Status.AxisStateMachine := ERROR_RESET;
			END_IF
	
		ERROR_RESET:
			IF NOT _AxisCtrl.Output.States.SingleAxis.Axis_0.Error AND NOT _AxisCtrl.Internal.FunctionsBlock.TorqueControl.Error THEN
				_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.ErrorReset := FALSE;
				_AxisCtrl.Internal.FunctionsBlock.TorqueControl.ErrorReset := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := WAIT_FOR_CMD;
				
			END_IF
		
		CYCLIC_POSITION_ON:
			
	    		_AxisCtrl.Internal.FunctionsBlock.TorqueControl.CyclicPosition := TRUE;
				_AxisCtrl.Output.Status.AxisStateMachine := WAIT_FOR_CMD;
				
		CYCLIC_POSITION_OFF:
		
				_AxisCtrl.Internal.FunctionsBlock.TorqueControl.CyclicPosition := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := WAIT_FOR_CMD;
			
		CYCLIC_TORQUE_ON:
	
			_AxisCtrl.Internal.FunctionsBlock.TorqueControl.CyclicTorque := TRUE;
			_AxisCtrl.Output.Status.AxisStateMachine := WAIT_FOR_CMD;
		
		CYCLIC_TORQUE_OFF:
		
			_AxisCtrl.Internal.FunctionsBlock.TorqueControl.CyclicTorque := FALSE;
			_AxisCtrl.Output.Status.AxisStateMachine := WAIT_FOR_CMD;
		
		CYCLIC_VELOCITY_ON:
		
			_AxisCtrl.Internal.FunctionsBlock.TorqueControl.CyclicVelocity := TRUE;
			_AxisCtrl.Output.Status.AxisStateMachine := WAIT_FOR_CMD;
			
		CYCLIC_VELOCITY_OFF:
		
			_AxisCtrl.Internal.FunctionsBlock.TorqueControl.CyclicVelocity := FALSE;
			_AxisCtrl.Output.Status.AxisStateMachine := WAIT_FOR_CMD;
		
		UPDATE_CYCLIC_SET:
			IF _AxisCtrl.Internal.FunctionsBlock.TorqueControl.UpdateDone THEN
				_AxisCtrl.Internal.FunctionsBlock.TorqueControl.Update := FALSE;
				_AxisCtrl.Output.Status.AxisStateMachine := WAIT_FOR_CMD;
			ELSE 
				_AxisCtrl.Internal.FunctionsBlock.TorqueControl.Update := TRUE;
			END_IF
		
	END_CASE;
	
	

END_ACTION
