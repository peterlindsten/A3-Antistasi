class a3c_rounds_number
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
			text = "Select No. Rounds to be fired"; //--- ToDo: Localize;
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
			text = "1"; //--- ToDo: Localize;
			action = "closeDialog 0;roundsX = 1;";
			
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
			text = "2"; //--- ToDo: Localize;
			action = "closeDialog 0;roundsX = 2";
			
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
			text = "3"; //--- ToDo: Localize;
			action = "closeDialog 0; roundsX = 3";
			
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
			text = "4"; //--- ToDo: Localize;
			action = "closeDialog 0;roundsX = 4";
			
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
			text = "5"; //--- ToDo: Localize;
			action = "closeDialog 0;roundsX = 5";
			
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
			text = "6"; //--- ToDo: Localize;
			action = "closeDialog 0;roundsX = 6";
			
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
			text = "7"; //--- ToDo: Localize;
			action = "closeDialog 0; roundsX = 7";
			
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
			text = "8"; //--- ToDo: Localize;
			action = "closeDialog 0;roundsX = 8";
			
		};
		
	};
	
};
