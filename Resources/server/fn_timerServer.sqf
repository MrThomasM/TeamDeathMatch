/*
	Author: MrThomasM
	MrThomasM#1857

	Description:
	- Make a timer countdown on server end.

	Exucution:
		[_timeInSeconds] spawn MRTM_fnc_timerServer;

	Parameter(s): ["_prepTime"]

	Returns: nothing

	Result: Updates the prepTime variable every 1 second.
*/

params ["_prepTime"];

while {_prepTime >= 0} do {
	_prepTime = _prepTime - 1;
	missionNamespace setVariable ["prepTime", _prepTime, true];
	sleep 1;
};

[] spawn MRTM_fnc_setupArea;