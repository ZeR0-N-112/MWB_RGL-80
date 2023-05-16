ATTACHMENT.Base = "att_ammo"
ATTACHMENT.Name = "40mm M576 Buckshot"
ATTACHMENT.Icon = Material("zeron/icons/40mmicon.vmt")
ATTACHMENT.Bodygroups = {
    ["ammotype"] = 1
}
local BaseClass = GetAttachmentBaseClass(ATTACHMENT.Base)
function ATTACHMENT:Stats(weapon)
    BaseClass.Stats(self, weapon)
	weapon.Bullet.Damage[1] = 200
    weapon.Bullet.Damage[2] = 30
	weapon.Bullet.NumBullets = 20
	weapon.Firemodes[1].Name = "BUCKSHOT"
	weapon.Primary.Sound = Sound("mw19.scharlie.Fire")
	weapon.ParticleEffects.MuzzleFlash = "AC_muzzle_Shotgun"
end
function ATTACHMENT:PostProcess(weapon)
    BaseClass.PostProcess(self, weapon)
    weapon.Projectile = nil
end
