////////////////////////////////////
//       NAMES AND FLAGS         ///
////////////////////////////////////
//Name Used for notifications
nameInvaders = "AFRF";

//SF Faction
factionMaleInvaders = "CUP_O_RU";
//Miltia Faction
if (gameMode == 4) then {factionFIA = ""};

//Flag Images
CSATFlag = "FlagCarrierRU";
CSATFlagTexture = "\ca\data\flag_rus_co.paa";
flagCSATmrk = "flag_CSAT";
if (isServer) then {"CSAT_carrier" setMarkerText "AFRF Carrier"};
	
//Loot Crate
CSATAmmoBox = "O_supplyCrate_F";

////////////////////////////////////
//   PVP LOADOUTS AND VEHICLES   ///
////////////////////////////////////
//PvP Loadouts
CSATPlayerLoadouts = [
	//Team Leader
	["CUP_opfor_teamLeader"] call A3A_fnc_getLoadout,
	//Medic
	["CUP_opfor_medic"] call A3A_fnc_getLoadout,
	//Autorifleman
	["CUP_opfor_machineGunner"] call A3A_fnc_getLoadout,
	//Marksman
	["CUP_opfor_marksman"] call A3A_fnc_getLoadout,
	//Anti-tank Scout
	["CUP_opfor_AT"] call A3A_fnc_getLoadout,
	//AT2
	["CUP_opfor_AT2"] call A3A_fnc_getLoadout
];

//PVP Player Vehicles
vehCSATPVP = ["CUP_O_UAZ_Unarmed_RU","CUP_O_UAZ_MG_RU","CUP_O_GAZ_Vodnik_PK_RU"];

////////////////////////////////////
//             UNITS             ///
////////////////////////////////////
//Military Units
CSATGrunt = "CUP_O_RU_Soldier_M_EMR";
CSATOfficer = "CUP_O_RU_Officer_M_EMR";
CSATBodyG = "CUP_O_RUS_Commander_Autumn";
CSATCrew = "CUP_O_RU_Crew_M_EMR";
CSATMarksman = "CUP_O_RU_Soldier_Marksman_M_EMR";
staticCrewInvaders = "CUP_O_RU_Soldier_M_EMR";
CSATPilot = "CUP_O_RU_Pilot_M_EMR";

//Militia Units
if (gameMode == 4) then
	{
	FIARifleman = "CUP_O_INS_Soldier";
	FIAMarksman = "CUP_O_INS_Soldier_AR";
	};

