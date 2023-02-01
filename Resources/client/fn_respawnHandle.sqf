/*
	Author: MrThomasM
	MrThomasM#1857

	Description:
	- Respawns player at base or at objective depending if a battle is active.

	Exucution:
		[] spawn MRTM_fnc_respawnHandle;

	Requirments:

	Parameter(s): nothing

	Returns: nothing

	Result: Respawns player at base or at objective.
*/

sleep 0.05;

if (missionNamespace getVariable "activeBattlehappening") then {
	private _battlePos = missionNamespace getVariable "currentBattlePos";
	private _spawnWestPos = missionNamespace getVariable "currentWestSpawn";
	private _spawnEastPos = missionNamespace getVariable "currentEastSpawn";

	[_battlePos, _spawnWestPos, _spawnEastPos] spawn MRTM_fnc_spawnAtObjective;
	player setUnitLoadout (player getVariable "MRTM_loadout");

	if (side player == west) then {
		_opfKills = missionNamespace getVariable "opfKills";
		_newOpfKills = _opfKills + 1;
		missionNamespace setVariable ["opfKills", _newOpfKills, true];
	};

	if (side player == east) then {
		_bluKills = missionNamespace getVariable "bluKills";
		_newBluKills = _bluKills + 1;
		missionNamespace setVariable ["bluKills", _newBluKills, true];		
	};
};

if (missionNamespace getVariable "activeBattlehappening" == false) then {
	if (side player == west) then {
		private _center = missionNamespace getVariable "bluBaseSpawn";
		private _radius = 5;

		private _angle = random 360;					
		private _randomSquareRoot = sqrt random 1;			
		private _distance = _radius * _randomSquareRoot;	
		private _position = _center getPos [_distance, _angle];
		player setPos _position;
	};

	if (side player == east) then {
		private _center = missionNamespace getVariable "opfBaseSpawn";
		private _radius = 5;

		private _angle = random 360;					
		private _randomSquareRoot = sqrt random 1;			
		private _distance = _radius * _randomSquareRoot;	
		private _position = _center getPos [_distance, _angle];
		player setPos _position;
	};

	player setUnitLoadout (player getVariable "MRTM_loadout");
};