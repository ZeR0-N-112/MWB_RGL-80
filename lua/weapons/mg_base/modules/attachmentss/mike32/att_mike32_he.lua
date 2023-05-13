ATTACHMENT.Base = "att_ammo"
ATTACHMENT.Name = "HE"
ATTACHMENT.Icon = Material("viper/mw/attachments/icons/grips/icon_attachment_bipod_grip.vmt")

local BaseClass = GetAttachmentBaseClass(ATTACHMENT.Base)
function ATTACHMENT:Stats(weapon)
    BaseClass.Stats(self, weapon)
	
end
