private ["_handle"];
_handle = [] spawn a3c_fnc_removeGear;
waitUntil {scriptDone _handle};

//Load player with default gear.
player forceAddUniform "CUP_U_I_GUE_Flecktarn2";
player addWeapon "CUP_arifle_AK74_Early";
player addPrimaryWeaponItem "CUP_30Rnd_545x39_AK_M";
player addWeapon "hgun_P07_F";
player addHandgunItem "16Rnd_9x21_Mag";
for "_i" from 1 to 2 do {player  addItemToUniform "CUP_30Rnd_545x39_AK74M_M";};
player  addHeadgear "H_Cap_red";

/* ITEMS */
player  linkItem "ItemMap";
player  linkItem "ItemCompass";
player  linkItem "ItemWatch";
player  linkItem "ItemRadio";
player  addItemToUniform "ACE_EarPlugs";
player  addItemToUniform "ACE_Cellphone";

[] call a3c_fnc_saveGear;
