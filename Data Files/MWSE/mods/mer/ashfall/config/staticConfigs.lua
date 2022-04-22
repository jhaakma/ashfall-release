local this = {}

this.activatorConfig = require("mer.Ashfall.activators.activatorConfig")
this.conditionConfig = require("mer.Ashfall.conditions.conditionConfig")
this.foodConfig = require("mer.Ashfall.config.foodConfig")
this.teaConfig = require("mer.Ashfall.config.teaConfig")
this.campfireConfig = require("mer.Ashfall.config.campfireConfig")

this.objectIds = {
    firewood = "ashfall_firewood",
    campfire = "ashfall_campfire",
    cookingPot = "ashfall_cooking_pot",
    grill = "ashfall_grill",
    kettle = "ashfall_kettle",
    bedroll = "ashfall_bedroll",
    bedroll_ashl = "ashfall_bedroll_ashl",
    coveredBedroll = "ashfall_cbroll_misc",
    canvasTent = "ashfall_tent_misc",
    ashlanderTent = "ashfall_tent_ashl_misc",
    woodaxe = "ashfall_woodaxe",
    pack_b = "ashfall_pack_01",
    pack_w = "ashfall_pack_01",
    pack_n = "ashfall_pack_01",
}
this.crateIds = {
    camping = "ashfall_crate_camping",
    food = "ashfall_crate_food",
}

this.innkeeperClasses = {
    publican = true,
    t_sky_publican = true,
    t_cyr_publican = true
}


this.maxSunTemp = 15

--Campfire values
this.hotWaterHeatValue = 80
this.stewWaterCooldownAmount = 100
this.stewIngredientCooldownAmount = 20
this.stewIngredAddAmount = 25 -- out of pot capacity, not 100
this.firewoodFuelMulti = 1.5
this.maxWoodInFire = 15




--For placement magic
this.placementConfig = {
    ashfall_bedroll_ashl = { maxSteepness = 0, drop = 10 },
    ashfall_bedroll = { maxSteepness = 0, },
    ashfall_cbroll_misc = { maxSteepness = 0 },
    ashfall_strawbed = { maxSteepness = 0, drop = 5  },

    ashfall_tent_misc = { maxSteepness = 0.4},
    ashfall_tent_ashl_misc = { maxSteepness = 0.4},
    ashfall_tent_canv_b_misc = { maxSteepness = 0.4},
    ashfall_tent_test_misc = { maxSteepness = 0.4},

    ashfall_tent_base_a = { maxSteepness = 0.4, drop = 170},
    ashfall_tent_imp_a = { maxSteepness = 0.4, drop = 170},
    ashfall_tent_qual_a = { maxSteepness = 0.4, drop = 170},
    ashfall_tent_ashl_a = { maxSteepness = 0.4, drop = 170},
    ashfall_tent_leather_a = { maxSteepness = 0.4, drop = 170},

    ashfall_tent_active = { maxSteepness = 0.4, drop = 70},
    ashfall_tent_ashl_active = { maxSteepness = 0.4, drop = 70},
    ashfall_tent_canv_b_active = { maxSteepness = 0.4, drop = 70},
    ashfall_tent_test_active = { maxSteepness = 0.4, drop = 70},

    a_bed_roll = { maxSteepness = 0.1 },

    ashfall_firewood = { maxSteepness = 0.5 },
    ashfall_grill = { maxSteepness = 0.5 },
    mer_lute = { maxSteepness = math.rad(50) },
    mer_lute_fat = { maxSteepness = math.rad(50) },

    ashfall_woodaxe = { maxSteepness = math.rad(50) },
    ashfall_sack_01 = { maxSteepness = math.rad(5) },
    ashfall_sack_c = { maxSteepness = math.rad(5) },

    ashfall_cushion_01 = { maxSteepness = 0.2, drop = 5 },
    ashfall_cushion_02 = { maxSteepness = 0.2, drop = 5 },
    ashfall_cushion_03 = { maxSteepness = 0.2, drop = 5 },
    ashfall_cushion_04 = { maxSteepness = 0.2, drop = 5 },
    ashfall_cushion_05 = { maxSteepness = 0.2, drop = 5 },
    ashfall_cushion_06 = { maxSteepness = 0.2, drop = 5 },
    ashfall_cushion_07 = { maxSteepness = 0.2, drop = 5 },

    ashfall_cushion_sq_01 = { maxSteepness = 0.2, drop = 5 },
    ashfall_cushion_sq_02 = { maxSteepness = 0.2, drop = 5 },
    ashfall_cushion_sq_03 = { maxSteepness = 0.2, drop = 5 },
    ashfall_cushion_sq_04 = { maxSteepness = 0.2, drop = 5 },
    ashfall_cushion_sq_05 = { maxSteepness = 0.2, drop = 5 },
    ashfall_cushion_sq_06 = { maxSteepness = 0.2, drop = 5 },
    ashfall_cushion_sq_07 = { maxSteepness = 0.2, drop = 5 },

    ashfall_cush_crft_01 = { maxSteepness = 0.2, drop = 0 },

    ashfall_rug_01 = { maxSteepness = 1, drop = -2 },
    ashfall_rug_02 = { maxSteepness = 1, drop = -2 },
    ashfall_rug_03 = { maxSteepness = 1, drop = -2 },
    ashfall_rug_04 = { maxSteepness = 1, drop = -2 },
    ashfall_rug_crft_01 = { maxSteepness = 1, drop = -2 },

    ashfall_crabpot_01_m = { maxSteepness = 1, drop = 25 },

    ashfall_cooking_pot = { maxSteepness = 0.05 },
    ashfall_cooking_pot_iron = { maxSteepness = 0.05 },
    ashfall_cooking_pot_steel = { maxSteepness = 0.05 },

    ashfall_teawarmer_01_a = { maxSteepness = 0.05 },

    ashfall_kettle_01 = { maxSteepness = 0.05 },
    ashfall_kettle_02 = { maxSteepness = 0.05 },
    ashfall_kettle_03 = { maxSteepness = 0.05 },
    ashfall_kettle_04 = { maxSteepness = 0.05 },
    ashfall_kettle_05 = { maxSteepness = 0.05 },
    ashfall_kettle_06 = { maxSteepness = 0.05 },
    ashfall_kettle_07 = { maxSteepness = 0.05 },
    ashfall_kettle_08 = { maxSteepness = 0.05 },

    ashfall_bowl_01 = { maxSteepness = 0.05 },

    ashfall_misc_stove_01 = { maxSteepness = 0.05 },

    ashfall_table_sml = {maxSteepness = 0, drop = 10 },
    ashfall_table_sml_2 = {maxSteepness = 0, drop = 10 },

    ashfall_chest_01_m = { maxSteepness = 0.1 },

    ashfall_supports_01 = { maxSteepness = 0, drop = 20 },
    ashfall_supports_02 = { maxSteepness = 0,  drop = 20 },
    ashfall_supports_03 = { maxSteepness = 0, drop = 10 },
}

