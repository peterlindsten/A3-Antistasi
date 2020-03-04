#include "..\..\macro.hpp"

if (clientQueryComplete) exitWith { diag_log "[A3 Client] Query Already Completed";};
cutText["Session_QueryFail","BLACK FADED"];
0 cutFadeOut 9999999;

diag_log "[A3 Client] Database Insert Requested";
diag_log format ["QUERY0: %1 :: %2 :: %3 :: ",getPlayerUID player,profileName,player];
[getPlayerUID player,profileName,player] remoteExecCall ["DB_fnc_insertRequest",2];
