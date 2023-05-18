AddCSLuaFile()

game.AddParticles( "particles/rgl80.pcf" )
PrecacheParticleSystem("rgl80_smoke_trail")

game.AddParticles("particles/rgl80napalm.pcf")
PrecacheParticleSystem("napalm_firepool")
PrecacheParticleSystem("napalm_bomb_trail")

PrecacheParticleSystem("AC_muzzle_desert")
PrecacheParticleSystem("AC_muzzle_pistol_suppressed")
PrecacheParticleSystem("AC_muzzle_pistol_ejection")
PrecacheParticleSystem("AC_muzzle_pistol_smoke_barrel")
include("animations.lua")
include("customization.lua")


local mgbase = weapons.GetStored("mg_base")

mgbase.StatDefinitions["SWEP.BlastRadius"] = "BlastRadius"
mgbase.StatDefinitions["SWEP.ImpactBlastRatio"] = "ImpactBlastRatio"

mgbase.StatInfo["BlastRadius"] = {
    Name = "Blast Radius",
    ProIfMore = true,
    ShowPercentage = true
}
mgbase.StatInfo["ImpactBlastRatio"] = {
    Name = "Blast Damage",
    ProIfMore = true,
    ShowPercentage = true
}

if CLIENT then
    killicon.Add( "mg_deagle", "VGUI/entities/mg_deagle", Color(255, 0, 0, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/spawnicons/icon_cac_weapon_pi_decho")
end

SWEP.Base = "mg_base"

SWEP.PrintName = "RGL-80"
SWEP.Category = "Modern Warfare"
SWEP.SubCategory = "Launchers"
SWEP.Spawnable = true
SWEP.VModel = Model("models/zeron/mgl/vm_la_mike32.mdl")
SWEP.WorldModel = Model("models/viper/mw/weapons/w_deagle.mdl")
SWEP.Trigger = {
    PressedSound = Sound("weap_mike32_fire_plr_mech"),
    ReleasedSound = Sound("weap_mike203_trig"),
    Time = 0.05
}
SWEP.Slot = 4
SWEP.HoldType = "Shotgun"

SWEP.Primary.Sound = Sound("weap_mike32_fire")
SWEP.Primary.Ammo = "SMG1_Grenade"
SWEP.Primary.ClipSize = 6 
SWEP.Primary.Automatic = false
SWEP.Primary.BurstRounds = 1
SWEP.Primary.BurstDelay = 0
SWEP.Primary.RPM = 125
SWEP.CanChamberRound = false
SWEP.CanDisableAimReload = true
SWEP.Projectile = {
    Class = "sdrk_rgl80_grenade", --bullet entity class
    Speed = 2800, --2800
    Gravity = 0.7, --1.05
    Penetrate = false
}

SWEP.BlastRadius = 128
SWEP.ImpactBlastRatio = 3

SWEP.ParticleEffects = {
    ["MuzzleFlash"] = "AC_muzzle_pistol_suppressed",
    ["MuzzleFlash_Suppressed"] = "AC_muzzle_pistol_suppressed",
    ["Ejection"] = "AC_muzzle_pistol_ejection",
}

SWEP.Reverb = {
    RoomScale = 50000, --(cubic hu)
    --how big should an area be before it is categorized as 'outside'?
 
    Sounds = {
        Outside = {
            Layer = Sound("weap_mike203_fire_plr_atmos_out"),
            Reflection = Sound("")
        }, 

        Inside = { 
            Layer = Sound("weap_mike203_fire_plr_atmos_in"),
            Reflection = Sound("")
        }
    }
}

SWEP.Firemodes = {
    [1] = {
        Name = "HIGH EXPLOSIVE",
        OnSet = function()
            return nil
        end
    }
}

SWEP.BarrelSmoke = {
    Particle = "AC_muzzle_pistol_smoke_barrel",
    Attachment = "muzzle",
    ShotTemperatureIncrease = 100,
    TemperatureThreshold = 100, --temperature that triggers smoke
    TemperatureCooldown = 100 --degrees per second
}

SWEP.Cone = {
    Hip = 0.12, --accuracy while hip
    Ads = 0.1, --accuracy while aiming
    Increase = 0.2, --increase cone size by this amount every time we shoot
    AdsMultiplier = 0.15, --multiply the increase value by this amount while aiming
    Max = 1.23, --the cone size will not go beyond this size
    Decrease = 0.2, -- amount (in seconds) for the cone to completely reset (from max)
    Seed = 54892 --just give this a random number
}

SWEP.Recoil = {
    Vertical = {3, 3}, --random value between the 2
    Horizontal = {-1, 2}, --random value between the 2
    Shake = 3.5, --camera shake
    AdsMultiplier = 0.65, --multiply the values by this amount while aiming
    Seed = 4445523 --give this a random number until you like the current recoil pattern
}

SWEP.Bullet = {
    Damage = {150, 150}, --first value is damage at 0 meters from impact, second value is damage at furthest point in effective range
    EffectiveRange = 25, --in meters, damage scales within this distance
    DropOffStartRange = 5, --in meters, damage scales within this distance
    Range = 50, --in meters, after this distance the bullet stops existing
    Tracer = false, --show tracer
    NumBullets = 1, --the amount of bullets to fire
    PhysicsMultiplier = 1.5, --damage is multiplied by this amount when pushing objects
    HeadshotMultiplier = 1,
    Penetration = {
        DamageMultiplier = 0.875, --how much damaged is multipled by when leaving a surface.
        MaxCount = 6, --how many times the bullet can penetrate.
        Thickness = 16, --in hu, how thick an obstacle has to be to stop the bullet.
    }
}

SWEP.Zoom = {
    FovMultiplier = 0.95,
    ViewModelFovMultiplier = 1,
    Blur = {
        EyeFocusDistance = 15
    }
}

SWEP.WorldModelOffsets = {
    Bone = "tag_pistol_offset",
    Angles = Angle(0, 90, -90),
    Pos = Vector(3, -3, -1.75)
}

SWEP.ViewModelOffsets = {
    Sprint = {
        Angles = Angle(0, 5, 5), 
        Pos = Vector(-0, -0, -1)
    }, 
    Aim = {
        Angles = Angle(0, 0, 0), 
        Pos = Vector(-0.026, -8.4, -0.589)
    }, 
    Idle = {  
        Angles = Angle(0, 0, 0), 
        Pos = Vector(0, 0, 0) 
    },   
    Inspection = {
        Bone = "tag_pistol_offset",
        X = {
            [0] = {Pos = Vector(0, 2, -2), Angles = Angle(30, 0, -30)},
            [1] = {Pos = Vector(0, 0, 0), Angles = Angle(0, 0, 0)}
        },
        Y = {
            [0] = {Pos = Vector(2, 0, 0), Angles = Angle(-30, -30, 0)},
            [1] = {Pos = Vector(-4, 0, 0), Angles = Angle(0, 30, 0)}
        }
    },
    RecoilMultiplier = 5,   
    KickMultiplier = 1.5  
}    
   
SWEP.Shell = "mwb_shelleject_45"

if CLIENT then 
    function SWEP:DrawCrosshairSticks(x,y) 
        local aimDelta = 1 - self:GetAimDelta()

        surface.SetAlphaMultiplier(aimDelta)
    
        local crosshairAlpha = 200
    
        --dot
        local c = self:GetCone()
        local m = self.Cone.Max
        local h = self.Cone.Hip
        local dotDelta = (c - h) / (m - h) 
        if (m - h <= 0) then
            dotDelta = 0
        end
    
        local color = string.ToColor(GetConVar("mgbase_hud_xhaircolor"):GetString())
        surface.SetDrawColor(color.r, color.g, color.b, 200)
    
        if (self:CanDrawCrosshair()) then
            local cone = self:GetCone() * 100
            local drawRect = surface.DrawTexturedRectRotated
            local sizeW = 32
            local sizeH = 32
    
            --left stick
            draw.RoundedBox( 5, x - cone, y, 2, 7,Color(255,255,255,crosshairAlpha))

            draw.RoundedBox( 20, x - cone - 23, y, 23, 2,Color(255,255,255,crosshairAlpha))
			
			draw.RoundedBox( 5, x - cone, y + 20, 2, 7,Color(255,255,255,crosshairAlpha))
			
            draw.RoundedBox( 20, x - cone - 17, y + 20, 17, 2,Color(255,255,255,crosshairAlpha))
			
			draw.RoundedBox( 5, x - cone, y + 40, 2, 7,Color(255,255,255,crosshairAlpha))
			
            draw.RoundedBox( 20, x - cone - 11, y + 40, 11, 2,Color(255,255,255,crosshairAlpha))
            
            --left stick
            draw.RoundedBox( 5, x + cone - 2, y, 2, 7,Color(255,255,255,crosshairAlpha))

            draw.RoundedBox( 20, x + cone, y, 23, 2,Color(255,255,255,crosshairAlpha))
			
			draw.RoundedBox( 5, x + cone - 2, y + 20, 2, 7,Color(255,255,255,crosshairAlpha))

            draw.RoundedBox( 20, x + cone, y + 20, 17, 2,Color(255,255,255,crosshairAlpha))

			draw.RoundedBox( 5, x + cone - 2, y + 40, 2, 7,Color(255,255,255,crosshairAlpha))
			
            draw.RoundedBox( 20, x + cone, y + 40, 11, 2,Color(255,255,255,crosshairAlpha))

     
        end
    
        surface.SetAlphaMultiplier(1)
        surface.SetDrawColor(255, 255, 255, 255)
    end
end

               
--                    ***HOLY SECTION***
--                    PRAYING NOT TO BUG
--                            _
--                         _ooOoo_
--                        o8888888o
--                        88" . "88
--                        (| -_- |)
--                        O\  =  /O
--                     ____/`---'\____
--                   .'  \\|     |//  `.
--                  /  \\|||  :  |||//  \
--                 /  _||||| -:- |||||_  \
--                 |   | \\\  -  /'| |   |
--                 | \_|  `\`---'//  |_/ |
--                 \  .-\__ `-. -'__/-.  /
--               ___`. .'  /--.--\  `. .'___
--            ."" '<  `.___\_<|>_/___.' _> \"".
--           | | :  `- \`. ;`. _/; .'/ /  .' ; |
--           \  \ `-.   \_\_`. _.'_/_/  -' _.' /
-- ===========`-.`___`-.__\ \___  /__.-'_.'_.-'================
 