#include "..\..\macro.hpp"
/*
    File: fn_syncData.sqf
    Author: Bryan "Tonic" Boardwine"

    Description:
    Used for player manual sync to the server.
*/
if (isNil "clientSyncTime") then {clientSyncTime = false;};
if (clientSyncTime) exitWith {hint "Session_SyncdAlready";};

[] call A3C_fnc_updateFull;
hint "Session_SyncData";
[] spawn {
    clientSyncTime = true;
    sleep (5 * 60);
    clientSyncTime = false;
};