this.capacities = {
    --cookingPot = 120,
    kettle = 100,
    potion = 15,
    MAX = 240
}

this.bottleConfig = {
    cup = { capacity = 25, weight = 2 },
    glass = { capacity = 25, weight = 2 },
    goblet = { capacity = 25, weight = 2 },
    mug = { capacity = 30, weight = 2 },
    tankard = { capacity = 30, weight = 2 },

    --expensive, small, good weight efficiency
    flask = {
        capacity = 80,
        value = 9,
        weight = 3 ,
    }, --waterPerDollar = 10, waterPerWeight = 30

    limewareFlask = {
        capacity = 80,
        weight = 4 ,
    }, --waterPerDollar = 10, waterPerWeight = 30

    --cheap, small, medium weight efficiency
    bottle = {
        capacity = 90,
        value = 3,
        weight = 4,
    },-- waterPerDollar = 33, waterPerWeight = 25

    --Pots: cheap, medium sized, low weight efficiency
    pot = {
        holdsStew = true,
        capacity = 100,
        value = 4,
        weight = 6
    },--waterPerDollar = 30, waterPerWeight = 20
    redwarePot = {
        holdsStew = true,
        capacity = 100,
        value = 7,
        weight = 5
    },--waterPerDollar = 17, waterPerWeight = 24
    noValPot = {
        holdsStew = true,
        capacity = 100,
        weight = 6
    },
    --cheap, very large, low weight efficiency
    jug = {
        capacity = 200,
        value = 5,
        weight = 10
    },--waterPerDollar = 44, waterPerWeight = 22

    --Pitchers tend to be best for large storage at home, not very portable

    --cheap, large, low weight efficiency
    pitcher = {
        capacity = 190,
        value = 7,
        weight = 8,
    },--waterPerDollar = 25, waterPerWeight = 25

    --very cheap, large, very low weight efficiency
    metalPitcher = {
        capacity = 190,
        value = 5,
        weight = 8
    },--waterPerDollar = 100, waterPerWeight = 25

    --expensive, large, medium weight efficiency
    redwarePitcher = {
        capacity = 200,
        value = 12,
        weight = 8
    },--waterPerDollar = 25, waterPerWeight = 27.5

    --Expensive, large, medium weight efficiency
    silverwarePitcher = {
        capacity = 200,
        value = 30,
        weight = 7,
    },--waterPerDollar = 7, waterPerWeight = 28.5


    --Expensive, large, medium weight efficiency
    dwarvenPitcher = {
        capacity = 220,
        value = 40,
        weight = 8
    }, --waterPerDollar = 5.5, waterPerWeight = 30
}

---@class AshfallBottleData
---@field capacity number
---@field holdsStew boolean
---@field type string

