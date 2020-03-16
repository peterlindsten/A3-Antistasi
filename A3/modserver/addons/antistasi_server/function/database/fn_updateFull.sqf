#include "..\..\macro.hpp"
/*
    File: fn_updateFull.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Updates ALL player information in the database.
    Information gets passed here from the client side file: core\session\fn_updateRequest.sqf
*/
diag_log "------------- updateFull Launched on Server -------------";
private ["_uid""_query"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_money = [_this,2,0,[0]] call BIS_fnc_param;
_score = [_this,3,0,[0]] call BIS_fnc_param;
_gear = [_this,4,[],[[]]] call BIS_fnc_param;
_garage = [_this,5,[],[[]]] call BIS_fnc_param;
_rank = [_this,6,[0,0,0,0,0],[[]]] call BIS_fnc_param;
_stats = [_this,7,[0,0,0,0,0,0,0,0,0,0,0,0],[[]]] call BIS_fnc_param;
_last_mission = [_this,8,"",[""]] call BIS_fnc_param;

//Get to those error checks.
if ((_uid isEqualTo "") || (_name isEqualTo "")) exitWith {};

//Parse and setup some data.
_name = [_name] call DB_fnc_mresString;
_money = [_money] call DB_fnc_numberSafe;
_score = [_score] call DB_fnc_numberSafe;
_gear = [_gear] call DB_fnc_mresArray;
_garage = [_garage] call DB_fnc_mresArray;
_rank = [_rank] call DB_fnc_mresArray;
_stats = [_stats] call DB_fnc_mresArray;
_last_mission = [_last_mission] call DB_fnc_numberSafe;

//PLAYTIME
_playtime = [_uid] call A3S_fnc_getPlayTime;
_playtime_update = [];
{
    if ((_x select 0) isEqualTo _uid) exitWith
    {
        _playtime_update pushBack [_x select 1];
    };
} forEach TON_fnc_playtime_values_request;
_playtime_update = (_playtime_update select 0) select 0;
_playtime_update set[1,_playtime];
_playtime_update = [_playtime_update] call DB_fnc_mresArray;

_query = format ["UPDATE players SET name='%1', money='%2', score='%3', gear='%4', garage='%5', rebel_rank='%6', rebel_stats='%7', playtime='%8', last_mission='%9' WHERE pid='%10'",_name,_money,_score,_gear,_garage,_rank,_stats,_playtime_update, _last_mission,_uid];

if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log "------------- Server Update Request -------------";
    diag_log format ["QUERY: %1",_query];
    diag_log "------------------------------------------------";
};

_queryResult = [_query,1] call DB_fnc_async;