
PROGRAM _INIT
	_Controller.Input.Params.ResetType := 0;
	 
END_PROGRAM

PROGRAM _CYCLIC
	_Controller.Internal.Fubs.GetTime.enable := _Controller.Input.Cmd.GetTime;

	IF _Controller.Internal.Fubs.GetTime.status = ERR_OK AND _Controller.Input.Cmd.GetTime THEN
		_Controller.Output.Time := _Controller.Internal.Fubs.GetTime.DT1;
	END_IF
		
	(*! Reset systemu !*)
	SYSreset(_Controller.Input.Cmd.DoReset,_Controller.Input.Params.ResetType);
	
	
	
	_Controller.Internal.Fubs.GetTime();
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