---@type table<string, AshfallBottleData>
this.bottleList = {

    ashfall_water_filter = {
        capacity = 60,--sync with wooden bowl
        holdsStew = false,
        waterMaxHeight = 4,
        waterMaxScale = 1.8,
    },

    _infinite_water_source = {
        capacity = math.huge,
        holdsStew = false
    },


    --ashfall stuff
    ashfall_waterskin = {
        capacity = 80
    },


    --vial
    misc_skooma_vial = this.bottleConfig.glass,

    --glasses
    misc_de_glass_green_01 = this.bottleConfig.glass,
    misc_de_glass_yellow_01 = this.bottleConfig.glass,
    --cups
    misc_com_redware_cup = this.bottleConfig.cup,
    misc_com_wood_cup_01 = this.bottleConfig.cup,
    misc_com_wood_cup_02 = this.bottleConfig.cup,
    misc_lw_cup = this.bottleConfig.cup,
    misc_imp_silverware_cup = this.bottleConfig.cup,
    misc_imp_silverware_cup_01 = this.bottleConfig.cup,

    --goblets
    misc_com_metal_goblet_01 = this.bottleConfig.goblet,
    misc_com_metal_goblet_02 = this.bottleConfig.goblet,
    misc_de_goblet_01 = this.bottleConfig.goblet,
    misc_de_goblet_02 = this.bottleConfig.goblet,
    misc_de_goblet_03 = this.bottleConfig.goblet,
    misc_de_goblet_04 = this.bottleConfig.goblet,
    misc_de_goblet_05 = this.bottleConfig.goblet,
    misc_de_goblet_06 = this.bottleConfig.goblet,
    misc_de_goblet_07 = this.bottleConfig.goblet,
    misc_de_goblet_08 = this.bottleConfig.goblet,
    misc_de_goblet_09 = this.bottleConfig.goblet,
    misc_dwrv_goblet00 = this.bottleConfig.goblet,
    misc_dwrv_goblet10 = this.bottleConfig.goblet,
    misc_dwrv_goblet00_uni = this.bottleConfig.goblet,
    misc_dwrv_goblet10_uni = this.bottleConfig.goblet,
    misc_dwrv_goblet10_tgcp = this.bottleConfig.goblet,
    misc_de_goblet_01_redas = this.bottleConfig.goblet,

    --tankards
    misc_com_tankard_01 = this.bottleConfig.tankard,
    misc_de_tankard_01 = this.bottleConfig.tankard,


    --mugs
    misc_dwrv_mug00 = this.bottleConfig.mug,
    misc_dwrv_mug00_uni = this.bottleConfig.mug,

    --flasks
    misc_flask_01 = this.bottleConfig.flask,
    misc_flask_02 = this.bottleConfig.flask,
    misc_flask_03 = this.bottleConfig.flask,
    misc_flask_04 = this.bottleConfig.flask,

    misc_com_redware_flask = this.bottleConfig.flask,
    misc_lw_flask = this.bottleConfig.limewareFlask,

    --bottles
    misc_com_bottle_01 = this.bottleConfig.bottle,
    misc_com_bottle_02 = this.bottleConfig.bottle,
    misc_com_bottle_04 = this.bottleConfig.bottle,
    misc_com_bottle_05 = this.bottleConfig.bottle,
    misc_com_bottle_06 = this.bottleConfig.bottle,

    misc_com_bottle_08 = this.bottleConfig.bottle,
    misc_com_bottle_09 = this.bottleConfig.bottle,
    misc_com_bottle_10 = this.bottleConfig.bottle,
    misc_com_bottle_11 = this.bottleConfig.bottle,
    misc_com_bottle_13 = this.bottleConfig.bottle,
    misc_com_bottle_14 = this.bottleConfig.bottle,
    misc_com_bottle_14_float = this.bottleConfig.bottle,
    misc_com_bottle_15 = this.bottleConfig.bottle,

    --pots
    misc_de_pot_blue_01 = this.bottleConfig.pot,
    misc_de_pot_blue_02 = this.bottleConfig.pot,
    misc_de_pot_glass_peach_01 = this.bottleConfig.pot,
    misc_de_pot_glass_peach_02 = this.bottleConfig.pot,
    misc_de_pot_green_01 = this.bottleConfig.pot,
    misc_de_pot_mottled_01 = this.bottleConfig.pot,
    --redware pots
    misc_de_pot_redware_01 = this.bottleConfig.redwarePot,
    misc_de_pot_redware_02 = this.bottleConfig.redwarePot,
    misc_de_pot_redware_03 = this.bottleConfig.redwarePot,
    misc_de_pot_redware_04 = this.bottleConfig.redwarePot,
    misc_de_pot_redware_04_uni = this.bottleConfig.redwarePot,

    --jugs
    misc_com_bottle_03 = this.bottleConfig.jug,
    misc_com_bottle_07 = this.bottleConfig.jug,
    misc_com_bottle_07_float = this.bottleConfig.jug,
    misc_com_bottle_12 = this.bottleConfig.jug,

    --pitchers
    misc_de_pitcher_01 = this.bottleConfig.pitcher,
    misc_com_redware_pitcher = this.bottleConfig.redwarePitcher,
    misc_com_pitcher_metal_01 = this.bottleConfig.metalPitcher,
    misc_imp_silverware_pitcher = this.bottleConfig.silverwarePitcher,
    misc_imp_silverware_pitcher_uni = this.bottleConfig.silverwarePitcher,

    misc_dwrv_pitcher00 = this.bottleConfig.dwarvenPitcher,
    misc_dwrv_pitcher00_uni = this.bottleConfig.dwarvenPitcher,

    --MODS

    --seydaneen gateway
    misc_com_bottle_water = this.bottleConfig.bottle,

    --Tamriel Data
    t_ayl_claycup_01 = this.bottleConfig.cup,
    t_ayl_claypot_01 = this.bottleConfig.pot,
    t_ayl_claypot_02 = this.bottleConfig.pot,
    t_ayl_claypot_03 = this.bottleConfig.pot,

    t_nor_claypot_01 = this.bottleConfig.pot,
    t_nor_claypot_02 = this.bottleConfig.pot,

    t_rga_blackwarecup_01 = this.bottleConfig.cup,
    t_rga_redwarecup_01 = this.bottleConfig.cup,
    t_rga_redwarecup_02 = this.bottleConfig.cup,
    t_rga_redwarecup_03 = this.bottleConfig.cup,

    t_he_dirennicup_01 = this.bottleConfig.cup,
    t_he_dirennicup_02 = this.bottleConfig.cup,

    t_he_direnniflask_01a = this.bottleConfig.limewareFlask,
    t_he_direnniflask_02a = this.bottleConfig.limewareFlask,
    t_he_direnniflask_03a = this.bottleConfig.limewareFlask,
    t_he_direnniflask_04a = this.bottleConfig.limewareFlask,
    t_he_direnniflask_05a = this.bottleConfig.limewareFlask,
    t_he_direnniflask_06a = this.bottleConfig.limewareFlask,
    t_he_direnniflask_07a = this.bottleConfig.limewareFlask,
    t_he_direnniflask_07b = this.bottleConfig.limewareFlask,

    t_he_dirennipot_01 = this.bottleConfig.noValPot,
    t_he_dirennipot_02 = this.bottleConfig.noValPot,
    t_he_dirennipot_03 = this.bottleConfig.noValPot,
    t_he_dirennipot_04 = this.bottleConfig.noValPot,

    t_nor_drinkinghorn_01 = { capacity = this.bottleConfig.tankard.capacity },
    t_nor_drinkinghorn_02 = { capacity = this.bottleConfig.tankard.capacity },
    t_nor_drinkinghorn_03 = { capacity = this.bottleConfig.tankard.capacity },

    t_nor_flaskblue_01 = this.bottleConfig.flask,
    t_nor_flaskblue_02 = this.bottleConfig.flask,
    t_nor_flaskblue_03 = this.bottleConfig.flask,
    t_nor_flaskblue_04 = this.bottleConfig.flask,

    t_nor_flaskgreen_01 = this.bottleConfig.flask,
    t_nor_flaskgreen_02 = this.bottleConfig.flask,
    t_nor_flaskgreen_03 = this.bottleConfig.flask,
    t_nor_flaskgreen_04 = this.bottleConfig.flask,

    t_nor_flaskred_01 = this.bottleConfig.flask,
    t_nor_flaskred_02 = this.bottleConfig.flask,
    t_nor_flaskred_03 = this.bottleConfig.flask,
    t_nor_flaskred_04 = this.bottleConfig.flask,

    t_rga_flask_01 = this.bottleConfig.limewareFlask,

    t_com_potionbottle_01 = { capacity = this.bottleConfig.bottle.capacity, weight = this.bottleConfig.bottle.weight },
    t_com_potionbottle_03 = { capacity = this.bottleConfig.bottle.capacity, weight = this.bottleConfig.bottle.weight },
    t_com_potionbottle_04 = { capacity = this.bottleConfig.bottle.capacity, weight = this.bottleConfig.bottle.weight },

    t_imp_silverwarecup_01 = { capacity = this.bottleConfig.cup.capacity },
    t_imp_silverwarecup_02 = { capacity = this.bottleConfig.cup.capacity },
    t_imp_silverwarecup_03 = { capacity = this.bottleConfig.cup.capacity },
    t_imp_silverwarepot_01 = this.bottleConfig.noValPot,

    t_de_stonewarecup_01 = { capacity = this.bottleConfig.cup.capacity },
    t_de_stonewarecup_02 = { capacity = this.bottleConfig.cup.capacity },

    t_de_stonewarepot_01 = this.bottleConfig.noValPot,
    t_de_stonewarepot_02 = this.bottleConfig.noValPot,
    t_de_stonewarepot_03 = this.bottleConfig.noValPot,

    t_com_woodencup_01 = this.bottleConfig.cup,
    t_nor_woodengoblet_01a = this.bottleConfig.goblet,
    t_nor_woodengoblet_01b = this.bottleConfig.goblet,
    t_nor_woodengoblet_01c = this.bottleConfig.goblet,
    t_nor_woodengoblet_02a = this.bottleConfig.goblet,
    t_nor_woodengoblet_02b = this.bottleConfig.goblet,
    t_nor_woodengoblet_03a = this.bottleConfig.goblet,
    t_nor_woodengoblet_03b = this.bottleConfig.goblet,
    t_nor_woodengoblet_04a = this.bottleConfig.goblet,
    t_nor_woodengoblet_04b = this.bottleConfig.goblet,
    t_nor_woodentankard_01a = this.bottleConfig.mug,
    t_nor_woodentankard_01b = this.bottleConfig.mug,
    t_nor_woodenpot_01a = this.bottleConfig.noValPot,
    t_nor_woodenpot_01b = this.bottleConfig.noValPot,
    t_nor_woodenpot_02a = this.bottleConfig.noValPot,
    t_nor_woodenpot_02b = this.bottleConfig.noValPot,
    t_nor_woodenpot_03a = this.bottleConfig.noValPot,
    t_nor_woodenpot_03b = this.bottleConfig.noValPot,

    t_de_telvannitankard_01 = this.bottleConfig.tankard,
    t_com_tankard_01 = this.bottleConfig.tankard,
    t_de_bluewaretankard01 = this.bottleConfig.tankard,
    t_de_yellowglasscup01 = this.bottleConfig.cup,
    t_de_yellowglassflask01 = this.bottleConfig.flask,
    t_de_yellowglasspot01 = this.bottleConfig.noValPot,

    ashfall_teacup_01 = {
        capacity = 25,
        waterMaxScale = 1.9,
        waterMaxHeight = 2.5,
    },
    ashfall_teacup_02 = {
        capacity = 25,
        waterMaxScale = 1.9,
        waterMaxHeight = 2.5,
    },
    ashfall_teacup_03 = {
        capacity = 25,
        waterMaxScale = 1.9,
        waterMaxHeight = 2.5,
    },

    --bushcrafting
    ashfall_bowl_01 = {
        capacity = 60,
        waterMaxHeight = 4,
        waterMaxScale = 1.8,
        holdsStew = true,
    },

    ashfall_cup_01 = {
        capacity = 25,
        waterMaxScale = 1.3,
        waterMaxHeight = 4.0,
    },
}
for id, _ in pairs(this.bottleList) do
    this.activatorConfig.list.waterContainer:addId(id)
