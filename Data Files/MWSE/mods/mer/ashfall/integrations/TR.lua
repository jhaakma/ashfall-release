local interop = require("mer.ashfall.interop")

local types = {
    tree = "tree",
    wood = "wood",
    vegetation = "vegetation",
    stump = "stump",
    deadTree = "deadTree",
    waterClean = "waterClean"
}

local activators = {

    --Tree
    t_sky_flora_treeleaf2plain_01 = types.tree,
    t_sky_flora_treeleaf2plain_02 = types.tree,
    t_sky_flora_treeleaf2plain_03 = types.tree,
    t_sky_flora_bushleaves1_01 = types.tree,
    t_sky_flora_bushleaves1_02 = types.tree,
    t_sky_flora_bushleaves1dry_01 = types.tree,
    t_sky_flora_bushleaves1dry_02 = types.tree,
    t_sky_flora_bushpine1_01 = types.tree,
    t_sky_flora_bushpine1_02 = types.tree,
    t_sky_flora_bushpine1dry_01 = types.tree,
    t_sky_flora_bushpine1dry_02 = types.tree,
    t_sky_flora_bushpine1snow_01 = types.tree,
    t_sky_flora_bushpine1snow_02 = types.tree,
    t_sky_flora_bushleaves2_01 = types.tree,
    t_sky_flora_bushleaves2_02 = types.tree,
    t_sky_flora_bushleaves3_01 = types.tree,
    t_sky_flora_bushleaves3_02 = types.tree,
    t_sky_flora_bushleaves3_03 = types.tree,
    t_sky_flora_bushleaves4_01 = types.tree,
    t_sky_flora_bushleaves4_02 = types.tree,
    t_sky_flora_bushleaves5_01 = types.tree,
    t_sky_flora_bushleaves5_02 = types.tree,
    t_sky_flora_bushleaves5_03 = types.tree,
    t_sky_flora_bushleaves5dry_01 = types.tree,
    t_sky_flora_bushleaves5dry_02 = types.tree,
    t_sky_flora_bushleaves5dry_03 = types.tree,
    t_sky_flora_bushpine3_01 = types.tree,
    t_sky_flora_bushpine3_02 = types.tree,
    t_sky_flora_bushpine3_03 = types.tree,
    t_sky_flora_bushpine3dry_01 = types.tree,
    t_sky_flora_bushpine3dry_02 = types.tree,
    t_sky_flora_bushpine3dry_03 = types.tree,
    t_sky_flora_bushpine3snow_01 = types.tree,
    t_sky_flora_bushpine3snow_02 = types.tree,
    t_sky_flora_bushpine3snow_03 = types.tree,
    t_sky_flora_bushpine4_01 = types.tree,
    t_sky_flora_bushpine4_02 = types.tree,
    t_sky_flora_bushpine4dry_01 = types.tree,
    t_sky_flora_bushpine4dry_02 = types.tree,
    t_sky_flora_bushpine4snow_01 = types.tree,
    t_sky_flora_bushpine4snow_02 = types.tree,
    t_sky_flora_bushplain1_01 = types.tree,
    t_sky_flora_bushplain1_02 = types.tree,
    t_sky_flora_bushplain1_03 = types.tree,
    t_sky_flora_treebirch1_01 = types.tree,
    t_sky_flora_treebirch1_02 = types.tree,
    t_sky_flora_treebirch1_03 = types.tree,
    t_sky_flora_treebirch1_04 = types.tree,
    t_sky_flora_treebirch1_05 = types.tree,
    t_sky_flora_treebirch1_06 = types.tree,
    t_sky_flora_treebirch1_07 = types.tree,
    t_sky_flora_treebirch1_08 = types.tree,
    t_sky_flora_treebirch2_01 = types.tree,
    t_sky_flora_treebirch2_02 = types.tree,
    t_sky_flora_treebirch2_03 = types.tree,
    t_sky_flora_treebirch2_04 = types.tree,
    t_sky_flora_treebirch2_05 = types.tree,
    t_sky_flora_treebirch2_06 = types.tree,
    t_sky_flora_treebirch2_07 = types.tree,
    t_sky_flora_treebirch2_08 = types.tree,
    t_sky_flora_treebirch3_01 = types.tree,
    t_sky_flora_treebirch3_02 = types.tree,
    t_sky_flora_treebirch3_03 = types.tree,
    t_sky_flora_treebirch3_04 = types.tree,
    t_sky_flora_treebirch3_05 = types.tree,
    t_sky_flora_treebirch3_06 = types.tree,
    t_sky_flora_treebirch3_07 = types.tree,
    t_sky_flora_treebirch3_08 = types.tree,
    t_sky_flora_treebirchdry_01 = types.tree,
    t_sky_flora_treebirchdry_02 = types.tree,
    t_sky_flora_treebirchdry_03 = types.tree,
    t_sky_flora_treebirchdry_04 = types.tree,
    t_sky_flora_treebirchdry_05 = types.tree,
    t_sky_flora_treebirchdry_06 = types.tree,
    t_sky_flora_treebirchdry_07 = types.tree,
    t_sky_flora_treebirchdry_08 = types.tree,
    t_sky_flora_treebirchdry_09 = types.tree,
    t_sky_flora_treebirchdry_10 = types.tree,
    t_sky_flora_treebirchdry_11 = types.tree,
    t_sky_flora_treebirchdry_12 = types.tree,
    t_sky_flora_treebirchdry_13 = types.tree,
    t_sky_flora_treebirchdry_14 = types.tree,
    t_sky_flora_treelarch01_01 = types.tree,
    t_sky_flora_treelarch01_02 = types.tree,
    t_sky_flora_treelarch01_03 = types.tree,
    t_sky_flora_treelarch02_01 = types.tree,
    t_sky_flora_treelarch02_02 = types.tree,
    t_sky_flora_treelarch02_03 = types.tree,
    t_sky_flora_treelarch03_01 = types.tree,
    t_sky_flora_treelarch03_02 = types.tree,
    t_sky_flora_treelarch03_03 = types.tree,
    t_sky_flora_treelarch04_01 = types.tree,
    t_sky_flora_treelarch04_02 = types.tree,
    t_sky_flora_treelarch04_03 = types.tree,
    t_sky_flora_treelarch05_01 = types.tree,
    t_sky_flora_treelarch05_02 = types.tree,
    t_sky_flora_treelarch05_03 = types.tree,
    t_sky_flora_treelarch06_01 = types.tree,
    t_sky_flora_treelarch06_02 = types.tree,
    t_sky_flora_treelarch06_03 = types.tree,
    t_sky_flora_treelarchdry_01 = types.tree,
    t_sky_flora_treelarchdry_02 = types.tree,
    t_sky_flora_treelarchdry_03 = types.tree,
    t_sky_flora_treelarchdry_04 = types.tree,
    t_sky_flora_treelarchsnow01_01 = types.tree,
    t_sky_flora_treelarchsnow01_02 = types.tree,
    t_sky_flora_treelarchsnow01_03 = types.tree,
    t_sky_flora_treelarchsnow02_01 = types.tree,
    t_sky_flora_treelarchsnow02_02 = types.tree,
    t_sky_flora_treelarchsnow02_03 = types.tree,
    t_sky_flora_treelarchsnow03_01 = types.tree,
    t_sky_flora_treelarchsnow03_02 = types.tree,
    t_sky_flora_treelarchsnow03_03 = types.tree,
    t_sky_flora_treelarchsnow04_01 = types.tree,
    t_sky_flora_treelarchsnow04_02 = types.tree,
    t_sky_flora_treelarchsnow04_03 = types.tree,
    t_sky_flora_treelarchsnow05_01 = types.tree,
    t_sky_flora_treelarchsnow05_02 = types.tree,
    t_sky_flora_treelarchsnow05_03 = types.tree,
    t_sky_flora_treelarchsnow06_01 = types.tree,
    t_sky_flora_treelarchsnow06_02 = types.tree,
    t_sky_flora_treelarchsnow06_03 = types.tree,
    t_sky_flora_treelarchsnowdry_01 = types.tree,
    t_sky_flora_treelarchsnowdry_02 = types.tree,
    t_sky_flora_treelarchsnowdry_03 = types.tree,
    t_sky_flora_treelarchsnowdry_04 = types.tree,
    t_sky_flora_treeleaf1_01 = types.tree,
    t_sky_flora_treeleaf1_02 = types.tree,
    t_sky_flora_treeleaf1_03 = types.tree,
    t_sky_flora_treeleaf1dry_01 = types.tree,
    t_sky_flora_treeleaf1dry_02 = types.tree,
    t_sky_flora_treeleaf1dry_03 = types.tree,
    t_sky_flora_treeleaf1plain_01 = types.tree,
    t_sky_flora_treeleaf1plain_02 = types.tree,
    t_sky_flora_treeleaf1plain_03 = types.tree,
    t_sky_flora_treeleaf2_01 = types.tree,
    t_sky_flora_treeleaf2_02 = types.tree,
    t_sky_flora_treeleaf2_03 = types.tree,
    t_sky_flora_treeleaf2dry_01 = types.tree,
    t_sky_flora_treeleaf2dry_02 = types.tree,
    t_sky_flora_treeleaf2dry_03 = types.tree,
    t_sky_flora_treeleaf3_01 = types.tree,
    t_sky_flora_treeleaf3_02 = types.tree,
    t_sky_flora_treeleaf3_03 = types.tree,
    t_sky_flora_treeleaf3_04 = types.tree,
    t_sky_flora_treepine1_01 = types.tree,
    t_sky_flora_treepine1_02 = types.tree,
    t_sky_flora_treepine1_03 = types.tree,
    t_sky_flora_treepine1_04 = types.tree,
    t_sky_flora_treepine1_05 = types.tree,
    t_sky_flora_treepine1_06 = types.tree,
    t_sky_flora_treepine1_07 = types.tree,
    t_sky_flora_treepine1snow_01 = types.tree,
    t_sky_flora_treepine1snow_02 = types.tree,
    t_sky_flora_treepine1snow_03 = types.tree,
    t_sky_flora_treepine1snow_04 = types.tree,
    t_sky_flora_treepine1snow_05 = types.tree,
    t_sky_flora_treepine1snow_06 = types.tree,
    t_sky_flora_treepine1snow_07 = types.tree,
    t_sky_flora_treepine2_01 = types.tree,
    t_sky_flora_treepine2_02 = types.tree,
    t_sky_flora_treepine2_03 = types.tree,
    t_sky_flora_treepine2_04 = types.tree,
    t_sky_flora_treepine2_05 = types.tree,
    t_sky_flora_treepine2_06 = types.tree,
    t_sky_flora_treepine2_07 = types.tree,
    t_sky_flora_treepine2snow_01 = types.tree,
    t_sky_flora_treepine2snow_02 = types.tree,
    t_sky_flora_treepine2snow_03 = types.tree,
    t_sky_flora_treepine2snow_04 = types.tree,
    t_sky_flora_treepine2snow_05 = types.tree,
    t_sky_flora_treepine2snow_06 = types.tree,
    t_sky_flora_treepine2snow_07 = types.tree,
    t_sky_flora_treepine3_01 = types.tree,
    t_sky_flora_treepine3_02 = types.tree,
    t_sky_flora_treepine3_03 = types.tree,
    t_sky_flora_treepine3_04 = types.tree,
    t_sky_flora_treepine3_05 = types.tree,
    t_sky_flora_treepine3_06 = types.tree,
    t_sky_flora_treepine3_07 = types.tree,
    t_sky_flora_treepine3_08 = types.tree,
    t_sky_flora_treepine3_09 = types.tree,
    t_sky_flora_treepine3snow_01 = types.tree,
    t_sky_flora_treepine3snow_02 = types.tree,
    t_sky_flora_treepine3snow_03 = types.tree,
    t_sky_flora_treepine3snow_04 = types.tree,
    t_sky_flora_treepine3snow_05 = types.tree,
    t_sky_flora_treepine3snow_06 = types.tree,
    t_sky_flora_treepine3snow_07 = types.tree,
    t_sky_flora_treepine3snow_08 = types.tree,
    t_sky_flora_treepine3snow_09 = types.tree,
    t_sky_flora_treepine4_01 = types.tree,
    t_sky_flora_treepine4_02 = types.tree,
    t_sky_flora_treepine4_03 = types.tree,
    t_sky_flora_treepine4snow_01 = types.tree,
    t_sky_flora_treepine4snow_02 = types.tree,
    t_sky_flora_treepine4snow_03 = types.tree,
    t_sky_flora_treepine5_01 = types.tree,
    t_sky_flora_treepine5_02 = types.tree,
    t_sky_flora_treepine5_03 = types.tree,
    t_sky_flora_treepine5snow_01 = types.tree,
    t_sky_flora_treepine5snow_02 = types.tree,
    t_sky_flora_treepine5snow_03 = types.tree,
    t_sky_flora_treepine6_01 = types.tree,
    t_sky_flora_treepine6_02 = types.tree,
    t_sky_flora_treepine6_03 = types.tree,
    t_sky_flora_treepine6snow_01 = types.tree,
    t_sky_flora_treepine6snow_02 = types.tree,
    t_sky_flora_treepine6snow_03 = types.tree,
    t_sky_flora_treepine7_01 = types.tree,
    t_sky_flora_treepine7_02 = types.tree,
    t_sky_flora_treepine7_03 = types.tree,
    t_sky_flora_treepine7_04 = types.tree,
    t_sky_flora_treepine7_05 = types.tree,
    t_sky_flora_treepine7_06 = types.tree,
    t_sky_flora_treepine7_07 = types.tree,
    t_sky_flora_treepine7snow_01 = types.tree,
    t_sky_flora_treepine7snow_02 = types.tree,
    t_sky_flora_treepine7snow_03 = types.tree,
    t_sky_flora_treepine7snow_04 = types.tree,
    t_sky_flora_treepine7snow_05 = types.tree,
    t_sky_flora_treepine7snow_06 = types.tree,
    t_sky_flora_treepine7snow_07 = types.tree,
    t_sky_flora_treepine7snow_08 = types.tree,
    t_sky_flora_treepine7snow_09 = types.tree,
    t_sky_flora_treepine7snow_10 = types.tree,
    t_sky_flora_treepine7snow_11 = types.tree,
    t_sky_flora_treepine7snow_12 = types.tree,
    t_sky_flora_treepine7snow_13 = types.tree,
    t_sky_flora_treepine7snow_14 = types.tree,

    --Vegetation
    t_sky_flora_grass1_01 = types.vegetation,
    t_sky_flora_grass1_02 = types.vegetation,
    t_sky_flora_grass1_03 = types.vegetation,
    t_sky_flora_grass2_01 = types.vegetation,
    t_sky_flora_grass2_02 = types.vegetation,
    t_sky_flora_grass2_03 = types.vegetation,
    t_sky_flora_grass3_01 = types.vegetation,
    t_sky_flora_grass3_02 = types.vegetation,
    t_sky_flora_grass3_03 = types.vegetation,
    t_sky_flora_grass4_01 = types.vegetation,
    t_sky_flora_grass5_01 = types.vegetation,
    t_sky_flora_grasscoast_01 = types.vegetation,
    t_sky_flora_grasscoast_02 = types.vegetation,
    t_sky_flora_grasscoast_03 = types.vegetation,
    t_sky_flora_grasscoast_04 = types.vegetation,
    t_sky_flora_grassdry1_01 = types.vegetation,
    t_sky_flora_grassdry1_02 = types.vegetation,
    t_sky_flora_grassdry1_03 = types.vegetation,
    t_sky_flora_grassfern1_01 = types.vegetation,
    t_sky_flora_grassshrub1_01 = types.vegetation,
    t_sky_flora_grassshrub1_02 = types.vegetation,
    t_sky_flora_grassshrub2_01 = types.vegetation,
    t_sky_flora_grassshrub2_02 = types.vegetation,
    t_sky_flora_grassshrub3_01 = types.vegetation,
    t_sky_flora_grassshrub3_02 = types.vegetation,
    t_sky_flora_grassshrub3_03 = types.vegetation,
    t_sky_flora_grassshrub4_01 = types.vegetation,
    t_sky_flora_grassshrub4_02 = types.vegetation,
    t_sky_flora_grassshrub5_01 = types.vegetation,
    t_sky_flora_grassshrub5_02 = types.vegetation,
    t_sky_flora_grassshrub5_03 = types.vegetation,
    t_sky_flora_grassshrub6_01 = types.vegetation,
    t_sky_flora_grassshrub6_02 = types.vegetation,
    t_sky_flora_grassshrubdry1_01 = types.vegetation,
    t_sky_flora_grassshrubdry1_02 = types.vegetation,
    t_sky_flora_grassshrubmed1_01 = types.vegetation,
    t_sky_flora_grassshrubmed1_02 = types.vegetation,
    t_sky_flora_grassshrubmed1_03 = types.vegetation,
    t_sky_flora_grassshrubsml1_01 = types.vegetation,
    t_sky_flora_grassshrubsml2_01 = types.vegetation,
    t_sky_flora_grassshrubsml3_01 = types.vegetation,
    t_sky_flora_grassshrubsml4_01 = types.vegetation,
    t_sky_flora_grassshrubsml5_01 = types.vegetation,
    t_sky_flora_grassshrubsml6_01 = types.vegetation,
    t_sky_flora_grassshrubsml7_01 = types.vegetation,
    t_sky_flora_grassshrubsml8_01 = types.vegetation,
    t_sky_flora_grassshrubsml9_01 = types.vegetation,
    t_sky_flora_grasssnow1_01 = types.vegetation,
    t_sky_flora_grasssnow1_02 = types.vegetation,
    t_sky_flora_grasssnow1_03 = types.vegetation,
    t_sky_flora_seaweed_01 = types.vegetation,
    t_sky_flora_seaweed_02 = types.vegetation,
    t_sky_flora_seaweedhang_01 = types.vegetation,
    t_sky_flora_seaweedhang_02 = types.vegetation,
    t_sky_flora_seaweedhang_03 = types.vegetation,
    t_sky_flora_seaweedhang_04 = types.vegetation,
    t_sky_flora_treebirchbush_01 = types.vegetation,
    t_sky_flora_treebirchbush_02 = types.vegetation,
    t_sky_flora_treebirchbush_03 = types.vegetation,
    t_sky_flora_treebirchbush_04 = types.vegetation,

    --Wood
    t_sky_flora_driftwood_01 = types.wood,
    t_sky_flora_driftwood_02 = types.wood,
    t_sky_flora_driftwood_03 = types.wood,
    t_sky_flora_treebirchbranch_01 = types.wood,
    t_sky_flora_treebirchbranch_02 = types.wood,
    t_sky_flora_treebirchbranch_03 = types.wood,
    t_sky_flora_treebirchbranch_04 = types.wood,
    t_sky_flora_treebirchlog_01 = types.wood,
    t_sky_flora_treebirchlog_02 = types.wood,
    t_sky_flora_treebirchlog_03 = types.wood,
    t_sky_flora_treebirchsnowlog_01 = types.wood,
    t_sky_flora_treebirchsnowlog_02 = types.wood,
    t_sky_flora_treebirchsnowlog_03 = types.wood,
    t_sky_flora_treelarchlog_01 = types.wood,
    t_sky_flora_treelarchlog_02 = types.wood,
    t_sky_flora_treelarchsnowlog_01 = types.wood,
    t_sky_flora_treelarchsnowlog_02 = types.wood,
    t_sky_flora_treeleaf1log_01 = types.wood,
    t_sky_flora_treeleaf1log_02 = types.wood,
    t_sky_flora_treeleaf1log_03 = types.wood,
    t_sky_flora_treeleaf1log_04 = types.wood,
    t_sky_flora_treeleaf2log_01 = types.wood,
    t_sky_flora_treeleaf2log_02 = types.wood,
    t_sky_flora_treeleaf2log_03 = types.wood,
    t_sky_flora_treeleaf2log_04 = types.wood,
    t_sky_flora_treepine1log_01 = types.wood,
    t_sky_flora_treepine1log_02 = types.wood,
    t_sky_flora_treepine1log_03 = types.wood,
    t_sky_flora_treepine1log_04 = types.wood,
    t_sky_flora_treepine1log_05 = types.wood,
    t_sky_flora_treepine1snowlog_01 = types.wood,
    t_sky_flora_treepine1snowlog_02 = types.wood,
    t_sky_flora_treepine1snowlog_03 = types.wood,
    t_sky_flora_treepine1snowlog_04 = types.wood,
    t_sky_flora_treepine1snowlog_05 = types.wood,
    t_sky_flora_treepine3log_01 = types.wood,
    t_sky_flora_treepine3log_02 = types.wood,
    t_sky_flora_treepine3log_03 = types.wood,
    t_sky_flora_treepine3log_04 = types.wood,
    t_sky_flora_treepine3log_05 = types.wood,
    t_sky_flora_treepine3snowlog_01 = types.wood,
    t_sky_flora_treepine3snowlog_02 = types.wood,
    t_sky_flora_treepine3snowlog_03 = types.wood,
    t_sky_flora_treepine3snowlog_04 = types.wood,
    t_sky_flora_treepine3snowlog_05 = types.wood,
    t_sky_flora_treepine6log_01 = types.wood,
    t_sky_flora_treepine6log_02 = types.wood,
    t_sky_flora_treepine6snowlog_01 = types.wood,
    t_sky_flora_treepine6snowlog_02 = types.wood,
    t_sky_flora_treepine7log_01 = types.wood,
    t_sky_flora_treepine7log_02 = types.wood,
    t_sky_flora_treepine7log_03 = types.wood,
    t_sky_flora_treepine7log_04 = types.wood,
    t_sky_flora_treepine7log_05 = types.wood,
    t_sky_flora_treepine7snowlog_01 = types.wood,
    t_sky_flora_treepine7snowlog_02 = types.wood,
    t_sky_flora_treepine7snowlog_03 = types.wood,
    t_sky_flora_treepine7snowlog_04 = types.wood,
    t_sky_flora_treepine7snowlog_05 = types.wood,

    --Stump
    t_sky_flora_treebirchsnowstm_01 = types.stump,
    t_sky_flora_treebirchsnowstm_02 = types.stump,
    t_sky_flora_treebirchsnowstm_03 = types.stump,
    t_sky_flora_treebirchsnowstm_04 = types.stump,
    t_sky_flora_treebirchstm_01 = types.stump,
    t_sky_flora_treebirchstm_02 = types.stump,
    t_sky_flora_treebirchstm_03 = types.stump,
    t_sky_flora_treebirchstm_04 = types.stump,
    t_sky_flora_treebirchstm_05 = types.stump,
    t_sky_flora_treebirchstm_06 = types.stump,
    t_sky_flora_treebirchstm_07 = types.stump,
    t_sky_flora_treebirchstm_08 = types.stump,
    t_sky_flora_treebirchstm_09 = types.stump,
    t_sky_flora_treebirchstm_10 = types.stump,
    t_sky_flora_treebirchstm_11 = types.stump,
    t_sky_flora_treebirchstm_12 = types.stump,
    t_sky_flora_treelarchsnowstm_01 = types.stump,
    t_sky_flora_treelarchsnowstm_02 = types.stump,
    t_sky_flora_treelarchsnowstm_03 = types.stump,
    t_sky_flora_treelarchstm_01 = types.stump,
    t_sky_flora_treelarchstm_02 = types.stump,
    t_sky_flora_treelarchstm_03 = types.stump,
    t_sky_flora_treeleaf1stump_01 = types.stump,
    t_sky_flora_treeleaf1stump_02 = types.stump,
    t_sky_flora_treeleaf1stump_03 = types.stump,
    t_sky_flora_treeleaf1stump_04 = types.stump,
    t_sky_flora_treeleaf2stump_01 = types.stump,
    t_sky_flora_treeleaf2stump_02 = types.stump,
    t_sky_flora_treeleaf2stump_03 = types.stump,
    t_sky_flora_treeleaf2stump_04 = types.stump,
    t_sky_flora_treepine1snowstm_01 = types.stump,
    t_sky_flora_treepine1snowstm_02 = types.stump,
    t_sky_flora_treepine1snowstm_03 = types.stump,
    t_sky_flora_treepine1snowstm_04 = types.stump,
    t_sky_flora_treepine1snowstm_05 = types.stump,
    t_sky_flora_treepine1snowstm_06 = types.stump,
    t_sky_flora_treepine1stump_01 = types.stump,
    t_sky_flora_treepine1stump_02 = types.stump,
    t_sky_flora_treepine1stump_03 = types.stump,
    t_sky_flora_treepine1stump_04 = types.stump,
    t_sky_flora_treepine1stump_05 = types.stump,
    t_sky_flora_treepine1stump_06 = types.stump,
    t_sky_flora_treepine3snowstm_01 = types.stump,
    t_sky_flora_treepine3snowstm_02 = types.stump,
    t_sky_flora_treepine3snowstm_03 = types.stump,
    t_sky_flora_treepine3snowstm_04 = types.stump,
    t_sky_flora_treepine3snowstm_05 = types.stump,
    t_sky_flora_treepine3snowstm_06 = types.stump,
    t_sky_flora_treepine3stump_01 = types.stump,
    t_sky_flora_treepine3stump_02 = types.stump,
    t_sky_flora_treepine3stump_03 = types.stump,
    t_sky_flora_treepine3stump_04 = types.stump,
    t_sky_flora_treepine3stump_05 = types.stump,
    t_sky_flora_treepine3stump_06 = types.stump,
    t_sky_flora_treepine4stump_01 = types.stump,
    t_sky_flora_treepine4stump_02 = types.stump,
    t_sky_flora_treepine4stump_03 = types.stump,
    t_sky_flora_treepine4stump_04 = types.stump,
    t_sky_flora_treepine6snowstm_01 = types.stump,
    t_sky_flora_treepine6stump_01 = types.stump,
    t_sky_flora_treepine7snowstm_01 = types.stump,
    t_sky_flora_treepine7snowstm_02 = types.stump,
    t_sky_flora_treepine7snowstm_03 = types.stump,
    t_sky_flora_treepine7snowstm_04 = types.stump,
    t_sky_flora_treepine7snowstm_05 = types.stump,
    t_sky_flora_treepine7snowstm_06 = types.stump,
    t_sky_flora_treepine7stump_01 = types.stump,
    t_sky_flora_treepine7stump_02 = types.stump,
    t_sky_flora_treepine7stump_03 = types.stump,
    t_sky_flora_treepine7stump_04 = types.stump,
    t_sky_flora_treepine7stump_05 = types.stump,
    t_sky_flora_treepine7stump_06 = types.stump,

    --Dead tree
    t_sky_flora_treepine6dead_01 = types.deadTree,
    t_sky_flora_treepine6dead_02 = types.deadTree,
    t_sky_flora_treepine6dead_03 = types.deadTree,
    t_sky_flora_treepine6dead_04 = types.deadTree,
    t_sky_flora_treepine6dead_05 = types.deadTree,
}

interop.registerActivators(activators)

return activators