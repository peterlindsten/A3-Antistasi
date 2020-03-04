#include "..\..\macro.hpp"
/*
    File: fn_updateRequest.sqf
    Author: Tonic

    Description:
    Passes ALL player information to the server to save player data to the database.
*/
private ["_packet","_tickTime","_score","_rankNum","_campaigns","_englvl","_medlvl","_flag","_rank","_savedscore","_infk","_vick","_armk","_airk","_death","_revives","_teamk","_civk","_civr,_powk,_powi,_powr","_stats","_array"];
_packet = [getPlayerUID player,(profileName)];

_tickTime = diag_tickTime;

_money = player getVariable ["moneyX", 0];
_packet pushBack _money;

_score = player getVariable ["score", 0];
_packet pushBack _score;

[] call a3c_fnc_saveGear;
_packet pushBack a3c_gear;

_garage = player getVariable ["personalgarage", "[]"];
_packet pushBack _garage;

_rankNum = player getVariable ["rankNum", 0];
_campaigns = player getVariable ["campaigns", 0];
_englvl = player getVariable ["englvl", 0];
_medlvl = player getVariable ["medlvl", 0];
_flag = player getVariable ["flag", 0];
_rank = [_rankNum, _campaigns, _englvl, _medlvl, _flag];
_packet pushBack _rank;

_savedscore = getPlayerScores player;
_infk = (_savedscore select 0);
_vick = (_savedscore select 1);
_armk = (_savedscore select 2);
_airk = (_savedscore select 3);
_death = (_savedscore select 4);
_revives = player getVariable ["revives", 0];
_teamk = player getVariable ["teamk", 0];
_civk = player getVariable ["civk", 0];
_civr = player getVariable ["civr", 0];
_powk = player getVariable ["powk", 0];
_powi = player getVariable ["powi", 0];
_powr = player getVariable ["powr", 0];
_stats = [_infk,_vick,_armk,_airk,_death,_revives,_teamk,_civk,_civr,_powk,_powi,_powr];
_packet pushback _stats;

// Send it
if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log "------------- Client Update Request -------------";
    diag_log format ["QUERY: %1",_packet];
    diag_log format ["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
    diag_log "------------------------------------------------";
};

_packet remoteExecCall ["DB_fnc_updateFull",2];
