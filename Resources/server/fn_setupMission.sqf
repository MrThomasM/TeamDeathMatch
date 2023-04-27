/*
	Author: MrThomasM
	MrThomasM#1857

	Description:
	- Initialize the objective scenario.

	Exucution:
		[] spawn MRTM_fnc_setupMission;

	Parameter(s): nothing

	Returns: nothing

	Result: 
	Creates a marker for the new objective and spawns every player there.
	Initializes the game end handle.
*/

_locationArray = createHashMapFromArray [
	/********************************      Citys     **********************************/

	[0,["Kore", [7062.42,16472.1,-116.425]]], [1,["Panochori", [5033.31,11245.2,-48.317]]],
	[2,["Rodopoli", [18753.4,16597.1,-32.1656]]], [3,["Agios Petros", [19339.4,17641.6,-37.4067]]],
	[4,["Paros", [20885.4,16958.8,-49.8089]]], [5,["Panagia", [20490.2,8907.12,-34.5332]]],
	[6,["Feres", [21640.7,7583.93,-14.1929]]], [7,["Delfinaki", [23908.6,20144.7,-14.0692]]],
	[8,["Sofia", [25680.5,21365.1,-20.7333]]], [9,["Topolia", [7375.81,15429.5,-54.782]]],
	[10,["Neri", [4116.11,11736.1,-50.8535]]], [11,["Kavala", [3458.95,12966.4,-6.1822]]],
	[12,["Katalaki", [11701.1,13672.1,-12.7303]]], [13,["Syrta", [8625.13,18301.6,-179.297]]],
	[14,["Stavros", [12950.1,15041.6,-28.1891]]], [15,["Galati", [10270.3,19036,-120.191]]],
	[16,["Abdera", [9425.42,20284,-122.26]]], [17,["Ifestiona", [12787,19679.3,-46.1323]]],
	[18,["Gravia", [14479.8,17614.3,-21.6749]]], [19,["Athira", [13993,18709.4,-25.735]]],
	[20,["Pyrgos", [16780.6,12604.5,-18.9913]]], [21,["Charkia", [18049.1,15264.1,-28.4237]]],
	[22,["Agios Dionysios", [9187.95,15947.8,-124.829]]], [23,["Aggelochori", [3687.78,13776.1,-10.7639]]],
	[24,["Poliakko", [10966.5,13435.3,-28.4601]]], [25,["Negades", [4885.98,16171.3,-77.5036]]],
	[26,["Dorida", [19336.9,13252.3,-37.8615]]], [27,["Nifi", [19473.3,15453.7,-22.9098]]],
	[28,["Chalkeia", [20194.6,11660.7,-45.8388]]], [29,["Kalochori", [21351.6,16361.9,-20.5678]]],
	[30,["Selakano", [20769.8,6736.46,-37.9427]]], [31,["Ioannina", [23199.7,19986.6,-14.2541]]],
	[32,["Therisa", [10618.9,12237.3,-16.0326]]], [33,["Alikampos", [11112.6,14573.7,-42.5353]]],
	[34,["Orino", [10410.4,17243.1,-82.7311]]], [35,["Agios Konstantinos", [3948.77,17277.8,-11.6385]]],
	[36,["Neochori", [12502,14337,-11.5868]]], [37,["Lakka", [12282,15732.3,-23.0026]]],
	[38,["Koroni", [11786.7,18372.4,-51.9314]]], [39,["Oreokastro", [4560.45,21460.6,-302.575]]],
	[40,["Telos", [16207,17296.7,-24.3308]]], [41,["Anthrakia", [16584.3,16104,-15.1762]]],
	[42,["Frini", [14612.5,20786.7,-47.0032]]], [43,["Ekali", [17059.7,9992.32,-21.8159]]],
	[44,["Zaros", [9091.81,11961.9,-19.9013]]], [45,["Swamp", [21085.2,14757.7,0.0013876]]],

	/********************************      Custom     **********************************/

	[46,["NWDumpSite", [5895.91,20180.7,0.00186157]]], [47,["NWFactory", [5411.2,17907,0.00143433]]],
	[48,["Nidasos", [23918.4,22491.2,0.00136566]]], [49,["area1", [26073.9,22585.8,0.00172043]]],
	[50,["EOpenArea", [18466,11912.5,0.00206757]]], [51,["area3", [21293.6,11004,0.00137329]]],
	[52,["area2", [17910.7,16154.8,0.00146866]]], [53,["area5", [23569.5,21108.4,0.00165558]]],
	[54,["area4", [27042.7,21483.1,0.00146484]]], [55,["area7", [6407.31,12354.4,0.00189209]]],
	[56,["area6", [21906.8,19547.4,0.00147247]]], [57,["area8", [5347.12,14514.4,0.00136757]]],
	[58,["area9", [6176.7,16235.1,0.00143814]]], [59,["area10", [4384.84,18654,0.00118256]]],
	[60,["area11", [6180.74,19805.4,0.00141907]]], [61,["area12", [4874.68,21936.6,0.00158691]]],
	[62,["area13", [7442.7,17672.7,0.00143433]]], [63,["area14", [6627.33,19250.8,0.00115967]]]
];

