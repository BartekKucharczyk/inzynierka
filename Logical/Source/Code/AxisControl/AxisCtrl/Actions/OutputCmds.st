
ACTION Output_commands: 
	
	(* FIRST AXIS *)
	_AxisCtrl.Output.States.SingleAxis.Axis_0.Active     := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Active;
	
	_AxisCtrl.Output.States.SingleAxis.Axis_0.PowerOn    := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.PowerOn;
	
	_AxisCtrl.Output.States.SingleAxis.Axis_0.IsHomed    := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.IsHomed;
	
	_AxisCtrl.Output.States.SingleAxis.Axis_0.Stopped    := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Stopped;
	
	_AxisCtrl.Output.States.SingleAxis.Axis_0.InPosition := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.InPosition;
	
	_AxisCtrl.Output.States.SingleAxis.Axis_0.InVelocity := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.InVelocity;
	
	_AxisCtrl.Output.States.SingleAxis.Axis_0.MoveActive := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.MoveActive;
	
	_AxisCtrl.Output.States.SingleAxis.Axis_0.Error		 := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Error;
	
	_AxisCtrl.Output.States.SingleAxis.Axis_0.StatusID	 := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.StatusID;
	
	_AxisCtrl.Output.States.SingleAxis.Axis_0.UpdateDone := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.UpdateDone;
	
	(* PARAMS *)
	_AxisCtrl.Output.States.SingleAxis.Axis_0.Params.PositionAct  := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Position;
	_AxisCtrl.Output.States.SingleAxis.Axis_0.Params.VelocityAct  := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Velocity;
	_AxisCtrl.Output.States.SingleAxis.Axis_0.Params.Acceleration := _AxisCtrl.Internal.Functions.MpAxisBasicParType_0.Acceleration;
	_AxisCtrl.Output.States.SingleAxis.Axis_0.Params.Deceleration := _AxisCtrl.Internal.Functions.MpAxisBasicParType_0.Deceleration;
	_AxisCtrl.Output.States.SingleAxis.Axis_0.Params.Distance	  := _AxisCtrl.Internal.Functions.MpAxisBasicParType_0.Distance;
	_AxisCtrl.Output.States.SingleAxis.Axis_0.Params.Position	  := _AxisCtrl.Internal.Functions.MpAxisBasicParType_0.Position;
	_AxisCtrl.Output.States.SingleAxis.Axis_0.Params.TorqueLimit  := _AxisCtrl.Internal.Functions.MpAxisBasicParType_0.Torque.Limit;
	_AxisCtrl.Output.States.SingleAxis.Axis_0.Params.Velocity	  := _AxisCtrl.Internal.Functions.MpAxisBasicParType_0.Velocity;


	(* DIAG *)
	_AxisCtrl.Output.States.Diagnosis.A0.AxisInitialized := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Info.AxisInitialized;
	_AxisCtrl.Output.States.Diagnosis.A0.DriveRestarted  := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Info.DriveRestarted;
	_AxisCtrl.Output.States.Diagnosis.A0.JogLimited		 := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Info.JogLimited;
	_AxisCtrl.Output.States.Diagnosis.A0.ReadyToOPowerOn := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Info.ReadyToPowerOn;
	_AxisCtrl.Output.States.Diagnosis.A0.TorqueLimitActive := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Info.TorqueLimitActive;
	
	CASE _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Info.PLCopenState OF
		0:
			_AxisCtrl.Output.States.Diagnosis.A0.PLCopenStateAx0 := 'Axis disabled';
		1:
			_AxisCtrl.Output.States.Diagnosis.A0.PLCopenStateAx0 := 'Axis standstill';
		2:
			_AxisCtrl.Output.States.Diagnosis.A0.PLCopenStateAx0 := 'Axis discrete motion';
		3:		
			_AxisCtrl.Output.States.Diagnosis.A0.PLCopenStateAx0 := 'Axis continuous motion';
		4:
			_AxisCtrl.Output.States.Diagnosis.A0.PLCopenStateAx0 := 'Axis synchronized motion';
		5:	
			_AxisCtrl.Output.States.Diagnosis.A0.PLCopenStateAx0 := 'Axis homing';
		9:
			_AxisCtrl.Output.States.Diagnosis.A0.PLCopenStateAx0 := 'Axis stopping';
		10:
			_AxisCtrl.Output.States.Diagnosis.A0.PLCopenStateAx0 := 'Axis errorstop';		
	END_CASE
	
	(* MpAxisCyclicSet *)
	_AxisCtrl.Output.States.SingleAxis.Axis_0.CyclicSet.Active		    := _AxisCtrl.Internal.FunctionsBlock.TorqueControl.Active;
	_AxisCtrl.Output.States.SingleAxis.Axis_0.CyclicSet.CommandAborted  := _AxisCtrl.Internal.FunctionsBlock.TorqueControl.CommandAborted;
	_AxisCtrl.Output.States.SingleAxis.Axis_0.CyclicSet.CommandBusy     := _AxisCtrl.Internal.FunctionsBlock.TorqueControl.CommandBusy;
	_AxisCtrl.Output.States.SingleAxis.Axis_0.CyclicSet.CyclicSetActive := _AxisCtrl.Internal.FunctionsBlock.TorqueControl.CyclicSetActive;
	_AxisCtrl.Output.States.SingleAxis.Axis_0.CyclicSet.Error			:= _AxisCtrl.Internal.FunctionsBlock.TorqueControl.Error;
	_AxisCtrl.Output.States.SingleAxis.Axis_0.CyclicSet.StatusID		:= _AxisCtrl.Internal.FunctionsBlock.TorqueControl.StatusID;
	_AxisCtrl.Output.States.SingleAxis.Axis_0.CyclicSet.UpdateDone 		:= _AxisCtrl.Internal.FunctionsBlock.TorqueControl.UpdateDone;

		

	
	(* CALL FUBS *)
	_AxisCtrl.Internal.FunctionsBlock.TorqueControl();
	_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0();
	
END_ACTION
