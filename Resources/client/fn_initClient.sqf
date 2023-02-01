/*
	Author: MrThomasM
	MrThomasM#1857

	Description:
	- Script that only excecutes when a player joins (Client side).
*/

player addEventHandler ["HandleDamage", {
	params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit"];
	_bluBase = missionNamespace getVariable "bluBaseSpawn";
	_opfBase = missionNamespace getVariable "opfBaseSpawn";

	if (player distance2D _bluBase <= 100 || player distance2D _opfBase <= 100) then {
		player setDamage 0;
	};
}];

[] spawn {
	while {missionNamespace getVariable "activeBattlehappening" == false} do {

		if (side player == west) then {
			_uniformB = uniform player;
			if (_uniformB in MRTM_BANNED_NATO_UNIFORM) then {
				removeUniform player;
			};		

			{
				if (_x in MRTM_BANNED_NATO_HELMET) then {
					removeHeadgear player;
				};		
			} forEach getUnitLoadout player;
		} else {
			_uniformO = uniform player;
			if (_uniformO in MRTM_BANNED_CSAT_UNIFORM) then {
				removeUniform player;
			};		

			{			
				if (_x in MRTM_BANNED_CSAT_HELMET) then {
					removeHeadgear player;
				};
			} forEach getUnitLoadout player;
		};
		sleep 0.3;
	};
};

[] spawn {
	while {true} do {
		if (missionNamespace getVariable "activeBattlehappening") then {
			_objective = missionNamespace getVariable "currentBattlePos";
			if (player distance2D _objective >= (missionNamespace getVariable "objectiveSize") && alive player) then {
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
	[missionNamespace getVariable "prepTime"] spawn MRTM_fnc_timerClient;
};