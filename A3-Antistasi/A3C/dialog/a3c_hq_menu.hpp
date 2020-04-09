class a3c_hq_menu
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
			text = $STR_antistasi_dialogs_hq_frame_text;
		};
		class main_exit : a3cMenuClose
		{
			type = 0;
			idc = -1;
			x = 0.87727273;
			y = 0.12121214;
			w = 0.07424243;
			h = 0.0747475;
		};

		class exit_button : a3cMenuButtonClose
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.655;
			y = safeZoneY + safeZoneH * 0.29111112;
			w = safeZoneW * 0.03125;
			h = safeZoneH * 0.04222223;
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
			text = $STR_antistasi_dialogs_hq_button_withdraw_text;
			tooltip = $STR_antistasi_dialogs_hq_button_withdraw_tooltip;
			action = "if (isMultiPlayer) then {if (player == theBoss) then {nul=call A3A_fnc_theBossSteal} else {hint ""Only Player Commander has access to this function""}} else {hint ""This function is MP only""};";
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
			text = $STR_antistasi_dialogs_hq_button_members_list_text;
			tooltip = $STR_antistasi_dialogs_hq_button_members_list_tooltip;
			action = "if (player == theBoss) then {if (isMultiplayer) then {nul = [] call A3A_fnc_membersList} else {hint ""This function is MP only""}} else {hint ""Only Player Commander has access to this function""};";
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
			text = $STR_antistasi_dialogs_hq_button_garrisons_text;
			tooltip = $STR_antistasi_dialogs_hq_button_garrisons_tooltip;
			action = "closeDialog 0;if (player == theBoss) then {nul=CreateDialog ""a3c_build_menu""} else {hint ""Only Player Commander has access to this function""};";
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
			text = $STR_antistasi_dialogs_hq_button_rebuild_assets_text;
			tooltip = $STR_antistasi_dialogs_hq_button_rebuild_assets_tooltip;
			action = "closeDialog 0;if (player == theBoss) then {nul=[] spawn A3A_fnc_rebuildAssets} else {hint ""Only Player Commander has access to this function""};";
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
			text = $STR_antistasi_dialogs_hq_button_move_headquarters_text;
			tooltip = $STR_antistasi_dialogs_hq_button_move_headquarters_tooltip;
			action = "closeDialog 0;if (player == theBoss) then {nul = [] spawn A3A_fnc_moveHQ;} else {hint ""Only Player Commander has access to this function""};";
		};
		class menu6 : a3cMenuButton
		{
			type = 1;
			idc = 109;
			x = 0.52651521;
			y = 0.50101011;
			w = 0.37575758;
			h = 0.0747475;
			style = 0+2;
			text = $STR_antistasi_dialogs_hq_button_train_ai_text;
			tooltip = $STR_antistasi_dialogs_hq_button_train_ai_tooltip;
			action = "closeDialog 0;if (player == theBoss) then {nul = [] call A3A_fnc_FIAskillAdd} else {hint ""Only Player Commander has access to this function""};";
		};
		class menu_message : a3cMenuButton
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
