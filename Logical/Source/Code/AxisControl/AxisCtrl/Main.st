
PROGRAM _INIT
	(* Task to initilization of drives *)
	Initialization;
	 
END_PROGRAM

PROGRAM _CYCLIC
	Input_commands;
	
	AxesControl;
	
	Output_commands; 
END_PROGRAM

PROGRAM _EXIT
	ExitAction;
	 
END_PROGRAM

