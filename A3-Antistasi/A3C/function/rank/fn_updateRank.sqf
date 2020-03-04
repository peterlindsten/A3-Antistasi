private _filename = "A3C_fnc_updateRank";
[3, format ["Working on player ranks"],_filename] call A3A_fnc_log;
private ["_newRank","_owner"];

private _textP = "";
private _textD = "";

_promoted = false;
_demoted = false;
{	
	private _player = _x getVariable ["owner", _x];
	private _score = _player getVariable ["score",0];
	private _currentRank = _player getVariable ["rankNum",0];
	private _check = [_player,_score,_currentRank] call A3C_fnc_checkRank;
	private _newRank = _check select 0;
	private _rankName = _check select 1;
	
	diag_log format ["RANKCHECK:NewRank %1 :: CurrentRank %2 ::Score %3 :: ",_newRank,_currentRank,_score];
	
	if (_newRank != _currentRank) then
	{
		if (_newRank > _currentRank) then
		{
			_promoted = true;
			[_player,_newRank] remoteExec ["A3C_fnc_setRank"];
			_textP = format ["%1%2: %3.\n",_textP, name _player, _rankName];
			sleep 5;
	
		};
		if (_newRank < _currentRank) then
		{
			_demoted = true;
			[_player,_newRank] remoteExec ["A3C_fnc_setRank"];
			_textD = format ["%1%2: %3.\n",_textD, name _player, _rankName];
			sleep 5;
		}
	};
} forEach ((call A3A_fnc_playableUnits) select {(side (group _x) == teamPlayer)});

[3, _textP, _filename] call A3A_fnc_log;
[3, _textD, _filename] call A3A_fnc_log;

if (_promoted) then
{
	_textP = format ["PROMOTED\n\n%1",_textP];
	[petros,"hint",_textP] remoteExec ["A3A_fnc_commsMP"];
};
sleep 20;

if (_demoted) then
{
	_textD = format ["DEMOTED\n\%1",_textD];
	[petros,"hint",_textD] remoteExec ["A3A_fnc_commsMP"];
};