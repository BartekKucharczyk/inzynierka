
ACTION Output_commands: 
	(* ALL AXES *)
	_AxisCtrl.Output.States.AllAxis.Active  := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Active;
	_AxisCtrl.Output.States.AllAxis.PowerOn := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.PowerOn;
	_AxisCtrl.Output.States.AllAxis.IsHomed := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.IsHomed;
	_AxisCtrl.Output.States.AllAxis.Stopped := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Stopped;
	_AxisCtrl.Output.States.AllAxis.InPosition := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.InPosition;
	_AxisCtrl.Output.States.AllAxis.InVelocity := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.InVelocity;
	_AxisCtrl.Output.States.AllAxis.MoveActive := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.MoveActive;
	_AxisCtrl.Output.States.AllAxis.Error 	   := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Error;
	
	
	
	(* FIRST AXIS *)
	_AxisCtrl.Output.States.SingleAxis.Axis_0.Active  := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Active;
	_AxisCtrl.Output.States.SingleAxis.Axis_0.PowerOn := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.PowerOn;
	_AxisCtrl.Output.States.SingleAxis.Axis_0.IsHomed := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.IsHomed;
	_AxisCtrl.Output.States.SingleAxis.Axis_0.Stopped := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Stopped;
	_AxisCtrl.Output.States.SingleAxis.Axis_0.InPosition := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.InPosition;
	_AxisCtrl.Output.States.SingleAxis.Axis_0.InVelocity := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.InVelocity;
	_AxisCtrl.Output.States.SingleAxis.Axis_0.MoveActive := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.MoveActive;
	_AxisCtrl.Output.States.SingleAxis.Axis_0.Error		 := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Error;
	_AxisCtrl.Output.States.SingleAxis.Axis_0.StatusID	 := _AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.StatusID;
	
	
	
_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0();
END_ACTION
