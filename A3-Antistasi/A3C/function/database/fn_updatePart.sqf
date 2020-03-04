#include "..\..\macro.hpp"
/*
    File: fn_updatePartial.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Sends specific information to the server to update on the player,
    meant to keep the network traffic down with large sums of data flowing
    through remoteExec
*/
private ["_mode","_packet","_array"];
_mode = param [0,0,[0]];
_packet = [getPlayerUID player,nil,_mode];
_array = [];

switch (_mode) do {
    case 0: {
		_money = player getVariable ["moneyX", 0];
        _packet set[1,_money];
    };

    case 1: {
        [] call a3c_fnc_saveGear;
        _packet set[1,a3c_gear];
    };

	case 2: {
	_garage = player getVariable ["personalgarage", "[]"];
	_packet set[1,_garage];
    };

};

_packet remoteExecCall ["DB_fnc_updatePart",2];
