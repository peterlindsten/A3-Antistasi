#include "..\Garage\defineGarage.inc"
private _fileName = "initClient.sqf";

//Make sure logLevel is always initialised.
//This should be overridden by the server, as appropriate. Hence the nil check.
if (isNil "logLevel") then { logLevel = 2 };scriptName "initClient.sqf";

[2,"initClient started",_fileName] call A3A_fnc_log;

//cutText ["Waiting Server Init","BLACK",0];
titleText ["Waiting for server to load . . .", "PLAIN"];

call A3A_fnc_installSchrodingersBuildingFix;

if (hasInterface) then {
	waitUntil {!isNull player};
	waitUntil {player == player};
	//Disable player saving until they're fully ready, and have chosen whether to load their save.
	player setVariable ["canSave", false, true];
};

if (!isServer) then {
	call A3A_fnc_initFuncs;
	call A3A_fnc_initVar;
	if (!hasInterface) exitWith {
		[2,format ["Headless client version: %1",localize "STR_antistasi_credits_generic_version_text"],_fileName] call A3A_fnc_log;
		[clientOwner] remoteExec ["A3A_fnc_addHC",2];
	};
	[2,format ["MP client version: %1",localize "STR_antistasi_credits_generic_version_text"],_fileName] call A3A_fnc_log;
}
else {
	// SP or hosted, initFuncs/var run in serverInit
	waitUntil {sleep 0.5;(!isNil "serverInitDone")};
};
[] execVM "briefing.sqf";

_isJip = _this select 1;
if (isMultiplayer) then {
	if (side player == teamPlayer) then {
		player setVariable ["eligible",true,true];
	};
	musicON = false;
	//waitUntil {scriptdone _introshot};
	disableUserInput true;
	cutText ["Waiting for Players and Server Init","BLACK",0];
	[2,"Waiting for server...",_fileName] call A3A_fnc_log;
	waitUntil {(!isNil "serverInitDone")};
	cutText ["Starting Mission","BLACK IN",0];
	[2,"Server loaded!",_fileName] call A3A_fnc_log;
	[2,format ["JIP client: %1",_isJIP],_fileName] call A3A_fnc_log;
	if (hasTFAR) then {
		[] execVM "orgPlayers\radioJam.sqf";
	};
	tkPunish = if ("tkPunish" call BIS_fnc_getParamValue == 1) then {true} else {false};
	if (side player == teamPlayer) then {
		private _firedHandlerTk = {
			_typeX = _this select 1;
			if ((_typeX == "Put") or (_typeX == "Throw")) then {
				private _shieldDistance = 100;
				if (player distance petros < _shieldDistance) then {
					["Warning", format ["You cannot throw grenades or place explosives within %1m of base.", _shieldDistance]] call A3A_fnc_customHint;
					deleteVehicle (_this select 6);
					if (_typeX == "Put") then {
						if (player distance petros < 10) then {
							[player, 20, 0.34, petros] call A3A_fnc_punishment;
						};
					};
				};
			};
		};
		player addEventHandler ["Fired", _firedHandlerTk];
		if (hasACE) then {
			["ace_firedPlayer", _firedHandlerTk ] call CBA_fnc_addEventHandler;
		};
	};
	if (!isNil "placementDone") then {_isJip = true};//workaround for BIS fail on JIP detection
}
else {
	theBoss = player;
	groupX = group player;
	if (worldName == "Tanoa") then {groupX setGroupId ["Pulu","GroupColor4"]} else {groupX setGroupId ["Stavros","GroupColor4"]};
	player setIdentity "protagonista";
	player setUnitRank "COLONEL";
	player hcSetGroup [group player];
	player setUnitTrait ["medic", true];
	player setUnitTrait ["engineer", true];
	waitUntil {/*(scriptdone _introshot) and */(!isNil "serverInitDone")};
};

[] spawn A3A_fnc_ambientCivs;
private ["_colourTeamPlayer", "_colorInvaders"];
_colourTeamPlayer = teamPlayer call BIS_fnc_sideColor;
_colorInvaders = Invaders call BIS_fnc_sideColor;
_positionX = if (side player == side (group petros)) then {position petros} else {getMarkerPos "respawn_west"};

