ATTACHMENT.Base = "att_ammo"
ATTACHMENT.Name = "40mm Remote Sticky"
ATTACHMENT.Icon = Material("zeron/icons/40mmicon.vmt")
ATTACHMENT.WeaponBodygroups = {
    ["ammotype"] = 1
}
local BaseClass = GetAttachmentBaseClass(ATTACHMENT.Base)
function ATTACHMENT:Stats(weapon)
    BaseClass.Stats(self, weapon)
	weapon.Firemodes[1].Name = "RC STICKY"

end

function ATTACHMENT:OverrideWeaponMaterial(path, mat)
    return path.."rc/", mat
end

function ATTACHMENT:OverrideAttachmentsMaterial(path, mat)
    return path.."rc/", mat
end

function ATTACHMENT:PostProcess(weapon)
    BaseClass.PostProcess(self, weapon)
    weapon.Projectile.Class = "sdrk_rgl80_grenade_sticky"
end