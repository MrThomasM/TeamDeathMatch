/*
	Author: MrThomasM
	MrThomasM#1857

	Description:
	- Displays a timer.

	Exucution:
		[] spawn MRTM_fnc_timerClient;

	Parameter(s): ["_time"]

	Returns: nothing

	Result: 
	Shows a timer on the client's device.
*/

params ["_state", "_time"];

waituntil {!isnull (findDisplay 46)};

timeLeft = _time;

_xDef = safezoneX;
_yDef = safezoneY;
_wDef = safezoneW;
_hDef = safezoneH;

private _ctrlBackground = findDisplay 46 ctrlCreate ["RscPictureKeepAspect", -1];
private _ctrlTime = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
private _ctrlBackgroundTime = findDisplay 46 ctrlCreate ["RscPictureKeepAspect", -1];

//Position
_ctrlBackground ctrlSetPosition [ 0.886219 * _wDef + _xDef, 0.095 * _hDef + _yDef, 0.0571875 * _wDef, 0.040 * _hDef];
_ctrlTime ctrlSetPosition [ 0.910219 * _wDef + _xDef, 0.1095 * _hDef + _yDef, 0.0571875 * _wDef, 0.040 * _hDef];
_ctrlBackgroundTime ctrlSetPosition [ 0.896219 * _wDef + _xDef, 0.110 * _hDef + _yDef, 0.0271875 * _wDef, 0.040 * _hDef];

switch (_state) do {
	case "prepping": { 
		while {timeLeft > 0} do {
			timeLeft = timeLeft - 1; 
			_ctrlBackground ctrlSetText "img\button_dark_red.paa";
			_ctrlBackground ctrlSetScale 1.4;
			_ctrlBackground ctrlCommit 0;
			_ctrlTime ctrlSetScale 1.2;
			_ctrlTime ctrlSetStructuredText parseText format ["<t color = '#ffffff'>%1</t>", [ timeLeft, "HH:MM:SS"] call BIS_fnc_secondsToString];
			_ctrlTime ctrlCommit 0;
			_ctrlBackgroundTime ctrlSetText "img\timer_ca.paa";
			_ctrlBackgroundTime ctrlSetScale 0.6;
			_ctrlBackgroundTime ctrlCommit 0;
			sleep 1;
		};
		player setVariable ["MRTM_loadout", getUnitLoadout [player, true], true];
	};
	case "battle": { 
		while {missionNamespace getVariable "activeBattlehappening"} do {
			for "_i" from 0 to timeLeft do {
				if (missionNamespace getVariable "activeBattlehappening") then {
					_time = timeLeft - _i;
					_ctrlBackground ctrlSetText "img\button_dark_red.paa";
					_ctrlBackground ctrlSetScale 1.4;
					_ctrlBackground ctrlCommit 0;
					_ctrlTime ctrlSetScale 1.2;
					_ctrlTime ctrlSetStructuredText parseText format ["<t color = '#ffffff'>%1</t>", [ _time, "HH:MM:SS"] call BIS_fnc_secondsToString];
					_ctrlTime ctrlCommit 0;
					_ctrlBackgroundTime ctrlSetText "img\timer_ca.paa";
					_ctrlBackgroundTime ctrlSetScale 0.6;
					_ctrlBackgroundTime ctrlCommit 0;
					missionNamespace setVariable ["objTime", _i, true];
					sleep 1;
				} else {
					break;
				};
			};
		};
	};
};

ctrlDelete _ctrlTime;
ctrlDelete _ctrlBackgroundTime;

