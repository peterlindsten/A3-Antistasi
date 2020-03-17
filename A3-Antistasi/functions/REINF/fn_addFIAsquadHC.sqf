private ["_typeGroup","_esinf","_typeVehX","_costs","_costHR","_exit","_formatX","_pos","_hr","_resourcesFIA","_groupX","_roads","_road","_truckX","_vehicle","_mortarX","_morty"];

if (player != theBoss) exitWith {["Recruit Squad", "Only the Commander has access to this function"] call A3A_fnc_customHint;};

if (markerAlpha respawnTeamPlayer == 0) exitWith {["Recruit Squad", "You cannot recruit a new squad while you are moving your HQ"] call A3A_fnc_customHint;};

if (!([player] call A3A_fnc_hasRadio)) exitWith {if !(hasIFA) then {["Recruit Squad", "You need a radio in your inventory to be able to give orders to other squads"] call A3A_fnc_customHint;} else {["Recruit Squad", "You need a Radio Man in your group to be able to give orders to other squads"] call A3A_fnc_customHint;}};

private _enemyNear = false;

{
	if (((side _x == Invaders) or (side _x == Occupants)) and (_x distance petros < 500) and ([_x] call A3A_fnc_canFight) and !(isPlayer _x)) exitWith {_enemyNear = true};
} forEach allUnits;

if (_enemyNear) exitWith {["Recruit Squad", "You cannot recruit squads with enemies near your HQ"] call A3A_fnc_customHint;};

_typeGroup = _this select 0;
_exit = false;

if (_typeGroup isEqualType "") then {
	if (_typeGroup == "not_supported") then {_exit = true; ["Recruit Squad", "The group or vehicle type you requested is not supported in your modset"] call A3A_fnc_customHint;};
	if (hasIFA and ((_typeGroup == SDKMortar) or (_typeGroup == SDKMGStatic)) and !debug) then {_exit = true; ["Recruit Squad", "The group or vehicle type you requested is not supported in your modset"] call A3A_fnc_customHint;};
};

if (activeGREF) then {
	if (_typeGroup isEqualType objNull) then {
		if (_typeGroup == staticATteamPlayer) then {["Recruit Squad", "AT Trucks are disabled in RHS - GREF"] call A3A_fnc_customHint; _exit = true};
	};
};

if (_exit) exitWith {};
_esinf = false;
_typeVehX = "";
_costs = 0;
_costHR = 0;
_formatX = [];
_format = "Squd-";

_hr = server getVariable "hr";
_resourcesFIA = server getVariable "resourcesFIA";

private _withBackpck = "";
if (_typeGroup isEqualType []) then {
	{
		private _typeUnit = if (random 20 <= skillFIA) then {_x select 1} else {_x select 0};
		_formatX pushBack _typeUnit;
		_costs = _costs + (server getVariable _typeUnit); _costHR = _costHR +1
	} forEach _typeGroup;

	if (count _this > 1) then {
		_withBackpck = _this select 1;
		if (_withBackpck == "MG") then {_costs = _costs + ([SDKMGStatic] call A3A_fnc_vehiclePrice)};
		if (_withBackpck == "Mortar") then {_costs = _costs + ([SDKMortar] call A3A_fnc_vehiclePrice)};
	};
	_esinf = true;

} else {
	_costs = _costs + (2*(server getVariable staticCrewTeamPlayer)) + ([_typeGroup] call A3A_fnc_vehiclePrice);
	_costHR = 2;

	if ((_typeGroup == SDKMortar) or (_typeGroup == SDKMGStatic)) then {
		_esInf = true;
		_formatX = [staticCrewTeamPlayer,staticCrewTeamPlayer];
	} else {
		_costs = _costs + ([vehSDKTruck] call A3A_fnc_vehiclePrice)
	};
};

if ((_withBackpck != "") and hasIFA) exitWith {["Recruit Squad", "Your current modset doesn't support packing/unpacking static weapons"] call A3A_fnc_customHint;};

if (_hr < _costHR) then {_exit = true; ["Recruit Squad", format ["You do not have enough HR for this request (%1 required)",_costHR]] call A3A_fnc_customHint;};

if (_resourcesFIA < _costs) then {_exit = true; ["Recruit Squad", format ["You do not have enough money for this request (%1 € required)",_costs]] call A3A_fnc_customHint;};

if (_exit) exitWith {};

[- _costHR, - _costs] remoteExec ["A3A_fnc_resourcesFIA",2];

_pos = getMarkerPos respawnTeamPlayer;

_road = [_pos] call A3A_fnc_findNearestGoodRoad;
_roadDirection = _road call A3A_fnc_getRoadDirection;

