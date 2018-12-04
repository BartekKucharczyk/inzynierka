
ACTION ErrorHandling: 

	IF (_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Error OR _AxisCtrl.Internal.FunctionsBlock.TorqueControl.Error) AND _AxisCtrl.Output.Status.AxisStateMachine <> ERROR_RESET THEN
		_AxisCtrl.Output.Status.AxisStateMachine := ERROR;
	END_IF
	
	
END_ACTION
