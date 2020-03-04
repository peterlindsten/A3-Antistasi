_handled = false;
if (player getVariable ["INCAPACITATED",false]) exitWith {_handled};
if (player getVariable ["owner",player] != player) exitWith {_handled};
_key = _this select 1;
if (_key == 21) then
	{
	if (isNil"garageVeh") then
		{
		if (_this select 2) then
			{
			if (player == theBoss) then
				{
				[] spawn A3A_fnc_artySupport;
				};
			}
		else
			{
			closedialog 0;
			_nul = createDialog "a3c_radio_comm";
			};
		};
	}
else
	{
	if (_key == 207) then
		{
			if (soundVolume isEqualTo 1) then {
			1 fadeSound 0.4; hintSilent "Ear Plugs Inserted";
			}else{
			1 fadeSound 1; hintSilent "Ear Plugs Removed";
			};
		};
	};
_handled