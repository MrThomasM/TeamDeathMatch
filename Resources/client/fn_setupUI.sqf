
_xDef = safezoneX;
_yDef = safezoneY;
_wDef = safezoneW;
_hDef = safezoneH;

private _bluKills = findDisplay 46 ctrlCreate ["RscStructuredText", -1]; //Blu Kills
private _opfKills = findDisplay 46 ctrlCreate ["RscStructuredText", -1]; //Opf Kills
private _maxKills = findDisplay 46 ctrlCreate ["RscStructuredText", -1]; //Max Kills

//Positions
_bluKills ctrlSetPosition [(_wDef /2 + _xDef), _yDef, _wDef / 30, _hDef / 30];
_opfKills ctrlSetPosition [((_wDef - (_wDef / 30) *2 ) / 2 + _xDef), _yDef, _wDef / 30, _hDef / 30];
_maxKills ctrlSetPosition [((_wDef - (_wDef / 15)) / 2 + _xDef), _yDef + (_hDef / 60) * 2, _wDef / 15, _hDef / 50];


//Colors
_bluKills ctrlSetBackgroundColor [0,0.3,0.6,0.8];
_opfKills ctrlSetBackgroundColor [0.5,0,0,0.8];
_maxKills ctrlSetBackgroundColor [0.5,0.5,0.5,1];


while {missionNamespace getVariable "activeBattlehappening"} do {
	_bluKills ctrlSetStructuredText parseText format ["<t size='1.2' font='PuristaSemibold' align='center'>%1</t>", missionNamespace getVariable "bluKills"];
	_opfKills ctrlSetStructuredText parseText format ["<t size='1.2' font='PuristaSemibold' align='center'>%1</t>", missionNamespace getVariable "opfKills"];
	_maxKills ctrlSetStructuredText parseText format ["<t size='1' font='PuristaSemibold' align='center'>%1</t>", missionNamespace getVariable "killParam"];


	_bluKills ctrlCommit 0;
	_opfKills ctrlCommit 0;
	_maxKills ctrlCommit 0;
	sleep 1;
};

ctrlDelete _bluKills;
ctrlDelete _opfKills;
ctrlDelete _maxKills;