end

this.interiorTempValues = {
    default = -10,
    sewer = -20,
    eggmine = -30,
    ruin = -35,
    dungeon = -40,
    cave = -45,
    tomb = -50,
    barrow = -65
}
this.interiorTempPatterns = {
    [" sewers"]     = this.interiorTempValues.sewer,
    [" eggmine"]     = this.interiorTempValues.eggmine,
    [" egg mine"]     = this.interiorTempValues.eggmine,
    [" grotto"]     = this.interiorTempValues.dungeon,
    [" dungeon"]    = this.interiorTempValues.dungeon,
    [" tomb"]         = this.interiorTempValues.tomb,
    [" crypt"]         = this.interiorTempValues.tomb,
    [" catacomb"]     = this.interiorTempValues.tomb,
    [" cave"]         = this.interiorTempValues.cave,
    [" barrow"]     = this.interiorTempValues.barrow,

    --caves
    ["abanabi"] = this.interiorTempValues.cave,
    ["abernanit"] = this.interiorTempValues.cave,
    ["abinabi"] = this.interiorTempValues.cave,
    ["adanumuran"] = this.interiorTempValues.cave,
    ["addamasartus"] = this.interiorTempValues.cave,
    ["aharnabi"] = this.interiorTempValues.cave,
    ["aharunartus"] = this.interiorTempValues.cave,
    ["ahinipalit"] = this.interiorTempValues.cave,
    ["ainab"] = this.interiorTempValues.cave,
    ["ainat"] = this.interiorTempValues.cave,
    ["ansi"] = this.interiorTempValues.cave,
    ["ashanammu"] = this.interiorTempValues.cave,
    ["ashinabi"] = this.interiorTempValues.cave,
    ["ashirbadon"] = this.interiorTempValues.cave,
    ["ashir-dan"] = this.interiorTempValues.cave,
    ["ashmelech"] = this.interiorTempValues.cave,
    ["assarnud"] = this.interiorTempValues.cave,
    ["assemanu"] = this.interiorTempValues.cave,
    ["assu"] = this.interiorTempValues.cave,
    ["assumanu"] = this.interiorTempValues.cave,
    ["bensamsi"] = this.interiorTempValues.cave,
    ["beshara"] = this.interiorTempValues.cave,
    ["cavern of the incarnate"] = this.interiorTempValues.cave,
    ["corprusarium"] = this.interiorTempValues.cave,
    ["dubdilla"] = this.interiorTempValues.cave,
    ["dun-ahhe"] = this.interiorTempValues.cave,
    ["habinbaes"] = this.interiorTempValues.cave,
    ["hassour"] = this.interiorTempValues.cave,
    ["hinnabi"] = this.interiorTempValues.cave,
    ["ibar-dad"] = this.interiorTempValues.cave,
    ["ilunibi"] = this.interiorTempValues.cave,
    ["kora-dur"] = this.interiorTempValues.cave,
    ["kudanat"] = this.interiorTempValues.cave,
    ["kumarahaz"] = this.interiorTempValues.cave,
    ["kunirai"] = this.interiorTempValues.cave,
    ["maba-ilu"] = this.interiorTempValues.cave,
    ["mallapi"] = this.interiorTempValues.cave,
    ["mamaea"] = this.interiorTempValues.cave,
    ["mannammu"] = this.interiorTempValues.cave,
    ["maran-adon"] = this.interiorTempValues.cave,
    ["masseranit"] = this.interiorTempValues.cave,
    ["mat"] = this.interiorTempValues.cave,
    ["milk"] = this.interiorTempValues.cave,
    ["minabi"] = this.interiorTempValues.cave,
    ["missamsi"] = this.interiorTempValues.cave,
    ["mount kand, cavern"] = this.interiorTempValues.cave,
    ["nallit"] = this.interiorTempValues.cave,
    ["nammu"] = this.interiorTempValues.cave,
    ["nissintu"] = this.interiorTempValues.cave,
    ["nund"] = this.interiorTempValues.cave,
    ["odaishah"] = this.interiorTempValues.cave,
    ["odibaal"] = this.interiorTempValues.cave,
    ["odirnamat"] = this.interiorTempValues.cave,
    ["palansour"] = this.interiorTempValues.cave,
    ["panat"] = this.interiorTempValues.cave,
    ["pinsun"] = this.interiorTempValues.cave,
    ["piran"] = this.interiorTempValues.cave,
    ["pulk"] = this.interiorTempValues.cave,
    ["punabi"] = this.interiorTempValues.cave,
    ["punammu"] = this.interiorTempValues.cave,
    ["punsabanit"] = this.interiorTempValues.cave,
    ["rissun"] = this.interiorTempValues.cave,
    ["salmantu"] = this.interiorTempValues.cave,
    ["sanabi"] = this.interiorTempValues.cave,
    ["sanit"] = this.interiorTempValues.cave,
    ["sargon"] = this.interiorTempValues.cave,
    ["saturan"] = this.interiorTempValues.cave,
    ["sennananit"] = this.interiorTempValues.cave,
    ["sha-adnius"] = this.interiorTempValues.cave,
    ["shal"] = this.interiorTempValues.cave,
    ["shallit"] = this.interiorTempValues.cave,
    ["sharapli"] = this.interiorTempValues.cave,
    ["shurinbaal"] = this.interiorTempValues.cave,
    ["shushan"] = this.interiorTempValues.cave,
    ["shushishi"] = this.interiorTempValues.cave,
    ["sinsibadon"] = this.interiorTempValues.cave,
    ["subdun"] = this.interiorTempValues.cave,
    ["sud"] = this.interiorTempValues.cave,
    ["surirulk"] = this.interiorTempValues.cave,
    ["tin-ahhe"] = this.interiorTempValues.cave,
    ["tukushapal"] = this.interiorTempValues.cave,
    ["ulummusa"] = this.interiorTempValues.cave,
    ["yakanalit"] = this.interiorTempValues.cave,
    ["yakin"] = this.interiorTempValues.cave,
    ["yasamsi"] = this.interiorTempValues.cave,
    ["yesamsi"] = this.interiorTempValues.cave,
    ["zainsipilu"] = this.interiorTempValues.cave,
    ["zaintirari"] = this.interiorTempValues.cave,
    ["zanabi"] = this.interiorTempValues.cave,
    ["zebabi"] = this.interiorTempValues.cave,
    ["zenarbael"] = this.interiorTempValues.cave,

    --ruins
    ["aleft"] = this.interiorTempValues.ruin,
    ["arkngthand"] = this.interiorTempValues.ruin,
    ["arkngthunch-sturdumz"] = this.interiorTempValues.ruin,
    ["bethamez"] = this.interiorTempValues.ruin,
    ["bthanchend"] = this.interiorTempValues.ruin,
    ["bthuand"] = this.interiorTempValues.ruin,
    ["bthungthumz"] = this.interiorTempValues.ruin,
    ["dagoth ur"] = this.interiorTempValues.ruin,
    ["druscashti"] = this.interiorTempValues.ruin,
    ["endusal"] = this.interiorTempValues.ruin,
    ["galom daeus"] = this.interiorTempValues.ruin,
    ["mudan"] = this.interiorTempValues.ruin,
    ["mzahnch"] = this.interiorTempValues.ruin,
    ["mzanchend"] = this.interiorTempValues.ruin,
    ["mzuleft"] = this.interiorTempValues.ruin,
    ["nchardahrk"] = this.interiorTempValues.ruin,
    ["nchardumz"] = this.interiorTempValues.ruin,
    ["nchuleft"] = this.interiorTempValues.ruin,
    ["nchuleftingth"] = this.interiorTempValues.ruin,
    ["nchurdamz"] = this.interiorTempValues.ruin,
    ["odrosal"] = this.interiorTempValues.ruin,
    ["tureynulal"] = this.interiorTempValues.ruin,
    ["vemynal"] = this.interiorTempValues.ruin,
}

