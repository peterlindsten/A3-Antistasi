class a3cRscText
{
	access = 0;
	type = 0;
	idc = -1;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	text = "";
	fixedWidth = false;
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	style = 0;
	shadow = 1;
	colorShadow[] = {0,0,0,0.5};
	font = "RobotoCondensed";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
	lineSpacing = 1;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	
};
class a3cRscStructuredText
{
	access = 0;
	type = 13;
	idc = -1;
	style = 0;
	colorText[] = {1,1,1,1};
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.1;
	text = "";
	size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
	shadow = 1;
	
};
class a3cRscListBox
{
	access = 0;
	type = 5;
	rowHeight = 0;
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.2};
	colorSelect[] = {0,0,0,1};
	colorSelect2[] = {0,0,0,1};
	colorSelectBackground[] = {0.8,0.8,0.8,0.7};
	colorSelectBackground2[] = {1,1,1,0.5};
	colorBackground[] = {0,0,0,0.3};
	soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
	arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
	arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
	colorPicture[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	x = 0;
	y = 0;
	w = 0.3;
	h = 0.3;
	style = 16;
	font = "RobotoCondensed";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
	shadow = 0;
	colorShadow[] = {0,0,0,0.5};
	period = 0;
	maxHistoryDelay = 1;
	
};
class a3cRscButton
{
	access = 0;
	type = 1;
	text = "";
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	colorBackground[] = {0,0,0,0.5};
	colorBackgroundDisabled[] = {0,0,0,0.5};
	colorBackgroundActive[] = {0,0,0,1};
	colorFocused[] = {0,0,0,1};
	colorShadow[] = {0,0,0,0};
	colorBorder[] = {0,0,0,1};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
	idc = -1;
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font = "RobotoCondensed";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
	offsetX = 0;
	offsetY = 0;
	offsetPressedX = 0;
	offsetPressedY = 0;
	borderSize = 0;
	
};
class a3cRscPicture
{
	access = 0;
	type = 0;
	idc = -1;
	style = 48;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "TahomaB";
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
	fixedWidth = false;
	shadow = 0;
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	
};

class a3cMenuBackground
{
	type = 0;
	idc = -1;
	style = 0;
	text = "";
	colorBackground[] = {0,0,0,0.95};
	colorText[] = {0.2431,0.0314,0.4745,1};
	font = "PuristaMedium";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
	
};
class a3cMenuHeader
{
	access = 0;
	type = 0;
	idc = -1;
	style = 2;
	colorBackground[] = {0.13,0.54,0.21,1};
	colorText[] = {1,1,1,1};
	font = "PuristaMedium";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
	
};
class a3cMenuClose
{
	access = 0;
	type = 0;
	idc = -1;
	style = 2;
	text = "X";
	colorBackground[] = {0.6393,0.0314,0.0314,1};
	colorText[] = {1,1,1,1};
	font = "PuristaMedium";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
	
};
class a3cMenuBack
{
	access = 0;
	type = 0;
	idc = -1;
	style = 2;
	text = "<";
	colorBackground[] = {0.102,0.302,0.102,1};
	colorText[] = {1,1,1,1};
	font = "PuristaMedium";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
	
};

class a3cMenuButtonClose
{
	type = 1;
	idc = -1;
	style = 0;
	text = "";
	borderSize = 0;
	colorBackground[] = {0,0,0,0};
	colorBackgroundActive[] = {0,0,0,0};
	colorBackgroundDisabled[] = {0,0,0,0};
	colorBorder[] = {0,0,0,0};
	colorDisabled[] = {0,0,0,0};
	colorFocused[] = {0,0,0,0};
	colorShadow[] = {0,0,0,0};
	colorText[] = {0.2784,0.698,0.4353,1};
	font = "PuristaMedium";
	offsetPressedX = 0.01;
	offsetPressedY = 0.01;
	offsetX = 0.01;
	offsetY = 0.01;
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
	action = "closeDialog 0;";
	
};
class a3cMenuButtonBack
{
	type = 1;
	idc = -1;
	style = 0;
	text = "";
	borderSize = 0;
	colorBackground[] = {0,0,0,0};
	colorBackgroundActive[] = {0,0,0,0};
	colorBackgroundDisabled[] = {0,0,0,0};
	colorBorder[] = {0,0,0,0};
	colorDisabled[] = {0,0,0,0};
	colorFocused[] = {0,0,0,0};
	colorShadow[] = {0,0,0,0};
	colorText[] = {0,0,0,0};
	font = "PuristaMedium";
	offsetPressedX = 0.01;
	offsetPressedY = 0.01;
	offsetX = 0.01;
	offsetY = 0.01;
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
	
};

class a3cMenuButton
{
	access = 0;
	type = 1;
	idc = -1;
	x = 0.10000012;
	y = 0.37500013;
	w = 0.37500003;
	h = 0.07500004;
	style = 0+2;
	borderSize = 0;
	colorBackground[] = {0.1294,0.5412,0.2118,1};
	colorBackgroundActive[] = {0.1294,0.5412,0.2118,1};
	colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
	colorBorder[] = {0,0,0,0};
	colorDisabled[] = {0.2,0.2,0.2,1};
	colorFocused[] = {0.2,0.2,0.2,1};
	colorShadow[] = {0,0,0,1};
	colorText[] = {0.902,0.902,0.902,1};
	font = "PuristaMedium";
	offsetPressedX = 0.01;
	offsetPressedY = 0.01;
	offsetX = 0.01;
	offsetY = 0.01;
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
};