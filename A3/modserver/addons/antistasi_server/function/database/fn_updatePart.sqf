#include "\antistasi_server\macro.hpp"
/*
    File: fn_updatePartial.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Takes partial data of a player and updates it, this is meant to be
    less network intensive towards data flowing through it for updates.
*/
private ["_uid","_side","_value","_mode","_query"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,2,-1,[0]] call BIS_fnc_param;

if (_uid isEqualTo "") exitWith {}; //Bad.
_query = "";

switch (_mode) do {
    case 0: {
        _value = [_this,1,0,[0]] call BIS_fnc_param;
        _value = [_value] call DB_fnc_numberSafe;
        _query = format ["UPDATE players SET money='%1' WHERE pid='%2'",_value,_uid];
    };

    case 1: {
        _value = [_this,1,[],[[]]] call BIS_fnc_param;
        _value = [_value] call DB_fnc_mresArray;
		_query = format ["UPDATE players SET gear='%1' WHERE pid='%2'",_value,_uid];
    };
	
	case 2: {
        _value = [_this,1,[],[[]]] call BIS_fnc_param;
        _value = [_value] call DB_fnc_mresArray;
		_query = format ["UPDATE players SET garage='%1' WHERE pid='%2'",_value,_uid];
    };
};

if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log "------------- Partial Update Request -------------";
    diag_log format ["QUERY: %1",_query];
    diag_log "------------------------------------------------";
};

if (_query isEqualTo "") exitWith {};

[_query,1] call DB_fnc_async;
