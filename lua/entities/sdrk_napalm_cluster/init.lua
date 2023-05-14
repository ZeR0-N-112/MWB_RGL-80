AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize() 
    self:SetModel("models/Items/AR2_Grenade.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetColor(Color(0,0,0))
    ParticleEffectAttach("napalm_bomb_trail", PATTACH_ABSORIGIN_FOLLOW, self, 0)

    local phys = self:GetPhysicsObject()

    if phys:IsValid() then

        phys:Wake()

    end

    self:SetAngles(AngleRand())
    phys:SetVelocity(self:GetForward() * 350 + Vector(0,0,math.random(100, 200)))
end

local function CanDetonate(ent) 
    
    if ent:IsWorld() then 
        return true
    end

    if ent:IsPlayer() || ent:IsNPC() || ent:IsNextBot() then 
        return false
    end

    return true
end

function ENT:PhysicsCollide( data, phys )
    if data.HitNormal.z <= -0.6 && CanDetonate(data.HitEntity) then
        local flame = ents.Create("sdrk_napalm_pool")
        flame:SetPos(self:GetPos())
        flame:Spawn()
        flame.Owner = self.Owner
        self:Remove() 
    end
end