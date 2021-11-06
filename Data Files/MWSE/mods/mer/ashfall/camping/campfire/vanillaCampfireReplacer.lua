local common = require ("mer.ashfall.common.common")
local CampfireUtil = require("mer.ashfall.camping.campfire.CampfireUtil")
local foodConfig = common.staticConfigs.foodConfig
local campfireConfig = common.staticConfigs.campfireConfig
local randomStuffChances = {
    utensil = 0.4,
    water = 0.6,
    tea = 0.7,
    stew = 0.7
}

local vanillaCampfires = {
    mr_light_pitfire = { replacement = "ashfall_campfire", supports = true, rootHeight = 5, squareSupports = true, infinite = true},
    --Ugly ones
    light_pitfire00 =  { replacement = "ashfall_campfire", supports = false, scale = 0.9, rootHeight = 0, infinite = true},
    light_pitfire01 =  { replacement = "ashfall_campfire", supports = false, scale = 0.9, rootHeight = 0, infinite = true},
    _ser_pitfire =  { replacement = "ashfall_campfire", supports = false, scale = 0.9, rootHeight = 0, infinite = true},
    abtv_light_suryanfirepit = { replacement = "ashfall_campfire", supports = false, scale = 0.9, rootHeight = 0, infinite = true},

    --unlit supports
    furn_de_firepit =  { replacement = "ashfall_campfire", supports = true, rootHeight = 68, infinite = true},
    --unlit
    furn_de_firepit_01 =  { replacement = "ashfall_campfire", supports = false, rootHeight = 0, infinite = true},

    --Supports
    furn_de_firepit_f =  { replacement = "ashfall_campfire", supports = true, rootHeight = 68, infinite = true},
    furn_de_firepit_f_128 = { replacement = "ashfall_campfire", supports = true, rootHeight = 68, infinite = true},
    furn_de_firepit_f_200 = { replacement = "ashfall_campfire", supports = true, rootHeight = 68, infinite = true},
    furn_de_firepit_f_323 = { replacement = "ashfall_campfire", supports = true, rootHeight = 68, infinite = true},
    furn_de_firepit_f_400 = { replacement = "ashfall_campfire", supports = true, rootHeight = 68, infinite = true},
    --yurt
    a_fire_big  = { replacement = "ashfall_campfire", supports = true, rootHeight = 68, infinite = true},
    a_fire_cooking  = { replacement = "ashfall_campfire", supports = true, rootHeight = 68, infinite = true},
    a_fire_doused  = { replacement = "ashfall_campfire", supports = true, rootHeight = 68, infinite = true},

    --No Supports
    furn_de_firepit_f_01 = { replacement = "ashfall_campfire", supports = false, rootHeight = 0, infinite = true},
    furn_de_firepit_f_01_400 = { replacement = "ashfall_campfire", supports = false, rootHeight = 0, infinite = true},

    furn_de_minercave_grill_01 = { replacement = "ashfall_campfire", supports = false, rootHeight = 0, hasGrill = true, rotation = 90, infinite = true},

    furn_redoran_hearth_01 = { replacement = "ashfall_redhearth_01", supports = false, rootHeight = 0, exactPosition = true },
    furn_redoran_hearth_02 = { replacement = "ashfall_redhearth_02", supports = false, rootHeight = 0, exactPosition = true },
    furn_fireplace10 = { replacement = "ashfall_fireplace10", supports = false, rootHeight = 0, exactPosition = true },
    in_nord_fireplace_01 = { replacement = "ashfall_nordfireplace_01", supports = false, rootHeight = 0, exactPosition = true },
    in_imp_fireplace_grand = { replacement = "ashfall_impfireplace_01", supports = false, rootHeight = 0, exactPosition = true },

    --OAAB
    ab_in_velhearthsmall = { replacement = "ashfall_ab_hearth_sml", supports = false, rootHeight = 0, exactPosition = true, hasGrill = true },
    ab_in_velHearthLargeLH = { replacement = "ashfall_ab_hearth_lh", supports = false, rootHeight = 0, exactPosition = true, hasGrill = true },
    ab_in_velHearthLargeRH = { replacement = "ashfall_ab_hearth_rh", supports = false, rootHeight = 0, exactPosition = true, hasGrill = true },
    --stove
    furn_dwrv_stove00 = { replacement = "ashfall_stove_01", supports = false, rootHeight = 0, exactPosition = true, hasGrill = true },
}

