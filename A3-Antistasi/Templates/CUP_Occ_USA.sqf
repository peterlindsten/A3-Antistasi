////////////////////////////////////
//       NAMES AND FLAGS         ///
////////////////////////////////////
//Name Used for notifications
nameOccupants = "NATO";

//Police Faction
factionGEN = "BLU_GEN_F";
//SF Faction
factionMaleOccupants = "CUP_B_US_Army";
//Miltia Faction
if ((gameMode != 4) and (!hasFFAA)) then {factionFIA = ""};

//Flag Images
NATOFlag = "Flag_NATO_F";
NATOFlagTexture = "\A3\Data_F\Flags\Flag_NATO_CO.paa";
flagNATOmrk = "flag_NATO";

if ((isServer) and ((worldName == "chernarus_summer") || (worldName == "chernarus_winter")))  then
	{
	"NATO_carrier" setMarkerText "NATO Base";
	}
	else
	{
	"NATO_carrier" setMarkerText "NATO Carrier";
};

//Loot Crate
NATOAmmobox = "B_supplyCrate_F";

////////////////////////////////////
//   PVP LOADOUTS AND VEHICLES   ///
////////////////////////////////////
//PvP Loadouts
NATOPlayerLoadouts = [
	//Team Leader
	["CUP_blufor_teamLeader"] call A3A_fnc_getLoadout,
	//Medic
	["CUP_blufor_medic"] call A3A_fnc_getLoadout,
	//Autorifleman
	["CUP_blufor_machineGunner"] call A3A_fnc_getLoadout,
	//Marksman
	["CUP_blufor_marksman"] call A3A_fnc_getLoadout,
	//Anti-tank Scout
	["CUP_blufor_AT"] call A3A_fnc_getLoadout,
	//AT2
	["CUP_blufor_rifleman"] call A3A_fnc_getLoadout
];

//PVP Player Vehicles
vehNATOPVP = ["B_T_MRAP_01_F","B_MRAP_01_hmg_F"];

////////////////////////////////////
//             UNITS             ///
////////////////////////////////////
//Military Units
NATOGrunt = "CUP_B_US_Soldier";
NATOOfficer = "CUP_B_US_Officer";
NATOOfficer2 = "CUP_B_US_Officer";
NATOBodyG = "CUP_B_US_Soldier_SL";
NATOCrew = "CUP_B_US_Crew";
NATOUnarmed = "B_Survivor_F";
NATOMarksman = "CUP_B_US_Soldier_Marksman";
staticCrewOccupants = "CUP_B_US_Soldier_AMG";
NATOPilot = "B_Helipilot_F";

//Militia Units
if ((gameMode != 4) and (!hasFFAA)) then
	{
	FIARifleman = "CUP_B_US_Soldier_Light";
	FIAMarksman = "CUP_B_US_Soldier_Marksman";
	};

//Police Units
policeOfficer = "B_GEN_Commander_F";
policeGrunt = "B_GEN_Soldier_F";

////////////////////////////////////
//            GROUPS             ///
////////////////////////////////////
//Military Groups
//Teams
groupsNATOSentry = ["CUP_B_US_Soldier_GL",NATOGrunt];
groupsNATOSniper = ["CUP_B_US_Sniper","CUP_B_US_Spotter"];
groupsNATOsmall = [groupsNATOSentry,groupsNATOSniper,["CUP_B_US_SpecOps_JTAC","CUP_B_US_SpecOps"]];
//Fireteams
groupsNATOAA = ["CUP_B_US_Soldier_TL","CUP_B_US_Soldier_Backpack","CUP_B_US_Soldier_AR","CUP_B_US_Soldier_AA"];
groupsNATOAT = ["CUP_B_US_Soldier_TL","CUP_B_US_Soldier_Backpack","CUP_B_US_Soldier_AR","CUP_B_US_Soldier_AHAT","CUP_B_US_Soldier_HAT"];
groupsNATOmid = [["CUP_B_US_Soldier_TL","CUP_B_US_Soldier_AR","CUP_B_US_Soldier_Backpack","CUP_B_US_Soldier_Backpack"],groupsNATOAA,groupsNATOAT];
//Squads
NATOSquad = ["CUP_B_US_Soldier_SL","CUP_B_US_Soldier_TL","CUP_B_US_Soldier_AR","CUP_B_US_Soldier_Backpack","CUP_B_US_Medic","CUP_B_US_Soldier_AR","CUP_B_US_Soldier_Backpack","CUP_B_US_Soldier_Marksman"];
NATOSpecOp = ["CUP_B_US_SpecOps_TL","CUP_B_US_SpecOps","CUP_B_US_SpecOps_MG","CUP_B_US_SpecOps_M","CUP_B_US_SpecOps_Medic","CUP_B_US_SpecOps_Assault","CUP_B_US_SpecOps","CUP_B_US_SpecOps_Assault"];
groupsNATOSquad = 
	[
	NATOSquad,
	["CUP_B_US_Soldier_SL","CUP_B_US_SpecOps_MG","CUP_B_US_Soldier_HAT","CUP_B_US_Soldier_HAT","CUP_B_US_Soldier_GL","CUP_B_US_Soldier_AHAT","CUP_B_US_Soldier_HAT","CUP_B_US_Soldier_Engineer_EOD"],
	["CUP_B_US_Soldier_SL","CUP_B_US_SpecOps_MG","CUP_B_US_Soldier_HAT","CUP_B_US_Soldier_GL","CUP_B_US_Soldier_GL","CUP_B_US_Soldier_AA","CUP_B_US_Soldier","CUP_B_US_Soldier"],
	["CUP_B_US_Soldier_SL","CUP_B_US_SpecOps_TL","CUP_B_US_Soldier_AR","CUP_B_US_Soldier_Backpack","CUP_B_US_Medic","CUP_B_US_Soldier_AR","CUP_B_US_Soldier","CUP_B_US_Soldier_Engineer_EOD"]
	];

