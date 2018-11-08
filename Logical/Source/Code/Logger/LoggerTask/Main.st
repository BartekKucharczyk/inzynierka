
PROGRAM _INIT
	(* INIT INPUT PARAMETERS *)
	_LoggerHandling.Input.Parameters.NumberOfLog := 10;
	_LoggerHandling.Input.Parameters.NumberOfLogbook := 1;
	_LoggerHandling.Input.Parameters.NameOfLogbook := '$$arlogsys';
	_LoggerHandling.Input.Parameters.NameOfNewLogbook := 'UserLogbook';
	_LoggerHandling.Input.Parameters.RecordID := 10;
	
	_LoggerHandling.Internal.FuncAndParams.i := 0;
END_PROGRAM

PROGRAM _CYCLIC
	
		CASE _LoggerHandling.Output.MainStep OF
		WAIT_FOR_CMD_LH:
			IF _LoggerHandling.Input.Commands.GET_ID THEN
				_LoggerHandling.Input.Commands.GET_ID := FALSE;
				_LoggerHandling.Output.MainStep := GET_ID_LH;
				
			ELSIF _LoggerHandling.Input.Commands.CREATE THEN
				_LoggerHandling.Input.Commands.CREATE := FALSE;
				_LoggerHandling.Output.MainStep := CREATE_LOGBOOK_LH;
				
			ELSIF _LoggerHandling.Input.Commands.DELETE THEN
				_LoggerHandling.Input.Commands.DELETE := FALSE;
				_LoggerHandling.Output.MainStep := DELETE_LOGBOOK_LH;
			
			ELSIF _LoggerHandling.Input.Commands.READ THEN
				_LoggerHandling.Input.Commands.READ := FALSE;
				_LoggerHandling.Output.MainStep := READ_LH;
				
			ELSIF _LoggerHandling.Input.Commands.READ_DESC THEN
				_LoggerHandling.Input.Commands.READ_DESC := FALSE;
				_LoggerHandling.Output.MainStep := READ_DESC_LH;
			
			ELSIF _LoggerHandling.Input.Commands.READ_ERROR_NUMBER THEN
				_LoggerHandling.Input.Commands.READ_ERROR_NUMBER := FALSE;
				_LoggerHandling.Output.MainStep := READ_ERROR_NUMBER_LH;
		
			ELSIF _LoggerHandling.Input.Commands.GET_LATEST_RECORD THEN
				_LoggerHandling.Input.Commands.GET_LATEST_RECORD := FALSE;
				_LoggerHandling.Output.MainStep := GET_LATEST_RECORD_ID_LH;
				
			ELSIF _LoggerHandling.Input.Commands.GET_PREVIOUS THEN
				_LoggerHandling.Input.Commands.GET_PREVIOUS := FALSE;
				_LoggerHandling.Output.MainStep := GET_PREVIOUS_RECORD_LH;
			END_IF
				
		GET_ID_LH:
			_LoggerHandling.Internal.Fubs._ArEventLogGetIdent.Name 	  := _LoggerHandling.Input.Parameters.NameOfLogbook;
			_LoggerHandling.Internal.Fubs._ArEventLogGetIdent.Execute := TRUE;
			_LoggerHandling.Internal.Fubs._ArEventLogGetIdent();
			
			IF _LoggerHandling.Internal.Fubs._ArEventLogGetIdent.Done THEN
				_LoggerHandling.Internal.FuncAndParams._ArEventLogIdentType := _LoggerHandling.Internal.Fubs._ArEventLogGetIdent.Ident;
				_LoggerHandling.Internal.Fubs._ArEventLogGetIdent.Execute := FALSE;
				_LoggerHandling.Internal.Fubs._ArEventLogGetIdent();
				_LoggerHandling.Output.States.EndStateCmd := 'CMD_OK: GET ID';
				_LoggerHandling.Output.MainStep := WAIT_FOR_CMD_LH;
			ELSIF _LoggerHandling.Internal.Fubs._ArEventLogGetIdent.Error THEN
				_LoggerHandling.Internal.Fubs._ArEventLogGetIdent.Execute := FALSE;
				_LoggerHandling.Internal.Fubs._ArEventLogGetIdent();
				_LoggerHandling.Output.States.EndStateCmd := 'CMD_EREOR: GET ID';
				_LoggerHandling.Output.MainStep := ERROR_LH;
			END_IF
			
		CREATE_LOGBOOK_LH:
			_LoggerHandling.Internal.Fubs._ArEventLogCreate.Execute := TRUE;
			_LoggerHandling.Internal.Fubs._ArEventLogCreate.Persistence := arEVENTLOG_PERSISTENCE_PERSIST;
			_LoggerHandling.Internal.Fubs._ArEventLogCreate.Size := 10000;
			_LoggerHandling.Internal.Fubs._ArEventLogCreate.Info := 0;
			_LoggerHandling.Internal.Fubs._ArEventLogCreate.Name := _LoggerHandling.Input.Parameters.NameOfNewLogbook;
			_LoggerHandling.Internal.Fubs._ArEventLogCreate();
			
			IF _LoggerHandling.Internal.Fubs._ArEventLogCreate.Done THEN
				_LoggerHandling.Internal.Fubs._ArEventLogCreate.Execute := FALSE;
				_LoggerHandling.Internal.Fubs._ArEventLogCreate();
				_LoggerHandling.Output.States.EndStateCmd := 'CMD_OK: CREATE LOGBOOK';
				_LoggerHandling.Output.MainStep := WAIT_FOR_CMD_LH;
				
			ELSIF _LoggerHandling.Internal.Fubs._ArEventLogCreate.Error THEN
				_LoggerHandling.Internal.Fubs._ArEventLogCreate.Execute := FALSE;
				_LoggerHandling.Internal.Fubs._ArEventLogCreate();
				_LoggerHandling.Output.States.EndStateCmd := 'CMD_ERROR: CREATE LOGBOOK';
				_LoggerHandling.Output.MainStep := ERROR_LH;
			END_IF
			
		DELETE_LOGBOOK_LH:
			_LoggerHandling.Internal.Fubs._ArEventLogDelete.Execute := TRUE;
			_LoggerHandling.Internal.Fubs._ArEventLogDelete.Ident := _LoggerHandling.Input.Parameters.IDentLogToDelete;
			_LoggerHandling.Internal.Fubs._ArEventLogDelete();
			
			IF   _LoggerHandling.Internal.Fubs._ArEventLogDelete.Done THEN
				_LoggerHandling.Internal.Fubs._ArEventLogDelete.Execute := FALSE;
				_LoggerHandling.Internal.Fubs._ArEventLogDelete();
				_LoggerHandling.Output.States.EndStateCmd := 'CMD_OK: DELETE LOGBOOK';
				_LoggerHandling.Output.MainStep := WAIT_FOR_CMD_LH;
				
			ELSIF _LoggerHandling.Internal.Fubs._ArEventLogDelete.Error THEN
				_LoggerHandling.Internal.Fubs._ArEventLogDelete.Execute := FALSE;
				_LoggerHandling.Internal.Fubs._ArEventLogDelete();
				_LoggerHandling.Output.States.EndStateCmd := 'CMD_ERROR: DELETE LOGBOOK';
				_LoggerHandling.Output.MainStep := ERROR_LH;
			END_IF;
		
		GET_LATEST_RECORD_ID_LH:
			_LoggerHandling.Internal.Fubs._ArEventLogGetLatestRecordID.Execute := TRUE;
			_LoggerHandling.Internal.Fubs._ArEventLogGetLatestRecordID.Ident := _LoggerHandling.Internal.FuncAndParams._ArEventLogIdentType;
			_LoggerHandling.Internal.Fubs._ArEventLogGetLatestRecordID();
			
			IF _LoggerHandling.Internal.Fubs._ArEventLogGetLatestRecordID.Done THEN
				_LoggerHandling.Internal.FuncAndParams._ArEventLogRecordIDType := _LoggerHandling.Internal.Fubs._ArEventLogGetLatestRecordID.RecordID;
				_LoggerHandling.Internal.Fubs._ArEventLogGetLatestRecordID.Execute := FALSE;
				_LoggerHandling.Internal.Fubs._ArEventLogGetLatestRecordID();
				_LoggerHandling.Output.States.EndStateCmd := 'CMD_OK: GET LATEST RECORD ID';
				_LoggerHandling.Output.MainStep := WAIT_FOR_CMD_LH;
			ELSIF _LoggerHandling.Internal.Fubs._ArEventLogGetLatestRecordID.Error THEN
				_LoggerHandling.Internal.Fubs._ArEventLogGetLatestRecordID.Execute := FALSE;
				_LoggerHandling.Internal.Fubs._ArEventLogGetLatestRecordID();
				_LoggerHandling.Output.States.EndStateCmd := 'CMD_ERROR: GET LATEST RECORD ID';
				_LoggerHandling.Output.MainStep := ERROR_LH;				
			END_IF
			
		GET_PREVIOUS_RECORD_LH:
			_LoggerHandling.Internal.Fubs._ArEventLogGetPreviousRecordID.Execute := TRUE;
			_LoggerHandling.Internal.Fubs._ArEventLogGetPreviousRecordID.Ident := _LoggerHandling.Internal.FuncAndParams._ArEventLogIdentType;
			_LoggerHandling.Internal.Fubs._ArEventLogGetPreviousRecordID.RecordID := _LoggerHandling.Internal.FuncAndParams._ArEventLogRecordIDType;
			_LoggerHandling.Internal.Fubs._ArEventLogGetPreviousRecordID();
			
			IF _LoggerHandling.Internal.Fubs._ArEventLogGetPreviousRecordID.Done THEN
				_LoggerHandling.Internal.FuncAndParams._ArEventLogRecordIDType := _LoggerHandling.Internal.Fubs._ArEventLogGetPreviousRecordID.PrevRecordID;
				_LoggerHandling.Internal.Fubs._ArEventLogGetPreviousRecordID.Execute := FALSE;
				_LoggerHandling.Internal.Fubs._ArEventLogGetPreviousRecordID();
				_LoggerHandling.Output.States.EndStateCmd := 'CMD_OK: GET PREVIOUS RECORD';
				_LoggerHandling.Output.MainStep := WAIT_FOR_CMD_LH;
				
			ELSIF _LoggerHandling.Internal.Fubs._ArEventLogGetPreviousRecordID.Error THEN
				_LoggerHandling.Internal.Fubs._ArEventLogGetPreviousRecordID.Execute := FALSE;
				_LoggerHandling.Internal.Fubs._ArEventLogGetPreviousRecordID();
				_LoggerHandling.Output.States.EndStateCmd := 'CMD_ERROR: GET PREVIOUS RECORD';
				_LoggerHandling.Output.MainStep := ERROR_LH;				
			END_IF
			
			
		READ_LH:
			_LoggerHandling.Internal.Fubs._ArEventLogRead.Execute := TRUE;
			_LoggerHandling.Internal.Fubs._ArEventLogRead.Ident := _LoggerHandling.Internal.FuncAndParams._ArEventLogIdentType;
			_LoggerHandling.Internal.Fubs._ArEventLogRead.RecordID := _LoggerHandling.Internal.FuncAndParams._ArEventLogRecordIDType;
			_LoggerHandling.Internal.Fubs._ArEventLogRead();
			
			IF _LoggerHandling.Internal.Fubs._ArEventLogRead.Done THEN
				_LoggerHandling.Internal.FuncAndParams.EventID := _LoggerHandling.Internal.Fubs._ArEventLogRead.EventID;
				_LoggerHandling.Internal.FuncAndParams.TimeLog := _LoggerHandling.Internal.Fubs._ArEventLogRead.TimeStamp;
				_LoggerHandling.Internal.Fubs._ArEventLogRead.Execute := FALSE;
				_LoggerHandling.Internal.Fubs._ArEventLogRead();
				_LoggerHandling.Output.States.EndStateCmd := 'CMD_OK: READ';
				_LoggerHandling.Output.MainStep := WAIT_FOR_CMD_LH;
		
			ELSIF _LoggerHandling.Internal.Fubs._ArEventLogRead.Error THEN
				_LoggerHandling.Internal.Fubs._ArEventLogRead.Execute := FALSE;
				_LoggerHandling.Internal.Fubs._ArEventLogRead();
				_LoggerHandling.Output.States.EndStateCmd := 'CMD_ERROR: READ';
				_LoggerHandling.Output.MainStep := ERROR_LH;
			END_IF
				
		READ_DESC_LH:
			_LoggerHandling.Internal.Fubs._ArEventLogReadDescription.Execute := TRUE;
			_LoggerHandling.Internal.Fubs._ArEventLogReadDescription.Ident := _LoggerHandling.Internal.FuncAndParams._ArEventLogIdentType;
			_LoggerHandling.Internal.Fubs._ArEventLogReadDescription.RecordID := _LoggerHandling.Internal.FuncAndParams._ArEventLogRecordIDType;
			_LoggerHandling.Internal.Fubs._ArEventLogReadDescription.TextBuffer := ADR(_LoggerHandling.Output.States.LogDesc[_LoggerHandling.Internal.FuncAndParams.i]);
			
			IF _LoggerHandling.Internal.Fubs._ArEventLogReadDescription.Done THEN
				_LoggerHandling.Internal.Fubs._ArEventLogReadDescription.Execute := FALSE;
				_LoggerHandling.Internal.Fubs._ArEventLogReadDescription();
				_LoggerHandling.Output.States.EndStateCmd := 'CMD_OK: READ DESC';
				_LoggerHandling.Output.MainStep := WAIT_FOR_CMD_LH;
			ELSIF _LoggerHandling.Internal.Fubs._ArEventLogReadDescription.Error THEN
				_LoggerHandling.Internal.Fubs._ArEventLogReadDescription.Execute := FALSE;
				_LoggerHandling.Internal.Fubs._ArEventLogReadDescription();
				_LoggerHandling.Output.States.EndStateCmd := 'CMD_ERROR: READ DESC';
				_LoggerHandling.Output.MainStep := ERROR_LH;				
			END_IF
			
		READ_ERROR_NUMBER_LH:
			_LoggerHandling.Internal.Fubs._ArEventLogReadErrorNumber.Execute := TRUE;
			_LoggerHandling.Internal.Fubs._ArEventLogReadErrorNumber.Ident := _LoggerHandling.Internal.FuncAndParams._ArEventLogIdentType;
			_LoggerHandling.Internal.Fubs._ArEventLogReadErrorNumber.RecordID := _LoggerHandling.Internal.FuncAndParams._ArEventLogRecordIDType ;
			_LoggerHandling.Internal.Fubs._ArEventLogReadErrorNumber();
			
			IF _LoggerHandling.Internal.Fubs._ArEventLogReadErrorNumber.Done THEN
				_LoggerHandling.Output.States.LogList[_LoggerHandling.Internal.FuncAndParams.i] := UDINT_TO_STRING(_LoggerHandling.Internal.Fubs._ArEventLogReadErrorNumber.ErrorNumber);
				_LoggerHandling.Internal.Fubs._ArEventLogReadErrorNumber.Execute := FALSE;
				_LoggerHandling.Internal.Fubs._ArEventLogReadErrorNumber();
				_LoggerHandling.Output.States.EndStateCmd := 'CMD_OK: READ ERROR NUMBER';
				_LoggerHandling.Output.MainStep := WAIT_FOR_CMD_LH;
				
			ELSIF _LoggerHandling.Internal.Fubs._ArEventLogReadErrorNumber.Error THEN
				_LoggerHandling.Internal.Fubs._ArEventLogReadErrorNumber.Execute := FALSE;
				_LoggerHandling.Internal.Fubs._ArEventLogReadErrorNumber();
				_LoggerHandling.Output.States.EndStateCmd := 'CMD_ERROR: READ ERROR NUMBER';
				_LoggerHandling.Output.MainStep := ERROR_LH;
				
			END_IF
			
		ADD_TO_INTERNAL_LH:	
			_LoggerHandling.Internal.FuncAndParams._ArEventLogRecordIDType := _LoggerHandling.Input.Parameters.RecordID;
			_LoggerHandling.Output.MainStep := WAIT_FOR_CMD_LH;

		ERROR_LH:
			IF _LoggerHandling.Input.Commands.ERROR_RESET THEN
				_LoggerHandling.Input.Commands.ERROR_RESET := FALSE;
				_LoggerHandling.Output.MainStep := ERROR_RESET_LH;
			END_IF
			
			
		ERROR_RESET_LH:
			_LoggerHandling.Output.MainStep := WAIT_FOR_CMD_LH;
		END_CASE;
	 
		CASE _LoggerHandling.Output.ReadList OF
		
		START_REL:
			IF _LoggerHandling.Input.Commands.REL_START THEN
				_LoggerHandling.Input.Commands.REL_START := FALSE;
				_LoggerHandling.Internal.FuncAndParams.i := 0;
				_LoggerHandling.Output.ReadList := INIT_REL;
			END_IF
		INIT_REL:
			_LoggerHandling.Input.Commands.GET_ID := TRUE;
			_LoggerHandling.Output.ReadList := GET_LATEST_REL;
			
		GET_LATEST_REL:
			IF _LoggerHandling.Output.MainStep = ERROR_LH THEN
				_LoggerHandling.Output.ReadList := START_REL;
				
			ELSIF _LoggerHandling.Output.States.EndStateCmd = 'CMD_OK: GET ID' THEN
				_LoggerHandling.Input.Commands.GET_LATEST_RECORD := TRUE;
				_LoggerHandling.Output.ReadList := READ_REL;
			END_IF
		READ_REL:
			IF _LoggerHandling.Output.MainStep = ERROR_LH THEN
				_LoggerHandling.Output.ReadList := START_REL;
				
			ELSIF _LoggerHandling.Output.States.EndStateCmd = 'CMD_OK: GET LATEST RECORD ID' OR _LoggerHandling.Output.States.EndStateCmd = 'CMD_OK: GET PREVIOUS RECORD'  THEN
				_LoggerHandling.Input.Commands.READ := TRUE;
				_LoggerHandling.Output.ReadList := WAIT_FOR_EXE_REL;
			END_IF			
			
		WAIT_FOR_EXE_REL:
			IF _LoggerHandling.Output.MainStep = ERROR_LH THEN
				_LoggerHandling.Output.ReadList := START_REL;
				
			ELSIF _LoggerHandling.Output.States.EndStateCmd = 'CMD_OK: READ' THEN
				
				IF _LoggerHandling.Internal.FuncAndParams.EventID <> 0 THEN
					_LoggerHandling.Output.States.LogList[_LoggerHandling.Internal.FuncAndParams.i] := DINT_TO_STRING(_LoggerHandling.Internal.FuncAndParams.EventID);
					_LoggerHandling.Input.Commands.READ_DESC := TRUE;
					_LoggerHandling.Output.ReadList := WAIT_FOR_DESC_REL;
				ELSE
					_LoggerHandling.Input.Commands.READ_ERROR_NUMBER := TRUE;
					_LoggerHandling.Output.ReadList := WAIT_FOR_ERROR_NUMBER_REL;
				END_IF				
			END_IF		
			
		WAIT_FOR_ERROR_NUMBER_REL:
			IF  _LoggerHandling.Output.MainStep = ERROR_LH  THEN
				_LoggerHandling.Output.ReadList := START_REL;
				
			ELSIF _LoggerHandling.Output.States.EndStateCmd = 'CMD_OK: READ ERROR NUMBER' THEN
				_LoggerHandling.Input.Commands.READ_DESC := TRUE;
				_LoggerHandling.Output.ReadList := WAIT_FOR_DESC_REL;
			END_IF
			
		WAIT_FOR_DESC_REL:
			IF  _LoggerHandling.Output.MainStep = ERROR_LH  THEN
				_LoggerHandling.Output.ReadList := START_REL;
				
			ELSIF _LoggerHandling.Output.States.EndStateCmd = 'CMD_OK: READ DESC' THEN
			      _LoggerHandling.Output.ReadList := CONVERSION_REL;
			END_IF
		
		CONVERSION_REL:
			_LoggerHandling.Output.States.LogTime[0] := 
			(* Do roku 1970 dodaæ sekundy i nanosekundy - powinno wyjœæ to samo co w loggerze w kolumnie time. *)
		NEXT_REL:
			
			_LoggerHandling.Internal.FuncAndParams.i := _LoggerHandling.Internal.FuncAndParams.i + 1;
			
			IF _LoggerHandling.Internal.FuncAndParams.i >= 50 THEN
				_LoggerHandling.Output.ReadList := END_REL;
			ELSE 
				_LoggerHandling.Input.Commands.GET_PREVIOUS := TRUE;
				_LoggerHandling.Output.ReadList := READ_REL;
			END_IF
			
		END_REL:
	
		
		END_CASE;
		
	
END_PROGRAM

PROGRAM _EXIT
	 
END_PROGRAM

