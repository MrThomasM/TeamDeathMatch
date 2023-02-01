params ["_battleLoc"];

if (side player == west) then {
	[west, "battleTaskW", ["Destroy the CSAT forces!", "Eliminate CSAT", "marker"], [ _battleLoc select 0, _battleLoc select 1, (getTerrainHeightASL [_battleLoc select 0, _battleLoc select 1]) - 10], "ASSIGNED", 1, true, "", true] call BIS_fnc_taskCreate;
	hint "Task created";
};

if (side player == east) then {
	[east, "battleTaskE", ["Destroy the NATO forces!", "Eliminate NATO", "marker"], [ _battleLoc select 0, _battleLoc select 1, (getTerrainHeightASL [_battleLoc select 0, _battleLoc select 1]) - 10], "ASSIGNED", 1, true, "", true] call BIS_fnc_taskCreate;
	hint "Task created";
};