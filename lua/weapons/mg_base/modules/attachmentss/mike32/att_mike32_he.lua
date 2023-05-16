ATTACHMENT.Base = "att_ammo"
ATTACHMENT.Name = "HE"
ATTACHMENT.Icon = Material("zeron/icons/40mmicon.vmt")

local BaseClass = GetAttachmentBaseClass(ATTACHMENT.Base)
function ATTACHMENT:Stats(weapon)
    BaseClass.Stats(self, weapon)
	
end
