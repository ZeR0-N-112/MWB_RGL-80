AddCSLuaFile()


---Mutant---
sound.Add({
    name =           "weap_mike32_fire",
    channel =        CHAN_WEAPON,
    level = 90	,
    volume =         7,
    pitch = {100,100},
    sound = {"mw22/weap_mike32_fire_plr_01.wav",
	         "mw22/weap_mike32_fire_plr_02.wav",
			 "mw22/weap_mike32_fire_plr_03.wav",
			 "mw22/weap_mike32_fire_plr_04.wav",
			 "mw22/weap_mike32_fire_plr_05.wav",
			 "mw22/weap_mike32_fire_plr_06.wav",
            }              
})
sound.Add({
    name =           "weap_mike32_fire_plr_mech",
    channel =        CHAN_TRIGGER + 1,
    level = 90,
    volume =         0.4,
    pitch = {-2,2},
    sound = {"mw22/weap_mike32_fire_plr_mech_01.wav",
	         "mw22/weap_mike32_fire_plr_mech_01.wav",
			 "mw22/weap_mike32_fire_plr_mech_01.wav",
			 "mw22/weap_mike32_fire_plr_mech_01.wav",
			 "mw22/weap_mike32_fire_plr_mech_01.wav",
			 "mw22/weap_mike32_fire_plr_mech_01.wav",
			 }              
})
sound.Add({
    name =            "weap_mike203_fire_plr_atmos_out",
    channel =        CHAN_ATMO,
 	volume =      1,
    sound = {"mw22/weap_mike203_fire_plr_atmos_01.wav",
	         "mw22/weap_mike203_fire_plr_atmos_02.wav",
			 "mw22/weap_mike203_fire_plr_atmos_03.wav",
			 "mw22/weap_mike203_fire_plr_atmos_04.wav",
	}
})
sound.Add({
    name =            "weap_mike203_fire_plr_atmos_in",
    channel =        CHAN_ATMO,
 	volume =      1,
    sound = {"mw22/weap_mike203_fire_plr_atmos_int1_01.wav",
	         "mw22/weap_mike203_fire_plr_atmos_int1_02.wav",
			 "mw22/weap_mike203_fire_plr_atmos_int1_03.wav",
			 "mw22/weap_mike203_fire_plr_atmos_int1_04.wav",
			 }
})
sound.Add({
	name = "weap_mike203_trig",
	channel = CHAN_TRIGGER,
	
	volume = 1,
	pitch = {100,100},
	sound = {
		     "mw22/weap_mike32_first_fire_plr_01.wav",
	         "mw22/weap_mike32_first_fire_plr_02.wav",
			 "mw22/weap_mike32_first_fire_plr_03.wav",
			 "mw22/weap_mike32_first_fire_plr_04.wav",
			 "mw22/weap_mike32_first_fire_plr_05.wav",
			 "mw22/weap_mike32_first_fire_plr_06.wav",
		}
})
sound.Add({
	name = "weap_la_mike32_ads_up",
	channel = CHAN_WPNFOLEY + 1,
	
	volume = 1,
	pitch = {100,100},
	sound = {
		"mw22/weap_la_mike32_ads_up.wav",
		}
})
-- Sound: 68
sound.Add({
	name = "weap_la_mike32_ads_down",
	channel = CHAN_WPNFOLEY + 2,
	
	volume = 1,
	pitch = {100,100},
	sound = {
		"mw22/weap_la_mike32_ads_down.wav",
		}
})
-- Sound: 69
sound.Add({
	name = "p32_la_mike32_inspect_raise",
	channel = CHAN_WPNFOLEY + 3,
	
	volume = 1,
	pitch = {100,100},
	sound = {
		"mw22/p32_la_mike32_inspect_raise.wav",
		}
})
-- Sound: 70
sound.Add({
	name = "p32_la_mike32_inspect_rattle",
	channel = CHAN_WPNFOLEY + 4,
	
	volume = 1,
	pitch = {100,100},
	sound = {
		"mw22/p32_la_mike32_inspect_rattle.wav",
		}
})
-- Sound: 71
sound.Add({
	name = "p32_la_mike32_inspect_breechopen",
	channel = CHAN_WPNFOLEY + 5,
	
	volume = 1,
	pitch = {100,100},
	sound = {
		"mw22/p32_la_mike32_inspect_breechopen.wav",
		}
})
-- Sound: 72
sound.Add({
	name = "p32_la_mike32_inspect_breechclose",
	channel = CHAN_WPNFOLEY + 6,
	
	volume = 1,
	pitch = {100,100},
	sound = {
		"mw22/p32_la_mike32_inspect_breechclose.wav",
		}
})
sound.Add({
	name = "p32_la_mike32_inspect_end",
	channel = CHAN_WPNFOLEY + 7,
	
	volume = 1,
	pitch = {100,100},
	sound = {
		"mw22/p32_la_mike32_inspect_end.wav",
		}
})
sound.Add({
	name = "p32_la_mike32_drop_rattle",
	channel = CHAN_WPNFOLEY + 8,
	
	volume = 1,
	pitch = {100,100},
	sound = {
		"mw22/p32_la_mike32_drop_rattle.wav",
		}
})
sound.Add({
	name = "p32_la_mike32_raise_rattle",
	channel = CHAN_WPNFOLEY + 9,
	
	volume = 1,
	pitch = {100,100},
	sound = {
		"mw22/p32_la_mike32_raise_rattle.wav",
		}
})
sound.Add({
	name = "p32_la_mike32_raise_quick_rattle",
	channel = CHAN_WPNFOLEY + 10,
	
	volume = 1,
	pitch = {100,100},
	sound = {
		"mw22/p32_la_mike32_raise_quick_rattle.wav",
		}
})
sound.Add({
	name = "p32_la_mike32_reload_rattle",
	channel = CHAN_WPNFOLEY + 1,
	
	volume = 1,
	pitch = {100,100},
	sound = {
		"mw22/p32_la_mike32_reload_rattle.wav",
		}
})
sound.Add({
	name = "p32_la_mike32_reload_raise",
	channel = CHAN_WPNFOLEY + 2,
	
	volume = 1,
	pitch = {100,100},
	sound = {
		"mw22/p32_la_mike32_reload_raise.wav",
		}
})
sound.Add({
	name = "p32_la_mike32_reload_magout",
	channel = CHAN_WPNFOLEY + 3,
	
	volume = 1,
	pitch = {100,100},
	sound = {
		"mw22/p32_la_mike32_reload_magout.wav",
		}
})
sound.Add({
	name = "p32_la_mike32_reload_magin",
	channel = CHAN_WPNFOLEY + 4,
	
	volume = 1,
	pitch = {100,100},
	sound = {
		"mw22/p32_la_mike32_reload_magin.wav",
		}
})
-- Sound: 70
sound.Add({
	name = "p32_la_mike32_reload_grab",
	channel = CHAN_WPNFOLEY + 5,
	
	volume = 1,
	pitch = {100,100},
	sound = {
		"mw22/p32_la_mike32_reload_grab.wav",
		}
})
-- Sound: 71
sound.Add({
	name = "p32_la_mike32_reload_grab2",
	channel = CHAN_WPNFOLEY + 6,
	
	volume = 1,
	pitch = {100,100},
	sound = {
		"mw22/p32_la_mike32_reload_grab2.wav",
		}
})
sound.Add({
	name = "p32_la_mike32_reload_fast_raise",
	channel = CHAN_WPNFOLEY + 7,
	
	volume = 1,
	pitch = {100,100},
	sound = {
		"mw22/p32_la_mike32_reload_fast_raise.wav",
		}
})
sound.Add({
	name = "p32_la_mike32_reload_fast_magout",
	channel = CHAN_WPNFOLEY + 1,
	
	volume = 1,
	pitch = {100,100},
	sound = {
		"mw22/p32_la_mike32_reload_fast_magout.wav",
		}
})
sound.Add({
	name = "p32_la_mike32_reload_fast_magin",
	channel = CHAN_WPNFOLEY + 2,
	
	volume = 1,
	pitch = {100,100},
	sound = {
		"mw22/p32_la_mike32_reload_fast_magin.wav",
		}
})
sound.Add({
	name = "p32_la_mike32_reload_fast_end",
	channel = CHAN_WPNFOLEY + 3,
	
	volume = 1,
	pitch = {100,100},
	sound = {
		"mw22/p32_la_mike32_reload_fast_end.wav",
		}
})
sound.Add({
	name = "p32_la_mike32_reload_fast_breechopen",
	channel = CHAN_WPNFOLEY + 4,
	
	volume = 1,
	pitch = {100,100},
	sound = {
		"mw22/p32_la_mike32_reload_fast_breechopen.wav",
		}
})
sound.Add({
	name = "p32_la_mike32_reload_fast_breechclose",
	channel = CHAN_WPNFOLEY + 5,
	
	volume = 1,
	pitch = {100,100},
	sound = {
		"mw22/p32_la_mike32_reload_fast_breechclose.wav",
		}
})
sound.Add({
	name = "p32_la_mike32_reload_end",
	channel = CHAN_WPNFOLEY + 6,
	
	volume = 1,
	pitch = {100,100},
	sound = {
		"mw22/p32_la_mike32_reload_end.wav",
		}
})
sound.Add({
	name = "p32_la_mike32_reload_breechopen",
	channel = CHAN_WPNFOLEY + 7,
	
	volume = 1,
	pitch = {100,100},
	sound = {
		"mw22/p32_la_mike32_reload_breechopen.wav",
		}
})
sound.Add({
	name = "p32_la_mike32_reload_breechclose",
	channel = CHAN_WPNFOLEY + 8,
	
	volume = 1,
	pitch = {100,100},
	sound = {
		"mw22/p32_la_mike32_reload_breechclose.wav",
		}
})
sound.Add({
	name = "wfoly_plr_la_mike32_reload_close_01",
	channel = CHAN_WPNFOLEY + 9,
	
	volume = 1,
	pitch = {100,100},
	sound = {
		"mw22/wfoly_plr_la_mike32_reload_close_01.wav",
		}
})
