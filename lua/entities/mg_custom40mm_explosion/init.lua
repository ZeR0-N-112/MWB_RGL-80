AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

ENT.ExplosionRadius = 256

function ENT:Initialize()
    self:SetModel("models/dav0r/hoverball.mdl")
    --[[self:PhysicsInit(SOLID_VPHYSICS)
    self:GetPhysicsObject():EnableMotion(false)
    self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)]]
    self:AddFlags(FL_GRENADE)
    self:AddFlags(FL_ONFIRE)
end 

function ENT:Think()
		self:Explode()
        self:Remove()
end

function ENT:Explode()
    local dmgInfo = DamageInfo()
    dmgInfo:SetAttacker(self:GetOwner())
    dmgInfo:SetDamage(150)
    dmgInfo:SetDamageType(DMG_BLAST + DMG_AIRBOAT)
    dmgInfo:SetInflictor(self)
    util.BlastDamageInfo(dmgInfo, self:GetPos(), self.ExplosionRadius)
    util.ScreenShake(self:GetPos(), 3500, 1111, 1, self.ExplosionRadius * 4)

    if (IsValid(self.arrow)) then
        self.arrow:Remove()
    end
end

function ENT:OnRemove()
    self:Explode()
end