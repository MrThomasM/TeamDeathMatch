/*
	Author: MrThomasM
	MrThomasM#1857

	Description:
	- Displays a prepping timer.

	Exucution:
		[_timeInSeconds] spawn MRTM_fnc_timerClient;

	Parameter(s): /

	Returns: nothing

	Result: Updates the visible timer synced to the server prepping timer.
*/

_xDef = safezoneX;
_yDef = safezoneY;
_wDef = safezoneW;
_hDef = safezoneH;


while {missionNamespace getVariable "prepTime" > 0} do {
	_timeLeft = missionNamespace getVariable "prepTime";
	hintSilent format ["Prep time: %1", [ _timeLeft, "MM:SS"] call BIS_fnc_secondsToString];
	sleep 0.5;
};

hintSilent "";

player setVariable ["MRTM_loadout", getUnitLoadout [player, true], true];