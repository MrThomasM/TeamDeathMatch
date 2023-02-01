/*
	Author: MrThomasM
	MrThomasM#1857

	Description:
	- Script that only excecutes when the server starts (Server side).
	- Sets up all mission variables.
*/
missionNamespace setVariable ["killParam", "MRTM_TDM_killAmount" call BIS_fnc_getParamValue, true];
missionNamespace setVariable ["timeParam", "MRTM_TDM_prepTime" call BIS_fnc_getParamValue, true];
missionNamespace setVariable ["timeObjectiveParam", "MRTM_TDM_roundTime" call BIS_fnc_getParamValue, true];



missionNamespace setVariable ["bluBaseSpawn", [7192.23,13828,0.00144958], true];
missionNamespace setVariable ["opfBaseSpawn", [21312.9,10723.8,0.00145817], true];

missionNamespace setVariable ["bluKills", 0, true];
missionNamespace setVariable ["opfKills", 0, true];

missionNamespace setVariable ["activeBattlehappening", false , true];	

missionNamespace setVariable ["prepTime", missionNamespace getVariable "timeParam", true]; //The prep timer

[missionNamespace getVariable "prepTime"] spawn MRTM_fnc_timer;


[] spawn {
	while {true} do {
		{
			deleteVehicle _x;
		} forEach allDeadMen;
		
		sleep 1;
	};
};
