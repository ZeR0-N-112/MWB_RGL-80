AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

ENT.bCollided = false
ENT.Projectile = {
	Class = "mg_bullet",
	Speed = 4000,
	Gravity = 1
}
ENT.Maxs = Vector(1, 1, 1)
ENT.Model = Model("models/items/ar2_grenade.mdl")
ENT.AoeEntity = nil

function ENT:Initialize()
	ParticleEffectAttach("rgl80_smoke_trail", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	self:SetModel(self.Model)
	self:PhysicsInitBox(Vector(-10, -1, -1), Vector(10, 1, 1))
	self:GetPhysicsObject():Wake()
	self:GetPhysicsObject():SetMaterial("default_silent")
	self:GetPhysicsObject():AddGameFlag(FVPHYSICS_NO_PLAYER_PICKUP)
	self:GetPhysicsObject():AddGameFlag(FVPHYSICS_NO_IMPACT_DMG)
	self:GetPhysicsObject():AddGameFlag(FVPHYSICS_HEAVY_OBJECT)
	self:GetPhysicsObject():EnableMotion(true)
	self:GetPhysicsObject():EnableDrag(false)
	self:GetPhysicsObject():SetMass(1000)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE) --doesn't collide with anything, no traces
	self:AddEFlags(EFL_NO_DAMAGE_FORCES)
	self:AddEFlags(EFL_DONTWALKON)
	self:AddEFlags(EFL_DONTBLOCKLOS)
	self:AddEFlags(EFL_NO_PHYSCANNON_INTERACTION)

	self.Projectile = table.Copy(self.Weapon.Projectile)
	self:GetPhysicsObject():SetVelocityInstantaneous(self:GetAngles():Forward() * self.Projectile.Speed)
	self.LastPos = self:GetOwner():EyePos()
	self.Bullet = self.Weapon.Bullet
end

function ENT:Think()
	--[[if (IsValid(self:GetParent()) && self:GetParent():Health() <= 0 && self:GetParent():GetMaxHealth() > 1) then
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		self:GetPhysicsObject():EnableMotion(true)
		self:GetPhysicsObject():Wake()
		self:SetParent(NULL)
	end]]
end

ENT.m_gravity = 0

function ENT:PhysicsUpdate(phys)
	if (!phys:IsMotionEnabled()) then
		return
	end

	self.m_gravity = math.Clamp(self.m_gravity + (self.Projectile.Gravity), -90, 90)

	phys:SetAngles(phys:GetAngles() + Angle(self.m_gravity, 0, 0) * FrameTime())
	phys:SetPos(self.LastPos + phys:GetAngles():Forward() * (self.Projectile.Speed * FrameTime()))
	
	--Aim assist
	if (GetConVar("mgbase_debug_projectiles"):GetInt() > 0) then
		debugoverlay.Box(phys:GetPos(), -self.Maxs, self.Maxs, 0, Color(0, 200, 50, 10))
	end

	local trData = {
		start = self.LastPos,
		endpos = phys:GetPos(),
		filter = {self:GetOwner(), self},
		mask = MASK_SHOT_PORTAL,
		collisiongroup = COLLISION_GROUP_PROJECTILE,
		mins = -self.Maxs,
		maxs = self.Maxs
	}

	local tr = util.TraceHull(trData)

	if (tr.Hit && (tr.Entity:IsPlayer() || tr.Entity:IsNPC())) then
		self:Impact(tr, phys, true)
		return
	end

	--Normal hitscan
	if (GetConVar("mgbase_debug_projectiles"):GetInt() > 0) then
		debugoverlay.Line(self.LastPos, phys:GetPos(), 1, Color(255, 0, 0, 1))
	end

	tr = util.TraceLine(trData)

	if (tr.Hit) then
		self:Impact(tr, phys, false)
		return
	end

	self.LastPos = phys:GetPos()
end

local function parentEntity(tr, ent)
	local arrowHitAng = tr.Normal:Angle()
	local arrowHitPos = tr.HitPos + arrowHitAng:Forward() * -3 + arrowHitAng:Up() * -1.5
	local boneId = tr.Entity:GetHitboxBone(tr.HitBox, 0)

	if (boneId != nil) then
		if (tr.Entity:IsRagdoll()) then
			boneId = tr.Entity:TranslatePhysBoneToBone(tr.PhysicsBone)
		end

		ent:FollowBone(tr.Entity, boneId)
		debugoverlay.Text(tr.HitPos, tr.Entity:GetBoneName(boneId), 1)
	else
		if (!tr.Entity:IsWorld()) then
			ent:SetParent(tr.Entity)
		end
	end

	ent:SetAngles(arrowHitAng)
	ent:SetPos(arrowHitPos)
