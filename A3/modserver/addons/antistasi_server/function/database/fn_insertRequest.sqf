#include "\antistasi_server\macro.hpp"

private ["_queryResult","_query","_alias"];
params [
    "_uid",
    "_name",
    ["_returnToSender",objNull,[objNull]]
];

//Error checks
if ((_uid isEqualTo "") || (_name isEqualTo "")) exitWith {systemChat "Bad UID or name";diag_log "------------- Bad UID or name -------------";};
if (isNull _returnToSender) exitWith {systemChat "ReturnToSender is Null!";diag_log "------------- ReturnToSender is Null! -------------";};

_query = format ["SELECT pid, name FROM players WHERE pid='%1'",_uid];

_tickTime = diag_tickTime;
_queryResult = [_query,2] call DB_fnc_async;

if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log "------------- Insert Query Request -------------";
    diag_log format ["QUERY: %1",_query];
    diag_log format ["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
    diag_log format ["Result: %1",_queryResult];
    diag_log "------------------------------------------------";
};

//Double check to make sure the client isn't in the database...
if (_queryResult isEqualType "") exitWith {[] remoteExecCall ["A3C_fnc_dataQuery",(owner _returnToSender)];  diag_log "------------- Failed on First Check -------------";};
if !(count _queryResult isEqualTo 0) exitWith {[] remoteExecCall ["A3C_fnc_dataQuery",(owner _returnToSender)]; diag_log "------------- Failed on Second Check -------------";};

diag_log "[A3 Server] Double Checked Against Database";

//Clense and prepare some information.
_name = [_name] call DB_fnc_mresString; //Clense the name of bad chars.
_alias = [[_name]] call DB_fnc_mresArray;

//Prepare the query statement..
_query = format ["INSERT INTO players (pid, name, aliases, gear, garage) VALUES('%1', '%2', '%3', '""[]""', '""[]""')",
    _uid,
    _name,
    _alias
];
diag_log format ["QUERY ASI: %1",_query];
[_query,1] call DB_fnc_async;
diag_log "[A3 Server] Called async";
[] remoteExecCall ["A3C_fnc_dataQuery",(owner _returnToSender)];
diag_log "[A3 Server] running dataquery again";