this.heatSourceValues = {
    in_lava_1024 = 250,
    In_Lava_1024_01 = 250,
    in_lava_256 = 250,
    in_lava_256a = 250,
    in_lava_512 = 250,
    in_lava_oval = 250,
    act_terrain_lava_vent = 50,
    act_terrain_lava_ventlg = 50,
    volcano_steam = 80,
}


this.utensils = {



    --iron
    ashfall_kettle = {
        type = "kettle",
        capacity = 140,
    },
    --steel
    ashfall_kettle_01 = {
        type = "kettle",
        capacity = 140,
    },
    --ceramic
    ashfall_kettle_02 = {
        type = "kettle",
        capacity = 120,
    },
    --ashl blue
    ashfall_kettle_03 = {
        type = "kettle",
        capacity = 130,
    },
    --ashl red
    ashfall_kettle_04 = {
        type = "kettle",
        capacity = 130,
    },
    --Ancient 6th house
    ashfall_kettle_05 = {
        type = "kettle",
        capacity = 150,
    },
    --Pewter / Small
    ashfall_kettle_06 = {
        type = "kettle",
        capacity = 100,
    },
    --Limeware
    ashfall_kettle_07 = {
        type = "kettle",
        capacity = 130,
    },
    --Japanese teapot
    ashfall_kettle_08 = {
        type = "kettle",
        capacity = 100,
    },

    --Tea Mod Teapots
    teamod_teapot_kb02 ={
        type = "kettle",
        capacity = 100,
    },
    teamod_teapot_q2 = {
        type = "kettle",
        capacity = 100,
    },
    teamod_teapot_q6 = {
        type = "kettle",
        capacity = 100,
    },
    teamod_teapot_q7 = {
        type = "kettle",
        capacity = 100,
    },
    teamod_teapot_qg = {
        type = "kettle",
        capacity = 100,
    },
    teamod_teapot_qgl = {
        type = "kettle",
        capacity = 100,
    },
    teamod_teapot_st01 = {
        type = "kettle",
        capacity = 100,
    },
    teamod_teapot_st02 = {
        type = "kettle",
        capacity = 100,
    },
    teamod_teapot_st03 = {
        type = "kettle",
        capacity = 100,
    },
    teamod_teapot_st04 = {
        type = "kettle",
        capacity = 100,
    },
    teamod_teapot_st05 = {
        type = "kettle",
        capacity = 100,
    },
    teamod_teapot_st06 = {
        type = "kettle",
        capacity = 100,
    },
    teamod_teapot_st07 = {
        type = "kettle",
        capacity = 100,
    },
    teamod_teapot_st08 = {
        type = "kettle",
        capacity = 100,
    },
    teamod_teapot_st09 = {
        type = "kettle",
        capacity = 100,
    },
    teamod_teapot_st10 = {
        type = "kettle",
        capacity = 100,
    },
    teamod_teapot_st11 = {
        type = "kettle",
        capacity = 100,
    },
    teamod_teapot_st12 = {
        type = "kettle",
        capacity = 100,
    },
    --Tea Mod Kettles
    teamod_kettle_st01 = {
        type = "kettle",
        capacity = 125,
    },
    teamod_kettle_st02 = {
        type = "kettle",
        capacity = 125,
    },

    --TR kettles
    tm_kettle_bar_01 = {
        type = "kettle",
        capacity = 130,
    },
    tm_kettle_bar_02 = {
        type = "kettle",
        capacity = 130,
    },

    -- misc_com_bucket_metal = {
    --     type = "cookingPot",
    --     meshOverride = "ashfall\\bucket_metal.nif",
    --     capacity = 150,
    --     waterMaxScale = 1.3,
    --     waterMaxHeight = 28,
    --     holdsStew = true
    -- },
    -- misc_com_bucket_01 = {
    --     type = "cookingPot",
    --     meshOverride = "ashfall\\bucket_wooden.nif",
    --     capacity = 140,
    --     waterMaxScale = 1.3,
    --     waterMaxHeight = 28,
    --     holdsStew = true
    -- },
    ashfall_cooking_pot = {
        type = "cookingPot",
        capacity = 200,
        waterMaxScale = 1.3,
        waterMaxHeight = 28,
        holdsStew = true,
    },
    ashfall_cooking_pot_iron = {
        type = "cookingPot",
        capacity = 230,
        waterMaxScale = 1.3,
        waterMaxHeight = 18,
        holdsStew = true,
    },
    ashfall_cooking_pot_steel = {
        type = "cookingPot",
        capacity = 200,
        waterMaxScale = 1.3,
        waterMaxHeight = 28,
        holdsStew = true,
    },

    --RM's mod
    dwrv_pan2 = {
        type = "cookingPot",
        capacity = 230,
        waterMaxScale = 1.3,
        waterMaxHeight = 18,
        meshOverride = "ashfall\\cooking_pot_iron.nif",
        holdsStew = true,
    },


}
table.copy(this.utensils, this.bottleList)