end

function ENT:Think()
	if (!self:GetNailed()) then
		return
	end

	if (self.Projectile.PickUp) then
		local dist = self:GetOwner():NearestPoint(self:GetPos()):DistToSqr(self:GetPos())

		if (dist < 32 * 32) then
			self:GetOwner():EmitSound("viper/shared/iw8_mp_scavenger_pack_pickup.wav")
			self:GetOwner():SetAmmo(self:GetOwner():GetAmmoCount("XBowBolt") + 1, "XBowBolt")
			self:Remove()
		end
	end
end
 
function ENT:Impact(tr1, phys, bHull)
	SafeRemoveEntityDelayed(self, 20)

	phys:EnableMotion(false)

	if (self.Projectile.PickUp) then
		self:AddEffects(EF_ITEM_BLINK)
	end

	self:SetMoveType(MOVETYPE_NONE)
	self:SetNailed(true)

	self:StopParticles()
	
	self:FireBullets({
		Attacker = self:GetOwner(),
		Num = 1,
		Tracer = 0,
		Src = self.LastPos,
		Dir = (phys:GetPos() - self.LastPos):GetNormalized(),
		HullSize = bHull && self.Maxs:Length() * 2 || 1,
		IgnoreEntity = self,
		Callback = function(attacker, tr, dmgInfo)
			dmgInfo:SetInflictor(IsValid(self.Weapon) && self.Weapon || self)
			dmgInfo:SetDamageType(dmgInfo:GetDamageType() + DMG_DIRECT + self:GetDamageType())

			if (IsValid(self.Weapon)) then
				self.Weapon:BulletCallback(attacker, tr, dmgInfo)
			end

			if (tr.HitSky) then
				self:Remove()
				return
			end

			if (self.AoeEntity != nil) then
				local aoe = ents.Create(self.AoeEntity)
				aoe:SetOwner(self:GetOwner())
				parentEntity(tr, aoe)
				aoe:SetPos(tr.HitPos + tr.HitNormal * 3)

				local angle = tr.HitNormal:Angle()
				angle:RotateAroundAxis(angle:Right(), 270)

				aoe:SetAngles(angle)
				aoe:Spawn()
				aoe.arrow = self
				self.aoe = aoe
			end

			if (tr.Entity:IsPlayer() || tr.Entity:IsNPC() || tr.Entity:IsNextBot() || tr.Entity:IsRagdoll()) then
				sound.Play("MW19_Crossbow.HitBody", tr.HitPos + tr.HitNormal * 5)
				self:Remove()
				return
			end

			sound.Play("MW19_Crossbow.Hit", tr.HitPos)

			self:FireBullets({
				Attacker = self:GetOwner(),
				Num = 1,
				Tracer = 0,
				Src = tr.HitPos + self:GetAngles():Forward() * 11,
				Dir = tr.Normal * -1,
				IgnoreEntity = self.aoe,
				Damage = 0,
				Callback = function(attacker, trBack, dmgInfo)
					if (trBack.Entity != tr.Entity) then
						--constraint.Weld(tr.Entity, trBack.Entity, tr.PhysicsBone, trBack.PhysicsBone, 0, false)
						local lPos1 = LocalToWorld(tr.HitPos, tr.HitNormal:Angle(), tr.Entity:GetPos(), tr.Entity:GetAngles())
						lPos1 = tr.Entity:GetPhysicsObject():WorldToLocal(tr.HitPos + tr.HitNormal)

						local lPos2 = LocalToWorld(tr.HitPos, tr.HitNormal:Angle(), trBack.Entity:GetPos(), trBack.Entity:GetAngles())

						self.constraint = constraint.Axis(tr.Entity, trBack.Entity, tr.PhysicsBone, trBack.PhysicsBone, lPos1, lPos2, 0, 0, 0, false)
						self:EmitSound("MW19_Crossbow.Skewer")
					end
				end
			})
		end
	})

	local customInputs = {
		["npc_turret_floor"] = function(npc) npc:Fire("SelfDestruct") end,
		["npc_rollermine"] = function(npc) npc:Fire("PowerDown") end,
		["npc_cscanner"] = function(npc) npc:SetHealth(0) npc:ClearSchedule() end,--SCHED_SCANNER_ATTACK_DIVEBOMB,
		["npc_clawscanner"] = function(npc) npc:SetHealth(0) npc:ClearSchedule() end,--SCHED_SCANNER_ATTACK_DIVEBOMB,
		["npc_manhack"] = function(npc) npc:MoveStop() npc:SetHealth(0) npc:MoveStart() end,
		["npc_turret_ceiling"] = function(npc) npc:SetHealth(0) npc:TakeDamage(1000, npc, npc) end,
		["npc_combine_camera"] = function(npc) npc:SetHealth(0) npc:TakeDamage(1000, npc, npc) end,
		["npc_dog"] = function(npc) npc:TakeDamage(10000, npc, npc) end,
		["npc_hunter"] = function(npc) npc:Fire("Dodge") end,
		["combine_mine"] = function(npc) npc:SetSaveValue("m_iMineState", "3") npc:Fire("Disarm") npc:EmitSound("npc/roller/mine/rmine_tossed1.wav", 75, math.random(95, 105), 1, CHAN_BODY) end,
		["item_healthcharger"] = function(npc) npc:SetSaveValue("m_iJuice", "0") npc:Use(Entity(1)) npc:EmitSound("items/medshotno1.wav", 75, math.random(95, 105), 1, CHAN_BODY) end,
		["item_suitcharger"] = function(npc) npc:SetSaveValue("m_iJuice", "0") npc:Use(Entity(1)) npc:EmitSound("items/suitchargeno1.wav", 75, math.random(95, 105), 1, CHAN_BODY) end,
		["prop_thumper"] = function(npc) npc:Fire("Disable") end,
		["grenade_helicopter"] = function(npc) npc:SetSaveValue("m_flLifeTime", "10000000") Entity(1):SimulateGravGunPickup(npc) 
			--npc:SetSaveValue("spawnflags", ""..bit.bor(npc:GetSpawnFlags(), 16)) end --dud, doesn't get read runtime?
		end,
		["item_battery"] = function(npc) npc:AddFlags(FL_DONTTOUCH) end,
		["weapon_striderbuster"] = function(npc) npc:Fire("Break") end, --the amount of effort required to make this thing detonate... nah
		["npc_grenade_frag"] = function(npc) 
			for _, c in pairs(npc:GetChildren()) do
				c:Fire("Disable")
			end
			npc:Fire("SetTimer", "9999") 
			npc:SetSaveValue("m_flNextBlipTime", "9999") end --aware that if you pick it up it's gonna restart
		--wanted to give player satisfaction of disabling it and then using it to fuck em up
	}

	sound.Play("^viper/shared/emp_expl.ogg", self:GetPos(), 0, 150, 1, CHAN_BODY) --snd scripts dont work lol!

    local angle = Angle(0,0,0)
	angle:RotateAroundAxis(angle:Right(), 270)
    ParticleEffect("Generic_explo_emp", self:GetPos(), angle, nil, 0)
    util.ScreenShake(self:GetPos(), 3500, 1111, 1, 600 * 2)
    
    for _, e in pairs(ents.FindInSphere(self:GetPos(), 600)) do
        if (e:IsPlayer()) then
            e:SetNWFloat("MW19_EMPEffect", CurTime() + 4)
            e:SetArmor(0)
            continue
        end

        if (customInputs[e:GetClass()] != nil) then
            timer.Simple(math.Rand(0, 0.2), function()
                if (!IsValid(e)) then
                    return
                end
                customInputs[e:GetClass()](e)
            end)

            local ef = EffectData()
            ef:SetEntity(e)
            ef:SetMagnitude(30)
            ef:SetScale(20)
            util.Effect("TeslaHitboxes", ef)
        else
            --if someone wants to latch onto this functionality
            if (e.OnModernWarfareEMP != nil) then
                e.OnModernWarfareEMP(self, tr)
            end
        end
    end
	self:Remove()
end

function ENT:GetDamageType()
	return DMG_SNIPER + DMG_SLASH
end

function ENT:OnRemove()
	if (IsValid(self.constraint)) then
		self.constraint:Remove()
	end
end