_bypassAI = false;
if (_esinf) then {
	_pos = [(getMarkerPos respawnTeamPlayer), 30, random 360] call BIS_Fnc_relPos;
	if (_typeGroup isEqualType []) then {
		_groupX = [_pos, teamPlayer, _formatX,true] call A3A_fnc_spawnGroup;
		if (_typeGroup isEqualTo groupsSDKmid) then {_format = "Tm-"};
		if (_typeGroup isEqualTo groupsSDKAT) then {_format = "AT-"};
		if (_typeGroup isEqualTo groupsSDKSniper) then {_format = "Snpr-"};
		if (_typeGroup isEqualTo groupsSDKSentry) then {_format = "Stry-"};
		if (_withBackpck == "MG") then {
			((units _groupX) select ((count (units _groupX)) - 2)) addBackpackGlobal supportStaticsSDKB2;
			((units _groupX) select ((count (units _groupX)) - 1)) addBackpackGlobal MGStaticSDKB;
			_format = "SqMG-";
		} else {
			if (_withBackpck == "Mortar") then {
				((units _groupX) select ((count (units _groupX)) - 2)) addBackpackGlobal supportStaticsSDKB3;
				((units _groupX) select ((count (units _groupX)) - 1)) addBackpackGlobal MortStaticSDKB;
				_format = "SqMort-";
			};
  	    };
	} else {
		_groupX = [_pos, teamPlayer, _formatX,true] call A3A_fnc_spawnGroup;
		_groupX setVariable ["staticAutoT",false,true];
		if (_typeGroup == SDKMortar) then {_format = "Mort-"};
		if (_typeGroup == SDKMGStatic) then {_format = "MG-"};
		[_groupX,_typeGroup] spawn A3A_fnc_MortyAI;
		_bypassAI = true;
	};
	_format = format ["%1%2",_format,{side (leader _x) == teamPlayer} count allGroups];
	_groupX setGroupId [_format];
} else {
	_pos = position _road findEmptyPosition [1, 40, vehSDKTruck];
	_vehicle = if (_typeGroup == staticAAteamPlayer) then {
		if (activeGREF) then {[_pos, _roadDirection,"rhsgref_ins_g_ural_Zu23", teamPlayer] call bis_fnc_spawnvehicle} else {[_pos, _roadDirection,vehSDKTruck, teamPlayer] call bis_fnc_spawnvehicle};
	} else {
		[_pos, _roadDirection,_typeGroup, teamPlayer] call bis_fnc_spawnvehicle
	};
	_truckX = _vehicle select 0;
	_groupX = _vehicle select 2;

	if ((!activeGREF) and (_typeGroup == staticAAteamPlayer)) then {
		_pos = position _road findEmptyPosition [10, 40, SDKMortar];
		_morty = _groupX createUnit [staticCrewTeamPlayer, _pos, [],0, "NONE"];
		_mortarX = _typeGroup createVehicle _pos;
		[_mortarX] call A3A_fnc_AIVEHinit;
		_mortarX attachTo [_truckX,[0,-1.5,0.2]];
		_mortarX setDir (getDir _truckX + 180);
		_morty moveInGunner _mortarX;
	};

	if (_typeGroup == vehSDKAT) then {_groupX setGroupId [format ["M.AT-%1",{side (leader _x) == teamPlayer} count allGroups]]};
	if (_typeGroup == staticAAteamPlayer) then {_groupX setGroupId [format ["M.AA-%1",{side (leader _x) == teamPlayer} count allGroups]]};

	driver _truckX action ["engineOn", vehicle driver _truckX];
	[_truckX] call A3A_fnc_AIVEHinit;
	_bypassAI = true;
};

{[_x] call A3A_fnc_FIAinit} forEach units _groupX;
theBoss hcSetGroup [_groupX];
petros directSay "SentGenReinforcementsArrived";
["Recruit Squad", format ["Group %1 at your command.<br/><br/>Groups are managed from the High Command bar (Default: CTRL+SPACE)<br/><br/>If the group gets stuck, use the AI Control feature to make them start moving. Mounted Static teams tend to get stuck (solving this is WiP)<br/><br/>To assign a vehicle for this group, look at some vehicle, and use Vehicle Squad Mngmt option in Y menu", groupID _groupX]] call A3A_fnc_customHint;
if (!_esinf) exitWith {};
if !(_bypassAI) then {_groupX spawn A3A_fnc_attackDrillAI};

if (count _formatX == 2) then {
	_typeVehX = vehSDKBike;
} else {
	if (count _formatX > 4) then {
		_typeVehX = vehSDKTruck;
	} else {
		_typeVehX = vehSDKLightUnarmed;
	};
};

_costs = [_typeVehX] call A3A_fnc_vehiclePrice;
if (_costs > server getVariable "resourcesFIA") exitWith {};

createDialog "veh_query";

sleep 1;
disableSerialization;

private _display = findDisplay 100;

if (str (_display) != "no display") then {
	private _ChildControl = _display displayCtrl 104;
	_ChildControl  ctrlSetTooltip format ["Buy a vehicle for this squad for %1 €",_costs];
	_ChildControl = _display displayCtrl 105;
	_ChildControl  ctrlSetTooltip "Barefoot Infantry";
};

waitUntil {(!dialog) or (!isNil "vehQuery")};
if ((!dialog) and (isNil "vehQuery")) exitWith {};

vehQuery = nil;

_pos = position _road findEmptyPosition [1,30,"B_G_Van_01_transport_F"];
private _purchasedVehicle = _typeVehX createVehicle _pos;
_purchasedVehicle setDir _roadDirection;
[_purchasedVehicle] call A3A_fnc_AIVEHinit;
_groupX addVehicle _purchasedVehicle;
_purchasedVehicle setVariable ["owner",_groupX,true];
[0, - _costs] remoteExec ["A3A_fnc_resourcesFIA",2];
leader _groupX assignAsDriver _purchasedVehicle;
{[_x] orderGetIn true; [_x] allowGetIn true} forEach units _groupX;
["Recruit Squad", "Vehicle Purchased"] call A3A_fnc_customHint;
petros directSay "SentGenBaseUnlockVehicle";