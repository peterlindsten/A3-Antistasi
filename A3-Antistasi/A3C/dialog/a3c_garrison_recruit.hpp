class a3c_garrison_recruit
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
			text = $STR_antistasi_dialogs_garrison_recruit_frame_text;
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
			action = "closeDialog 0;_nul = createDialog ""a3c_build_menu"";";
			
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
			text = $STR_antistasi_dialogs_garrison_spawn_rifleman_text;
			action = "nul = [SDKMil] spawn A3A_fnc_garrisonAdd";
			
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
			text = $STR_antistasi_dialogs_garrison_spawn_autorifleman_text;
			action = "nul = [SDKMG] spawn A3A_fnc_garrisonAdd";
			
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
			text = $STR_antistasi_dialogs_garrison_spawn_medic_text;
			action = "nul = [SDKMedic] spawn A3A_fnc_garrisonAdd";
			
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
			text = $STR_antistasi_dialogs_garrison_spawn_squad_lead_text;
			action = "nul = [SDKSL] spawn A3A_fnc_garrisonAdd";
			
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
			text = $STR_antistasi_dialogs_garrison_spawn_mortar_text;
			action = "nul = [staticCrewTeamPlayer] spawn A3A_fnc_garrisonAdd";
			
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
			text = $STR_antistasi_dialogs_garrison_spawn_grenadier_text;
			action = "nul = [SDKGL] spawn A3A_fnc_garrisonAdd";
			
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
			text =  $STR_antistasi_dialogs_garrison_spawn_marksman_text;
			action = "nul = [SDKSniper] spawn A3A_fnc_garrisonAdd";
			
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
			text = $STR_antistasi_dialogs_garrison_spawn_at_text;
			action = "nul = [SDKATman] spawn A3A_fnc_garrisonAdd";
			
		};
		
	};
	
};
