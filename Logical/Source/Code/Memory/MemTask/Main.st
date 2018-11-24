
PROGRAM _INIT
	(*
0 ... brDRAM (TMP_Ram)
1 ... brUSRRAM (USR_Ram)
2 ... brSYSROM (SYS_Prom)
3 ... brUSRROM (USR_Prom)
 *)
	
	 
END_PROGRAM

PROGRAM _CYCLIC
	CASE _MemTask.Output.MemStateMachine OF
		WAIT_FOR_CMD_MT:
			IF _MemTask.Input.Cmd.Start THEN
				_MemTask.Input.Cmd.Start := FALSE;
				_MemTask.Output.MemStateMachine := START_MT;
			ELSIF _MemTask.Input.Cmd.RepeatAll THEN
				_MemTask.Input.Cmd.RepeatAll := FALSE;
				_MemTask.Output.MemStateMachine := START_MT;
			ELSIF _MemTask.Input.Cmd.ReapetOnce THEN
				_MemTask.Input.Cmd.ReapetOnce := FALSE;
				_MemTask.Internal.memXInfo.mem_typ := _MemTask.Input.Params.MemType;
				_MemTask.Output.MemStateMachine := READ_MT;
			END_IF
			_MemTask.Output.States.Status := 'WAIT_FOR_CMD';
			
		START_MT:
			_MemTask.Internal.iter := 0;
			_MemTask.Internal.memXInfo.enable := TRUE;
			_MemTask.Internal.memXInfo.mem_typ := _MemTask.Internal.iter;
			_MemTask.Output.MemStateMachine := READ_MT;
			
			_MemTask.Output.States.brDRAM 	:= '';
			_MemTask.Output.States.brUSRRAM := '';
			_MemTask.Output.States.brUSRROM := '';
			_MemTask.Output.States.brSYSROM := '';
			_MemTask.Output.States.Status 	:= 'START';
			
		READ_MT:
			_MemTask.Internal.memXInfo();
			
			IF _MemTask.Internal.memXInfo.status = ERR_OK THEN
				
					CASE _MemTask.Internal.iter OF
					0:
						_MemTask.Internal.memBuffor := UDINT_TO_STRING(_MemTask.Internal.memXInfo.MemSize);
						strcat(ADR(_MemTask.Output.States.brDRAM),ADR(_MemTask.Internal.memBuffor));
						strcat(ADR(_MemTask.Output.States.brDRAM),ADR('|'));
						_MemTask.Internal.memBuffor := UDINT_TO_STRING(_MemTask.Internal.memXInfo.FreeMemSize);
						strcat(ADR(_MemTask.Output.States.brDRAM),ADR(_MemTask.Internal.memBuffor));
						strcat(ADR(_MemTask.Output.States.brDRAM),ADR('|'));
						_MemTask.Internal.memBuffor := UDINT_TO_STRING(_MemTask.Internal.memXInfo.BiggestFreeBlockSize);
						strcat(ADR(_MemTask.Output.States.brDRAM),ADR(_MemTask.Internal.memBuffor));
					1:
						_MemTask.Internal.memBuffor := UDINT_TO_STRING(_MemTask.Internal.memXInfo.MemSize);
						strcat(ADR(_MemTask.Output.States.brUSRRAM),ADR(_MemTask.Internal.memBuffor));
						strcat(ADR(_MemTask.Output.States.brUSRRAM),ADR('|'));
						_MemTask.Internal.memBuffor := UDINT_TO_STRING(_MemTask.Internal.memXInfo.FreeMemSize);
						strcat(ADR(_MemTask.Output.States.brUSRRAM),ADR(_MemTask.Internal.memBuffor));
						strcat(ADR(_MemTask.Output.States.brUSRRAM),ADR('|'));
						_MemTask.Internal.memBuffor := UDINT_TO_STRING(_MemTask.Internal.memXInfo.BiggestFreeBlockSize);
						strcat(ADR(_MemTask.Output.States.brUSRRAM),ADR(_MemTask.Internal.memBuffor));
					2:
						_MemTask.Internal.memBuffor := UDINT_TO_STRING(_MemTask.Internal.memXInfo.MemSize);
						strcat(ADR(_MemTask.Output.States.brSYSROM),ADR(_MemTask.Internal.memBuffor));
						strcat(ADR(_MemTask.Output.States.brSYSROM),ADR('|'));
						_MemTask.Internal.memBuffor := UDINT_TO_STRING(_MemTask.Internal.memXInfo.FreeMemSize);
						strcat(ADR(_MemTask.Output.States.brSYSROM),ADR(_MemTask.Internal.memBuffor));
						strcat(ADR(_MemTask.Output.States.brSYSROM),ADR('|'));
						_MemTask.Internal.memBuffor := UDINT_TO_STRING(_MemTask.Internal.memXInfo.BiggestFreeBlockSize);
						strcat(ADR(_MemTask.Output.States.brSYSROM),ADR(_MemTask.Internal.memBuffor));
					3:	
						_MemTask.Internal.memBuffor := UDINT_TO_STRING(_MemTask.Internal.memXInfo.MemSize);
						strcat(ADR(_MemTask.Output.States.brUSRROM),ADR(_MemTask.Internal.memBuffor));
						strcat(ADR(_MemTask.Output.States.brUSRROM),ADR('|'));
						_MemTask.Internal.memBuffor := UDINT_TO_STRING(_MemTask.Internal.memXInfo.FreeMemSize);
						strcat(ADR(_MemTask.Output.States.brUSRROM),ADR(_MemTask.Internal.memBuffor));
						strcat(ADR(_MemTask.Output.States.brUSRROM),ADR('|'));
						_MemTask.Internal.memBuffor := UDINT_TO_STRING(_MemTask.Internal.memXInfo.BiggestFreeBlockSize);
						strcat(ADR(_MemTask.Output.States.brUSRROM),ADR(_MemTask.Internal.memBuffor));
				END_CASE;	
				_MemTask.Output.MemStateMachine := WRITE_IN_OUTPUT_MT;
			END_IF
		
			
		READ_ONCE_MT:
			_MemTask.Internal.memXInfo.mem_typ := _MemTask.Input.Params.MemType;
			_MemTask.Internal.memXInfo();
			
			IF _MemTask.Internal.memXInfo.status = ERR_OK THEN
					
				_MemTask.Output.MemStateMachine := WRITE_IN_OUTPUT_MT;
			END_IF
			
		WRITE_IN_OUTPUT_MT:
			_MemTask.Internal.iter := _MemTask.Internal.iter +1;
			
			IF _MemTask.Internal.iter > 3 THEN
				_MemTask.Internal.iter := 0;
				_MemTask.Output.MemStateMachine := DONE_MT;
			ELSE
				_MemTask.Internal.memXInfo.mem_typ := _MemTask.Internal.iter;
				_MemTask.Output.MemStateMachine := READ_MT;
			
			END_IF
			
			
		DONE_MT:
			_MemTask.Output.States.Status := 'MemTest: DONE';
			IF _MemTask.Input.Cmd.Ack THEN
				_MemTask.Input.Cmd.Ack := FALSE;
				_MemTask.Output.MemStateMachine := WAIT_FOR_CMD_MT;
			END_IF
		
	END_CASE;
	 
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

