class a3c_game_options
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
			text = "Game Options"; //--- ToDo: Localize;
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
			text = "Civ Limit"; //--- ToDo: Localize;
			tooltip = "Set the max number of spawned civilians. Affects game performance";
			action = "if (player == theBoss) then {closeDialog 0; nul = createDialog ""a3c_config_civ""} else {hint ""Only Player Commander has access to this function""};";
			
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
			text = "Spawn Distance"; //--- ToDo: Localize;
			tooltip = "Affects performance. Please use this with caution. Set it to lower distances if you feel Antistasi is running bad";
			action = "if (player == theBoss) then {closeDialog 0; nul = createDialog ""a3c_config_spawn""} else {hint ""Only Player Commander has access to this function""};";
			
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
			text = "AI Limiter"; //--- ToDo: Localize;
			tooltip = "Sets how much local and simulated AI can spawn in the map. Affects performance and AI ""intelligence"". Use with caution. This is not an exact number as vehicles and squad leaders will allways spawn";
			action = "if (player == theBoss) then {closeDialog 0; nul = createDialog ""a3c_fps_limiter""} else {hint ""Only Player Commander has access to this function""};";
			
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
			text = "Persistent Save"; //--- ToDo: Localize;
			tooltip = "Use this option to save your current game. It does save the most important data in a ""Grand Theft Auto"" way. This opnion allows good MP save and independent saves of any version update. Vanilla saves are disabled because of lack of several features";
			action = "closeDialog 0;if (player == theBoss) then {[""statSave\saveLoop.sqf"",""BIS_fnc_execVM""] call BIS_fnc_MP} else {_nul = [] execVM ""statSave\saveLoop.sqf""; hintC ""Personal Stats Saved""};";
			
		};

	};
};
