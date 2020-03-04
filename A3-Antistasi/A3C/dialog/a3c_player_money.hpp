class a3c_player_money
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
			text = "Player and Money Interaction"; //--- ToDo: Localize;
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
			action = "closeDialog 0;_nul = createDialog ""a3c_radio_comm"";";
			
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
			text = "Add Server Member"; //--- ToDo: Localize;
			tooltip = "Use this option to add the player which you are currently looking to the member's list";
			action = "if (isMultiplayer) then {closeDialog 0;nul = [""add""] call A3A_fnc_memberAdd;} else {hint ""This function is MP only""};";
			
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
			text = "Remove Server Member"; //--- ToDo: Localize;
			tooltip = "Use this option to remove the player which you are currently looking to the member's list";
			action = "if (isMultiplayer) then {closeDialog 0;nul = [""remove""] call A3A_fnc_memberAdd;} else {hint ""This function is MP only""};";
			
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
			text = "Donate 100 € to player"; //--- ToDo: Localize;
			action = "[true] call A3A_fnc_donateMoney;";
			
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
			text = "Donate 100 € to Faction"; //--- ToDo: Localize;
			tooltip = "It will increase your prestige among your faction";
			action = "[] call A3A_fnc_donateMoney;";
			
		};
	
	};
	
};
