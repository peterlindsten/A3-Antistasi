////////////////////////////////////
//       NAMES AND FLAGS         ///
////////////////////////////////////
nameTeamPlayer = if (worldName == "Tanoa") then {"SDK"} else {"FIA"};
SDKFlag = "Flag_Altis_F";
SDKFlagTexture = "\A3\Data_F\Flags\Flag_Altis_CO.paa";
typePetros = "I_G_officer_F";

////////////////////////////////////
//             UNITS             ///
////////////////////////////////////
//First Entry is Guerilla, Second Entry is Para/Military
staticCrewTeamPlayer = "I_G_Soldier_unarmed_F";
SDKUnarmed = "I_G_Survivor_F";
SDKSniper = ["CUP_I_GUE_Sniper","CUP_I_PMC_Sniper"];
SDKATman = ["CUP_I_GUE_Soldier_AT","CUP_I_PMC_Soldier_AT"];
SDKMedic = ["CUP_I_GUE_Medic","CUP_I_PMC_Medic"];
SDKMG = ["CUP_I_GUE_Soldier_MG","CUP_I_PMC_Soldier_MG_PKM"];
SDKExp = ["CUP_I_GUE_Saboteur","CUP_I_GUE_Saboteur"];
SDKGL = ["CUP_I_GUE_Soldier_GL","CUP_I_PMC_Soldier_GL_M16A2"];
SDKMil = ["CUP_I_GUE_Soldier_AKS74","CUP_I_PMC_Bodyguard_M4"];
SDKSL = ["CUP_I_GUE_Officer","CUP_I_PMC_Contractor1"];
SDKEng = ["CUP_I_GUE_Engineer","CUP_I_PMC_Engineer"];

////////////////////////////////////
//            GROUPS             ///
////////////////////////////////////
groupsSDKmid = [SDKSL,SDKGL,SDKMG,SDKMil];
groupsSDKAT = [SDKSL,SDKMG,SDKATman,SDKATman,SDKATman];
groupsSDKSquad = [SDKSL,SDKGL,SDKMil,SDKMG,SDKMil,SDKATman,SDKMil,SDKMedic];
groupsSDKSquadEng = [SDKSL,SDKGL,SDKMil,SDKMG,SDKExp,SDKATman,SDKEng,SDKMedic];
groupsSDKSquadSupp = [SDKSL,SDKGL,SDKMil,SDKMG,SDKATman,SDKMedic,[staticCrewTeamPlayer,staticCrewTeamPlayer],[staticCrewTeamPlayer,staticCrewTeamPlayer]];
groupsSDKSniper = [SDKSniper,SDKSniper];
groupsSDKSentry = [SDKGL,SDKMil];

//Rebel Unit Tiers (for costs)
sdkTier1 = SDKMil + [staticCrewTeamPlayer] + SDKMG + SDKGL + SDKATman;
sdkTier2 = SDKMedic + SDKExp + SDKEng;
sdkTier3 = SDKSL + SDKSniper;
soldiersSDK = sdkTier1 + sdkTier2 + sdkTier3;

////////////////////////////////////
//           VEHICLES            ///
////////////////////////////////////
//Military Vehicles
vehSDKBike = "I_G_Quadbike_01_F";
vehSDKLightArmed = "I_G_Offroad_01_armed_F";
vehSDKAT = "I_G_Offroad_01_AT_F";
vehSDKLightUnarmed = "I_G_Offroad_01_F";
vehSDKTruck = "I_G_Van_01_transport_F";
//vehSDKHeli = "I_C_Heli_Light_01_civil_F";
vehSDKPlane = "CUP_C_AN2_AEROSCHROT_TK_CIV";
vehSDKBoat = "I_G_Boat_Transport_01_F";
vehSDKRepair = "I_G_Offroad_01_repair_F";

//Civilian Vehicles
civCar = "C_Offroad_01_F";
civTruck = "C_Van_01_transport_F";
civHeli = "C_Heli_Light_01_civil_F";
civBoat = "C_Boat_Transport_02_F";

////////////////////////////////////
//        STATIC WEAPONS         ///
////////////////////////////////////
//Assembled Static Weapons
SDKMGStatic = "I_HMG_01_high_F";
staticATteamPlayer = "I_Static_AT_F";
staticAAteamPlayer = "I_Static_AA_F";
SDKMortar = "I_G_Mortar_01_F";
SDKMortarHEMag = "8Rnd_82mm_Mo_shells";
SDKMortarSmokeMag = "8Rnd_82mm_Mo_Smoke_white";

//Static Weapon Bags
MGStaticSDKB = "I_HMG_01_high_weapon_F";
ATStaticSDKB = "I_AT_01_weapon_F";
AAStaticSDKB = "I_AA_01_weapon_F";
MortStaticSDKB = "I_Mortar_01_weapon_F";
//Short Support
supportStaticSDKB = "I_HMG_01_support_F";
//Tall Support
supportStaticsSDKB2 = "I_HMG_01_support_high_F";
//Mortar Support
supportStaticsSDKB3 = "I_Mortar_01_support_F";

////////////////////////////////////
//             ITEMS             ///
////////////////////////////////////
//Mines
ATMineMag = "ATMine_Range_Mag";
APERSMineMag = "APERSMine_Range_Mag";

