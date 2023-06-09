AddCSLuaFile()

function SWEP:doSuppressorStats()
    self.Primary.Sound = Sound("weap_decho_sup_plr")
    self.Reverb = {
        RoomScale = 50000,
        Sounds = {
            Outside = {
                Layer = Sound("Atmo_Pistol_Mag_Sup.Outside"),
                Reflection = Sound("Reflection_ARSUP.Outside")
            },
    
            Inside = { 
                Layer = Sound("Atmo_Pistol_Sup.Inside"),
                Reflection = Sound("Reflection_ARSUP.Inside")
            }
        }
    }
    self.ParticleEffects.MuzzleFlash = "AC_muzzle_pistol_suppressed"
end

SWEP.Customization = {

    {"att_perk", "att_mike32_soh", "att_perk_fastswap", "att_perk_overclock"},
	
	{"attachment_vm_la_mike32_scope", "att_vm_minireddot01_tall", "att_vm_minireddot02_tall", "att_vm_minireddot03_tall",
    "att_vm_holo_west01", "att_vm_holo_west02", "att_vm_holo_east01", "att_vm_reflex_east01",
    "att_vm_reflex_east02", "att_vm_reflex_west02_tall", "att_vm_reflex_west03",
    "att_vm_thermal_east01", "att_vm_thermal_west01", "att_vm_thermal_east01_hybrid",
    "att_vm_hybrid_west01", "att_vm_reflex_west04", 
    "att_vm_hybrid_west03", "att_vm_4x_east01_tall",
    "att_vm_4x_west01", "att_vm_4x_west02",
    "att_vm_scope_mike14"},
	
	{"att_laser", "attachment_vm_ar_mike4_laser02", "attachment_vm_ar_mike4_laser03"},
	
	{"att_mike32_he", "att_mike32_thermite", "att_mike32_gas", "att_mike32_emp", "att_mike32_buck", "att_mike32_sticky","att_mike32_propel"},


}

--NECESSARY: it loads custom attachments from other authors
require("mw_utils")
mw_utils.LoadInjectors(SWEP)   

-- SWEP.Customization = {
-- ["Muzzle"] = {
--     Slot = 3,
--         {
--             Key = "no_muzzle"
--         },
--         {
--             Key = "attachment_vm_flashhider_psl01",
--             VElement = {
--                 Bone = "tag_silencer",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                         [2] = {Vector(0, 4, 0), Angle()},
--                         [3] = {Vector(0, 0.7, 0), Angle()},
--                         [4] = {Vector(0, 0, 0), Angle()}
--                     }
--                 }
--             },
--             Stats = function(self)
--                 self.ParticleEffects.MuzzleFlash = "AC_muzzle_pistol_suppressed"
--             end 
--         },               
     
--         {
--             Key = "attachment_vm_pi_decho_muzzlebrake",
--             VElement = {
--                 Bone = "tag_silencer",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                         [2] = {Vector(0, 4, 0), Angle()},
--                         [3] = {Vector(0, 0.7, 0), Angle()},
--                         [4] = {Vector(0, 0, 0), Angle()}
--                     }
--                 }
--             },
--             Stats = function(self)
--             end 
--         },   
--         {
--             Key = "attachment_vm_oil_filter_suppressor",
--             VElement = {
--                 Bone = "tag_silencer",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                         [2] = {Vector(0, 4, 0), Angle()},
--                         [3] = {Vector(0, 0.7, 0), Angle()},
--                         [4] = {Vector(0, 0, 0), Angle()}
--                     }
--                 }
--             },
--             Stats = function(self)
--                 doSuppressorStats(self)
--             end 
--         },    
--         {
--             Key = "attachment_vm_silencer_pstl_02",
--             VElement = {
--                 Bone = "tag_silencer",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                         [2] = {Vector(0, 4, 0), Angle()},
--                         [3] = {Vector(0, 0.7, 0), Angle()},
--                         [4] = {Vector(0, 0, 0), Angle()}
--                     }
--                 }
--             },
--             Stats = function(self)
--                 doSuppressorStats(self)
--             end 
--         },   
--         {
--             Key = "attachment_vm_silencerpstl03",
--             VElement = {
--                 Bone = "tag_silencer",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                         [2] = {Vector(0, 4, 0), Angle()},
--                         [3] = {Vector(0, 0.7, 0), Angle()},
--                         [4] = {Vector(0, 0, 0), Angle()}
--                     }
--                 }
--             },
--             Stats = function(self)
--                 doSuppressorStats(self)
--             end 
--         },
--         {
--             Key = "attachment_vm_silencerpstl",
--             VElement = {
--                 Bone = "tag_silencer",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                         [2] = {Vector(0, 4, 0), Angle()},
--                         [3] = {Vector(0, 0.7, 0), Angle()},
--                         [4] = {Vector(0, 0, 0), Angle()}
--                     }
--                 }
--             },
--             Stats = function(self)
--                 doSuppressorStats(self) 
--             end 
--         },       
               
        
--     },