{
	_x set [3, 0.33]
} forEach [_colourTeamPlayer, _colorInvaders];

//Initialise membershipEnabled so we can do isMember checks.
membershipEnabled = if (isMultiplayer && "membership" call BIS_fnc_getParamValue == 1) then {true} else {false};

disableUserInput false;
player setVariable ["spawner",true,true];

if (isMultiplayer && {playerMarkersEnabled}) then {
	[] spawn A3A_fnc_playerMarkers;
};

[player] spawn A3A_fnc_initRevive;		// with ACE medical, only used for helmet popping & TK checks

if (!hasACE) then {
	[] spawn A3A_fnc_tags;
};

if (player getVariable ["pvp",false]) exitWith {
	lastVehicleSpawned = objNull;
	[player] call A3A_fnc_pvpCheck;
	[player] call A3A_fnc_dress;
	if (hasACE) then {[] call A3A_fnc_ACEpvpReDress};
	respawnTeamPlayer setMarkerAlphaLocal 0;

	player addEventHandler ["GetInMan", {_this call A3A_fnc_ejectPvPPlayerIfInvalidVehicle}];
	player addEventHandler ["SeatSwitchedMan", {[_this select 0, assignedVehicleRole (_this select 0) select 0, _this select 2] call A3A_fnc_ejectPvPPlayerIfInvalidVehicle}];
	player addEventHandler ["InventoryOpened", {
		_override = false;
		_boxX = typeOf (_this select 1);
		if ((_boxX == NATOAmmoBox) or (_boxX == CSATAmmoBox)) then {_override = true};
		_override
	}];
	_nameX = if (side player == Occupants) then {nameOccupants} else {nameInvaders};
	waituntil {!isnull (finddisplay 46)};
	gameMenu = (findDisplay 46) displayAddEventHandler ["KeyDown", {
		_handled = FALSE;
		if (_this select 1 == 207) then {
			if (!hasACEhearing) then {
				if (soundVolume <= 0.5) then {
					0.5 fadeSound 1;
					["Ear Plugs", "You've taken out your ear plugs.", true] call A3A_fnc_customHint;
				}
				else {
					0.5 fadeSound 0.1;
					["Ear Plugs", "You've inserted your ear plugs.", true] call A3A_fnc_customHint;
				};
			};
		}
		else {
			if (_this select 1 == 21) then {
				closedialog 0;
				_nul = createDialog "NATO_player";
			};
		};
		_handled
	}];
};

player setVariable ["owner",player,true];
player setVariable ["punish",0,true];

stragglers = creategroup teamPlayer;
(group player) enableAttack false;

//Give the player the base loadout.
//[player] call A3A_fnc_dress;