local legacyReplacedCampfires = {
    ashfall_campfire = true,
    ashfall_campfire_static = true,
    ashfall_campfire_mr = true,
    ashfall_campfire_sup = true,
    ashfall_campfire_grill = true,
}

--A list of shit that campfires can be composed of
--When replacing a vanilla mesh, get rid of these
local kitBashObjects = {
    furn_log_01 = true,
    furn_log_02 = true,
    furn_log_03 = true,
    furn_log_04 = true,
    misc_com_wood_spoon_02 = true,
    misc_com_iron_ladle = true,
    dark_64 = true,
    t_de_var_logpileweathered_01 = true,
    furn_coals_hot = true,
    furn_de_shack_hook = true,
    chimney_smoke_small = true,
    a_log_04 = true,
    a_cooking_ladle = true,
    a_fire_coals = true,
    furn_hook_01 = true,
    t_com_var_ropestraight_01 = true,
    t_com_var_ropeknot_01 = true,
    furn_dwrv_stove10 = true,
}

local cauldrons = {
    furn_com_cauldron_01 = true,
    furn_com_cauldron_02 = true,
    misc_com_bucket_metal = true,
    pot_01 = true,
    a_cooking_pot = true,
}
local grills = {
    furn_de_minercave_grill_01 = true,
    a_cooking_grille = true
}

local fryingPans = {
    t_com_frypan_01 = true,
    ashfall_fry_pan = true,
    mc_skillet = true,
    dwrv_frying_pan = true,

}


--Meshes that a campfire might be sitting on,
--In which case we don't want to orient it
--Still call orients but maxSteepness 0
local platforms = {
    in_t_platform_02 = true,
    ex_t_rock_coastal_01 = true,
    furn_firepit00 = true,
    in_redoran_ashpit_01 = true,
    furn_de_forge_01 = true,
    a_yurt_int_01 = true,
    a_yurt_int_01_d = true,
}

local lightPatterns = {
    "light_fire",
    "light_logpile",
    "flame light",
    "a_fire_light",
    "a_hearth_smoke",
}

local ignorePatterns = {
    'ao_',
    'sound_'
}

local function getRandomItem(list)
    local item = table.choice(table.keys(list))
    local attempts = 0
    while not tes3.getObject(item) and attempts < 10 do
        common.log:debug("Found invalid item %s, trying again", item)
        item = table.choice(table.keys(list))
        attempts = attempts + 1
    end

    common.log:debug("returning randomg item: %s", item)
    return item
end

local function addWater(campfire)
    if math.random() < randomStuffChances.water then
        campfire.data.waterAmount = 10 + math.random(50)
        if campfire.data.isLit then
            CampfireUtil.setHeat(campfire.data, 100, campfire)
        end
        --add tea to kettleswaterHeat
        if campfire.data.utensil == "kettle" then
            if math.random() < randomStuffChances.tea then
                local teaType = table.choice(common.staticConfigs.teaConfig.validTeas)
                campfire.data.waterType = teaType
                campfire.data.teaProgress = 100
            end
        --add random stew to cooking pots
        elseif campfire.data.utensil == "cookingPot" then
            if math.random() < randomStuffChances.stew then
                campfire.data.ladle = true
                campfire.data.stewLevels = {}
                local stewTypes = {}
                for stewType, _ in pairs(foodConfig.getStewBuffList()) do
                    table.insert(stewTypes, stewType)
                end
                local thisStewType = table.choice(stewTypes)
                campfire.data.stewLevels = {
                    [thisStewType] = 10 + math.random(90)
                }
                campfire.data.stewProgress = 100
            end
        end
    end
end

local function addCookingPot(campfire)
    campfire.data.utensil = "cookingPot"
    campfire.data.utensilId = getRandomItem(common.staticConfigs.cookingPots)
    campfire.data.waterCapacity = common.staticConfigs.utensils[campfire.data.utensilId].capacity
    campfire.data.dynamicConfig.cookingPot = "static"
    addWater(campfire)
end

local function addKettle(campfire)
    campfire.data.dynamicConfig.kettle = "static"
    campfire.data.utensil = "kettle"
    campfire.data.utensilId = getRandomItem(common.staticConfigs.kettles)
    campfire.data.waterCapacity = common.staticConfigs.utensils[campfire.data.utensilId].capacity
    addWater(campfire)
