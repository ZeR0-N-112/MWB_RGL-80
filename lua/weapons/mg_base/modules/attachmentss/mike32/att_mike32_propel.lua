ATTACHMENT.Base = "att_ammo"
ATTACHMENT.Name = "40mm High Propellant"
ATTACHMENT.Icon = Material("viper/mw/attachments/icons/grips/icon_attachment_bipod_grip.vmt")
ATTACHMENT.WeaponBodygroups = {
    ["ammotype"] = 1
}
local BaseClass = GetAttachmentBaseClass(ATTACHMENT.Base)
function ATTACHMENT:Stats(weapon)
    BaseClass.Stats(self, weapon)
	weapon.Firemodes[1].Name = "HIGH PROPELLANT"
    weapon.BlastRadius = weapon.BlastRadius / 2
    weapon.Projectile.Speed = weapon.Projectile.Speed * 2
    weapon.Projectile.Gravity = weapon.Projectile.Gravity / 1.5
end

function ATTACHMENT:OverrideWeaponMaterial(path, mat)
    return path.."thermite/", mat
end

function ATTACHMENT:OverrideAttachmentsMaterial(path, mat)
    return path.."thermite/", mat
end