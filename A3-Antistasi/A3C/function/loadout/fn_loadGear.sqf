#include "..\..\macro.hpp"
/*
    File: fn_loadGear.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Loads saved gear
*/
private ["_itemArray","_handle"];
_itemArray = a3c_gear;
waitUntil {!(isNull (findDisplay 46))};

_handle = [] spawn a3c_fnc_removeGear;
waitUntil {scriptDone _handle};

if (count _itemArray isEqualTo 0) exitWith {
	[] call a3c_fnc_defaultGear;
};

_itemArray params [
    "_uniform",
    "_vest",
    "_backpack",
    "_goggles",
    "_headgear",
    ["_items",[]],
    "_prim",
    "_seco",
    ["_uItems",[]],
    ["_uMags",[]],
    ["_bItems",[]],
    ["_bMags",[]],
    ["_vItems",[]],
    ["_vMags",[]],
    ["_pItems",[]],
    ["_hItems",[]]
];

if (!(_goggles isEqualTo "")) then {_handle = [_goggles,true,false,false,false] spawn a3c_fnc_handleItem; waitUntil {scriptDone _handle};};
if (!(_headgear isEqualTo "")) then {_handle = [_headgear,true,false,false,false] spawn a3c_fnc_handleItem; waitUntil {scriptDone _handle};};
if (!(_uniform isEqualTo "")) then {_handle = [_uniform,true,false,false,false] spawn a3c_fnc_handleItem; waitUntil {scriptDone _handle};};
if (!(_vest isEqualTo "")) then {_handle = [_vest,true,false,false,false] spawn a3c_fnc_handleItem; waitUntil {scriptDone _handle};};
if (!(_backpack isEqualTo "")) then {_handle = [_backpack,true,false,false,false] spawn a3c_fnc_handleItem; waitUntil {scriptDone _handle};};

{_handle = [_x,true,false,false,false] spawn a3c_fnc_handleItem; waitUntil {scriptDone _handle};} forEach _items;

{player addItemToUniform _x;} forEach (_uItems);
{(uniformContainer player) addItemCargoGlobal [_x,1];} forEach (_uMags);
{player addItemToVest _x;} forEach (_vItems);
{(vestContainer player) addItemCargoGlobal [_x,1];} forEach (_vMags);
{player addItemToBackpack _x;} forEach (_bItems);
{(backpackContainer player) addItemCargoGlobal [_x,1];} forEach (_bMags);

//Primary & Secondary (Handgun) should be added last as magazines do not automatically load into the gun.
if (!(_prim isEqualTo "")) then {_handle = [_prim,true,false,false,false] spawn a3c_fnc_handleItem; waitUntil {scriptDone _handle};};
if (!(_seco isEqualTo "")) then {_handle = [_seco,true,false,false,false] spawn a3c_fnc_handleItem; waitUntil {scriptDone _handle};};

{
    if (!(_x isEqualTo "")) then {
        player addPrimaryWeaponItem _x;
    };
} forEach (_pItems);
{
    if (!(_x isEqualTo "")) then {
        player addHandgunItem _x;
    };
} forEach (_hItems);