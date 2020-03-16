#include "\antistasi_server\macro.hpp"

private ["_uid","_query","_queryResult","_tickTime","_tmp"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_ownerID = [_this,1,objNull,[objNull]] call BIS_fnc_param;

if (isNull _ownerID) exitWith {};
_ownerID = owner _ownerID;

_query = format ["SELECT pid, name, memblvl, adminlvl, money, score, gear, garage, rebel_rank, rebel_stats, last_mission, playtime FROM players WHERE pid='%1'",_uid];

_tickTime = diag_tickTime;
_queryResult = [_query,2] call DB_fnc_async;

if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log "------------- Client Query Request -------------";
    diag_log format ["QUERY: %1",_query];
    diag_log format ["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
    diag_log format ["Result: %1",_queryResult];
    diag_log "------------------------------------------------";
};

if (_queryResult isEqualType "") exitWith {
    [] remoteExecCall ["A3C_fnc_insertPlayer",_ownerID]; diag_log "------------- Fail 1 -------------";
};

if (count _queryResult isEqualTo 0) exitWith {
    [] remoteExecCall ["A3C_fnc_insertPlayer",_ownerID]; diag_log "------------- Fail 2 -------------";
};

diag_log "------------- queryRequest is not null -------------";

//Blah conversion thing from a2net->extdb
_tmp = _queryResult select 4;
_queryResult set[4,[_tmp] call DB_fnc_numberSafe];

_tmp = _queryResult select 5;
_queryResult set[5,[_tmp] call DB_fnc_numberSafe];

//Gear array
_new = [(_queryResult select 6)] call DB_fnc_mresToArray;
if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
_queryResult set[6,_new];

//Garage array
_new = [(_queryResult select 7)] call DB_fnc_mresToArray;
if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
_queryResult set[7,_new];

//Parse Stats
_new = [(_queryResult select 8)] call DB_fnc_mresToArray;
if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
_queryResult set[8,_new];

_new = [(_queryResult select 9)] call DB_fnc_mresToArray;
if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
_queryResult set[9,_new];

//Last Mission
_tmp = _queryResult select 10;
_queryResult set[10,[_tmp] call DB_fnc_numberSafe];

//Playtime
_new = [(_queryResult select 11)] call DB_fnc_mresToArray;
if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
_index = TON_fnc_playtime_values_request find [_uid, _new];
if !(_index isEqualTo -1) then {
	TON_fnc_playtime_values_request set[_index,-1];
	TON_fnc_playtime_values_request = TON_fnc_playtime_values_request - [-1];
	TON_fnc_playtime_values_request pushBack [_uid, _new];
} else {
	TON_fnc_playtime_values_request pushBack [_uid, _new];
};
[_uid,_new select 1] call A3S_fnc_setPlayTime;

publicVariable "TON_fnc_playtime_values_request";

_queryResult remoteExec ["A3C_fnc_queryReturn",_ownerID];
