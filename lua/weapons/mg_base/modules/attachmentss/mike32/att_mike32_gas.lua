ATTACHMENT.Base = "att_ammo"
ATTACHMENT.Name = "40mm Gas"
ATTACHMENT.Icon = Material("viper/mw/attachments/icons/grips/icon_attachment_bipod_grip.vmt")
ATTACHMENT.AttachmentBodygroups = {
    ["ammotype"] = 1
}

local BaseClass = GetAttachmentBaseClass(ATTACHMENT.Base)
function ATTACHMENT:Stats(weapon)
    BaseClass.Stats(self, weapon)
	weapon.Firemodes[1].Name = "GAS"
end

function ATTACHMENT:PostProcess(weapon)
    BaseClass.PostProcess(self, weapon)
    weapon.Projectile.Class = "sdrk_rgl80_grenade_gas"
end