#include "\antistasi_server\macro.hpp"
diag_log "[A3 Server] Async started";
private ["_queryStmt","_mode","_multiarr","_queryResult","_key","_return","_loop"];
_queryStmt = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,1,[0]] call BIS_fnc_param;
_multiarr = [_this,2,false,[false]] call BIS_fnc_param;

_key = EXTDB format ["%1:%2:%3",_mode,(call a3c_sql_id),_queryStmt];

diag_log format ["QUERY0: %1 :: %2 :: %3 :: ",_queryStmt,_mode,_multiarr];

if (_mode isEqualTo 1) exitWith {true};

_key = call compile format ["%1",_key];
_key = (_key select 1);
_queryResult = EXTDB format ["4:%1", _key];

diag_log format ["QUERY1: %1",_queryResult];

//Make sure the data is received
if (_queryResult isEqualTo "[3]") then {
    for "_i" from 0 to 1 step 0 do {
        if (!(_queryResult isEqualTo "[3]")) exitWith {};
        _queryResult = EXTDB format ["4:%1", _key];
    };
};

diag_log format ["QUERYKEY: %1 :: %2 :: %3 :: ",_queryResult,_key,_multiarr];

diag_log format ["QUERY2: %1",_queryResult];

if (_queryResult isEqualTo "[5]") then {
    _loop = true;
    for "_i" from 0 to 1 step 0 do { // extDB3 returned that result is Multi-Part Message
		diag_log format ["QUERY3: %1",_queryResult];
        _queryResult = "";
        for "_i" from 0 to 1 step 0 do {
            _pipe = EXTDB format ["5:%1", _key];
            if (_pipe isEqualTo "") exitWith {_loop = false};
            _queryResult = _queryResult + _pipe;
        };
    if (!_loop) exitWith {};
    };
};
_queryResult = call compile _queryResult;
diag_log format ["QUERY4: %1",_queryResult];
if ((_queryResult select 0) isEqualTo 0) exitWith {diag_log format ["extDB3: Protocol Error: %1", _queryResult]; []};
_return = (_queryResult select 1);
if (!_multiarr && count _return > 0) then {
    _return = (_return select 0);
};

diag_log format ["Async Completed Return: %1",_return];
_return;