//Militia Groups
if ((gameMode != 4) and (!hasFFAA)) then
	{
	//Teams
	groupsFIASmall =
	[
	["CUP_B_US_Soldier_GL",FIARifleman],
	[FIAMarksman,FIARifleman],
	["CUP_B_US_SpecOps_M14","CUP_B_US_Soldier"]
	];
	//Fireteams
	groupsFIAMid = 
	[
	["CUP_B_US_Soldier_TL","CUP_B_US_Soldier_GL","CUP_B_US_Soldier_AR","CUP_B_US_Soldier_Marksman"],
	["CUP_B_US_Soldier_TL","CUP_B_US_Soldier_GL","CUP_B_US_Soldier_AR","CUP_B_US_Soldier_HAT"],
	["CUP_B_US_Soldier_TL","CUP_B_US_Soldier_AR","CUP_B_US_Soldier_AA","CUP_B_US_Soldier_AA"]
	];
	//Squads
	FIASquad = ["CUP_B_US_Soldier_TL","CUP_B_US_Soldier_AR","CUP_B_US_Soldier_GL","CUP_B_US_Soldier_Backpack","CUP_B_US_Soldier_Backpack","CUP_B_US_Soldier_Backpack","CUP_B_US_Soldier_HAT","CUP_B_US_Medic"];
	groupsFIASquad = [FIASquad,["CUP_B_US_Soldier_TL","CUP_B_US_Soldier_MG","CUP_B_US_Soldier_GL","CUP_B_US_Soldier_Backpack","CUP_B_US_Soldier_AMG","CUP_B_US_Soldier_Backpack","CUP_B_US_Soldier_HAT","CUP_B_US_Medic"]];
	};

//Police Groups
//Teams
groupsNATOGen = [policeOfficer,policeGrunt];

