ATTACHMENT.Base = "att_ammo"
ATTACHMENT.Name = "40mm Incendiary"
ATTACHMENT.Icon = Material("viper/mw/attachments/icons/grips/icon_attachment_bipod_grip.vmt")
ATTACHMENT.WeaponBodygroups = {
    ["ammotype"] = 1
}
local BaseClass = GetAttachmentBaseClass(ATTACHMENT.Base)
function ATTACHMENT:Stats(weapon)
    BaseClass.Stats(self, weapon)
	weapon.Firemodes[1].Name = "INCENDIARY"

end
function ATTACHMENT:PostProcess(weapon)
    BaseClass.PostProcess(self, weapon)
    weapon.Projectile.Class = "mg_drpeppercan"
end