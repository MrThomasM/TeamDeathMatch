/*
	Author: MrThomasM
	MrThomasM#1857

	Description:
	- Script that only excecutes when a player joins (Client side).
*/

[] call MRTM_fnc_arsenalSetup;

call MRTM_fnc_mapIcons;

//Event handlers:
player addEventHandler ["HandleDamage", {
	params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit"];
	_bluBase = missionNamespace getVariable "bluBaseSpawn";
	_opfBase = missionNamespace getVariable "opfBaseSpawn";

	if (player distance2D _bluBase <= 100 || player distance2D _opfBase <= 100) then {
		player setDamage 0;
	};
}];

//End of event handlers

0 spawn {
	while {true} do {
		if (missionNamespace getVariable "activeBattlehappening") then {
			_objective = missionNamespace getVariable "currentBattlePos";
			_altPlayer = getPosATL player select 2;
			if (player distance2D _objective >= (missionNamespace getVariable "objectiveSize") && alive player && _altPlayer < 10) then {
				player setDamage 1;
			};
		};
		sleep 4;
	};
};

if (missionNamespace getVariable "activeBattlehappening") then {
	player setVariable ["MRTM_loadout", getUnitLoadout [player, true], true];
	[battlePos, spawnWestPos, spawnEastPos] call MRTM_fnc_spawnAtObjective;
	sleep 2;
	[] spawn MRTM_fnc_setupUI;
} else {
	["prepping", missionNamespace getVariable "prepTime"] spawn MRTM_fnc_timerClient;
};


