#include "macro.hpp"

diag_log "------Starting A3 Client Init ------";
_timeStamp = diag_tickTime;

waitUntil {!isNull (findDisplay 46)};
enableSentences false;

clientQueryComplete = false;
clientQueryAttempts = 0;
clientIsReady = false;

diag_log "[A3 Client] Waiting for the server to be ready...";
waitUntil {!isNil "serverInitComplete" && {!isNil "serverDatabaseFail"}};

if (serverDatabaseFail) exitWith {
    0 cutText ["Init_ExtdbFail","BLACK FADED",99999999];
	diag_log "[A3 Client] Server Database Fail";
};

waitUntil {serverInitComplete};
diag_log "[A3 Client] Server loading completed ";
0 cutText ["Init_ServerReady","BLACK FADED",99999999];

[] call A3C_fnc_dataQuery;

waitUntil {clientQueryComplete};
0 cutText["Init_ClientFinish","BLACK FADED",99999999];

//Set Player Rank
_rankNum = player getVariable ["rankNum",0];
switch (true) do
{	case (_rankNum > 17): {player setRank "COLONEL";};
	case (_rankNum > 16): {player setRank "MAJOR";};
	case (_rankNum > 14): {player setRank "CAPTAIN";};
	case (_rankNum > 12): {player setRank "LIEUTENANT";};
	case (_rankNum > 5): {player setRank "SERGEANT";};
	case (_rankNum > 3): {player setRank "CORPORAL";};
	case (_rankNum < 4): {player setRank "PRIVATE";};
};

player setVariable ["rankX",rank player,true];
player setVariable ["realname", profileName, true];

[] call a3c_fnc_setUnitTrait;

0 cutText ["","BLACK IN"];
clientIsReady = true;
diag_log format ["------Completed A3 Client Init ------ :: Execution Time %1 seconds ",(diag_tickTime - _timeStamp)];

