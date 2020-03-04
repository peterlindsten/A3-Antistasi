class a3c_config_spawn
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
			text = "Spawn Distance Config"; //--- ToDo: Localize;
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
			action = "closeDialog 0;_nul = createDialog ""a3c_game_options"";";
			
		};
		
	};
	class Controls
	{

		class menu3 : a3cMenuButton 
		{
			type = 1;
			idc = -1;
			x = 0.10000012;
			y = 0.37500013;
			w = 0.37500003;
			h = 0.07500004;
			style = 0+2;
			text = "+100 Spawn Dist."; //--- ToDo: Localize;
			action = "if (player == theBoss) then {if (distanceSPWN < 2000) then {distanceSPWN = distanceSPWN + 100; distanceSPWN1 = distanceSPWN * 1.3; distanceSPWN2 = distanceSPWN /2; publicVariable ""distanceSPWN"";publicVariable ""distanceSPWN1"";publicVariable ""distanceSPWN2""}; hint format [""Spawn Distance Set to %1 meters. Be careful, this may affect game performance"",distanceSPWN]} else {hint ""Only Player Commander has access to this function""};";
			
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
			text = "-100 Spawn Dist."; //--- ToDo: Localize;
			action = "if (player == theBoss) then {if (distanceSPWN > 600) then {distanceSPWN = distanceSPWN - 100; if (distanceSPWN < 600) then {distanceSPWN = 600}; distanceSPWN1 = distanceSPWN * 1.3; distanceSPWN2 = distanceSPWN /2; if (distanceSPWN < 600) then {distanceSPWN = 600};publicVariable ""distanceSPWN"";publicVariable ""distanceSPWN1"";publicVariable ""distanceSPWN2"";}; hint format [""Spawn Distance Set to %1 meters"",distanceSPWN]} else {hint ""Only Player Commander has access to this function""};";
			
		};
		
	};
	
};