end

local function addSupports(campfire, vanillaConfig)
    common.log:debug("Setting supports")
    local supportsId = "ashfall_supports_01" --Use teepee for vanilla ones because of things leaning on them etc
    if vanillaConfig.squareSupports then
        supportsId = "ashfall_supports_02" --Morrowind Rebirth ones
    elseif vanillaConfig.ironSupports then
        supportsId = "ashfall_supports_03" --Metal supports
    end
    campfire.data.supportsId = supportsId
end

local function addGrill(campfire)
    campfire.data.hasGrill = true
    campfire.data.grillId = "ashfall_grill_miner"
end

local function addFryingPan(campfire)
    campfire.data.hasGrill = true
    campfire.data.grillId = "ashfall_fry_pan"
end

local function attachRandomStuff(campfire, vanillaConfig)
    if string.find(campfire.cell.id:lower(), "tomb") then return end
    if campfire.data.staticCampfireInitialised then return end

    common.log:debug("Attaching random stuff")
    campfire.data.staticCampfireInitialised = true


    --Initialise static utensils
    if campfire.data.dynamicConfig.supports == "static" then
        addSupports(campfire, vanillaConfig)
    end
    if campfire.data.dynamicConfig.grill == "static" then
        addGrill(campfire)
    end


    --If supports, add utensils
    if campfire.data.supportsId then
        if campfire.data.utensil == nil and math.random() < randomStuffChances.utensil then
            if math.random() < 0.5 then addKettle(campfire) else addCookingPot(campfire) end

        end
    end

    common.log:debug("setting static fuel level")
    campfire.data.fuelLevel = 2 + math.random(3)
end

local function setInitialState(campfire, vanillaRef, data, vanillaConfig)

    if data.hasGrill or vanillaConfig.hasGrill then
        campfire.data.dynamicConfig.grill = "static"
    end
    if data.hasFryingPan then
        addFryingPan(campfire)
    end

    if vanillaConfig.supports == true then
        common.log:debug("setting dynamicConfig.supports to static")
        --prevent removal of supports for kitbashing reasons
        campfire.data.dynamicConfig.supports = "static"
        if data.hasCookingPot then
            addCookingPot(campfire)
        end
    elseif data.hasPlatform == true then
       campfire.data.dynamicConfig.supports = "none"
    else
        if data.hasCookingPot then
            vanillaConfig.ironSupports = true
            addSupports(campfire, vanillaConfig)
            addCookingPot(campfire)
        end
    end

    --fire is lit already?
    local doLight = (
        data.isLit or
        vanillaRef.object.objectType == tes3.objectType.light
    )
    common.log:debug("Campfire initial fireState: %s", (doLight and "lit" or "unlit") )
    if doLight then
        campfire.data.isLit = true
        common.log:debug("Playing Fire sound on %s", campfire.object.id)
        tes3.playSound{ sound = "Fire", reference = campfire, loop = true }
    else
        campfire:deleteDynamicLightAttachment()
    end

    timer.delayOneFrame(function()
        event.trigger("Ashfall:registerReference", { reference = campfire} )
    end)

end

