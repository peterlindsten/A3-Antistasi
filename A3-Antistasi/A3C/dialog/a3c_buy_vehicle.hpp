class a3c_buy_vehicle
{
	idd = 7679002;
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
			text = "Vehicle Purchase";
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
		class vic_list : a3cRscListBox
		{
			type = 5;
			idc = 1003;
			x = safeZoneX + safeZoneW * 0.325;
			y = safeZoneY + safeZoneH * 0.34777778;
			w = safeZoneW * 0.144375;
			h = safeZoneH * 0.32555556;
			style = 16;
			colorText[] = {1,1,1,1};
			colorDisabled[] = {1,1,1,0.2};
			colorScrollbar[] = {1,0,0,0};
			colorSelect[] = {0,0,0,1};
			colorSelect2[] = {0,0,0,1};
			colorSelectBackground[] = {0.8,0.8,0.8,0.7};
			colorSelectBackground2[] = {1,1,1,0.5};
			colorBackground[] = {0,0,0,0.3};
			colorPicture[] = {1,1,1,1};
			colorPictureSelected[] = {1,1,1,1};
			colorPictureDisabled[] = {1,1,1,0.25};
			colorPictureRight[] = {1,1,1,1};
			colorPictureRightSelected[] = {1,1,1,1};
			colorPictureRightDisabled[] = {1,1,1,0.25};
			colorTextRight[] = {1,1,1,1};
			colorSelectRight[] = {0,0,0,0.8};
			colorSelect2Right[] = {0,0,0,0.8};
			tooltipColorText[] = {1,1,1,1};
			tooltipColorBox[] = {1,1,1,1};
			tooltipColorShade[] = {0,0,0,0.65};
			font = "PuristaMedium";
			maxHistoryDelay = 0;
			rowHeight = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
			class ListScrollBar
			{
				color[] = {1,1,1,1};
				colorActive[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.3};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				shadow = 0;
				scrollSpeed = 0.06;
				autoScrollEnabled = 1;
				autoScrollSpeed = -1;
				autoScrollDelay = 5;
				autoScrollRewind = 0;
			};
			
		};
		class vic_purchase_btn : a3cMenuButton
		{
			type = 1;
			idc = 1005;
			x = 0.50000002;
			y = 0.75000007;
			w = 0.37500003;
			h = 0.07500004;
			style = 0+2;
			text = "Purchase Selected Vehicle";
		
		};
		class vic_info : a3cRscStructuredText
		{
			type = 13;
			idc = 1004;
			x = 0.45000005;
			y = 0.22500002;
			w = 0.47500005;
			h = 0.50000002;
			style = 0;
			text = "";
			class Attributes
			{
				
			};
			
		};
		
	};
	
};
