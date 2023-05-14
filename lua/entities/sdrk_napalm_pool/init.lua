AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize() 
    ParticleEffectAttach("napalm_firepool", PATTACH_ABSORIGIN_FOLLOW, self, 0)
    self.DeathTime = CurTime() + 2
    self:EmitSound("ambient/fire/fire_small_loop2.wav", 100, 100, 1, CHAN_WEAPON)
    self:EmitSound("ambient/fire/gascan_ignite1.wav", 75, 100, 0.4, CHAN_WEAPON)
end

function ENT:Think() 

    for k, v in pairs(ents.FindInSphere(self:GetPos(), 50)) do 
        if v.ClassName != self.ClassName then
            v:Ignite(10, 10) 
            v:TakeDamage(10, self.Owner, self)
        end
    end

    if CurTime() > self.DeathTime then 
        self:Remove()
    end

    self:NextThink(CurTime() + 0.2)
    return true
end

function ENT:OnRemove() 
    self:StopSound("ambient/fire/fire_small_loop2.wav")
end