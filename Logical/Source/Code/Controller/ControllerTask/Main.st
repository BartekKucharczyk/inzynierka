
PROGRAM _INIT

	 
END_PROGRAM

PROGRAM _CYCLIC
	_Controller.Internal.Fubs.GetTime.enable := _Controller.Input.GetTime;

	IF _Controller.Internal.Fubs.GetTime.status = ERR_OK AND _Controller.Input.GetTime THEN
		_Controller.Output.Time := _Controller.Internal.Fubs.GetTime.DT1;
	END_IF
		
	
	
	_Controller.Internal.Fubs.GetTime();
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