//Breaching explosives
//Breaching APCs needs one demo charge
breachingExplosivesAPC = [["DemoCharge_Remote_Mag", 1]];
//Breaching tanks needs one satchel charge or two demo charges
breachingExplosivesTank = [["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]];

//Todo : update rebel starting unlocks

//Starting Unlocks
// Weapons
initialRebelEquipment append ["hgun_Pistol_heavy_02_F","hgun_P07_F","SMG_01_F","SMG_02_F"];
initialRebelEquipment append ["CUP_SKS","CUP_srifle_LeeEnfield","CUP_srifle_Mosin_Nagant","CUP_hgun_TEC9","CUP_launch_M72A6"];
// Mags
initialRebelEquipment append ["6Rnd_45ACP_Cylinder","16Rnd_9x21_Mag","30Rnd_45ACP_Mag_SMG_01","30Rnd_9x21_Mag_SMG_02","MiniGrenade","SmokeShell"];
initialRebelEquipment append ["CUP_10Rnd_762x39_SKS_M","CUP_10x_303_M", "CUP_5Rnd_762x54_Mosin_M", "CUP_32Rnd_9x19_TEC9"];
// Backpacks
initialRebelEquipment append ["B_FieldPack_oli","B_FieldPack_blk","B_FieldPack_ocamo","B_FieldPack_oucamo","B_FieldPack_cbr","B_FieldPack_khk"];
// Vests
initialRebelEquipment append ["V_Chestrig_blk","V_Chestrig_rgr","V_Chestrig_khk","V_Chestrig_oli","V_BandollierB_blk","V_BandollierB_cbr","V_BandollierB_rgr","V_BandollierB_khk","V_BandollierB_oli","V_Rangemaster_belt"];
// Items
initialRebelEquipment append ["Binocular","acc_flashlight","ItemCompass","ItemWatch","FirstAidKit","Medikit","ToolKit","Chemlight_green"];
// Breaching charge
initialRebelEquipment append ["DemoCharge_Remote_Mag"];
// Uniforms
initialRebelEquipment append ["CUP_U_I_GUE_Anorak_01","CUP_U_I_GUE_Anorak_02","CUP_U_I_GUE_Anorak_03","CUP_U_C_Suit_01","CUP_U_C_Priest_01","CUP_U_C_Mechanic_02","CUP_U_C_Villager_01","CUP_U_C_Worker_01","CUP_U_C_Worker_02","CUP_U_C_Worker_03","CUP_U_C_Worker_04","CUP_U_C_Woodlander_03","CUP_U_C_Woodlander_02","CUP_U_C_Functionary_jacket_03","CUP_U_C_Rocker_01","CUP_U_C_Rocker_03","CUP_U_C_racketeer_03","CUP_U_C_Profiteer_03","CUP_U_C_Rescuer_01","CUP_U_C_Fireman_01","CUP_U_C_Citizen_01","CUP_U_C_Citizen_02","CUP_U_I_GUE_Flecktarn2"];
// Headgear
initialRebelEquipment append ["CUP_H_PMC_EP_Headset","CUP_H_NAPA_Fedora","CUP_H_PMC_Cap_Grey","CUP_H_PMC_Cap_Tan","CUP_H_PMC_Cap_Burberry","CUP_H_PMC_Cap_Back_Tan","CUP_H_PMC_Cap_EP_Tan","CUP_H_PMC_Cap_Back_EP_Grey","CUP_H_PMC_Beanie_Khaki","CUP_H_PMC_Beanie_Winter","CUP_H_PMC_Beanie_Black","CUP_H_FR_BandanaGreen","CUP_H_FR_BandanaWdl","CUP_H_FR_Bandana_Headset","CUP_H_FR_Headband_Headset","CUP_H_C_Ushanka_01","CUP_H_C_Ushanka_02","CUP_H_C_Ushanka_03","CUP_H_C_Ushanka_04","CUP_H_C_Beanie_01","CUP_H_C_Beanie_02","CUP_H_C_Beanie_03","CUP_H_C_Beanie_04","CUP_H_C_Beret_01","CUP_H_C_Beret_02","CUP_H_C_Beret_03","CUP_H_C_Beret_04","CUP_H_C_Fireman_Helmet_01"];
// Facewear
initialRebelEquipment append ["CUP_FR_NeckScarf","CUP_FR_NeckScarf2","CUP_FR_NeckScarf3","CUP_FR_NeckScarf4","CUP_FR_NeckScarf5","CUP_G_White_Scarf_Shades","CUP_G_Tan_Scarf_Shades","CUP_G_Grn_Scarf_Shades","CUP_G_Scarf_Face_Red","CUP_G_Scarf_Face_Tan","CUP_G_Scarf_Face_Grn","CUP_G_Scarf_Face_Blk","CUP_G_Scarf_Face_White","CUP_TK_NeckScarf","CUP_RUS_Balaclava_grn","CUP_RUS_Balaclava_blk","CUP_PMC_G_thug","G_Respirator_white_F","G_Respirator_yellow_F","G_EyeProtectors_F","G_EyeProtectors_Earpiece_F","G_Respirator_blue_F","G_Balaclava_TI_blk_F","G_Balaclava_TI_tna_F","G_Bandanna_blk","G_Bandanna_oli","G_Bandanna_khk","G_Bandanna_tan","G_Bandanna_beast","G_Bandanna_shades","G_Bandanna_sport","G_Bandanna_aviator","G_Balaclava_blk","G_Balaclava_oli","G_Balaclava_combat","G_Balaclava_lowprofile","G_Aviator","G_Blindfold_01_white_F","G_Blindfold_01_black_F","CUP_PMC_Facewrap_Black","CUP_PMC_Facewrap_Winter","CUP_PMC_Facewrap_Tropical","CUP_PMC_Facewrap_Tan","CUP_PMC_Facewrap_Red","CUP_PMC_Facewrap_Ranger","CUP_PMC_Facewrap_Smilie","CUP_PMC_Facewrap_Skull"];
//TFAR Unlocks
if (hasTFAR) then {initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};
if (hasTFAR && startWithLongRangeRadio) then {initialRebelEquipment pushBack "tf_anprc155"};
if (hasACE) then {initialRebelEquipment append ["ACE_Flashlight_Maglite_ML300L"]};