class a3c_radio_comm
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
			text = "Battle Options"; //--- ToDo: Localize;
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
			text = "Fast Travel"; //--- ToDo: Localize;
			tooltip = "Teleport your squad or a HC selected squad to a friendly zone depending on several factors";
			action = "closeDialog 0; [] spawn A3A_fnc_fastTravelRadio;";
			
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
			text = "Player and Money"; //--- ToDo: Localize;
			tooltip = "Look at some player and interact with him";
			action = "closeDialog 0;if (isMultiPlayer) then {nul = createDialog ""a3c_player_money""} else {hint ""MP Only Menu""};";
			
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
			text = "Undercover ON"; //--- ToDo: Localize;
			tooltip = "Become Undercover if you match the requirements. Enemy AI won't attack you until they discover you";
			action = "closeDialog 0;nul = [] spawn A3A_fnc_goUndercover";
			
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
			text = "Construct Here"; //--- ToDo: Localize;
			tooltip = "Construct in the spot where you are a selected building facing this direction";
			action = "closeDialog 0;_nul = createDialog ""a3c_construction_menu"";";
			
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
			text = "Garage Vehicle"; //--- ToDo: Localize;
			tooltip = "Vehicle or Static gun you're looking at will be garaged, interact with Flag to retrieve";
			action = "closeDialog 0;if (player != theBoss) then {nul = [false] call A3A_fnc_garageVehicle} else {if (isMultiplayer) then {_nul = createDialog ""a3c_garage_check""} else {nul = [true] call A3A_fnc_garageVehicle}};";
			
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
			text = "Unlock Vehicle"; //--- ToDo: Localize;
			tooltip = "Allow other groups to mount this vehicle";
			action = "closeDialog 0;[] call A3A_fnc_unlockVehicle";
			
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
			text = "AI Management"; //--- ToDo: Localize;
			tooltip = "Several AI options";
			action = "if (player == leader group player) then {closeDialog 0;nul = createDialog ""a3c_ai_management""} else {hint ""Only group leaders may access to this option""};";
			
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
			text = "Commander"; //--- ToDo: Localize;
			tooltip = "Open commander options";
			action = "closeDialog 0; nul = createDialog ""a3c_commander_comm"";";
			
		};
		
	};
	
};
