if (side player == west) then {
	_arsBID = player addAction ["Open arsenal",
	{
		["Open", TRUE] spawn BIS_fnc_arsenal;
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
		["Open", TRUE] spawn BIS_fnc_arsenal;
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