--[[
    Finds nearby objects that might make up a campfire,
    disables them and determines the replacement campfire
    based on what was found
]]
local function checkKitBashObjects(vanillaRef)
    common.log:debug("Checking kit bash objects for %s", vanillaRef.object.id)
    local result = {
        hasGrill = false,
        hasFryingPan = false,
        hasCookingPot = false,
        hasPlatform = false,
        isLit = false,
        ignoreList = {},
        foodList = {},
    }
    for ref in vanillaRef.cell:iterateReferences() do
        if ref.disabled then
            common.log:debug("%s is disabled, adding to ignore list", ref.object.id)
            table.insert(result.ignoreList, ref)
        else
            if (ref.baseObject.objectType ~= tes3.objectType.static) then
                common.log:debug("Raytest ignores all non statics: %s", ref)
                table.insert(result.ignoreList, ref)
            elseif common.helper.compareReferenceSize(vanillaRef, ref) then
                common.log:debug("Ignoring reference %s because it is too small", ref.object.id)
                table.insert(result.ignoreList, ref)
            end
            local id = ref.object.id:lower()

            if common.helper.getCloseEnough({ref1 = ref, ref2 = vanillaRef, distHorizontal = 75, distVertical = 300}) then
                if ref ~= vanillaRef then
                    common.log:debug("Nearby ref: %s", ref.object.id)

                    local skipRef
                    for _, pattern in ipairs(ignorePatterns) do
                        if string.find(id, pattern) then
                            common.log:debug("Skipping ref %s", id)
                            skipRef = true
                        end
                    end
                    if string.find(id, "_unique") then
                        common.log:debug("Found a unique mesh (%s), ignoring campfire replacement", id)
                        skipRef = true
                    end

                    if ref.object.script then
                        common.log:debug("Found a scripted mesh (%s), ignoring campfire replacement", id)
                        skipRef = true
                    end

                    if not skipRef then


                        if platforms[id] then
                            common.log:debug("Has platform")
                            result.hasPlatform = true
                        end

                        --if you find an existing campfire, get rid of it
                        if vanillaCampfires[id] then
                            common.log:debug("removing existing replaced campfire %s", ref.object.id)
                            table.insert(result.ignoreList, ref)
                            common.helper.yeet(ref)
                        end

                        if vanillaCampfires[id] then
                            common.log:debug("Found another campfire that wants to be replaced, yeeting now: %s", ref.object.id)
                            table.insert(result.ignoreList, ref)
                            common.helper.yeet(ref)
                        end

                        if cauldrons[id] then
                            common.log:debug("Found existing cooking pot")
                            table.insert(result.ignoreList, ref)
                            result.hasCookingPot = true
                            common.helper.yeet(ref)
                        end
                        if grills[id] then
                            common.log:debug("Found existing grill")
                            table.insert(result.ignoreList, ref)
                            result.hasGrill = true
                            common.helper.yeet(ref)
                        end
                        if fryingPans[id] then
                            common.log:debug("Found existing frying pan")
                            table.insert(result.ignoreList, ref)
                            result.hasFryingPan = true
                            common.helper.yeet(ref)
                        end
                        if kitBashObjects[id] then
                            common.log:debug("Found existing kitbash %s", id)
                            common.helper.yeet(ref)
                            table.insert(result.ignoreList, ref)
                        end

                        for _, pattern in ipairs(lightPatterns) do
                            if string.startswith(id, pattern)then
                                common.log:debug("Found a fire: %s", id)
                                result.isLit = true
                                table.insert(result.ignoreList, ref)
                                common.helper.yeet(ref)
                            end
                        end

                        if ref.object.objectType == tes3.objectType.ingredient then
                            if common.helper.getCloseEnough({ref1 = ref, ref2 = vanillaRef, distHorizontal = 50, distVertical = 100}) then
                                table.insert(result.foodList, ref)
                            end
                        end

                    end
                end
            end
        end
    end
    return result
end

--[[
    For each ingredient, check if food was placed on a grill
    If it was, then set the ingredient position to the returned intersection
]]
local function moveFood(campfire, foodList)
    for _, ref in ipairs(foodList) do
        common.log:trace("Checking if %s is on a grill", ref.object.id)
        local grillNode = CampfireUtil.getFoodPlacedOnGrill(ref, campfire)
        if grillNode then
            common.log:debug("%s is on a grill, moving it", ref.object.id)
            local campfireHeight = campfire.position.z
            local grillHeight = grillNode.translation.z * campfire.scale
            local ingredBottomDiff = ref.sceneNode:createBoundingBox().min.z
            common.log:trace("campfireHeight: %s", campfireHeight)
            common.log:trace("grillHeight: %s", grillHeight)
            common.log:trace("ingredient bottom diff: %s", ingredBottomDiff)
            common.log:trace("Old position: %s", ref.position)
            ref.position = {
                ref.position.x,
                ref.position.y,
                campfireHeight + grillHeight - ingredBottomDiff
            }
            common.log:debug("New position: %s", ref.position)

            --Set cooked amount and prevent from getting burnt
            if foodConfig.getGrillValues(ref.object) then
                ref.data.cookedAmount = 100
                ref.data.grillState = "cooked"
                ref.data.preventBurning = true
                event.trigger("Ashfall:ingredCooked", { reference = ref})
            end
        end
    end

end

