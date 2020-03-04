#include "..\..\macro.hpp"

private ["_uid","_sender"];
if (clientQueryComplete) exitWith {};
_sender = player;
_uid = getPlayerUID _sender;
cutText[format ["Session_Query",_uid],"BLACK FADED"];
0 cutFadeOut 999999999;

[_uid,_sender] remoteExec ["DB_fnc_queryRequest",2];