--     ["Laser"] = {
--         Slot = 7,
--         {
--             Key = "no_laser",
--         },
--         {
--             Key = "attachment_vm_laser_pstl",
--               Stats = function(self)
--             end
--         },
--         {
--             Key = "attachment_vm_laser_pstl03",
--             Stats = function(self)
--             end
--         },       
--         {
--             Key = "attachment_vm_laser_pstl04",
--             Stats = function(self)
--             end
--         }
--     },


--     ["Pistol Grip"] = {
--         Slot = 5,
--         {
--             Key = "attachment_vm_pi_decho_grip",
--             Stats = function(self)
--             end
--         },
--         {
--             Key = "attachment_vm_pi_decho_cust_grip",
--             Stats = function(self)
--             end
--         }
--     },

--     ["Barrel"] = {
--         Slot = 2,
--         {
--             Key = "attachment_vm_pi_decho_slide",
--             Stats = function(self)
--             end
--         },
--         {
--             Key = "attachment_vm_pi_decho_slide_extended",
--             Stats = function(self)
--             end
--         },
--         {
--             Key = "attachment_vm_pi_decho_slide_extended02",
--             Stats = function(self)
--             end
--         }
--     },

--     ["Optic"] = {
--         Slot = 4,
--         {
--             Key = "no_optic",
--         },
--         {
--             Key = "attachment_vm_minireddot01",
--             Stats = function(self)
--             self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(0, 0, -0.365)
--             end
--         },
--         {
--             Key = "attachment_vm_minireddot02",
--             Stats = function(self)
--             self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(0, 0, -0.4)
--             end
--         },      
--         {
--             Key = "attachment_vm_minireddot03",
--             Stats = function(self)
--             self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(0, 0, -0.4)
--             end
--         }, 
--         {
--             Key = "attachment_vm_reflex_west02_lod0",
--             Stats = function(self)
--                 self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(0, 0, -0.6)
--             end
--         },         
--         {
--             Key = "attachment_vm_holo_west_lod0",
--             VElement = {
--                 Bone = "tag_reflex",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                     }
--                 }
--             },
--             Stats = function(self)
--                 self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(0, 0, -1.1)
--             end
--         },         
--         {
--             Key = "attachment_vm_holo_east",
--             VElement = {
--                 Bone = "tag_reflex",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                     }
--                 }
--             },
--             Stats = function(self)
--                 self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(0, 0, -0.85)
--             end
--         },         
--         {
--             Key = "attachment_vm_reflex_east02_lod0",
--             Stats = function(self)
--                 self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(0, 0, -0.8)
--             end
--         },         
--         {
--             Key = "attachment_vm_reflex_east",
--             Stats = function(self)
--                 self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(0, 0, -1)
--             end
--         },     
--         {
--             Key = "attachment_vm_4x_east",
--             VElement = {
--                 Bone = "tag_reflex",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                     }
--                 }
--             },
--              Stats = function(self)
--                 self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(0.13, 0, -0.75)
--             end
--         },        
--         {
--             Key = "attachment_vm_4x_west",
--             VElement = {
--                 Bone = "tag_reflex",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                     }
--                 }
--             },
--              Stats = function(self)
--                 self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(0.015, 0, -0.85)
--            end
--         },        
--         {
--             Key = "attachment_vm_4x_west02",
--             VElement = {
--                 Bone = "tag_reflex",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                     }
--                 }
--             },
--              Stats = function(self)
--                 self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(0, 0, -0.75)
--             end
--         }
--     },

--     ["Perk"] = {
--         Slot = 1,
--         {
--             Key = "no_perk",
--         },
--         {
--             Key = "perk_soh",
--             Stats = function(self)
--                 self.Animations.Reload = self.Animations.Reload_Fast
--                 self.Animations.Reload_Empty = self.Animations.Reload_Empty_Fast                
--                 self.Animations.Reload_XmagLrg = self.Animations.Reload_XmagLrg_Fast
--                 self.Animations.Reload_Empty_XmagLrg = self.Animations.Reload_Empty_XmagLrg_Fast
--                 self.Animations.Reload_Xmag = self.Animations.Reload_Xmag_Fast
--                 self.Animations.Reload_Empty_Xmag = self.Animations.Reload_Empty_Xmag_Fast
--             end
--         },
--         {
--             Key = "perk_fastmelee",
--             Stats = function(self)
--             end
--         },
--         {
--             Key = "perk_heavymelee",
--             Stats = function(self)
--             end
--         },
--         {
--             Key = "perk_fmj",
--             Stats = function(self)
--             end
--         }
--     },

--     ["Magazine"] = {
--         Slot = 6,
--         {
--             Key = "attachment_vm_pi_decho_mag",
--             Stats = function(self)
--             end
--         },
--         {
--             Key = "attachment_vm_pi_decho_xmags",
--             Stats = function(self)
--             end
--         },
--         {
--             Key = "attachment_vm_pi_decho_xmags2",
--             Stats = function(self)
--             end
--         }
--     },

--     -- ["Camo"] = {
--     --     Slot = 8,
--     --     {
--     --         Key = "no_camo",
--     --     },
--     --     {
--     --         Key = "camo_jermasus",
--     --         Stats = function(self)
--     --         end
--     --     },
--     --     {
--     --         Key = "camo_digital",
--     --         Stats = function(self)
--     --         end
--     --     }
--     -- },
-- }