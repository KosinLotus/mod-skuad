local Mod = RegisterMod("Skuad",1)
local game = Game()

-- Sabri --

local Sabri = { -- Change Sabri everywhere to match your character. No spaces!
	DAMAGE = .7,	-- These are all relative to Isaac's base stats.
	SPEED = 0,
	SHOTSPEED = .15,
	TEARHEIGHT = 1,
	TEARFALLINGSPEED = 0,
	LUCK = 1,
	FLYING = false,									
	TEARFLAG = 0, -- 0 is default
	TEARCOLOR = Color(0.0, 1.0, 1.0, 0.75, 150, 150, 150) 	-- Color(1.0, 1.0, 1.0, 1.0, 0, 0, 0) is default
}

function Sabri:onCache(player, cacheFlag) -- I do mean everywhere!
	if player:GetName() == "Sabri" then -- Especially here!
		if cacheFlag == CacheFlag.CACHE_DAMAGE then
			player.Damage = player.Damage + Sabri.DAMAGE
		end
		if cacheFlag == CacheFlag.CACHE_SHOTSPEED then
			player.ShotSpeed = player.ShotSpeed + Sabri.SHOTSPEED
		end
		if cacheFlag == CacheFlag.CACHE_RANGE then
			player.TearHeight = player.TearHeight - Sabri.TEARHEIGHT
			player.TearFallingSpeed = player.TearFallingSpeed + Sabri.TEARFALLINGSPEED
		end
		if cacheFlag == CacheFlag.CACHE_SPEED then
			player.MoveSpeed = player.MoveSpeed + Sabri.SPEED
		end
		if cacheFlag == CacheFlag.CACHE_LUCK then
			player.Luck = player.Luck + Sabri.LUCK
		end
		if cacheFlag == CacheFlag.CACHE_FLYING and Sabri.FLYING then
			player.CanFly = true
		end
		if cacheFlag == CacheFlag.CACHE_TEARFLAG then
			player.TearFlags = player.TearFlags | Sabri.TEARFLAG
		end
		if cacheFlag == CacheFlag.CACHE_TEARCOLOR then
			player.TearColor = Sabri.TEARCOLOR
		end
	end
end

Mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, Sabri.onCache)


-- Gonza --

local Gonza = { -- Change Sabri everywhere to match your character. No spaces!
	DAMAGE = .3,	-- These are all relative to Isaac's base stats.
	SPEED = .15,
	SHOTSPEED = .1,
	TEARHEIGHT = 2,
	TEARFALLINGSPEED = 2,
	LUCK = 0,
	FLYING = false,									
	TEARFLAG = 0, -- 0 is default
	TEARCOLOR = Color(1.0, 1.0, 1.0, 1, 116, 254, 174) 	-- Color(1.0, 1.0, 1.0, 1.0, 0, 0, 0) is default
}

function Gonza:onCache(player, cacheFlag) -- I do mean everywhere!
	if player:GetName() == "Gonza" then -- Especially here!
		if cacheFlag == CacheFlag.CACHE_DAMAGE then
			player.Damage = player.Damage + Gonza.DAMAGE
		end
		if cacheFlag == CacheFlag.CACHE_SHOTSPEED then
			player.ShotSpeed = player.ShotSpeed + Gonza.SHOTSPEED
		end
		if cacheFlag == CacheFlag.CACHE_RANGE then
			player.TearHeight = player.TearHeight - Gonza.TEARHEIGHT
			player.TearFallingSpeed = player.TearFallingSpeed + Gonza.TEARFALLINGSPEED
		end
		if cacheFlag == CacheFlag.CACHE_SPEED then
			player.MoveSpeed = player.MoveSpeed + Gonza.SPEED
		end
		if cacheFlag == CacheFlag.CACHE_LUCK then
			player.Luck = player.Luck + Gonza.LUCK
		end
		if cacheFlag == CacheFlag.CACHE_FLYING and Gonza.FLYING then
			player.CanFly = true
		end
		if cacheFlag == CacheFlag.CACHE_TEARFLAG then
			player.TearFlags = player.TearFlags | Gonza.TEARFLAG
		end
		if cacheFlag == CacheFlag.CACHE_TEARCOLOR then
			player.TearColor = Gonza.TEARCOLOR
		end
	end
end

Mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, Gonza.onCache)

-- Prendas Rockeras --

local PrendasRockeras = Isaac.GetItemIdByName("Prendas Rockeras");
local costume_PrendasRock = Isaac.GetCostumeIdByPath("gfx/characters/prendasrockeras.anm2");

function Mod:onUpdate(player) -- Costume --
  if game:GetFrameCount() == 1 then
    Mod.HasPrendasRockeras = false
  end
  if not Mod.HasPrendasRockeras and player:HasCollectible(PrendasRockeras) then
    player:AddNullCostume(costume_PrendasRock)
    Mod.HasPrendasRockeras = true
  end
  
end
Mod:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, Mod.onUpdate)

-- Master of Puppets --

