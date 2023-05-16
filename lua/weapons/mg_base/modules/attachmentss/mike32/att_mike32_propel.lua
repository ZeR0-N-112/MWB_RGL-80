ATTACHMENT.Base = "att_ammo"
ATTACHMENT.Name = "40mm High Propellant"
ATTACHMENT.Icon = Material("zeron/icons/40mmicon.vmt")
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
    return path.."hp/", mat
end

function ATTACHMENT:OverrideAttachmentsMaterial(path, mat)
    return path.."hp/", mat
end