rSelection = floor random ((count _locationArray) + 1); //Need to make it so its never 0

while {rSelection == 0} do {
	rSelection = floor random ((count _locationArray) + 1);
	sleep 0.1;
};

_battleLocation = _locationArray get rSelection;

battleCityName = _battleLocation select 0;
battlePos = _battleLocation select 1;


switch (battleCityName) do {
	case "area14": { 
		battleSize = [200, 200];
		marker1 = createMarker ["marker1", battlePos];
		marker1 setMarkerType "loc_Rifle";
		marker1 setMarkerSize [1, 1];
		marker1 setMarkerColor "ColorBlack";

		marker = createMarker ["marker", battlePos];
		marker setMarkerShape "ELLIPSE";
		marker setMarkerBrush "FDiagonal";
		marker setMarkerSize [(battleSize select 1) - 10, (battleSize select 1) - 10];
		marker setMarkerColor "ColorRed";

		spawnEastPos = [battlePos select 0, (battlePos select 1) - ((battleSize select 1) - 50), battlePos select 2];
		spawnWestPos = [battlePos select 0, (battlePos select 1) + ((battleSize select 1) - 50), battlePos select 2];	

		missionNamespace setVariable ["objectiveSize", (battleSize select 1) - 10, true];
	};

	case "area13": { 
		battleSize = [250, 250];
		marker1 = createMarker ["marker1", battlePos];
		marker1 setMarkerType "loc_Rifle";
		marker1 setMarkerSize [1, 1];
		marker1 setMarkerColor "ColorBlack";

		marker = createMarker ["marker", battlePos];
		marker setMarkerShape "ELLIPSE";
		marker setMarkerBrush "FDiagonal";
		marker setMarkerSize [(battleSize select 1) - 10, (battleSize select 1) - 10];
		marker setMarkerColor "ColorRed";

		spawnEastPos = [battlePos select 0, (battlePos select 1) - ((battleSize select 1) - 75), battlePos select 2];
		spawnWestPos = [battlePos select 0, (battlePos select 1) + ((battleSize select 1) - 75), battlePos select 2];	

		missionNamespace setVariable ["objectiveSize", (battleSize select 1) - 10, true];
	};

	case "area12": { 
		battleSize = [200, 200];
		marker1 = createMarker ["marker1", battlePos];
		marker1 setMarkerType "loc_Rifle";
		marker1 setMarkerSize [1, 1];
		marker1 setMarkerColor "ColorBlack";

		marker = createMarker ["marker", battlePos];
		marker setMarkerShape "ELLIPSE";
		marker setMarkerBrush "FDiagonal";
		marker setMarkerSize [(battleSize select 1) - 10, (battleSize select 1) - 10];
		marker setMarkerColor "ColorRed";

		spawnEastPos = [battlePos select 0, (battlePos select 1) - ((battleSize select 1) - 50), battlePos select 2];
		spawnWestPos = [battlePos select 0, (battlePos select 1) + ((battleSize select 1) - 50), battlePos select 2];

		missionNamespace setVariable ["objectiveSize", (battleSize select 1) - 10, true];	
	};

	case "area11": { 
		battleSize = [200, 200];
		marker1 = createMarker ["marker1", battlePos];
		marker1 setMarkerType "loc_Rifle";
		marker1 setMarkerSize [1, 1];
		marker1 setMarkerColor "ColorBlack";

		marker = createMarker ["marker", battlePos];
		marker setMarkerShape "ELLIPSE";
		marker setMarkerBrush "FDiagonal";
		marker setMarkerSize [(battleSize select 1) - 10, (battleSize select 1) - 10];
		marker setMarkerColor "ColorRed";

		spawnEastPos = [battlePos select 0, (battlePos select 1) - ((battleSize select 1) - 50), battlePos select 2];
		spawnWestPos = [battlePos select 0, (battlePos select 1) + ((battleSize select 1) - 50), battlePos select 2];

		missionNamespace setVariable ["objectiveSize", (battleSize select 1) - 10, true];	
	};

	case "area10": { 
		battleSize = [200, 200];
		marker1 = createMarker ["marker1", battlePos];
		marker1 setMarkerType "loc_Rifle";
		marker1 setMarkerSize [1, 1];
		marker1 setMarkerColor "ColorBlack";

		marker = createMarker ["marker", battlePos];
		marker setMarkerShape "ELLIPSE";
		marker setMarkerBrush "FDiagonal";
		marker setMarkerSize [(battleSize select 1) - 10, (battleSize select 1) - 10];
		marker setMarkerColor "ColorRed";

		spawnEastPos = [battlePos select 0, (battlePos select 1) - ((battleSize select 1) - 50), battlePos select 2];
		spawnWestPos = [battlePos select 0, (battlePos select 1) + ((battleSize select 1) - 50), battlePos select 2];

		missionNamespace setVariable ["objectiveSize", (battleSize select 1) - 10, true];	
	};

	case "area9": { 
		battleSize = [250, 250];
		marker1 = createMarker ["marker1", battlePos];
		marker1 setMarkerType "loc_Rifle";
		marker1 setMarkerSize [1, 1];
		marker1 setMarkerColor "ColorBlack";

		marker = createMarker ["marker", battlePos];
		marker setMarkerShape "ELLIPSE";
		marker setMarkerBrush "FDiagonal";
		marker setMarkerSize [(battleSize select 1) - 10, (battleSize select 1) - 10];
		marker setMarkerColor "ColorRed";

		spawnEastPos = [battlePos select 0, (battlePos select 1) - ((battleSize select 1) - 75), battlePos select 2];
		spawnWestPos = [battlePos select 0, (battlePos select 1) + ((battleSize select 1) - 75), battlePos select 2];

		missionNamespace setVariable ["objectiveSize", (battleSize select 1) - 10, true];	
	};

	case "area8": { 
		battleSize = [250, 250];
		marker1 = createMarker ["marker1", battlePos];
		marker1 setMarkerType "loc_Rifle";
		marker1 setMarkerSize [1, 1];
		marker1 setMarkerColor "ColorBlack";

		marker = createMarker ["marker", battlePos];
		marker setMarkerShape "ELLIPSE";
		marker setMarkerBrush "FDiagonal";
		marker setMarkerSize [(battleSize select 1) - 10, (battleSize select 1) - 10];
		marker setMarkerColor "ColorRed";

		spawnEastPos = [battlePos select 0, (battlePos select 1) - ((battleSize select 1) - 75), battlePos select 2];
		spawnWestPos = [battlePos select 0, (battlePos select 1) + ((battleSize select 1) - 75), battlePos select 2];	

		missionNamespace setVariable ["objectiveSize", (battleSize select 1) - 10, true];
	};

	case "area7": { 
		battleSize = [250, 250];
		marker1 = createMarker ["marker1", battlePos];
		marker1 setMarkerType "loc_Rifle";
		marker1 setMarkerSize [1, 1];
		marker1 setMarkerColor "ColorBlack";

		marker = createMarker ["marker", battlePos];
		marker setMarkerShape "ELLIPSE";
		marker setMarkerBrush "FDiagonal";
		marker setMarkerSize [(battleSize select 1) - 10, (battleSize select 1) - 10];
		marker setMarkerColor "ColorRed";

		spawnEastPos = [battlePos select 0, (battlePos select 1) - ((battleSize select 1) - 75), battlePos select 2];
		spawnWestPos = [battlePos select 0, (battlePos select 1) + ((battleSize select 1) - 75), battlePos select 2];

		missionNamespace setVariable ["objectiveSize", (battleSize select 1) - 10, true];	
	};

	case "area6": { 
		battleSize = [200, 200];
		marker1 = createMarker ["marker1", battlePos];
		marker1 setMarkerType "loc_Rifle";
		marker1 setMarkerSize [1, 1];
		marker1 setMarkerColor "ColorBlack";

		marker = createMarker ["marker", battlePos];
		marker setMarkerShape "ELLIPSE";
		marker setMarkerBrush "FDiagonal";
		marker setMarkerSize [(battleSize select 1) - 10, (battleSize select 1) - 10];
		marker setMarkerColor "ColorRed";

		spawnEastPos = [battlePos select 0, (battlePos select 1) - ((battleSize select 1) - 50), battlePos select 2];
		spawnWestPos = [battlePos select 0, (battlePos select 1) + ((battleSize select 1) - 50), battlePos select 2];	

		missionNamespace setVariable ["objectiveSize", (battleSize select 1) - 10, true];
	};

	case "area5": { 
		battleSize = [250, 250];
		marker1 = createMarker ["marker1", battlePos];
		marker1 setMarkerType "loc_Rifle";
		marker1 setMarkerSize [1, 1];
		marker1 setMarkerColor "ColorBlack";

		marker = createMarker ["marker", battlePos];
		marker setMarkerShape "ELLIPSE";
		marker setMarkerBrush "FDiagonal";
		marker setMarkerSize [(battleSize select 1) - 10, (battleSize select 1) - 10];
		marker setMarkerColor "ColorRed";

		spawnEastPos = [battlePos select 0, (battlePos select 1) - ((battleSize select 1) - 75), battlePos select 2];
		spawnWestPos = [battlePos select 0, (battlePos select 1) + ((battleSize select 1) - 75), battlePos select 2];

		missionNamespace setVariable ["objectiveSize", (battleSize select 1) - 10, true];	
	};

	case "area4": { 
		battleSize = [200, 200];
		marker1 = createMarker ["marker1", battlePos];
		marker1 setMarkerType "loc_Rifle";
		marker1 setMarkerSize [1, 1];
		marker1 setMarkerColor "ColorBlack";

		marker = createMarker ["marker", battlePos];
		marker setMarkerShape "ELLIPSE";
		marker setMarkerBrush "FDiagonal";
		marker setMarkerSize [(battleSize select 1) - 10, (battleSize select 1) - 10];
		marker setMarkerColor "ColorRed";

		spawnEastPos = [battlePos select 0, (battlePos select 1) - ((battleSize select 1) - 50), battlePos select 2];
		spawnWestPos = [battlePos select 0, (battlePos select 1) + ((battleSize select 1) - 50), battlePos select 2];	

		missionNamespace setVariable ["objectiveSize", (battleSize select 1) - 10, true];
	};

	case "area3": { 
		battleSize = [200, 200];
		marker1 = createMarker ["marker1", battlePos];
		marker1 setMarkerType "loc_Rifle";
		marker1 setMarkerSize [1, 1];
		marker1 setMarkerColor "ColorBlack";

		marker = createMarker ["marker", battlePos];
		marker setMarkerShape "ELLIPSE";
		marker setMarkerBrush "FDiagonal";
		marker setMarkerSize [(battleSize select 1) - 10, (battleSize select 1) - 10];
		marker setMarkerColor "ColorRed";

		spawnEastPos = [battlePos select 0, (battlePos select 1) - ((battleSize select 1) - 50), battlePos select 2];
		spawnWestPos = [battlePos select 0, (battlePos select 1) + ((battleSize select 1) - 50), battlePos select 2];	

		missionNamespace setVariable ["objectiveSize", (battleSize select 1) - 10, true];
	};

	case "area2": { 
		battleSize = [250, 250];
		marker1 = createMarker ["marker1", battlePos];
		marker1 setMarkerType "loc_Rifle";
		marker1 setMarkerSize [1, 1];
		marker1 setMarkerColor "ColorBlack";

		marker = createMarker ["marker", battlePos];
		marker setMarkerShape "ELLIPSE";
		marker setMarkerBrush "FDiagonal";
		marker setMarkerSize [(battleSize select 1) - 10, (battleSize select 1) - 10];
		marker setMarkerColor "ColorRed";

		spawnEastPos = [battlePos select 0, (battlePos select 1) - ((battleSize select 1) - 75), battlePos select 2];
		spawnWestPos = [battlePos select 0, (battlePos select 1) + ((battleSize select 1) - 75), battlePos select 2];	

		missionNamespace setVariable ["objectiveSize", (battleSize select 1) - 10, true];
	};

	case "area1": { 
		battleSize = [250, 250];
		marker1 = createMarker ["marker1", battlePos];
		marker1 setMarkerType "loc_Rifle";
		marker1 setMarkerSize [1, 1];
		marker1 setMarkerColor "ColorBlack";

		marker = createMarker ["marker", battlePos];
		marker setMarkerShape "ELLIPSE";
		marker setMarkerBrush "FDiagonal";
		marker setMarkerSize [(battleSize select 1) - 10, (battleSize select 1) - 10];
		marker setMarkerColor "ColorRed";

		spawnEastPos = [battlePos select 0, (battlePos select 1) - ((battleSize select 1) - 75), battlePos select 2];
		spawnWestPos = [battlePos select 0, (battlePos select 1) + ((battleSize select 1) - 75), battlePos select 2];

		missionNamespace setVariable ["objectiveSize", (battleSize select 1) - 10, true];	
	};

	case "Swamp": { 
		battleSize = [250, 250];
		marker1 = createMarker ["marker1", battlePos];
		marker1 setMarkerType "loc_Rifle";
		marker1 setMarkerSize [1, 1];
		marker1 setMarkerColor "ColorBlack";

		marker = createMarker ["marker", battlePos];
		marker setMarkerShape "ELLIPSE";
		marker setMarkerBrush "FDiagonal";
		marker setMarkerSize [(battleSize select 1) - 10, (battleSize select 1) - 10];
		marker setMarkerColor "ColorRed";

		spawnEastPos = [battlePos select 0, (battlePos select 1) - ((battleSize select 1) - 75), battlePos select 2];
		spawnWestPos = [battlePos select 0, (battlePos select 1) + ((battleSize select 1) - 75), battlePos select 2];

		missionNamespace setVariable ["objectiveSize", (battleSize select 1) - 10, true];	
	};

	case "NWDumpSite": { 
		battleSize = [250, 250];
		marker1 = createMarker ["marker1", battlePos];
		marker1 setMarkerType "loc_Rifle";
		marker1 setMarkerSize [1, 1];
		marker1 setMarkerColor "ColorBlack";

		marker = createMarker ["marker", battlePos];
		marker setMarkerShape "ELLIPSE";
		marker setMarkerBrush "FDiagonal";
		marker setMarkerSize [(battleSize select 1) - 10, (battleSize select 1) - 10];
		marker setMarkerColor "ColorRed";	

		spawnEastPos = [battlePos select 0, (battlePos select 1) - ((battleSize select 1) - 75), battlePos select 2];
		spawnWestPos = [battlePos select 0, (battlePos select 1) + ((battleSize select 1) - 75), battlePos select 2];	

		missionNamespace setVariable ["objectiveSize", (battleSize select 1) - 10, true];	
	};

	case "Nidasos": { 
		battleSize = [250, 250];
		marker1 = createMarker ["marker1", battlePos];
		marker1 setMarkerType "loc_Rifle";
		marker1 setMarkerSize [1, 1];
		marker1 setMarkerColor "ColorBlack";

		marker = createMarker ["marker", battlePos];
		marker setMarkerShape "ELLIPSE";
		marker setMarkerBrush "FDiagonal";
		marker setMarkerSize [(battleSize select 1) - 10, (battleSize select 1) - 10];
		marker setMarkerColor "ColorRed";		

		spawnEastPos = [battlePos select 0, (battlePos select 1) - ((battleSize select 1) - 75), battlePos select 2];
		spawnWestPos = [battlePos select 0, (battlePos select 1) + ((battleSize select 1) - 75), battlePos select 2];
		
		missionNamespace setVariable ["objectiveSize", (battleSize select 1) - 10, true];
	};

	case "NWFactory": { 
		battleSize = [200, 200];
		marker1 = createMarker ["marker1", battlePos];
		marker1 setMarkerType "loc_Rifle";
		marker1 setMarkerSize [1, 1];
		marker1 setMarkerColor "ColorBlack";

		marker = createMarker ["marker", battlePos];
		marker setMarkerShape "ELLIPSE";
		marker setMarkerBrush "FDiagonal";
		marker setMarkerSize [(battleSize select 1) - 10, (battleSize select 1) - 10];
		marker setMarkerColor "ColorRed";		

		spawnEastPos = [battlePos select 0, (battlePos select 1) - ((battleSize select 1) - 50), battlePos select 2];
		spawnWestPos = [battlePos select 0, (battlePos select 1) + ((battleSize select 1) - 50), battlePos select 2];

		missionNamespace setVariable ["objectiveSize", (battleSize select 1) - 10, true];
	};

	case "EOpenArea": { 
		battleSize = [300, 300];

		marker1 = createMarker ["marker1", battlePos];
		marker1 setMarkerType "loc_Rifle";
		marker1 setMarkerSize [1, 1];
		marker1 setMarkerColor "ColorBlack";

		marker = createMarker ["marker", battlePos];
		marker setMarkerShape "ELLIPSE";
		marker setMarkerBrush "FDiagonal";
		marker setMarkerSize [(battleSize select 1) - 10, (battleSize select 1) - 10];
		marker setMarkerColor "ColorRed";	

		spawnEastPos = [battlePos select 0, (battlePos select 1) - ((battleSize select 1) - 100), battlePos select 2];
		spawnWestPos = [battlePos select 0, (battlePos select 1) + ((battleSize select 1) - 100), battlePos select 2];

		missionNamespace setVariable ["objectiveSize", (battleSize select 1) - 10, true];
	};

	default { 
		battleSize = size nearestLocation [battlePos, "nameCity"];

		marker1 = createMarker ["marker1", battlePos];
		marker1 setMarkerType "loc_Rifle";
		marker1 setMarkerSize [1, 1];
		marker1 setMarkerColor "ColorBlack";

		marker = createMarker ["marker", battlePos];
		marker setMarkerShape "ELLIPSE";
		marker setMarkerBrush "FDiagonal";
		marker setMarkerSize [(battleSize select 1) - 10, (battleSize select 1) - 10];
		marker setMarkerColor "ColorRed";

		spawnEastPos = [battlePos select 0, (battlePos select 1) - ((battleSize select 1) / 2), battlePos select 2];
		spawnWestPos = [battlePos select 0, (battlePos select 1) + ((battleSize select 1) / 2), battlePos select 2];

		missionNamespace setVariable ["objectiveSize", (battleSize select 1) - 10, true];
	};
};

