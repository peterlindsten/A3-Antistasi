if (!hasInterface) exitWith {}; // no map to show markers on

if(!isNil{player_markers_main_loop_handle}) then {
	// if this is already running, end previous
	terminate player_markers_main_loop_handle;
	player_markers_main_loop_handle = nil;
};

player_markers_main_loop_handle = _this spawn {
					   
	private ["_marker","_markerText","_temp","_unit","_vehicle","_markerNumber","_show","_injured","_text","_num","_getNextMarker","_getMarkerColor","_showAllSides","_showPlayers","_showAIs","_l","_player"];

	_showAllSides = false;
	_showPlayers = false;
	_showAIs = false;

	if(count _this == 0) then {
		_showAllSides = true;
		_showPlayers = true;
		_showAIs =! isMultiplayer;
	};
	                         
	{
		_l = toLower _x;
		if(_l in ["player","players","everything","all"]) then {
			_showPlayers = true;
		};
		if(_l in ["ai","ais","everything","all"]) then {
			_showAIs = true;
		};
		if(_l in ["allside","allsides","everything","all"]) then {
			_showAllSides = true;
		};
	} forEach _this;

	aero_player_markers_pos = [0,0];
	onMapSingleClick "aero_player_markers_pos=_pos;";

	_getNextMarker = {
		private ["_marker"]; 
		_markerNumber = _markerNumber + 1;
		_marker = format["um%1",_markerNumber];	
		if(getMarkerType _marker == "") then {
			createMarkerLocal [_marker, _this];
		} else {
			_marker setMarkerPosLocal _this;
		};
		_marker;
	};

	_isPlayer = { // BUG? it is possible that isPlayer _x returns false but _x in allPlayers returns true
		_this in allPlayers	
	};

	_cleanUpMarkers = {
		_markerNumber = _markerNumber + 1;
		_marker = format["um%1",_markerNumber];	
		while {(getMarkerType _marker) != ""} do {
			deleteMarkerLocal _marker;
			_markerNumber = _markerNumber + 1;
			_marker = format["um%1",_markerNumber];
		};		 
	};

	_markerNumber = 0;
	call _cleanUpMarkers;

	if("stop" in _this) exitWith {
		// we only wanted to stop previous and cleanup markers
	};

	while {true} do {
	  
		waitUntil {
			sleep 0.5;
			([player] call A3A_fnc_hasRadio);
		};
		
		_markerNumber = 0; 

		_player = player;		
		if(!isNil{ACE_player}) then {
			_player = ACE_player;
		};
		
		// show players or players's vehicles
		{
			_show = false;
			_injured = false;
			_unit = _x;
			
			if(
				(
					(_showAIs && {!(_unit call _isPlayer)} && {0=={ {_x==_unit} count crew _x>0} count allUnitsUav}) ||
					(_showPlayers && {_unit call _isPlayer})
				) && {
					_showAllSides || side group _unit == side group _player
				}
			) then {	
				if((crew vehicle _unit) select 0 == _unit) then {
					_show = true;
				};		
				if(!alive _unit || damage _unit > 0.9) then {
					_injured = true;
				};	  
				if(!isNil {_unit getVariable "hide"}) then {
					_show = false;
				};  
				if(_unit getVariable ["BTC_need_revive",-1] == 1) then {
					_injured = true;
					_show = false;
				};		  
				if(_unit getVariable ["NORRN_unconscious",false]) then {
					_injured = true;
				};	  	
				if(_unit getVariable ["INCAPACITATED",false]) then {
					_injured = true;
					_show = true;
				};
				
				if([_unit] call A3A_fnc_hasRadio) then {
					_show = true;
				}
				else
				{
					_show = false;
				};
			};
				  	 
			if(_show) then {
				_vehicle = vehicle _unit;  				  	
				_pos = getPosATL _vehicle;		  					
				_color = "ColorWhite";  

				_markerText = _pos call _getNextMarker;						
				_markerText setMarkerColorLocal _color;	 						 				
	 			_markerText setMarkerTypeLocal "c_unknown";		  			   
				_markerText setMarkerSizeLocal [0.8,0];

				_marker = _pos call _getNextMarker;			
				_marker setMarkerColorLocal _color;
				_marker setMarkerDirLocal getDir _vehicle;
				_marker setMarkerTypeLocal "mil_triangle";
				_marker setMarkerTextLocal "";			
				if(_vehicle == vehicle _player) then {
					_marker setMarkerSizeLocal [0.8,1];
				} else {
					_marker setMarkerSizeLocal [0.5,0.7];
				};
				
	 			if(_vehicle != _unit && !(_vehicle isKindOf "ParachuteBase")) then {			 						
					_text = format["[%1]", getText(configFile>>"CfgVehicles">>typeOf _vehicle>>"DisplayName")];
					if(!isNull driver _vehicle) then {
						_text = format["%1 %2", name driver _vehicle, _text];	
					};							 						
					
					if((aero_player_markers_pos distance getPosATL _vehicle) < 50) then {
						aero_player_markers_pos = getPosATL _vehicle;
						_num = 0;
						{
							if(alive _x && _x call _isPlayer && _x != driver _vehicle) then {						
								_text = format["%1%2 %3", _text, if(_num>0)then{","}else{""}, name _x];
								_num = _num + 1;
							};						
						} forEach crew _vehicle; 
					} else { 
						_num = {alive _x && _x call _isPlayer && _x != driver _vehicle} count crew _vehicle;
						if (_num>0) then {					
							if (isNull driver _vehicle) then {
								_text = format["%1 %2", _text, name (crew _vehicle select 0)];
								_num = _num - 1;
							};
							if (_num>0) then {
								_text = format["%1 +%2", _text, _num];
							};
						};
					};	 					
				} else {
					_text = name _x;			
				};
				
				if(_injured) then {
					_text =  format ["%1 Injured",name _unit];
					_marker setMarkerColorLocal "ColorRed";
					_markerText setMarkerColorLocal "ColorRed";
					};
				
				
				_markerText setMarkerTextLocal _text;
			};
			
		} forEach ((allUnits - allPlayers) + allPlayers); // BUG? its possible that allUnits does not contain allPlayers


		// show player controlled uavs
		{
			if(isUavConnected _x) then {	
				_unit=(uavControl _x) select 0;
				if(
					(				
						(_showAIs && {!(_unit call _isPlayer)}) || 
						(_showPlayers && {_unit call _isPlayer})
					) && {
						_showAllSides || side _unit == side _player
					}
				) then {
					_color = _x call _getMarkerColor;								  										  				
					_pos = getPosATL _x;
					
					_marker = _pos call _getNextMarker;			
					_marker setMarkerColorLocal _color;
					_marker setMarkerDirLocal getDir _x;
					_marker setMarkerTypeLocal "mil_triangle";			
					_marker setMarkerTextLocal "";
					if(_unit == _player) then {
						_marker setMarkerSizeLocal [0.8,1];
					} else {
						_marker setMarkerSizeLocal [0.5,0.7];
					};
										  		
					_markerText = _pos call _getNextMarker;	
					_markerText setMarkerColorLocal _color;	   
					_markerText setMarkerTypeLocal "c_unknown";
					_markerText setMarkerSizeLocal [0.8,0];
					_markerText setMarkerTextLocal format["%1 [%2]", name _unit, getText(configFile>>"CfgVehicles">>typeOf _x>>"DisplayName")];	
				};
			};
		} forEach allUnitsUav; 			

		call _cleanUpMarkers;
		 
	};

	_markerNumber = 0;
	call _cleanUpMarkers;

};