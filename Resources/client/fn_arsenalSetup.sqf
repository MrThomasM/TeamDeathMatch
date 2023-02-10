/*
	Author: MrThomasM
	MrThomasM#1857

	Description:
	- Allows for a pre set arsenal for players to open.

	Exucution:
		[] call MRTM_fnc_arsenalHandle;

	Parameter(s): nothing

	Returns: nothing

	Result: 
	Removes / adds certain clothing from the arsenal.
*/

["Preload"] call BIS_fnc_arsenal;

helmetListNato = [
"H_HelmetB", "H_HelmetB_camo", "H_HelmetB_paint", "H_HelmetB_light", "H_HelmetB_plain_mcamo", "H_HelmetB_plain_blk",
"H_HelmetSpecB", "H_HelmetSpecB_paint1", "H_HelmetSpecB_paint2", "H_HelmetSpecB_blk", "H_HelmetSpecB_snakeskin",
"H_HelmetSpecB_sand", "H_Helmet_Kerry", "H_HelmetB_grass", "H_HelmetB_snakeskin", "H_HelmetB_desert", "H_HelmetB_black",
"H_HelmetB_sand", "H_HelmetB_light_grass", "H_HelmetB_light_snakeskin", "H_HelmetB_light_desert", "H_HelmetB_light_black",
"H_HelmetB_light_sand"
];

clothingListNato = [
"U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_tshirt","U_B_CombatUniform_mcam_vest","U_B_GhillieSuit",
"U_B_CombatUniform_mcam_worn","U_BG_leader","U_B_CTRG_1","U_B_CTRG_2","U_B_CTRG_3","U_B_survival_uniform","U_I_G_Story_Protagonist_F",
"U_I_G_resistanceLeader_F","U_B_FullGhillie_lsh",
"U_B_FullGhillie_sard","U_B_FullGhillie_ard","U_B_T_Soldier_F","U_B_T_Soldier_AR_F","U_B_T_Soldier_SL_F",
"U_B_T_Sniper_F","U_B_T_FullGhillie_tna_F","U_B_CTRG_Soldier_F","U_B_CTRG_Soldier_2_F","U_B_CTRG_Soldier_3_F",
"U_B_CTRG_Soldier_Arid_F","U_B_CTRG_Soldier_2_Arid_F","U_B_CTRG_Soldier_3_Arid_F",
"U_B_CTRG_Soldier_urb_1_F","U_B_CTRG_Soldier_urb_2_F","U_B_CTRG_Soldier_urb_3_F"
,"U_B_CombatUniform_vest_mcam_wdl_f","U_B_CombatUniform_mcam_wdl_f",
"U_B_CombatUniform_tshirt_mcam_wdL_f"
];

if (side player == west) then {
	BIS_fnc_arsenal_data set [3, clothingListNato];
	BIS_fnc_arsenal_data set [6, helmetListNato];
} else {
	BIS_fnc_arsenal_data set [3, clothingListNato];
	BIS_fnc_arsenal_data set [6, helmetListNato];
};