missionNamespace setVariable ["activeBattlehappening", true , true];

missionNamespace setVariable ["currentBattlePos", battlePos, true];
missionNamespace setVariable ["currentWestSpawn", spawnWestPos, true];
missionNamespace setVariable ["currentEastSpawn", spawnEastPos, true];

[] spawn { //Game end handle
	missionNamespace setVariable ["objTime", 0, true];
	["battle", missionNamespace getVariable "timeObjectiveParam"] spawn MRTM_fnc_timerClient;
	
	waitUntil {missionNamespace getVariable "bluKills" == missionNamespace getVariable "killParam" || missionNamespace getVariable "opfKills" == missionNamespace getVariable "killParam" || missionNamespace getVariable "objTime" == missionNamespace getVariable "timeObjectiveParam"};

	missionNamespace setVariable ["activeBattlehappening", false , true];


	{
		if (side _x == west) then {
			private _center = missionNamespace getVariable "bluBaseSpawn";
			private _radius = 5;

			private _angle = random 360;	
			private _randomSquareRoot = sqrt random 1;			
			private _distance = _radius * _randomSquareRoot;	
			private _position = _center getPos [_distance, _angle];
			_x setPos _position;
		};

		if (side _x == east) then {
			private _center = missionNamespace getVariable "opfBaseSpawn";
			private _radius = 5;

			private _angle = random 360;					
			private _randomSquareRoot = sqrt random 1;			
			private _distance = _radius * _randomSquareRoot;	
			private _position = _center getPos [_distance, _angle];
			_x setPos _position;
		};
	} forEach allPlayers;

	deleteMarker "marker1";
	deleteMarker "marker";

	missionNamespace setVariable ["bluKills", 0, true];
	missionNamespace setVariable ["opfKills", 0, true];

	missionNamespace setVariable ["prepTime", missionNamespace getVariable "timeParam", true]; //The prep timer

	["prepping", missionNamespace getVariable "prepTime"] remoteExec ["MRTM_fnc_timerClient", 0]; //every client, not server

	[missionNamespace getVariable "prepTime"] remoteExec ["MRTM_fnc_timer", 2]; // server
};

[battlePos, spawnWestPos, spawnEastPos] remoteExec ["MRTM_fnc_spawnAtObjective", 0]; //every client, not server

[] remoteExec ["MRTM_fnc_setupUI", 0]; //every client, not server