////////////////////////////////////
//            GROUPS             ///
////////////////////////////////////
//Military Groups
//Teams
groupsCSATSentry = ["CUP_O_RU_Soldier_GL_M_EMR","CUP_O_RU_Soldier_M_EMR"];
groupsCSATSniper = ["CUP_O_RU_Sniper_M_EMR","CUP_O_RU_Spotter_M_EMR"];
groupsCSATsmall = [groupsCSATSentry,["CUP_O_RU_Soldier_Marksman_M_EMR","CUP_O_RU_Soldier_SL_M_EMR"],groupsCSATSniper];
//Fireteams
groupsCSATAA = ["CUP_O_RU_Soldier_TL_M_EMR","CUP_O_RU_Soldier_AA_M_EMR","CUP_O_RU_Soldier_AA_M_EMR","CUP_O_RU_Soldier_AA_M_EMR"];
groupsCSATAT = ["CUP_O_RU_Soldier_TL_M_EMR","CUP_O_RU_Soldier_HAT_M_EMR","CUP_O_RU_Soldier_HAT_M_EMR","CUP_O_RU_Soldier_AT_M_EMR"];
groupsCSATmid = [["CUP_O_RU_Soldier_TL_M_EMR","CUP_O_RU_Soldier_MG_M_EMR","CUP_O_RU_Soldier_GL_M_EMR","CUP_O_RU_Soldier_LAT_M_EMR"],groupsCSATAA,groupsCSATAT];
//Squads
CSATSquad = ["CUP_O_RU_Soldier_SL_M_EMR","CUP_O_RU_Soldier_M_EMR","CUP_O_RU_Soldier_LAT_M_EMR","CUP_O_RU_Soldier_Marksman_M_EMR","CUP_O_RU_Soldier_TL_M_EMR","CUP_O_RU_Soldier_MG_M_EMR","CUP_O_RU_Soldier_AR_M_EMR","CUP_O_RU_Medic_M_EMR"];
CSATSpecOp = ["CUP_O_RUS_Soldier_TL_Autumn","CUP_O_RUS_SpecOps_Scout_Autumn","CUP_O_RUS_Soldier_Marksman_Autumn","CUP_O_RUS_Saboteur_Autumn","CUP_O_RUS_Soldier_GL_Autumn","CUP_O_RUS_SpecOps_SD_Autumn"];
groupsCSATSquad =
	[
	CSATSquad,
	["CUP_O_RU_Soldier_SL_M_EMR","CUP_O_RU_Soldier_MG_M_EMR","CUP_O_RU_Soldier_GL_M_EMR","CUP_O_RU_Soldier_Marksman_M_EMR","CUP_O_RU_Soldier_HAT_M_EMR","CUP_O_RU_Soldier_AT_M_EMR","CUP_O_RU_Soldier_AR_M_EMR","CUP_O_RU_Medic_M_EMR"],
	["CUP_O_RU_Soldier_SL_M_EMR","CUP_O_RU_Soldier_LAT_M_EMR","CUP_O_RU_Soldier_TL_M_EMR","CUP_O_RU_Soldier_MG_M_EMR","CUP_O_RU_Soldier_AR_M_EMR","CUP_O_RU_Explosive_Specialist_M_EMR","CUP_O_RU_Soldier_Saiga_M_EMR","CUP_O_RU_Medic_M_EMR"],
	["CUP_O_RU_Soldier_SL_M_EMR","CUP_O_RU_Soldier_LAT_M_EMR","CUP_O_RU_Soldier_TL_M_EMR","CUP_O_RU_Soldier_MG_M_EMR","CUP_O_RU_Soldier_AR_M_EMR","CUP_O_RU_Explosive_Specialist_M_EMR","CUP_O_RU_Soldier_Saiga_M_EMR","CUP_O_RU_Medic_M_EMR"],
	["CUP_O_RU_Soldier_SL_M_EMR","CUP_O_RU_Soldier_LAT_M_EMR","CUP_O_RU_Soldier_TL_M_EMR","CUP_O_RU_Soldier_MG_M_EMR","CUP_O_RU_Soldier_AR_M_EMR","CUP_O_RU_Soldier_AA_M_EMR","CUP_O_RU_Soldier_AA_M_EMR","CUP_O_RU_Medic_M_EMR"],
	["CUP_O_RU_Soldier_SL_M_EMR","CUP_O_RU_Soldier_LAT_M_EMR","CUP_O_RU_Soldier_TL_M_EMR","CUP_O_RU_Soldier_MG_M_EMR","CUP_O_RU_Soldier_AR_M_EMR","CUP_O_RU_Engineer_M_EMR","CUP_O_RU_Engineer_M_EMR","CUP_O_RU_Medic_M_EMR"]
	];

//Militia Groups
if (gameMode == 4) then
	{
	//Teams
	groupsFIASmall =
		[
		["CUP_O_INS_Soldier_GL",FIARifleman],
		[FIAMarksman,FIARifleman],
		["CUP_O_INS_Sniper","CUP_O_INS_Soldier_GL"]
		];
	//Fireteams
	groupsFIAMid =
		[
		["CUP_O_INS_Officer","CUP_O_INS_Soldier_GL","CUP_O_INS_Soldier_AR",FIAMarksman],
		["CUP_O_INS_Officer","CUP_O_INS_Soldier_GL","CUP_O_INS_Soldier_AR","CUP_O_INS_Soldier_LAT"],
		["CUP_O_INS_Officer","CUP_O_INS_Soldier_GL","CUP_O_INS_Soldier_AR","CUP_O_INS_Soldier_Engineer"]
		];
	//Squads
	FIASquad = ["CUP_O_INS_Officer","CUP_O_INS_Soldier_AR","CUP_O_INS_Soldier_GL",FIARifleman,FIARifleman,FIAMarksman,"CUP_O_INS_Soldier_LAT","CUP_O_INS_Medic"];
	groupsFIASquad =
		[
		FIASquad,
		["CUP_O_INS_Officer","CUP_O_INS_Soldier_AR","CUP_O_INS_Soldier_GL",FIARifleman,"CUP_O_INS_Soldier_MG","CUP_O_INS_Soldier_Exp","CUP_O_INS_Soldier_LAT","CUP_O_INS_Medic"]
		];
	};

