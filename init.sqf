/*
	Author: MrThomasM
	MrThomasM#1857

	Description:
	- Sets up the 2 needed files for the server.
*/

if (isServer) then {
	call MRTM_fnc_initServer;
};

if (!isDedicated && hasInterface) then {call MRTM_fnc_initClient};