player setvariable ["compromised",0];
player addEventHandler ["FiredMan", {
	_player = _this select 0;
	if (captive _player) then {
		//if ({((side _x== Invaders) or (side _x== Occupants)) and (_x knowsAbout player > 1.4)} count allUnits > 0) then
		if ({if (((side _x == Occupants) or (side _x == Invaders)) and (_x distance player < 300)) exitWith {1}} count allUnits > 0) then {
			[_player,false] remoteExec ["setCaptive",0,_player];
			_player setCaptive false;
		}
		else {
			_city = [citiesX,_player] call BIS_fnc_nearestPosition;
			_size = [_city] call A3A_fnc_sizeMarker;
			_dataX = server getVariable _city;
			if (random 100 < _dataX select 2) then {
				if (_player distance getMarkerPos _city < _size * 1.5) then {
					[_player,false] remoteExec ["setCaptive",0,_player];
					_player setCaptive false;
					if (vehicle _player != _player) then {
						{if (isPlayer _x) then {[_x,false] remoteExec ["setCaptive",0,_x]; _x setCaptive false}} forEach ((assignedCargo (vehicle _player)) + (crew (vehicle _player)) - [player]);
					};
				};
			};
		};
	};
}];
player addEventHandler ["HandleDamage", {
	private _victim = param [0];
	private _damage = param [2];
	private _instigator = param [6];
	if(!isNull _instigator && isPlayer _instigator && _victim != _instigator && side _instigator == teamPlayer && _damage > 0.9) then {
		[_instigator, 20, 0.21, _victim] remoteExec ["A3A_fnc_punishment",_instigator];
		[format ["%1 was injured by %2 (UID: %3), %4m from HQ",name _victim,name _instigator,getPlayerUID _instigator,_victim distance2D posHQ]] remoteExec ["diag_log",2];
	};
}];
player addEventHandler ["InventoryOpened", {
	private ["_playerX","_containerX","_typeX"];
	_control = false;
	_playerX = _this select 0;
	if (captive _playerX) then {
		_containerX = _this select 1;
		_typeX = typeOf _containerX;
		if (((_containerX isKindOf "Man") and (!alive _containerX)) or (_typeX == NATOAmmoBox) or (_typeX == CSATAmmoBox)) then {
			if ({if (((side _x== Invaders) or (side _x== Occupants)) and (_x knowsAbout _playerX > 1.4)) exitWith {1}} count allUnits > 0) then{
				[_playerX,false] remoteExec ["setCaptive",0,_playerX];
				_playerX setCaptive false;
			}
			else {
				_city = [citiesX,_playerX] call BIS_fnc_nearestPosition;
				_size = [_city] call A3A_fnc_sizeMarker;
				_dataX = server getVariable _city;
				if (random 100 < _dataX select 2) then {
					if (_playerX distance getMarkerPos _city < _size * 1.5) then {
						[_playerX,false] remoteExec ["setCaptive",0,_playerX];
						_playerX setCaptive false;
					};
				};
			};
		};
	};
	_control
}];
/*
player addEventHandler ["InventoryClosed", {
[1] call a3c_fnc_updatePart;
	_uniform = uniform player;
	_typeSoldier = getText (configfile >> "CfgWeapons" >> _uniform >> "ItemInfo" >> "uniformClass");
	_sideType = getNumber (configfile >> "CfgVehicles" >> _typeSoldier >> "side");
	if ((_sideType == 1) or (_sideType == 0) and (_uniform != "")) then {
		if !(player getVariable ["disguised",false]) then {
			hint "You are wearing an enemy uniform, this will make the AI attack you. Beware!";
			player setVariable ["disguised",true];
			player addRating (-1*(2001 + rating player));
		};
	}
	else {
		if (player getVariable ["disguised",false]) then {
			hint "You removed your enemy uniform";
			player addRating (rating player * -1);
		};
	};
	_control
}];
*/
player addEventHandler ["HandleHeal", {
	_player = _this select 0;
	if (captive _player) then {
		if ({((side _x== Invaders) or (side _x== Occupants)) and (_x knowsAbout player > 1.4)} count allUnits > 0) then {
			[_player,false] remoteExec ["setCaptive",0,_player];
			_player setCaptive false;
		}
		else {
			_city = [citiesX,_player] call BIS_fnc_nearestPosition;
			_size = [_city] call A3A_fnc_sizeMarker;
			_dataX = server getVariable _city;
			if (random 100 < _dataX select 2) then {
				if (_player distance getMarkerPos _city < _size * 1.5) then {
					[_player,false] remoteExec ["setCaptive",0,_player];
					_player setCaptive false;
				};
			};
		};
	};
}];
player addEventHandler ["WeaponAssembled", {
	private ["_veh"];
	_veh = _this select 1;
	if (_veh isKindOf "StaticWeapon") then {
		if (not(_veh in staticsToSave)) then {
			staticsToSave pushBack _veh;
			publicVariable "staticsToSave";
			[_veh] call A3A_fnc_AIVEHinit;
		};
	_markersX = markersX select {sidesX getVariable [_x,sideUnknown] == teamPlayer};
	_pos = position _veh;
	if (_markersX findIf {_pos inArea _x} != -1) then {["Static Deployed", "Static weapon has been deployed for use in a nearby zone, and will be used by garrison militia if you leave it here the next time the zone spawns"] call A3A_fnc_customHint;};
	}
	else {
		_veh addEventHandler ["Killed",{[_this select 0] remoteExec ["A3A_fnc_postmortem",2]}];
	};
}];
player addEventHandler ["WeaponDisassembled", {
	_bag1 = _this select 1;
	_bag2 = _this select 2;
	//_bag1 = objectParent (_this select 1);
	//_bag2 = objectParent (_this select 2);
	[_bag1] call A3A_fnc_AIVEHinit;
	[_bag2] call A3A_fnc_AIVEHinit;
}];

