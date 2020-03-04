disableSerialization;
_vic = lbData [ 1003, ( lbCurSel 1003 ) ];
_index = lbCurSel 1003;

_undercover = "<t align='right' color='#ff0000'>No</t>";
if (_vic in A3C_civVehicles ) then 
{
_undercover = "<t align='right'>Yes</t>";
};

_crewCount = [_vic, true] call BIS_fnc_crewCount;
_selectedVic = A3C_fiaVehicles select _index;
_cost = (_selectedVic) select 1;

((findDisplay 7679002) displayCtrl 1004) ctrlSetStructuredText parseText format
["
<t align='left'>Cost:</t> <t align='right'>€%1</t><br/>
<t align='left'>Undercover:</t>%2<br/>
<t align='left'>Passengers:</t> <t align='right'>%3</t><br/>
",
_cost, _undercover, _crewCount]; 

_veh = (_selectedVic) select 0;
buttonSetAction [1005, format["closeDialog 0;nul = [""%1"",%2] spawn A3A_fnc_addFIAveh;", _veh, _cost]];