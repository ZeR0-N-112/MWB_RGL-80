include("shared.lua")

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT
ENT.bTracerOn = false

ENT.OuterFlairColor = Color(218,12,65,255)
ENT.InnerFlairColor = Color(255,155,155,255)

ENT.OuterFlairScale = 1
ENT.InnerFlairScale = 0.3

local flair = Material("shadowdark/flairs/grenade_flair.vmt")

function ENT:DrawTranslucent(flags)
	if (self:GetVelocity():LengthSqr() > 0 || self:GetNailed()) then
		self:DrawModel()

		local ang = LocalPlayer():EyeAngles()
        local angle = Angle( 0, LocalPlayer():EyeAngles()[2], 0 )

        angle = Angle(LocalPlayer():EyeAngles()[1], angle.y, 0 )
       
        angle:RotateAroundAxis( angle:Up(), -90 )
        angle:RotateAroundAxis( angle:Forward(), 90 )


		cam.Start3D2D( self:GetPos() - self:GetForward() * 5, angle, 0.2 )

			local OuterScale = 512 * self.OuterFlairScale
			local InnerScale = 512 * self.InnerFlairScale

			surface.SetMaterial(flair)
			surface.SetDrawColor(self.OuterFlairColor)
			surface.DrawTexturedRect(-OuterScale/2, -OuterScale/2, OuterScale, OuterScale)

			surface.SetDrawColor(self.InnerFlairColor)
			surface.DrawTexturedRect(-InnerScale/2, -InnerScale/2, InnerScale, InnerScale)
        cam.End3D2D()

		if (!self.bTracerOn) then
			self.bTracerOn = true
		end
	end
end

function ENT:OnRemove() 
	ParticleEffect("Generic_explo_high", self:GetPos(), self:GetAngles())
	self:EmitSound("^viper/shared/frag_expl.ogg", 0, 100, 1, CHAN_BODY)
	util.Decal("Scorch", self:GetPos(), self:GetPos() + self:GetUp() * -100, {self})
end