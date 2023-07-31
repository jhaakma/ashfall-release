local activatorController = require("mer.ashfall.activators.activatorController")
local harvestConfigs = require("mer.ashfall.harvest.config")
local common = require("mer.ashfall.common.common")
local logger = common.createLogger("harvestController")
local config = require("mer.ashfall.config").config
local service = require("mer.ashfall.harvest.service")



event.register("loaded", function()
    timer.start{
        type = timer.real,
        iterations = -1,
        duration = 0.1,
        callback = service.updateDisabledHarvestables
    }
end)

---@param e attackEventData
local function harvestOnAttack(e)
    logger:debug("harvestOnAttack() ENTRY")
    --Get the necessary objects and check conditions--

    --Filter to player
    if e.mobile.reference ~= tes3.player then
        logger:debug("Harvest: Not player")
        return
    end

    --Get player target Activator
    local activator = activatorController.getCurrentActivator()
    if not activator then
        logger:debug("Harvest: No activator")
        return
    end

    --Get activator Ref
    local reference = activatorController.getCurrentActivatorReference()
    if not reference then
        logger:debug("Harvest: No reference")
        return
    end

    --Get harvest config from activator
    ---@type Ashfall.Harvest.Config
    local harvestConfig = harvestConfigs.activatorHarvestData[activator.type]
    if not harvestConfig then
        logger:debug("Harvest: No harvest config")
        logger:debug("activatorType: %s", activator.type)
        return
    end

    --Get Player Weapon
    local weapon = tes3.player.mobile.readiedWeapon
    if not weapon then
        logger:debug("Harvest: No weapon")
        return
    end

    --Get harvest data from weapon
    local weaponData = service.getWeaponHarvestData(weapon, harvestConfig)
    if not weaponData then
        logger:debug("Harvest: No weapon data")
        return
    end

    --Check if Activator is active
    local activatorActive = config[activator.mcmSetting] ~= false
    if not activatorActive then
        logger:debug("Harvest: Activator not active")
        return
    end

    --Return if illegal to harvest
    if service.checkIllegalToHarvest() then
        service.showIllegalToHarvestMessage(harvestConfig)
        logger:debug("Harvest: Illegal to harvest")
        return
    end

    --Check attack direction
    if not service.validAttackDirection(harvestConfig) then
        logger:debug("Harvest: Invalid attack direction")
        return
    end

    --Check if activator is already harvested
    if service.checkHarvested(reference) then
        logger:debug("Harvest: Can't harvest, already harvested")
        return
    end

    logger:debug("Checks passed, swinging")
    --CHECKS PASS, we are swinging at something
    service.playSound(harvestConfig)

    --Get strength of swing
    local swingStrength = service.getSwingStrength(weapon, weaponData)

    --Degrade weapon and exit if it breaks
    local weaponBroke = service.degradeWeapon(weapon, swingStrength, weaponData.degradeMulti)
    if weaponBroke then
        logger:debug("Weapon broke")
        return
    end

    --Accumulate swings and check if it's enough to harvest
    local didHarvest = service.attemptSwing(swingStrength, reference, harvestConfig.swingsNeeded)
    if not didHarvest then return end
    logger:debug("Enough swings, harvesting")
    --Harvest the resources
    service.harvest(reference, harvestConfig)
    --Disable if  exhausted
    if harvestConfig.destructionLimitConfig and config.disableHarvested then
        logger:debug("Disabling exhausted harvestable")
        service.disableExhaustedHarvestable(reference, harvestConfig)
    end
    logger:debug("harvestOnAttack() EXIT")
end
event.register("attack", harvestOnAttack )

-- Force a chop action if looking at a harvestable
---@param e attackStartEventData
event.register("attackStart", function(e)
    --Get player target Activator
    local activator = activatorController.getCurrentActivator()
    if not activator then
        logger:debug("Harvest: No activator")
        return
    end


    logger:debug("Activator type: %s", activator.type)

        --Get harvest config from activator
    ---@type Ashfall.Harvest.Config
    local harvestConfig = harvestConfigs.activatorHarvestData[activator.type]
    if not harvestConfig then
        logger:debug("Harvest: No harvest config")
        return
    end

    --Get Player Weapon
    local weapon = tes3.player.mobile.readiedWeapon
    if not weapon then
        logger:debug("Harvest: No weapon")
        return
    end

    --Get harvest data from weapon
    local weaponData = service.getWeaponHarvestData(weapon, harvestConfig)
    if not weaponData then
        logger:debug("Harvest: No weapon data")
        return
    end

    if not (harvestConfig.attackDirections and table.size(harvestConfig.attackDirections) > 0) then
        logger:debug("No attack directions")
        return
    end

    --Check if current attack direction doesn't match valid directions for this harvestable
    if not harvestConfig.attackDirections[e.attackType] then
        if harvestConfig.defaultAttackDirection then
            logger:debug("Forcing attack type %s", table.find(tes3.physicalAttackType, harvestConfig.defaultAttackDirection))
            e.attackType = harvestConfig.defaultAttackDirection
        else
            --set to first one in list
            for attackType, _ in pairs(harvestConfig.attackDirections) do
                logger:debug("Forcing attack type %s", table.find(tes3.physicalAttackType, attackType))
                e.attackType = attackType
                break
            end
        end
    end

end)

--- Reset harvestables on load.
event.register("loaded", function()
    service.destroyedHarvestables:iterate(function(reference)
        service.enableHarvestable(reference)
    end)
end)

--- Clear any data added when an item was felled from a tree.
---@param e activateEventData
event.register("activate", function(e)
    if common.helper.isCarryable(e.target.baseObject) then
        if e.target and e.target.data then
            e.target.data.ashfallHarvestOriginalLocation = nil
            e.target.data.ashfallDestroyedHarvestable = nil
        end
    end
end)

