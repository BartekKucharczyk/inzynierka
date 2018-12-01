
PROGRAM _INIT
	
//	_Trace.Internal.Fubs.ReadNetTraceStatus.Enable := TRUE;
//	_Trace.Internal.Fubs.ReadNetTraceStatus.Configuration := ;
//	
//	_Trace.Internal.Fubs.ReadParTraceStatus.Enable := TRUE;
//	_Trace.Internal.Fubs.ReadParTraceStatus.Configuration := ;
	 
	// ACP10PAR_SCTRL_SPEED_ACT ;
	//	ACP10PAR_ENCOD1_S_ACT
				//	ACP10PAR_PCTRL_S_ACT
				//	ACP10PAR_TORQUE_ACT
				//	ACP10PAR_
	
	_Trace.Internal.Params.Offset := 0;
END_PROGRAM

PROGRAM _CYCLIC
	
	CASE _Trace.Output.StateMachine OF
		WAIT_FOR_CMD_T:
		
			IF _Trace.Input.Cmd.Start THEN
				_Trace.Input.Cmd.Start := FALSE;
				_Trace.Output.StateMachine := START_T;
			END_IF
		
		START_T:
			IF NOT _Trace.Internal.Fubs.ParTrace.Busy AND NOT _Trace.Internal.Fubs.ParTrace.Done THEN
				_Trace.Internal.Func.PARTRACECONFIG.DatObj.Device := 'AppSave';
				_Trace.Internal.Func.PARTRACECONFIG.DatObj.Format := mcFILE_TXT;
				_Trace.Internal.Func.PARTRACECONFIG.DatObj.Name   := 'chartAutoApp';
				_Trace.Internal.Func.PARTRACECONFIG.DatObj.Type   := mcFILE;
			
				_Trace.Internal.Func.PARTRACECONFIG.ParTrace.SamplingTime := 0.1;
				_Trace.Internal.Func.PARTRACECONFIG.ParTrace.TracingTime  := 15;
				_Trace.Internal.Func.PARTRACECONFIG.ParTrace.Type := mcMULTI_AXIS_TRACE;
				_Trace.Internal.Func.PARTRACECONFIG.ParTrace.Delay := 0;
				_Trace.Internal.Func.PARTRACECONFIG.ParTrace.NetTriggerDelay := 0;
				_Trace.Internal.Func.PARTRACECONFIG.ParTrace.Trigger.Threshold := 90;
			
				_Trace.Internal.Func.PARTRACECONFIG.ParTrace.Parameter[0].Axis  := ADR(gAxis01);
				_Trace.Internal.Func.PARTRACECONFIG.ParTrace.Parameter[0].ParID := ACP10PAR_PCTRL_V_ACT;
										
			END_IF
			
			_Trace.Internal.Fubs.ParTrace.Execute := TRUE;
			_Trace.Internal.Fubs.ParTrace.Command := mcSTART+mcSAVE;
			_Trace.Internal.Fubs.ParTrace.Configuration := _Trace.Internal.Func.PARTRACECONFIG;
			_Trace.Internal.Fubs.ParTrace();
			
						
			IF _Trace.Internal.Fubs.ParTrace.Done THEN
				_Trace.Internal.Fubs.ParTrace.Execute := FALSE;
				_Trace.Internal.Fubs.ParTrace();
				_Trace.Output.StateMachine := OPEN_T;
				
			ELSIF _Trace.Internal.Fubs.ParTrace.Error THEN
				_Trace.Output.StateMachine := ERROR_T;
				
			END_IF
				
		OPEN_T:
			_Trace.Internal.Fubs.Fileopen.enable  := TRUE;
			_Trace.Internal.Fubs.Fileopen.mode 	  := fiREAD_ONLY;
			_Trace.Internal.Fubs.Fileopen.pDevice := ADR('AppSave');
			_Trace.Internal.Fubs.Fileopen.pFile   := ADR('\chartAutoApp.txt');
			_Trace.Internal.Fubs.Fileopen();
			
			IF _Trace.Internal.Fubs.Fileopen.status = ERR_OK THEN
				_Trace.Internal.Fubs.Fileread.ident := _Trace.Internal.Fubs.Fileopen.ident;
				_Trace.Internal.Params.FileLenght 	:= _Trace.Internal.Fubs.Fileopen.filelen;
				 
				_Trace.Internal.Fubs.Fileopen.enable := FALSE;
				_Trace.Internal.Fubs.Fileopen();
				_Trace.Output.StateMachine := READ_T;
			ELSIF _Trace.Internal.Fubs.Fileopen.status <> ERR_OK AND NOT _Trace.Internal.Fubs.Fileopen.status = ERR_FUB_BUSY THEN
			
				_Trace.Internal.Fubs.Fileopen.enable := FALSE;
				_Trace.Output.StateMachine := ERROR_T;
				
			ELSIF _Trace.Internal.Fubs.Fileopen.status = ERR_FUB_BUSY THEN
				
			END_IF
		READ_T:
			_Trace.Internal.Fubs.Fileread.enable := TRUE;
			_Trace.Internal.Fubs.Fileread.pDest  := ADR(_Trace.Internal.Params.ParamsIn);
			_Trace.Internal.Fubs.Fileread.len 	 := 1000;
			_Trace.Internal.Fubs.Fileread.offset := _Trace.Internal.Params.Offset;
			_Trace.Internal.Fubs.Fileread();
			// $r$n
			IF _Trace.Internal.Fubs.Fileread.status = ERR_OK THEN
				_Trace.Internal.Fubs.Fileread.enable := FALSE;
				_Trace.Internal.Fubs.Fileread();
				
				_Trace.Output.StateMachine := CONNECT_TXT_T;
			END_IF
			
		CONNECT_TXT_T:
			FOR _Trace.Internal.Params.Iteration = 0
			
			
			
			
		WAIT_FOR_READ_T:
			
		ERROR_T:
		
		ERROR_RESET_T:
		
	END_CASE;

END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