local function replaceCampfire(e)

    local isLegacy  = legacyReplacedCampfires[e.reference.object.id:lower()]
    if isLegacy and e.reference.data.dynamicConfig then
        --For older replaced campfires, we need to set the infinite flag
        e.reference.data.infinite = true
    end

    local vanillaConfig = vanillaCampfires[e.reference.object.id:lower()]
    local campfireReplaced = e.reference.data and e.reference.data.campfireReplaced
    if vanillaConfig then
        if not campfireReplaced then
            common.log:debug("replaceCampfire() %s", e.reference.object.id)

            if e.reference.disabled or e.reference.deleted then
                common.log:debug("%s is disabled, not replacing", e.reference.object.id)
                return
            end
            e.reference:disable()
            e.reference.data.campfireReplaced = true
            --decide which campfire to replace with
            local data = checkKitBashObjects(e.reference)
            if not data then return end
            local replacement = vanillaConfig.replacement or "ashfall_campfire"

            common.log:debug("\n\nREPLACING %s with %s", e.reference.object.id, replacement)
            common.log:debug("position %s", e.reference.position)
            common.log:debug("orientation %s", e.reference.orientation)
            common.log:debug("hasPlatform %s", data.hasPlatform)

            local campfire = tes3.createReference{
                object = replacement,
                position = {
                    e.reference.position.x,
                    e.reference.position.y,
                    e.reference.position.z - (vanillaConfig.rootHeight * e.reference.scale)
                },
                orientation = {
                    e.reference.orientation.x,
                    e.reference.orientation.y,
                    e.reference.orientation.z + math.rad(vanillaConfig.rotation or 0)
                },
                cell = e.reference.cell
            }
            --make sure the position is correct
            campfire.position = {
                e.reference.position.x,
                e.reference.position.y,
                e.reference.position.z + (vanillaConfig.rootHeight * e.reference.scale)
            }
            campfire.orientation = {
                e.reference.orientation.x,
                e.reference.orientation.y,
                e.reference.orientation.z + math.rad(vanillaConfig.rotation or 0)
            }

            common.log:debug("new orientation %s", campfire.orientation)
            campfire.data.dynamicConfig = campfireConfig.getConfig(campfire.object.id)
            campfire.data.dynamicConfig.campfire = "static"
            campfire.data.infinite = vanillaConfig.infinite

            setInitialState(campfire, e.reference, data, vanillaConfig)
            attachRandomStuff(campfire, vanillaConfig)
            event.trigger("Ashfall:UpdateAttachNodes", { campfire = campfire })

            campfire.scale = e.reference.scale
            if vanillaConfig.scale then
                campfire.scale = campfire.scale * vanillaConfig.scale
            end

            if not vanillaConfig.exactPosition then

                --For stuff inside platforms, let the scale get smaller
                local minScale = data.hasPlatform and 0.6 or 0.75
                campfire.scale = math.clamp(campfire.scale, minScale, 1.3)
                common.log:debug("setting scale to %s", campfire.scale)

                table.insert(data.ignoreList, campfire)
                local rootHeight = 0 -- vanillaConfig.rootHeight * campfire.scale
                local orientedCorrectly = common.helper.orientRefToGround{
                    ref = campfire,
                    maxSteepness = (data.hasPlatform and 0.0 or 0.2),
                    ignoreList = data.ignoreList,
                    rootHeight = rootHeight+5,
                    ignoreNonStatics = true,
                    ignoreBB = true,
                    --skipPosition = true
                    maxZ = 10
                }
                if not orientedCorrectly then
                    common.helper.removeCollision(e.reference.sceneNode)
                    common.helper.removeLight(e.reference.sceneNode)
                    local vanillaBB = e.reference.sceneNode:createBoundingBox(e.reference.scale)
                    local vanillaHeight = vanillaBB.min.z
                    local campfireHeight = campfire.position.z - rootHeight
                    local heightDiff = campfireHeight - vanillaHeight
                    common.log:debug("Failed to orient, setting height based on bounding box")
                    campfire.position = {
                        campfire.position.x,
                        campfire.position.y,
                        campfire.position.z - heightDiff
                    }
                end
            end

            common.helper.yeet(e.reference)


            common.log:debug("------------------moving food")
            moveFood(campfire, data.foodList)

            common.log:debug("Campfire final supports: %s\n\n", campfire.data.dynamicConfig.supports)
        end
    end
end

local function replaceCampfires(e)
    for _, cell in pairs(tes3.getActiveCells()) do
        for ref in cell:iterateReferences() do
            replaceCampfire{reference = ref}
        end
    end
end
event.register("cellChanged", replaceCampfires)
