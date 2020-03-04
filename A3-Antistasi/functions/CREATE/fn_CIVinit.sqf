private ["_unit","_enemiesX"];

_unit = _this select 0;

_unit setSkill 0;
_unit forceAddUniform (selectRandom allCivilianUniforms);
_unit disableAI "TARGET";
_unit disableAI "AUTOTARGET";
//Stops civilians from shouting out commands.
[_unit, "NoVoice"] remoteExec ["setSpeaker", 0, _unit];

_unit addEventHandler
[
	"HandleDamage",
	{
		private _unit = _this select 0;
		_dam = _this select 2;
		_proy = _this select 4;
		_injurer = _this select 3;
		if(!isNil "_injurer" && isPlayer _injurer) then
		{
			_unit setVariable ["injuredByPlayer", _injurer, true];
			_unit setVariable ["lastInjuredByPlayer", time, true];
		};
		if (_proy == "") then
		{
			if ((_dam > 0.95) and (!isPlayer _injurer)) then {_dam = 0.9};
		};
		_dam
	}
];
_EHkilledIdx = _unit addEventHandler
[
	"killed",
	{
		_victim = _this select 0;
		_killer = _this select 1;
		if (time - (_victim getVariable ["lastInjuredByPlayer", 0]) < 120) then
		{
			_killer = _victim getVariable ["injuredByPlayer", _killer];
		};
		if (isNull _killer) then
		{
			_killer	= _victim;
		};
		if (_victim == _killer) then
		{
			_nul = [-1,-1,getPos _victim] remoteExec ["A3A_fnc_citySupportChange",2];
		}
		else
		{
			if (isPlayer _killer) then
			{
				[format["%1 Killed a Civilian", name _killer]] remoteExec ["systemChat", 0, false];
				diag_log format ["[Antistasi] %1 Killed a Civilian", name _killer];
				[1,_killer,"civk"] remoteExec ["a3c_fnc_updateStat",_killer];
				[-30,_killer] call A3A_fnc_playerScoreAdd;
				[_killer, [1,0,0,0,0] ] remoteExec[ "addPlayerScores", _killer ];
			};
			_multiplier = 1;
			if (typeOf _victim == "C_journalist_F") then {_multiplier = 10};
			//Must be group, in case they're undercover.
			if (side group _killer == teamPlayer) then
			{
				_nul = [1*_multiplier,0] remoteExec ["A3A_fnc_prestige",2];
				_nul = [1,0,getPos _victim] remoteExec ["A3A_fnc_citySupportChange",2];
			}
			else
			{
				if (side group _killer == Occupants) then
				{
					//_nul = [-1*_multiplier,0] remoteExec ["A3A_fnc_prestige",2];
					_nul = [0,1,getPos _victim] remoteExec ["A3A_fnc_citySupportChange",2];
				}
				else
				{
					if (side group _killer == Invaders) then
					{
						//_nul = [2*_multiplier,0] remoteExec ["A3A_fnc_prestige",2];
						_nul = [-1,1,getPos _victim] remoteExec ["A3A_fnc_citySupportChange",2];
					};
				};
			};
		};
	}
];
