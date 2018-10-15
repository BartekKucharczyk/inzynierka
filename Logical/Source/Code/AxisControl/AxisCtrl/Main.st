
PROGRAM _INIT
	
	(* Action for initilization of drives *)
	Initialization;
	 
END_PROGRAM

PROGRAM _CYCLIC
	(* Common commands for all axes *)
	Input_commands;
	
	(* Commands for first axis 		*)
	Axis1;
	
	(* Commands for second axis 	*)
	Axis2;
	
	(* Status and states all axes 	*)
	Output_commands; 	
END_PROGRAM

PROGRAM _EXIT
	
	(* Action for safe shutdown drives *)
	ExitAction;
	 
END_PROGRAM