this.dynamicCampfireKettles = {
    ashfall_kettle_01 = true,
    ashfall_kettle_02 = true,
    ashfall_kettle_03 = true,
    ashfall_kettle_04 = true,
    ashfall_kettle_05 = true,
    ashfall_kettle_06 = true,
    ashfall_kettle_07 = true,
}

this.kettles = {}
this.cookingPots = {}
for id, data in pairs(this.utensils) do
    if data.type == "kettle" then
        this.kettles[id] = data
        this.activatorConfig.list.kettle:addId(id)
    elseif data.type == "cookingPot" then
        this.cookingPots[id] = data
        this.activatorConfig.list.cookingPot:addId(id)
    end
end

this.grills = {
    ashfall_grill_miner = {
        type = "grill",
    },

    ashfall_grill = {
        type = "grill",
        meshOverride = "ashfall\\grill_attach.nif"
    },
    ashfall_grill_steel = {
        type = "grill",
        meshOverride = "ashfall\\grill_steel_attach.nif"
    },
    ashfall_fry_pan = {
        type = "grill",
        fryingPan = true,
        meshOverride = "ashfall\\fry_pan_01_attach.nif"
    },
    --RM's mod
    dwrv_frying_pan = {
        type = "grill",
        fryingPan = true,
        meshOverride = "ashfall\\dwrv_fry_pan_attach.nif"
    },
    --Morrowind Crafting
    mc_skillet = {
        type = "grill",
        fryingPan = true,
        meshOverride = "ashfall\\fry_pan_01_attach.nif"
    },

    t_com_frypan_01 = {
        type = "grill",
        fryingPan = true,
        meshOverride = "ashfall\\fry_pan_tr_attach.nif"
    },

    ashfall_grill_wood = {
        type = "grill",
        materials = {
            ashfall_firewood = 3
        }
    }
}

