
ACTION Output_commands: 
	(* ALL AXES *)
	_AxisCtrl.Output.States.AllAxis.Error 	   := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Error OR _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_1.Error;
	
	_AxisCtrl.Output.States.AllAxis.Active     := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Active AND _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_1.Active;
	
	_AxisCtrl.Output.States.AllAxis.PowerOn    := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.PowerOn AND _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_1.PowerOn;
	
	_AxisCtrl.Output.States.AllAxis.IsHomed    := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.IsHomed AND _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_1.IsHomed;
	
	_AxisCtrl.Output.States.AllAxis.Stopped    := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Stopped AND _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_1.Stopped;
	
	_AxisCtrl.Output.States.AllAxis.InPosition := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.InPosition AND _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_1.InPosition;
	
	_AxisCtrl.Output.States.AllAxis.InVelocity := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.InVelocity AND _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_1.InVelocity;
	
	_AxisCtrl.Output.States.AllAxis.MoveActive := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.MoveActive AND _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_1.MoveActive;
	
	
	
	
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
	
	
	(* SECOND AXIS *)
	_AxisCtrl.Output.States.SingleAxis.Axis_1.Active     := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_1.Active;
	
	_AxisCtrl.Output.States.SingleAxis.Axis_1.PowerOn    := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_1.PowerOn;
	
	_AxisCtrl.Output.States.SingleAxis.Axis_1.IsHomed    := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_1.IsHomed;
	
	_AxisCtrl.Output.States.SingleAxis.Axis_1.Stopped    := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_1.Stopped;
	
	_AxisCtrl.Output.States.SingleAxis.Axis_1.InPosition := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_1.InPosition;
	
	_AxisCtrl.Output.States.SingleAxis.Axis_1.InVelocity := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_1.InVelocity;
	
	_AxisCtrl.Output.States.SingleAxis.Axis_1.MoveActive := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_1.MoveActive;
	
	_AxisCtrl.Output.States.SingleAxis.Axis_1.Error		 := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_1.Error;
	
	_AxisCtrl.Output.States.SingleAxis.Axis_1.StatusID	 := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_1.StatusID;
	
	(* CALL FUBS *)
	_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0();
	_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_1();
END_ACTION
