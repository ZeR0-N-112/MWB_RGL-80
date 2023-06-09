include("shared.lua")

killicon.Add("mg_aoe_arrow_explosion", "VGUI/entities/mg_crossbow", Color(255, 0, 0, 255))

local BaseClass = baseclass.Get(ENT.Base)

function ENT:Draw(flags)
    self:DrawShadow(false)
end 

function ENT:OnRemove()
    ParticleEffect("Generic_explo_high", self:GetPos(), self:GetAngles())
    self:EmitSound("^viper/shared/frag_expl.ogg", 0, 100, 1, CHAN_BODY) --snd scripts dont work lol!

	local dlight = DynamicLight(self:EntIndex())
	if (dlight) then
		dlight.pos = self:GetPos()
		dlight.r = 255
		dlight.g = 75
		dlight.b = 0
		dlight.brightness = 5
		dlight.Decay = 500
		dlight.Size = 512
		dlight.DieTime = CurTime() + 6
	end

    util.Decal("Scorch", self:GetPos(), self:GetPos() + self:GetUp() * -100, {self, self.arrow})
end