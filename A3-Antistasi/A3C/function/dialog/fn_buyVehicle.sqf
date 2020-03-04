createDialog "a3c_buy_vehicle";
disableSerialization;

waitUntil {!(isNull (findDisplay 7679002))};

_list = (findDisplay 7679002) displayCtrl 1003;
lbClear _list;

{
_vic = _x select 0;
_list lbAdd (getText(configFile >> "cfgVehicles" >> _vic >> "displayName"));
_picture = (getText(configFile >> "cfgVehicles" >> _vic >> "picture"));
_list lbSetPicture[(lbSize _list)-1, _picture];
_list lbSetData[(lbSize _list)-1, _vic];
} forEach A3C_fiaVehicles;

_list lbSetCurSel 0;
call A3C_fnc_buyVehicleInfo;

_list ctrlSetEventHandler ["LBSelChanged","call A3C_fnc_buyVehicleInfo;"];