local MasterofPuppets = Isaac.GetItemIdByName("Master of Puppets");
local costume_MoP = Isaac.GetCostumeIdByPath("gfx/characters/masterofpuppets.anm2");

function Mod:onUpdate(player) -- Costume --
  if game:GetFrameCount() == 1 then
    Mod.HasMasterofPuppets = false
  end
  if not Mod.HasMasterofPuppets and player:HasCollectible(MasterofPuppets) then
    player:AddNullCostume(costume_MoP)
    Mod.HasMasterofPuppets = true
  end
  
end
Mod:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, Mod.onUpdate)

function Mod:cacheUpdate(player, cacheFlag) -- Cambio Stats --
  local player = Isaac.GetPlayer(0)
  if player:HasCollectible(MasterofPuppets) then
    
    if (cacheFlag == CacheFlag.CACHE_LUCK) then
      player.Luck = player.Luck + 3
    end
    if (cacheFlag == CacheFlag.CACHE_SPEED) then
      player.MoveSpeed = player.MoveSpeed - 0.15
    end
  end
end

Mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, Mod.cacheUpdate)

-- Bocadillo de M --

local BocadilloM = Isaac.GetItemIdByName("Bocadillo de M");
local costume_BocadilloM = Isaac.GetCostumeIdByPath("gfx/characters/bocadillodem.anm2");

function Mod:onUpdate(player) -- Costume y Spawneo Pildora --
  if game:GetFrameCount() == 1 then
    Mod.HasBocadilloM = false
  end
  if not Mod.HasBocadilloM and player:HasCollectible(BocadilloM) then
    player:AddNullCostume(costume_BocadilloM)
    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_PILL, 3, player.Position, Vector(0,0), player)
    Mod.HasBocadilloM = true
  end
  
end
Mod:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, Mod.onUpdate)

function Mod:cacheUpdate(player, cacheFlag) -- Cambio Stats --
  local player = Isaac.GetPlayer(0)
  if player:HasCollectible(BocadilloM) then
    if (cacheFlag == CacheFlag.CACHE_SHOTSPEED) then
      player.ShotSpeed = player.ShotSpeed - 0.4
    end
    if (cacheFlag == CacheFlag.CACHE_DAMAGE) then
      player.Damage = player.Damage + 1.2
    end
    if (cacheFlag == CacheFlag.CACHE_SPEED) then
      player.MoveSpeed = player.MoveSpeed + 0.2
    end
    if (cacheFlag == CacheFlag.CACHE_RANGE) then
      player.TearFallingSpeed = player.TearFallingSpeed + 4
    end
  end
end
Mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, Mod.cacheUpdate)


function Mod:onTear(BdMTear) -- TearFlags --
  local player = Isaac.GetPlayer(0)
  local BdMRoll = math.random(4)
  if player:HasCollectible(BocadilloM) and BdMRoll == 1 then
    BdMTear.TearFlags = BdMTear.TearFlags |TearFlags.TEAR_POISON
    player.TearColor = Color(0,1,0,1,50,200,25)
  elseif player:HasCollectible(BocadilloM) and BdMRoll == 2 then
    BdMTear.TearFlags = BdMTear.TearFlags |TearFlags.TEAR_SLOW
    player.TearColor = Color(0,0,1,1,25,50,200)
  end
  if player:HasCollectible(BocadilloM) and BdMRoll == 3 then
    player.TearColor = Color(1,0,0,1,200,25,50)
  end
  if player:HasCollectible(BocadilloM) and BdMRoll == 4 then
    player.TearColor = Color(1,0,0,1,200,25,50)
  end
  
  
end
Mod:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR , Mod.onTear)

-- CricketsPaw --

local CricketsPaw = Isaac.GetItemIdByName("Cricket's Paw");
local costume_CricketsPaw = Isaac.GetCostumeIdByPath("gfx/characters/cricketspaw.anm2");

function Mod:onUpdate(player) -- Costume --
  if game:GetFrameCount() == 1 then
    Mod.HasCricketsPaw = false
  end
  if not Mod.HasCricketsPaw and player:HasCollectible(CricketsPaw) then
    player:AddNullCostume(costume_CricketsPaw)
    Mod.HasCricketsPaw = true
  end
  
end
Mod:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, Mod.onUpdate)

function Mod:cacheUpdate(player, cacheFlag) -- Cambio Stats --
  local player = Isaac.GetPlayer(0)
  if player:HasCollectible(CricketsPaw) then
    
    if (cacheFlag == CacheFlag.CACHE_DAMAGE) then
      player.Damage = player.Damage + 1.69
    end
    if (cacheFlag == CacheFlag.CACHE_LUCK) then
      player.Luck = player.Luck - 1.5
    end
    if (cacheFlag == CacheFlag.CACHE_SPEED) then
      player.MoveSpeed = player.MoveSpeed + 0.15
    end
  end
end

Mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, Mod.cacheUpdate)

-- Baby Pablo --

CollectibleType.COLLECTIBLE_BABY_PABLO = Isaac.GetItemIdByName("Baby Pablo")
FamiliarVariant.BABY_PABLO = Isaac.GetEntityVariantByName("Baby Pablo")


