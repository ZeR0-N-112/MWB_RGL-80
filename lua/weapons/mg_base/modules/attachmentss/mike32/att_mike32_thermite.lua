ATTACHMENT.Base = "att_ammo"
ATTACHMENT.Name = "40mm Napalm"
ATTACHMENT.Icon = Material("zeron/icons/40mmicon.vmt")
ATTACHMENT.WeaponBodygroups = {
    ["ammotype"] = 1
}
local BaseClass = GetAttachmentBaseClass(ATTACHMENT.Base)
function ATTACHMENT:Stats(weapon)
    BaseClass.Stats(self, weapon)
	weapon.Firemodes[1].Name = "INCENDIARY"

end

function ATTACHMENT:OverrideWeaponMaterial(path, mat)
    return path.."thermite/", mat
end

function ATTACHMENT:OverrideAttachmentsMaterial(path, mat)
    return path.."thermite/", mat
end

function ATTACHMENT:PostProcess(weapon)
    BaseClass.PostProcess(self, weapon)
    weapon.Projectile.Class = "sdrk_rgl80_grenade_napalm"
end