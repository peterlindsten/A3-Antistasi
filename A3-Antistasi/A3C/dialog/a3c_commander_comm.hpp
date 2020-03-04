class a3c_commander_comm
{
	idd = -1;
	movingenable=false;
	
	class ControlsBackground
	{
		class main_background : a3cMenuBackground 
		{
			type = 0;
			idc = -1;
			x = 0.05303032;
			y = 0.12196973;
			w = 0.89848485;
			h = 0.72424245;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class main_header : a3cMenuHeader 
		{
			type = 0;
			idc = -1;
			x = 0.05303032;
			y = 0.12196973;
			w = 0.89848485;
			h = 0.07424249;
			style = 2;
			text = "Commander Battle Options"; //--- ToDo: Localize;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class main_exit : a3cMenuClose 
		{
			type = 0;
			idc = -1;
			x = 0.87727273;
			y = 0.12121214;
			w = 0.07424243;
			h = 0.0747475;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class main_back : a3cMenuBack 
		{
			type = 0;
			idc = -1;
			x = 0.05303031;
			y = 0.12121214;
			w = 0.07424243;
			h = 0.0747475;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class exit_button : a3cMenuButtonClose 
		{
			type = 1;
			idc = -1;
			x = safeZoneX+safeZoneW*0.655;
			y = safeZoneY+safeZoneH*0.29111112;
			w = safeZoneW*0.03125;
			h = safeZoneH*0.04222223;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class back_button : a3cMenuButtonBack 
		{
			type = 1;
			idc = -1;
			x = safeZoneX+safeZoneW*0.315;
			y = safeZoneY+safeZoneH*0.29;
			w = safeZoneW*0.03125;
			h = safeZoneH*0.04222223;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			action = "closeDialog 0;nul = createDialog ""a3c_radio_comm"";";
			
		};
		
	};
	class Controls
	{
		class menu1 : a3cMenuButton 
		{
			type = 1;
			idc = -1;
			x = 0.10000004;
			y = 0.25000008;
			w = 0.37500003;
			h = 0.07500004;
			style = 0+2;
			text = "Recruit Squad"; //--- ToDo: Localize;
			tooltip = "Recruit new squads and manage them with the HC Module (CTRL + SPACE)";
			action = "closeDialog 0;if (player == theBoss) then { [] spawn A3A_fnc_squadRecruit; } else {hint ""Only Player Commander has access to this function""};";
			
		};
		class menu2 : a3cMenuButton 
		{
			type = 1;
			idc = -1;
			x = 0.52500009;
			y = 0.25000009;
			w = 0.37500003;
			h = 0.07500004;
			style = 0+2;
			text = "Air Support"; //--- ToDo: Localize;
			tooltip = "Ask for Air Support (uses Airstrike points)";
			action = "closeDialog 0;if (player == theBoss) then {_nul = createDialog ""a3c_carpet_bombing""} else {hint ""Only Player Commander has access to this function""};";
			
		};
		class menu3 : a3cMenuButton 
		{
			type = 1;
			idc = -1;
			x = 0.10000012;
			y = 0.37500013;
			w = 0.37500003;
			h = 0.07500004;
			style = 0+2;
			text = "O.Post - Roadblock"; //--- ToDo: Localize;
			tooltip = "Establish a new watchpost or roadblock depending on the type of terrain you select";
			action = "if (player == theBoss) then {closeDialog 0;[""create""] spawn A3A_fnc_outpostDialog} else {hint ""You're not the Commander!""};";
			
		};
		class menu4 : a3cMenuButton 
		{
			type = 1;
			idc = -1;
			x = 0.52500009;
			y = 0.37500013;
			w = 0.37500003;
			h = 0.07500004;
			style = 0+2;
			text = "Garbage Clean"; //--- ToDo: Localize;
			tooltip = "Cleans several things in game. Use with caution as it freezes the mission";
			action = "if (player == theBoss) then {closedialog 0;[] remoteExec [""A3A_fnc_garbageCleaner"",2]} else {hint ""Only Player Commander has access to this function""};";
			
		};
		class menu5 : a3cMenuButton 
		{
			type = 1;
			idc = -1;
			x = 0.10151516;
			y = 0.50101011;
			w = 0.37575758;
			h = 0.0747475;
			style = 0+2;
			text = "O.Post-Roadblock Delete"; //--- ToDo: Localize;
			tooltip = "Remove selected observation post or roadblock, money will be refunded";
			action = "if (player == theBoss) then {closeDialog 0; [""delete""] spawn A3A_fnc_outpostDialog} else {hint ""You're not the Commander!""};";
			
		};
		class menu6 : a3cMenuButton 
		{
			type = 1;
			idc = -1;
			x = 0.52651521;
			y = 0.50101011;
			w = 0.37575758;
			h = 0.0747475;
			style = 0+2;
			text = "Faction Garage"; //--- ToDo: Localize;
			tooltip = "Look at a vehicle and garage it into faction garage (shared among commanders)";
			action = "if (player == theBoss) then {closeDialog 0;nul = [true] call A3A_fnc_garageVehicle;} else {hint ""You're not the Commander!""};";
			
		};
		class menu7 : a3cMenuButton 
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.33625;
			y = safeZoneY + safeZoneH * 0.57333334;
			w = safeZoneW * 0.155;
			h = safeZoneH * 0.04111112;
			style = 0+2;
			text = "Resign / Eligible"; //--- ToDo: Localize;
			tooltip = "Step down from commander or toggle eligibility";
			action = "if (isMultiplayer) then {closedialog 0;[player] remoteExec [""A3A_fnc_theBossToggleEligibility"", 2]} else {hint ""This feature is MP Only""};";
			
		};
		class menu8 : a3cMenuButton 
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.51125;
			y = safeZoneY + safeZoneH * 0.57333334;
			w = safeZoneW * 0.155;
			h = safeZoneH * 0.04111112;
			style = 0+2;
			text = "Sell Vehicle"; //--- ToDo: Localize;
						tooltip = "Look at a vehicle and sell it for money";
			action = "if (player == theBoss) then {closeDialog 0; nul = [] call A3A_fnc_sellVehicle} else {hint ""Only the Commander can sell vehicles""};";
			
		};
		
	};
	
};
