/*
	Author: MrThomasM
	MrThomasM#1857

	Description:
	- Allows people to open the arsenal.

	Exucution:
		[] spawn MRTM_fnc_arsenalHandle;

	Parameter(s): nothing

	Returns: nothing

	Result: 
	Opens the arsenal.
*/

if (side player == west) then {
	_arsBID = player addAction ["Open arsenal",
	{
		_uniform = uniform player;
		["Open", TRUE] spawn BIS_fnc_arsenal;
		_uniform spawn {
			waitUntil {!isNull (uiNamespace getVariable ["BIS_fnc_arsenal_cam", objNull])};
			while {!isNull (uiNamespace getVariable ["BIS_fnc_arsenal_cam", objNull])} do {
				if !(uniform player in clothingListNato) then {
					player forceAddUniform "U_B_CombatUniform_mcam";
				};

				if !(headGear player in helmetListNato) then {
					player addHeadgear "H_HelmetB";
				};
				sleep 0.1;
			};
		};
	},
	nil,		
	1.5,		
	true,		
	true,		
	"",			
	"cursorObject == arsenalB && player inArea [arsenalB, 10, 10, 360, false]", 	// condition
	50,			
	false		
	];
} else {
	_arsOID = player addAction ["Open arsenal",
	{
		_uniform = uniform player;
		["Open", TRUE] spawn BIS_fnc_arsenal;
		_uniform spawn {
			waitUntil {!isNull (uiNamespace getVariable ["BIS_fnc_arsenal_cam", objNull])};
			while {!isNull (uiNamespace getVariable ["BIS_fnc_arsenal_cam", objNull])} do {
				if !(uniform player in MRTM_factionAppropriateUniforms) then {
					player forceAddUniform _this;
				};
				sleep 0.1;
			};
		};
	},
	nil,		
	1.5,		
	true,		
	true,		
	"",			
	"cursorObject == arsenalO && player inArea [arsenalO, 10, 10, 360, false]", 	// condition
	50,			
	false		
	];
};
