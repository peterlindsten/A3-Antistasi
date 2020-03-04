private ["_mode","_packet","_array"];
//[1,player,"flag"] call a3c_fnc_updateStat;
//[1,_x,"flag"] remoteExec ["a3c_fnc_updateStat",_x];
_num = _this select 0;
_player = _this select 1;
_var = _this select 2;

_score = _player getVariable [_var,0];
_score= _score + 1;
_player setVariable [_var,_score,true];