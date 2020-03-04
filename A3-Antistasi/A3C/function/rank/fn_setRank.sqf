_player = _this select 0;
_player = _player getVariable ["owner",_player];
_rankNum = _this select 1;
diag_log "------SET RANK HAS BEEN CALLED------";
//Set Player Rank
switch (true) do
{	case (_rankNum > 17): {_player setRank "COLONEL";};
	case (_rankNum > 16): {_player setRank "MAJOR";};
	case (_rankNum > 14): {_player setRank "CAPTAIN";};
	case (_rankNum > 12): {_player setRank "LIEUTENANT";};
	case (_rankNum > 5): {_player setRank "SERGEANT";};
	case (_rankNum > 3): {_player setRank "CORPORAL";};
	case (_rankNum < 4): {_player setRank "PRIVATE";};
};

_player setVariable ["rankNum",_rankNum,true];
_player setVariable ["rankX",rank player,true];

[] spawn A3A_fnc_statistics;


