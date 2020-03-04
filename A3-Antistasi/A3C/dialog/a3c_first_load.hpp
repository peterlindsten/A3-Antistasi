class a3c_first_load
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
			text = $STR_antistasi_dialogs_lps_frame_text;
			
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
			text = $STR_antistasi_dialogs_generic_button_yes_text;
			tooltip = $STR_antistasi_dialogs_generic_button_yes_tooltip;
			action = "closeDialog 0;nul = [] spawn A3A_fnc_loadPreviousSession;";
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
			text = $STR_antistasi_dialogs_generic_button_no_text;
			tooltip = $STR_antistasi_dialogs_generic_button_no_tooltip;
			action = "closeDialog 0;if ((player == theBoss) and (isNil ""placementDone"") and !(isMultiplayer)) then { closeDialog 0; [] spawn A3A_fnc_difficultyMenu; };";
			
		};


		class menu_message
		{
			type = 0;
			idc = -1;
			x = 0.0750001;
			y = 0.72500014;
			w = 0.85000003;
			h = 0.10000004;
			style = 2;
			text = "* this menu will be replaced with the mobile phone and admin menu";
			colorBackground[] = {0,0,0,0};
			colorText[] = {0.902,0.902,0.902,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		
	};
	
};