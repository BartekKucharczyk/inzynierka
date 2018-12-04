
PROGRAM _INIT
	_Controller.Input.Params.ResetType := 0;
	 
END_PROGRAM

PROGRAM _CYCLIC
	(************************** Get time **************************)
	_Controller.Internal.Fubs.GetTime.enable := _Controller.Input.Cmd.GetTime;
	
	IF _Controller.Internal.Fubs.GetTime.status = ERR_OK AND _Controller.Input.Cmd.GetTime THEN
		_Controller.Output.Time := _Controller.Internal.Fubs.GetTime.DT1;
	END_IF
	_Controller.Internal.Fubs.GetTime();
	(**************************          **************************)
	
	
	(************************** Reset systemu **************************)
	SYSreset(_Controller.Input.Cmd.DoReset,_Controller.Input.Params.ResetType);
	(**************************               **************************)
	
	(************************** Project info **************************)
	IF _Controller.Input.Cmd.GetInfoAboutProject THEN
		_Controller.Internal.Fubs.ProjectGetInfo.Execute := TRUE;
		
		IF _Controller.Internal.Fubs.ProjectGetInfo.Done THEN
			_Controller.Input.Cmd.GetInfoAboutProject := FALSE;
			_Controller.Output.ProjectInfo.ConfigurationID := _Controller.Internal.Fubs.ProjectGetInfo.ConfigurationID;
			_Controller.Output.ProjectInfo.ConfigurationVersion := _Controller.Internal.Fubs.ProjectGetInfo.ConfigurationVersion;
			_Controller.Output.ProjectInfo.Done := TRUE;
			
			_Controller.Internal.Fubs.ProjectGetInfo.Execute := FALSE;
			_Controller.Internal.Fubs.ProjectGetInfo();
			
		ELSIF _Controller.Internal.Fubs.ProjectGetInfo.Error THEN
			_Controller.Internal.Fubs.ProjectGetInfo.Execute := FALSE;
			_Controller.Output.ProjectInfo.ErrorID := _Controller.Internal.Fubs.ProjectGetInfo.StatusID;
			_Controller.Output.ProjectInfo.Done := TRUE;
			_Controller.Internal.Fubs.ProjectGetInfo();
		END_IF
		_Controller.Internal.Fubs.ProjectGetInfo();
	END_IF
	(**************************              **************************)
	
	(** TODO: BRSystem,Zmiana adresu IP sterownika **)
	
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

