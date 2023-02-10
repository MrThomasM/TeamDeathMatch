params ["_west", "_east"];

_blackFishBlu =  createVehicle ["type", [(_west select 0) + 20, (_west select 1) + 100, _west select 2], [], 0, "FLY"];
createVehicleCrew _blackFishBlu;

_blackFishOpf =  createVehicle ["type", [(_east select 0) - 20, (_east select 1) - 100, _east select 2], [], 0, "FLY"];
createVehicleCrew _blackFishOpf;

driver _blackFishBlu doMove [(_east select 0) + 20, (_east select 1) - 100, _east select 2];

driver _blackFishOpf doMove [(_west select 0) - 20, (_west select 1) + 100, _west select 2];

{
	if (side _x == west) then {
		_x moveInCargo _blackFishBlu;
	} else {
		_x moveInCargo _blackFishOpf;
	}; 
} forEach allPlayers;