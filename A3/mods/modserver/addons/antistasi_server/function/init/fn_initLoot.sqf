#include "\antistasi_server\data\backpack.sqf"
private _allBackpackConfigs = _a3c_backpacks apply {configFile >> "CfgVehicles" >> _x};

#include "\antistasi_server\data\mags.sqf"
private _allMagazineConfigs = _a3c_mags apply {configFile >> "CfgMagazines" >> _x};


#include "\antistasi_server\data\weapons.sqf"
#include "\antistasi_server\data\putthrow.sqf"
#include "\antistasi_server\data\vests.sqf"
#include "\antistasi_server\data\weapon-attachments.sqf"
private _a3c_cfgweapons = _a3c_weapons + _a3c_attachments + _a3c_vests + _a3c_putthrows;
private _allWeaponConfigs = _a3c_cfgweapons apply {configFile >> "CfgWeapons" >> _x};

_allBackpackConfigs + _allMagazineConfigs + _allWeaponConfigs;