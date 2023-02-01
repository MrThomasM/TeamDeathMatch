/*
	Author: MrThomasM
	MrThomasM#1857

	Description:
	- Spawns each player at the  current objective.

	Exucution:
		[] call MRTM_fnc_spawnAtObjective;

	Parameter(s): ["_posBattle", "_spawnW", "_spawnE"]

	Returns: nothing

	Result: 
	Sets the unit from wich this scrip was called at the objective.
*/

params ["_posBattle", "_spawnW", "_spawnE"];


if (side player == west) then {
	private _center = _spawnW;
	private _radius = 20;

	private _angle = random 360;					
	private _randomSquareRoot = sqrt random 1;			
	private _distance = _radius * _randomSquareRoot;	
	private _position = _center getPos [_distance, _angle];
	player setPos _position;
	player setDir 180;
};

if (side player == east) then {
	private _center = _spawnE;
	private _radius = 20;

	private _angle = random 360;					
	private _randomSquareRoot = sqrt random 1;			
	private _distance = _radius * _randomSquareRoot;	
	private _position = _center getPos [_distance, _angle];
	player setPos _position;
};