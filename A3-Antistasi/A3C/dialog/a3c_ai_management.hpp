class a3c_ai_management
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
			text = "Temp. AI Control"; //--- ToDo: Localize;
			tooltip = "Take personal control of the selected squad member or HC squad leader and be able to perform any kind of actions for 60 seconds. Control state will be cancelled if the player or the controlled unit receives any kind of damage";
			action = "closeDialog 0; if ((count groupselectedUnits player > 0) and (count hcSelected player > 0)) exitWith {hint ""You must select from HC or Squad Bars, not both""}; if (count groupselectedUnits player == 1) then {nul = [groupselectedUnits player] execVM ""REINF\controlunit.sqf""}; if (count hcSelected player == 1) then {nul = [hcSelected player] execVM ""REINF\controlHCsquad.sqf"";};";
			
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
			text = "Auto Rearm \ Loot"; //--- ToDo: Localize;
			tooltip = "AI will search for better weapons, vests, helmets etc. If they are in a vehicle, they will just store what they scavenge in the vehicle. If not, they will equip them";
			action = "closeDialog 0; if (count groupselectedUnits player == 0) then {nul = (units group player) spawn A3A_fnc_rearmCall} else {nul = (groupselectedUnits player) spawn A3A_fnc_rearmCall};";
			
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
			text = "Auto Heal"; //--- ToDo: Localize;
			tooltip = "AI squad mates will heal proactively each other";
			action = "if (autoHeal) then {autoHeal = false; hint ""Auto Healing disabled"";} else {autoHeal = true; hint ""Auto Heal enabled""; nul = [] spawn A3A_fnc_autoHealFnc}";
			
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
			text = "Squad SITREP"; //--- ToDo: Localize;
			tooltip = "Recover info about a HC squad status";
			action = "[""stats""] call A3A_fnc_vehStats;";
			
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
			text = "Garrison Units / Squads"; //--- ToDo: Localize;
			tooltip = "Adds selected units or squads to a map selected garrison";
			action = "closeDialog 0;if (count groupselectedUnits player > 0) then {nul = [groupselectedUnits player] execVM ""REINF\addToGarrison.sqf""} else {if (count (hcSelected player) > 0) then {nul = [hcSelected player] execVM ""REINF\addToGarrison.sqf""}}; if ((count groupselectedUnits player == 0) and (count hcSelected player == 0)) then {hint ""No units or squads selected""}";
			
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
			text = "Squad Add Vehicle"; //--- ToDo: Localize;
			tooltip = "Look at some vehicle and assign it to the selected squad for it's use";
			action = "closeDialog 0;[] call A3A_fnc_addSquadVeh;";
			
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
			text = "Dismiss Units / Squad"; //--- ToDo: Localize;
			tooltip = "Dimiss selected units or squads, recovering it's cost to the proper resource pool";
			action = "closeDialog 0;if (count groupselectedUnits player > 0) then {nul = [groupselectedUnits player] execVM ""REINF\dismissPlayerGroup.sqf""} else {if (count (hcSelected player) > 0) then {nul = [hcSelected player] execVM ""REINF\dismissSquad.sqf""}}; if ((count groupselectedUnits player == 0) and (count hcSelected player == 0)) then {hint ""No units or squads selected""}";
			
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
			text = "Mount / Dismount"; //--- ToDo: Localize;
			tooltip = "Force squad to mount or dismount their assigned vehicle";
			action = "[""mount""] call A3A_fnc_vehStats";
			
		};
		
	};
	
};
