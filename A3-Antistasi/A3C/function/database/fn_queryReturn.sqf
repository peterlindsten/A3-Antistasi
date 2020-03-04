#include "..\..\macro.hpp"
/*
    File: fn_requestReceived.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Called by the server saying that we have a response so let's
    sort through the information, validate it and if all valid
    set the client up.
*/
diag_log "[A3 Client] Query Returned";
diag_log format ["[A3 Client] Query Report %1",_this];

private _count = count _this;
clientQueryAttempts = clientQueryAttempts + 1;
if (clientQueryComplete) exitWith {};
if (clientQueryAttempts > 3) exitWith {cutText["Session_Error","BLACK FADED"]; 0 cutFadeOut 999999999;};

0 cutText ["Session_Received","BLACK FADED"];
0 cutFadeOut 9999999;

//Error handling and junk..
if (isNil "_this") exitWith {[] call A3C_fnc_insertPlayer;};
if (_this isEqualType "") exitWith {[] call A3C_fnc_insertPlayer;};
if (count _this isEqualTo 0) exitWith {[] call A3C_fnc_insertPlayer;};
if ((_this select 0) isEqualTo "Error") exitWith {[] call A3C_fnc_insertPlayer;};
if (!(getPlayerUID player isEqualTo (_this select 0))) exitWith {[] call A3C_fnc_dataQuery;};

//Set Membership Level
_memblvl = (_this select 2);
player setVariable ["memblvl",_memblvl,true];

//Set Player in-game score
_infk = ((_this select 9) select 0);
_vick = ((_this select 9) select 1);
_armk = ((_this select 9) select 2);
_airk = ((_this select 9) select 3);
_death = ((_this select 9) select 4);
diag_log format ["[A3 Client] databaseScore  %1 %2 %3 %4 %5",_infk,_vick,_armk,_airk,_death];

_savedscore = getPlayerScores player;
diag_log format ["[A3 Client] currentPlayerScore  %1",_savedscore];

_infk = (_infk - (_savedscore select 0));
_vick = (_vick - (_savedscore select 1));
_armk = (_armk - (_savedscore select 2));
_airk = (_airk - (_savedscore select 3));
_death = (_death - (_savedscore select 4));

[player, [_infk,_vick,_armk,_airk,_death] ] remoteExec[ "addPlayerScores", 2 ];

//Set Player Rank Stats
_rankNum = ((_this select 8) select 0);
_campaigns = ((_this select 8) select 1);
_englvl = ((_this select 8) select 2);
_medlvl = ((_this select 8) select 3);
_flag = ((_this select 8) select 4);

player setVariable ["rankNum",_rankNum,true];
player setVariable ["campaigns",_campaigns,true];
player setVariable ["englvl",_englvl,true];
player setVariable ["medlvl",_medlvl,true];
player setVariable ["flag",_flag,true];

//Set Remaining Stats
_revives = ((_this select 9) select 5);
_teamk = ((_this select 9) select 6);
_civk = ((_this select 9) select 7);
_civr = ((_this select 9) select 8);
_powk = ((_this select 9) select 9);
_powi = ((_this select 9) select 10);
_powr = ((_this select 9) select 11);

player setVariable ["revives",_revives,true];
player setVariable ["teamk",_teamk,true];
player setVariable ["civk",_civk,true];
player setVariable ["civr",_civr,true];
player setVariable ["powk",_powk,true];
player setVariable ["powi",_powi,true];
player setVariable ["powr",_powr,true];

//Set Money and Score
_money = parseNumber (_this select 4);
_score = parseNumber (_this select 5);

player setVariable ["moneyX",_money,true];
player setVariable ["score",_score,true];

//Set Player Gear & Garage
a3c_gear = _this select 6;
call a3c_fnc_loadGear;

_garage = _this select 7;
player setVariable ["personalgarage",_garage,true];

clientQueryComplete = true;