////////////////////////////////////
//           VEHICLES            ///
////////////////////////////////////
//Military Vehicles
//Lite
vehCSATBike = "O_Quadbike_01_F";
vehCSATLightArmed = ["CUP_O_UAZ_MG_RU","CUP_O_GAZ_Vodnik_PK_RU","CUP_O_GAZ_Vodnik_AGS_RU","CUP_O_GAZ_Vodnik_BPPU_RU","CUP_O_UAZ_AGS30_RU","CUP_O_UAZ_METIS_RU","CUP_O_UAZ_SPG9_RU"];
vehCSATLightUnarmed = ["CUP_O_Kamaz_RU","CUP_O_UAZ_Unarmed_RU", "CUP_O_GAZ_Vodnik_MedEvac_RU","CUP_O_UAZ_Open_RU"];
vehCSATTrucks = ["CUP_O_Kamaz_Open_RU","CUP_O_Ural_RU","CUP_O_Ural_Open_RU"];
vehCSATAmmoTruck = "CUP_O_Kamaz_Reammo_RU";
vehCSATLight = vehCSATLightArmed + vehCSATLightUnarmed;
//Armored
vehCSATAPC = ["CUP_O_BMP2_RU","CUP_O_BTR60_Green_RU","CUP_O_BTR60_RU","CUP_O_BTR80_CAMO_RU","CUP_O_BTR80_DESERT_RU","CUP_O_BTR80A_GREEN_RU","CUP_O_MTLB_pk_WDL_RU","CUP_O_MTLB_pk_Green_RU"];
vehCSATTank = "CUP_O_T72_RU"; //todo: add CUP_O_T90_RU
vehCSATAA = "CUP_O_2S6M_RU"; //todo: add CUP_O_2S6_RU, CUP_O_UAZ_AA_RU, CUP_O_Ural_ZU23_RU
vehCSATAttack = vehCSATAPC + [vehCSATTank];
//Boats
vehCSATBoat = "O_Boat_Armed_01_hmg_F";
vehCSATRBoat = "CUP_O_PBX_RU";
vehCSATBoats = [vehCSATBoat,vehCSATRBoat,"CUP_O_LCVP_SLA"];
//Planes
vehCSATPlane = "CUP_O_Su25_Dyn_RU";
vehCSATPlaneAA = "CUP_O_SU34_RU";
vehCSATTransportPlanes = ["CUP_O_C47_SLA"];
//Heli
vehCSATPatrolHeli = "CUP_O_UH1H_slick_SLA";
vehCSATTransportHelis = ["CUP_O_MI6T_RU","CUP_O_Mi8AMT_RU", "CUP_O_Mi8_medevac_RU" ,vehCSATPatrolHeli];
vehCSATAttackHelis = ["CUP_O_Ka50_DL_RU","CUP_O_Ka52_RU","CUP_O_Ka60_Grey_RU","CUP_O_Mi24_P_Dynamic_RU","CUP_O_Mi8_RU"];
//UAV
vehCSATUAV = "O_UAV_02_F";
vehCSATUAVSmall = "O_UAV_01_F";
//Artillery
vehCSATMRLS = "CUP_O_BM21_RU";
vehCSATMRLSMags = "CUP_40Rnd_GRAD_HE";

//Combined Arrays
vehCSATNormal = vehCSATLight + vehCSATTrucks + [vehCSATAmmoTruck, "CUP_O_Ural_Refuel_RU", "CUP_O_BMP2_AMB_RU", "CUP_O_Kamaz_Repair_RU", "CUP_O_Ural_Repair_RU"];
vehCSATAir = vehCSATTransportHelis + vehCSATAttackHelis + [vehCSATPlane,vehCSATPlaneAA] + vehCSATTransportPlanes;

//Militia Vehicles
if (gameMode == 4) then
	{
	vehFIAArmedCar = "CUP_O_UAZ_MG_RU";
	vehFIATruck = "CUP_O_Kamaz_Open_RU";
	vehFIACar = "CUP_O_Kamaz_RU";
	};

////////////////////////////////////
//        STATIC WEAPONS         ///
////////////////////////////////////
//Assembled Statics
CSATMG = "CUP_O_KORD_high_RU";
staticATInvaders = "CUP_O_Metis_RU";
staticAAInvaders = "CUP_O_Igla_AA_pod_RU";
CSATMortar = "CUP_O_2b14_82mm_RU";

//Static Weapon Bags
MGStaticCSATB = "CUP_B_Kord_Gun_Bag";
ATStaticCSATB = "CUP_B_Metis_Gun_Bag";
AAStaticCSATB = "CUP_Weapon_launch_Igla";
MortStaticCSATB = "CUP_B_Podnos_Gun_Bag";
//Short Support
supportStaticCSATB = "CUP_B_Metis_Tripod_Bag";
//Tall Support
supportStaticCSATB2 = "CUP_B_Kord_Tripod_Bag";
//Mortar Support
supportStaticCSATB3 = "CUP_B_Podnos_Bipod_Bag";