function Mod:GetBabyPablo(Pablo) -- Datos de B.P. --
  local data = Pablo:GetData()
  if data.Charge == nil then data.Charge = 0 end
  if data.Cooldown == nil then data.Cooldown = 0 end
  Pablo.IsFollower = true
end
Mod:AddCallback(ModCallbacks.MC_FAMILIAR_INIT, Mod.GetBabyPablo, FamiliarVariant.BABY_PABLO)

local PABLO_COOLDOWN = 30
local PABLO_CHARGE = 29
local Dir = {
  [Direction.UP] = Vector(0,-1),
  [Direction.DOWN] = Vector(0,1),
  [Direction.LEFT] = Vector(-1,0),
  [Direction.RIGHT] = Vector(1,0),
}
function Mod:UpdateBabyPablo(Pablo) -- Colores, animaciones, disparos --
  local player = Isaac.GetPlayer(0)
  local data = Pablo:GetData()
  local sprite = Pablo:GetSprite()
  local FireDir = player:GetFireDirection()
  local MoveDir = player:GetMovementDirection()
  
  if FireDir == Direction.NO_DIRECTION or data.Cooldown > 0 then
    if data.Charge == PABLO_CHARGE then
      Pablo:SetColor(Color(1,1,1,1,0,0,0),0,0,false,false)
      data.Cooldown = PABLO_COOLDOWN
      data.Charge = 0
      
      data.Laser = player:FireBrimstone(Dir[data.FireDir])
      data.Laser.Parent = Pablo
      data.Laser.Position = Pablo.Position
      data.Laser.Color = Color(0,1,1,1,0,0,0)
      data.Laser.MaxDistance = 150
      data.Laser.TearFlags = 1<<31
      
      
      sprite.FlipX = false
      if data.FireDir == Direction.UP then
        sprite:Play("FloatShootUp", false)
      elseif data.FireDir == Direction.DOWN then
        sprite:Play("FloatShootDown", false)
      elseif data.FireDir == Direction.LEFT then
        sprite:Play("FloatShootSide", false)
        sprite.FlipX = true
      elseif data.FireDir == Direction.RIGHT then
        sprite:Play("FloatShootSide", false)
      end
    elseif data.Cooldown == 0 then
      sprite.FlipX = false
      if MoveDir == Direction.UP then
        sprite:Play("FloatUp", false)
      elseif MoveDir == Direction.DOWN or MoveDir == Direction.NO_DIRECTION then
        sprite:Play("FloatDown", false)
      elseif MoveDir == Direction.LEFT then
        sprite:Play("FloatSide", false)
        sprite.FlipX = true
      elseif MoveDir == Direction.RIGHT then
        sprite:Play("FloatSide", false)
      end
    end
    if data.Cooldown > 0 then data.Cooldown = data.Cooldown - 1 end
  else
    if data.Charge < PABLO_CHARGE then
      data.Charge = data.Charge + 1
      sprite.FlipX = false
      if FireDir == Direction.UP then
        sprite:Play("FloatChargeUp", false)
      elseif FireDir == Direction.DOWN then
        sprite:Play("FloatChargeDown", false)
      elseif FireDir == Direction.LEFT then
        sprite:Play("FloatChargeSide", false)
        sprite.FlipX = true
      elseif FireDir == Direction.RIGHT then
        sprite:Play("FloatChargeSide", false)
      end
    else
      sprite.FlipX = false
      if FireDir == Direction.UP then
        sprite:SetFrame("FloatChargeUp", PABLO_CHARGE)
      elseif FireDir == Direction.DOWN then
        sprite:SetFrame("FloatChargeDown", PABLO_CHARGE)
      elseif FireDir == Direction.LEFT then
        sprite:SetFrame("FloatChargeSide", PABLO_CHARGE)
        sprite.FlipX = true
      elseif FireDir == Direction.RIGHT then
        sprite:SetFrame("FloatChargeSide", PABLO_CHARGE)
      end
      
      if Pablo.FrameCount % 4 == 0 then
        Pablo:SetColor(Color(1,1,1,1,30,30,30),0,0,false,false)
      elseif Pablo.FrameCount % 4 == 2 then
        Pablo:SetColor(Color(1,1,1,1,0,0,0),0,0,false,false)
      end
    end
    data.FireDir = FireDir
  end
  Pablo:FollowParent ()
end

Mod:AddCallback(ModCallbacks.MC_FAMILIAR_UPDATE, Mod.UpdateBabyPablo, FamiliarVariant.BABY_PABLO)

function Mod:onCache(player, cacheFlag) -- Realineación, checkeo --
  if cacheFlag == CacheFlag.CACHE_FAMILIARS then
    player:CheckFamiliar(FamiliarVariant.BABY_PABLO, player:GetCollectibleNum(CollectibleType.COLLECTIBLE_BABY_PABLO), RNG())
  end
end
Mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, Mod.onCache)


-- Hammonsin --