////////////////////////////////////
//           VEHICLES            ///
////////////////////////////////////
//Military Vehicles
//Lite
vehNATOBike = "B_Quadbike_01_F";
vehNATOLightArmed = ["CUP_B_RG31_M2_OD_USA","CUP_B_RG31_M2_OD_GC_USA","CUP_B_RG31_Mk19_OD_USA","CUP_B_RG31E_M2_OD_USA","CUP_B_M1151_M2_WDL_USA","CUP_B_M1151_Deploy_WDL_USA","CUP_B_M1151_Mk19_WDL_USA","CUP_B_M1167_WDL_USA","CUP_B_M1165_GMV_WDL_USA"];
vehNATOLightUnarmed = ["CUP_B_M1151_WDL_USA","CUP_B_M1152_WDL_USA","CUP_B_M1133_MEV_Woodland","CUP_B_M113_Med_USA"];
vehNATOTrucks = ["CUP_B_MTVR_USMC","B_Truck_01_covered_F"];
vehNATOCargoTrucks = ["B_Truck_01_cargo_F", "B_Truck_01_flatbed_F"];
vehNATOAmmoTruck = "CUP_B_MTVR_Ammo_USMC";
vehNATORepairTruck = "CUP_B_MTVR_Repair_USMC";
vehNATOLight = vehNATOLightArmed + vehNATOLightUnarmed;
//Armored
vehNATOAPC = ["CUP_B_M1126_ICV_M2_Woodland_Slat","CUP_B_M1126_ICV_M2_Woodland","CUP_B_M1128_MGS_Woodland_Slat","CUP_B_M1130_CV_M2_Woodland_Slat","CUP_B_M1130_CV_M2_Woodland","CUP_B_M113_USA","CUP_B_M163_USA"];
vehNATOTank = "CUP_B_M2Bradley_USA_W"; //ToDo add "CUP_B_M2A3Bradley_USA_W","CUP_B_M1A2_TUSK_MG_US_Army"
vehNATOAA = "CUP_B_M6LineBacker_USA_W"; //ToDo add "CUP_B_M163_USA","CUP_B_HMMWV_Avenger_USMC"
vehNATOAttack = vehNATOAPC + [vehNATOTank];
//Boats
vehNATOBoat = "B_Boat_Armed_01_minigun_F";
vehNATORBoat = "CUP_B_RHIB2Turret_USMC"; //ToDo add "CUP_B_RHIB_USMC" and new transport LCU
vehNATOBoats = [vehNATOBoat,vehNATORBoat,"B_APC_Wheeled_01_cannon_F","CUP_B_Zodiac_USMC","CUP_B_RHIB_USMC"];
//Planes
vehNATOPlane = "CUP_B_A10_DYN_USA";
vehNATOPlaneAA = "CUP_B_AV8B_DYN_USMC"; //ToDo add "CUP_B_F35B_USMC"
vehNATOTransportPlanes = ["CUP_B_MV22_USMC","CUP_B_C130J_Cargo_USMC","CUP_B_C130J_USMC" ];
//Heli
vehNATOPatrolHeli = "CUP_B_AH6M_USA";
vehNATOTransportHelis = ["CUP_B_CH47F_USA","CUP_B_MH47E_USA","CUP_B_UH60M_US","CUP_B_CH53E_USMC","CUP_B_UH1Y_UNA_USMC"];
vehNATOAttackHelis = ["CUP_B_AH6J_USA","CUP_B_AH6M_USA","CUP_B_AH1Z_Dynamic_USMC","CUP_B_MH60L_DAP_4x_US","CUP_B_MH60L_DAP_4x_USN","CUP_B_UH1Y_Gunship_Dynamic_USMC"];
//UAV
vehNATOUAV = "CUP_B_USMC_DYN_MQ9";
vehNATOUAVSmall = "B_UAV_01_F";
//Artillery
vehNATOMRLS = "CUP_B_M270_HE_USMC";
vehNATOMRLSMags = "CUP_12Rnd_MLRS_HE";
//Combined Arrays
vehNATONormal = vehNATOLight + vehNATOTrucks + [vehNATOAmmoTruck,"CUP_B_MTVR_Refuel_USMC", "CUP_B_HMMWV_Ambulance_USMC", vehNATORepairTruck,"B_APC_Tracked_01_CRV_F"];
vehNATOAir = vehNATOTransportHelis + vehNATOAttackHelis + [vehNATOPlane,vehNATOPlaneAA] + vehNATOTransportPlanes;

//Militia Vehicles
if ((gameMode != 4) and (!hasFFAA)) then
	{
	vehFIAArmedCar = "CUP_B_M1151_M2_WDL_USA";
	vehFIATruck = "B_Truck_01_transport_F";
	vehFIACar = "CUP_B_M1151_WDL_USA";
	};

//Police Vehicles
vehPoliceCar = "B_GEN_OFFROAD_01_gen_F";

////////////////////////////////////
//        STATIC WEAPONS         ///
////////////////////////////////////
//Assembled Statics
NATOMG = "CUP_B_M2StaticMG_US";
staticATOccupants = "CUP_B_TOW_TriPod_USMC";
staticAAOccupants = "B_static_AA_F";
NATOMortar = "CUP_B_M252_US";

//Static Weapon Bags
MGStaticNATOB = "B_HMG_01_high_weapon_F";
ATStaticNATOB = "B_AT_01_weapon_F";
AAStaticNATOB = "B_AA_01_weapon_F";
MortStaticNATOB = "B_Mortar_01_weapon_F";
//Short Support
supportStaticNATOB = "B_HMG_01_support_F";
//Tall Support
supportStaticNATOB2 = "B_HMG_01_support_high_F";
//Mortar Support
supportStaticNATOB3 = "B_Mortar_01_support_F";