this.bellows = {
    misc_de_bellows10 = {
        type = "bellows",
        --meshOverride
        burnRateEffect = 1.5,
        heatEffect = 2.0
    }
}

this.groundUtensils = {}
table.copy(this.grills, this.groundUtensils)
table.copy(this.bellows, this.groundUtensils)

this.supports = {
    ashfall_supports_01 = { type = "supports", materials = { ashfall_firewood = 3 } }, --wooden teepee
    ashfall_supports_02 = { type = "supports", materials = {  ashfall_firewood = 3 } }, --wooden MR
    ashfall_supports_03 = { type = "supports" }, -- Iron
}

this.firestarters = {
    ab_misc_flintandsteel = true,
    ashfall_flintsteel = true,
}

this.ladles = {
    misc_com_iron_ladle = {},
    ashfall_wood_ladle = {
        meshOverride = "ashfall\\craft\\wood_ladle_attach.nif",
    }
}

this.lightFireBlacklist = {
    ashfall_teawarmer_01 = true,
    g7_initialized = true,
    g7_inventory_alch = true,
    g7_inventory_ammo = true,
    g7_inventory_armo = true,
    g7_inventory_book = true,
    g7_inventory_clot = true,
    g7_inventory_ingr = true,
    g7_inventory_keys = true,
    g7_inventory_lock = true,
    g7_inventory_misc = true,
    g7_inventory_repa = true,
    g7_inventory_scrl = true,
    g7_inventory_soul = true,
    g7_inventory_weap = true,
}

this.shadeEquipment = {
    ashfall_pack_05 = true,
    gondolier_helm = true,
    ashfall_strawhat = true,
    t_de_caravaner_helm_01 = true,
}

return this