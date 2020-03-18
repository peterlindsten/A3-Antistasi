#include "macro.hpp"
private ["_timeStamp","_databaseLoaded"];

serverInitComplete = false;
publicVariable "serverInitComplete";
_databaseFail = "";

HeadlessClientOnline = false;
publicVariable "HeadlessClientOnline";

// Prepare extDB before starting the init process for the server.
if (isNil {uiNamespace getVariable "a3c_sql_id"}) then {
    a3c_sql_id = round(random(9999));
    a3c_sql_id = compileFinal (if (a3c_sql_id isEqualType "") then {a3c_sql_id} else {str(a3c_sql_id)});
    uiNamespace setVariable ["a3c_sql_id",a3c_sql_id];
        try {
        _result = EXTDB format ["9:ADD_DATABASE:%1",EXTDB_SETTING(getText,"DatabaseName")];
        if (!(_result isEqualTo "[1]")) then {throw "extDB3: Error with Database Connection"};
        _result = EXTDB format ["9:ADD_DATABASE_PROTOCOL:%2:SQL:%1:TEXT2",(call a3c_sql_id),EXTDB_SETTING(getText,"DatabaseName")];
        if (!(_result isEqualTo "[1]")) then {throw "extDB3: Error with Database Connection"};
    } catch {
        diag_log _exception;
        _databaseFail = [true, _exception];
    };
    if (_databaseFail isEqualType []) exitWith {};
    EXTDB "9:LOCK";
    diag_log "extDB3: Connected to Database";
} else {
    a3c_sql_id = uiNamespace getVariable "a3c_sql_id";
    a3c_sql_id = compileFinal (if (a3c_sql_id isEqualType "") then {a3c_sql_id} else {str(a3c_sql_id)});
    diag_log "extDB3: Still Connected to Database";
};

if (_databaseFail isEqualType []) exitWith {
    serverDatabaseFail = true;
    publicVariable "serverDatabaseFail";
};
serverDatabaseFail = false;
publicVariable "serverDatabaseFail";

_timeStamp = diag_tickTime;
diag_log "------Starting A3 Server Init ------";

//addMissionEventHandler ["HandleDisconnect",{_this call A3S_fnc_clientDisconnect; false;}];

TON_fnc_playtime_values = [];
TON_fnc_playtime_values_request = [];

//Just incase the Headless Client connects before anyone else
publicVariable "TON_fnc_playtime_values";
publicVariable "TON_fnc_playtime_values_request";

[] call a3s_fnc_initFortify;

#include "data\listVehicles.sqf"

/* Tell clients that the server is ready and accepting queries */
serverInitComplete = true;
publicVariable "serverInitComplete";

diag_log format ["------ Completed A3 Server Init :: Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];