player addEventHandler ["GetInMan", {
	private ["_unit","_veh"];
	_unit = _this select 0;
	_veh = _this select 2;
	_exit = false;
	if (isMultiplayer) then {
		if !([player] call A3A_fnc_isMember) then {
			_owner = _veh getVariable "ownerX";
			if (!isNil "_owner") then {
				if (_owner isEqualType "") then {
					if ({getPlayerUID _x == _owner} count (units group player) == 0) then {
						["Warning", "You cannot board other player vehicle if you are not in the same group"] call A3A_fnc_customHint;
						moveOut _unit;
						_exit = true;
					};
				};
			};
		};
	};
	if (!_exit) then {
		if (((typeOf _veh) in arrayCivVeh) or ((typeOf _veh) in civBoats)) then {
			if (!(_veh in reportedVehs)) then {
				[] spawn A3A_fnc_goUndercover;
			};
		};
	};
}];

call A3A_fnc_initUndercover;

if (isMultiplayer) then {
	["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;//Exec on client
	if (membershipEnabled) then {
		if !([player] call A3A_fnc_isMember) then {
			private _isMember = false;
			if (isServer) then {
				_isMember = true;
			};
			if (serverCommandAvailable "#logout") then {
				_isMember = true;
				["General Info", "You are not in the member's list, but as you are Server Admin, you have been added. Welcome!"] call A3A_fnc_customHint;
			};
			
			if (_isMember) then {
				membersX pushBack (getPlayerUID player);
				publicVariable "membersX";
			} else {
				_nonMembers = {(side group _x == teamPlayer) and !([_x] call A3A_fnc_isMember)} count (call A3A_fnc_playableUnits);
				if (_nonMembers >= (playableSlotsNumber teamPlayer) - bookedSlots) then {["memberSlots",false,1,false,false] call BIS_fnc_endMission};
				if (memberDistance != 16000) then {[] execVM "orgPlayers\nonMemberDistance.sqf"};
				
				["General Info", "Welcome Guest<br/><br/>You have joined this server as guest"] call A3A_fnc_customHint;
			};
		};
	};
};

[] remoteExec ["A3A_fnc_assignBossIfNone", 2];

if (_isJip) then {
	[2,"Joining In Progress (JIP)",_filename] call A3A_fnc_log;

	waitUntil {!(isNil "missionsX")};
	if (count missionsX > 0) then {
		{
			_tsk = _x select 0;
			if ([_tsk] call BIS_fnc_taskExists) then {
				_state = _x select 1;
				if ((_tsk call BIS_fnc_taskState) != _state) then {
					/*
					_tskVar = _tsk call BIS_fnc_taskVar;
					_tskVar setTaskState _state;
					*/
					[_tsk,_state] call bis_fnc_taskSetState;
				};
			};
		} forEach missionsX;
	};
	if (isNil "placementDone") then {
		waitUntil {!isNil "theBoss"};
		if (player == theBoss) then {
		    waitUntil {!(isNil"loadLastSave")};
		    if !(loadLastSave) then {
					//cutText ["","BLACK IN",0];
					titleText ["", "PLAIN"];
		    		_nul = [] spawn A3A_fnc_placementSelection;
				player setVariable ['canSave', true, true];
	    		};
		};
	}
	else {
		[] spawn A3A_fnc_createDialog_shouldLoadPersonalSave;
	};
	[2,"JIP client loaded",_fileName] call A3A_fnc_log;
	player setPos (getMarkerPos respawnTeamPlayer);
}
else 
{
	[2,"Not Joining in Progress (JIP)",_filename] call A3A_fnc_log;
	if (isNil "placementDone") then {
		waitUntil {!isNil "theBoss"};
		if (player == theBoss) then 
		{
			
			if (isMultiplayer) then {
				HC_commanderX synchronizeObjectsAdd [player];
				player synchronizeObjectsAdd [HC_commanderX];
		    	if !(loadLastSave) then 
				{
					_nul = [] spawn A3A_fnc_placementSelection;
					//This shouldn't really be here, but it's triggered on every other path through the code.
					//This big if statement needs tidying, really.
					player setVariable ['canSave', true, true];
		    	}
		    	else {
		    		[] spawn A3A_fnc_createDialog_shouldLoadPersonalSave;
				};
				[2,"Client load completed",_fileName] call A3A_fnc_log;
			}
			else 
			{
				membersX = [];
				player setUnitTrait ["medic",true];
				player setUnitTrait ["engineer",true];
				[] spawn A3A_fnc_loadPlayer;
			};
		}
		else 
		{
				player setVariable ["score", 0,true];
				[] spawn A3A_fnc_createDialog_shouldLoadPersonalSave;
				player setPos (getMarkerPos respawnTeamPlayer);
		};
	}
	else 
	{
		if !(isServer) then {
			[] spawn A3A_fnc_createDialog_shouldLoadPersonalSave;
			player setPos (getMarkerPos respawnTeamPlayer);
		};
	};
};

waituntil {!isnull (finddisplay 46)};
gameMenu = (findDisplay 46) displayAddEventHandler ["KeyDown",A3A_fnc_keys];
//removeAllActions boxX;

//if ((!isServer) and (isMultiplayer)) then {boxX call jn_fnc_arsenal_init};

boxX allowDamage false;
boxX addAction ["Transfer Vehicle cargo to Ammobox", {[] spawn A3A_fnc_empty;}, 4];
boxX addAction ["Move this asset", A3A_fnc_moveHQObject,nil,0,false,true,"","(_this == theBoss)", 4];
flagX allowDamage false;
flagX addAction ["Unit Recruitment", {if ([player,300] call A3A_fnc_enemyNearCheck) then {["Recruit Unit", "You cannot recruit units while there are enemies near you"] call A3A_fnc_customHint;} else { [] spawn A3A_fnc_unit_recruit; }},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)"];
flagX addAction ["Move this asset", A3A_fnc_moveHQObject,nil,0,false,true,"","(_this == theBoss)", 4];

//Adds a light to the flag
private _flagLight = "#lightpoint" createVehicle (getPos flagX);
_flagLight setLightDayLight true;
_flagLight setLightColor [1, 1, 0.9];
_flagLight setLightBrightness 0.2;
_flagLight setLightAmbient [1, 1, 0.9];
_flagLight lightAttachObject [flagX, [0, 0, 4]];
_flagLight setLightAttenuation [7, 0, 0.5, 0.5];

vehicleBox allowDamage false;
vehicleBox addAction ["Heal, Repair and Rearm", A3A_fnc_healAndRepair,nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)", 4];
vehicleBox addAction ["Vehicle Arsenal", JN_fnc_arsenal_handleAction, [], 0, true, false, "", "alive _target && vehicle _this != _this", 10];
if (isMultiplayer) then {
	vehicleBox addAction ["Personal Garage", { [GARAGE_PERSONAL] spawn A3A_fnc_garage },nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)", 4];
};
vehicleBox addAction ["Faction Garage", { [GARAGE_FACTION] spawn A3A_fnc_garage; },nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)", 4];
vehicleBox addAction ["Buy Vehicle", {if ([player,300] call A3A_fnc_enemyNearCheck) then {["Purchase Vehicle", "You cannot buy vehicles while there are enemies near you"] call A3A_fnc_customHint;} else {call a3c_fnc_buyVehicle}},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)", 4];
vehicleBox addAction ["Move this asset", A3A_fnc_moveHQObject,nil,0,false,true,"","(_this == theBoss)", 4];

fireX allowDamage false;
[fireX, "fireX"] call A3A_fnc_flagaction;

mapX allowDamage false;
mapX addAction ["Game Options", {["Game Options", format ["Antistasi - %2<br/><br/>Version: %1<br/><br/>Difficulty: %3<br/>Unlock Weapon Number: %4<br/>Limited Fast Travel: %5",antistasiVersion,worldName,if (skillMult == 2) then {"Normal"} else {if (skillMult == 1) then {"Easy"} else {"Hard"}},minWeaps,if (limitedFT) then {"Yes"} else {"No"}]] call A3A_fnc_customHint; nul=CreateDialog "a3c_game_options";},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)", 4];
mapX addAction ["Map Info", A3A_fnc_cityinfo,nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)", 4];
mapX addAction ["Move this asset", A3A_fnc_moveHQObject,nil,0,false,true,"","(_this == theBoss)", 4];
if (isMultiplayer) then {mapX addAction ["AI Load Info", { [] remoteExec ["A3A_fnc_AILoadInfo",4];},nil,0,false,true,"","((_this == theBoss) || (serverCommandAvailable ""#logout""))"]};
_nul = [player] execVM "OrgPlayers\unitTraits.sqf";
groupPetros = group petros;
groupPetros setGroupIdGlobal ["Petros","GroupColor4"];
petros setIdentity "friendlyX";
petros setName "Petros";
petros disableAI "MOVE";
petros disableAI "AUTOTARGET";
[petros,"mission"] call A3A_fnc_flagaction;
enableEnvironment [false, true];

// Start Database Checks
#include "..\..\A3C\init.sqf"

waitUntil {clientIsReady};
//cutText ["Starting Mission","BLACK IN",0];
titleText ["Starting Mission", "PLAIN DOWN"];
if (membershipEnabled) then {
	_uid = getPlayerUID player;
	_memblvl = player getVariable "memblvl";
		if (_memblvl > 0) then{
			if  (_uid in membersX) then{
			diag_log format ["[A3 Client] Already in MembersX : %1",_uid];
			} else {
			membersX pushBackUnique _uid;
			diag_log format ["[A3 Client] Added to MembersX : %1",_uid];
			};
		};
		
		if (_memblvl > 3) then{
			if  (_uid in modMembersX) then{
			diag_log format ["[A3 Client] Already in modMembersX : %1",_uid];
			} else {
			modMembersX pushBackUnique _uid;
			diag_log format ["[A3 Client] Added to modMembersX : %1",_uid];
			};
		};

publicVariable "modMembersX";
publicVariable "membersX";
};


disableSerialization;
_layer = ["statisticsX"] call bis_fnc_rscLayer;
_layer cutRsc ["H8erHUD","PLAIN",0,false];
[] spawn A3A_fnc_statistics;

//Check if we need to relocate HQ
if (isNil "placementDone") then {
	if (isNil "playerPlacingHQ" || {!(playerPlacingHQ in (call A3A_fnc_playableUnits))}) then {
		playerPlacingHQ = player;
		publicVariable "playerPlacingHQ";
		call A3A_fnc_placementSelection;
	};
};

//Move the player to HQ now they're initialised.
player setPos (getMarkerPos respawnTeamPlayer);
//Welcome message
call a3c_fnc_welcome;
//Disables rabbits and snakes, because they cause the log to be filled with "20:06:39 Ref to nonnetwork object Agent 0xf3b4a0c0"
//Can re-enable them if we find the source of the bug.
enableEnvironment [false, true];

[2,"initClient completed",_fileName] call A3A_fnc_log;

// Save player stats every 10 minutes
[] spawn {
	while {true} do {
		sleep (10 * 60);
		[] call A3C_fnc_updateFull;
		systemChat "Your Stats/Gear/Garage have been saved";
	};
};

//Deploy Handler to ensure items are on the ground
[{
    params ["_unit", "_object", "_cost"];
    private _return = (getPosATL _object) select 2 < 0.2;
    _return
}] call acex_fortify_fnc_addDeployHandler;

//Deploy Handler to ensure items are within 50m of Petros
[{
    params ["_unit", "_object", "_cost"];
    private _return = (petros distance _unit) < 50;
    _return
}] call acex_fortify_fnc_addDeployHandler;

