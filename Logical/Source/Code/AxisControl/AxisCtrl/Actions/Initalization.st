
ACTION Initialization: 
	(* INIT PARAMETERS AXIS BASIC *)
	_AxisCtrl.Internal.Functions.MpAxisBasicParType_0.Velocity := 100;
	_AxisCtrl.Internal.Functions.MpAxisBasicParType_0.Acceleration := 1000;
	_AxisCtrl.Internal.Functions.MpAxisBasicParType_0.Deceleration := 1000;
	_AxisCtrl.Internal.Functions.MpAxisBasicParType_0.Position := 1;
	_AxisCtrl.Internal.Functions.MpAxisBasicParType_0.Distance := 1;
	
	(* INIT MpAxisBasic *)
	_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Enable := TRUE;
	_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Axis   := ADR(gAxis01);
	_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.MpLink := ADR(gAxisBasic);
	_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Parameters := ADR(_AxisCtrl.Internal.Functions.MpAxisBasicParType_0);
	
	(* INIT PARAMETERS CYCLIC SET PARAMS *)
	_AxisCtrl.Internal.Functions.MpTorqueParams.Acceleration := 1000;
	_AxisCtrl.Internal.Functions.MpTorqueParams.Deceleration := 1000;
	_AxisCtrl.Internal.Functions.MpTorqueParams.PositionModeMaxVelocity := 500;
	_AxisCtrl.Internal.Functions.MpTorqueParams.VelocityModeDirection := mpAXIS_DIR_POSITIVE;
//	_AxisCtrl.Internal.Functions.MpTorqueParams.
	
	(* INIT MpAxisCyclicSet*)
	_AxisCtrl.Internal.FunctionsBlock.TorqueControl.MpLink := ADR(gAxisBasic);	
	_AxisCtrl.Internal.FunctionsBlock.TorqueControl.Enable := TRUE;
	_AxisCtrl.Internal.FunctionsBlock.TorqueControl.Parameters := ADR(_AxisCtrl.Internal.Functions.MpTorqueParams);
	_AxisCtrl.Internal.FunctionsBlock.TorqueControl.Velocity := 200;
	_AxisCtrl.Internal.FunctionsBlock.TorqueControl.Torque := 2;
	_AxisCtrl.Internal.FunctionsBlock.TorqueControl.Position := 500;
	
	
END_ACTION
