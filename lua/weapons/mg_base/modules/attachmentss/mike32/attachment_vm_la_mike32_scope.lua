ATTACHMENT.Base = "att_optic_4x"
ATTACHMENT.Name = "defaultrgl"
ATTACHMENT.Model = Model("models/zeron/mgl/attachment_vm_la_mike32_scope_LOD0.mdl")
ATTACHMENT.Icon = Material("viper/mw/attachments/icons/optics/icon_attachment_4x_east.vmt")


ATTACHMENT.Optic = {
    LensHideMaterial = Material("viper/MW/attachments/attachment_vm_scope_vz_lens.vmt"),
    HideModel = Model("models/zeron/mgl/attachment_vm_la_mike32_scope_LOD0_hide.mdl"),
    LensBodygroup = "lens",
    FOV = 7, 
    ParallaxSize = 750, --a value of zero means 1:1 size with the end of the optic
    Thermal = false
}
ATTACHMENT.Reticle = {
    Material = Material("zeron/reticles/40mmreticle"),
    Size = 900,
    Color = Color(255, 255, 255, 255),
    Attachment = "reticle",
	Offset = Vector(-0.18, 0, 0)
}
local BaseClass = GetAttachmentBaseClass(ATTACHMENT.Base)
function ATTACHMENT:Stats(weapon)
    BaseClass.Stats(self, weapon)
	weapon.ViewModelOffsets.Aim.Pos = weapon.ViewModelOffsets.Aim.Pos + Vector(0, 0, 0.21)
	weapon.ViewModelOffsets.Aim.Angles = weapon.ViewModelOffsets.Aim.Angles + Angle(0, 0, 0)
	weapon.Zoom.ViewModelFovMultiplier = weapon.Zoom.ViewModelFovMultiplier * 1.05
end