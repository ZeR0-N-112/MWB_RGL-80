ATTACHMENT.Base = "att_ammo"
ATTACHMENT.Name = "40mm M576 Buckshot"
ATTACHMENT.Icon = Material("viper/mw/attachments/icons/grips/icon_attachment_bipod_grip.vmt")
ATTACHMENT.Bodygroups = {
    ["ammotype"] = 0
}
local BaseClass = GetAttachmentBaseClass(ATTACHMENT.Base)
function ATTACHMENT:Stats(weapon)
    BaseClass.Stats(self, weapon)
	weapon.Bullet.Damage[1] = 200
    weapon.Bullet.Damage[2] = 30
	weapon.Bullet.NumBullets = 20
	weapon.Firemodes[1].Name = "BUCKSHOT"
end
function ATTACHMENT:PostProcess(weapon)
    BaseClass.PostProcess(self, weapon)
    weapon.Projectile = nil
end
