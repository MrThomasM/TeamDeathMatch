/*
	Author: MrThomasM
	MrThomasM#1857

	Description:
	- Sets up the 2 needed files for the server.
*/

if (isServer) then {
	call MRTM_fnc_initServer;
};

if (!isDedicated && hasInterface) then {call MRTM_fnc_initClient};


MRTM_BANNED_NATO_UNIFORM = createHashMapFromArray [
[ "U_O_CombatUniform_ocamo", 1], ["U_O_CombatUniform_oucamo", 2],
["U_O_CombatUniform_ghex_F", 3], ["U_O_CombatUniform_hex_F", 4],
["U_O_OfficerUniform_ocamo", 5], ["U_O_SpecopsUniform_ocamo", 6],
["U_O_SpecopsUniform_blk", 7], ["U_O_V_Soldier_Viper_F", 8],
["U_O_V_Soldier_Viper_hex_F", 9], ["U_O_V_Soldier_Viper_ghex_F", 10]
];

MRTM_BANNED_NATO_HELMET = createHashMapFromArray [
["H_HelmetO_ocamo", 1], ["H_HelmetSpecO_ocamo", 2], ["H_HelmetLeaderO_hex_F", 3],
["H_HelmetLeaderO_ocamo", 4], ["H_HelmetCrew_O_ghex_F", 5], ["H_HelmetCrew_O_hex_F", 6],
["H_HelmetO_ghex_F", 7], ["H_HelmetO_hex_F", 8], ["H_HelmetSpecO_ghex_F", 9],
["H_HelmetSpecO_hex_F", 10], ["H_HelmetLeaderO_ghex_F", 11], ["H_HelmetLeaderO_hex_F", 12],
["V_HarnessO_ghex_F", 13], ["V_HarnessO_hex_F", 14], ["V_HarnessOGL_ghex_F", 15],
["V_HarnessOGL_hex_F", 16], ["V_TacVest_gen_F", 17], ["H_HelmetO_ocamo", 18], ["H_HelmetSpecO_ocamo", 19],
["H_HelmetLeaderO_ocamo", 20], ["H_HelmetCrew_O_ghex_F", 21], ["H_HelmetCrew_O_hex_F", 22],
["H_HelmetO_ghex_F", 23], ["H_HelmetO_hex_F", 24], ["H_HelmetSpecO_ghex_F", 25],
["H_HelmetSpecO_hex_F", 26], ["H_HelmetLeaderO_ghex_F", 27]
];

MRTM_BANNED_CSAT_UNIFORM = createHashMapFromArray [
["U_B_CombatUniform_mcam", 1], ["U_B_CombatUniform_mcam_tshirt", 2], ["U_B_CombatUniform_mcam_vest", 3],
["U_B_CombatUniform_mcam_worn", 4], ["U_B_CTRG_1", 5], ["U_B_CTRG_2", 6],
["U_B_CTRG_3", 7], ["U_B_CTRG_Soldier_2_F", 8], ["U_B_CTRG_Soldier_3_F", 9],
["U_B_CTRG_Soldier_F", 10], ["U_B_CTRG_Soldier_urb_1_F", 11], ["U_B_CTRG_Soldier_urb_2_F", 12],
["U_B_CTRG_Soldier_urb_3_F", 13], ["U_B_GEN_Commander_F", 14], ["U_B_GEN_Soldier_F", 15],
["U_B_PilotCoveralls", 16], ["U_B_Protagonist_VR", 17], ["U_B_SpecopsUniform_sgg", 18],
["U_B_T_Soldier_AR_F", 19], ["U_B_T_Soldier_F", 20], ["U_B_T_Soldier_SL_F", 21], ["U_B_Wetsuit", 22]
];

MRTM_BANNED_CSAT_HELMET = createHashMapFromArray [
["H_HelmetB", 1], ["H_HelmetB_black", 2], ["H_HelmetB_camo", 3], ["H_HelmetB_desert", 4],
["H_HelmetB_grass", 5], ["H_HelmetB_light", 6], ["H_HelmetB_paint", 7],
["H_HelmetB_plain_blk", 8], ["H_HelmetB_sand", 9], ["H_HelmetB_snakeskin", 10],
["H_HelmetB_tna_F", 11], ["H_HelmetIA", 12], ["H_HelmetIA_camo", 13], ["H_HelmetIA_net", 14],
["H_HelmetLeaderO_ghex_F", 15], ["H_HelmetLeaderO_hex_F", 16], ["H_HelmetSpecB", 17],
["H_HelmetSpecB_blk", 18], ["H_HelmetSpecB_paint1", 19], ["H_HelmetSpecB_paint2", 20]
];