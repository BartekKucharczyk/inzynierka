
ACTION Initialization: 
	
	_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Enable := TRUE;
	_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Axis   := ADR(gAxis01);
	_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.MpLink := ADR(gAxisBasic);
	_AxisCtrl.Internal.FunctionsBlock.MpAxisBasic_0.Parameters  := ADR(_AxisCtrl.Internal.Functions.MpAxisBasicParType_0);
		
	
	
END_ACTION
