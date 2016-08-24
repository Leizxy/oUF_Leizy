local Addon, data = ... 



boolean = {
	show_player = true,
	show_target = true,
	show_target_target = true,
	show_pet = true,
	show_focus = true,
	show_focus_target = true,
	show_raid = false,
	show_boss = false
}
point = {
	player = {"CENTER",UIParent,"CENTER",-300,-100},
	target = {"CENTER",UIParent,"CENTER",300,-100},
	targettarget = {"CENTER",UIParent,"CENTER",0,-130},
	pet = {"CENTER",UIParent,"CENTER",-300,-130},
	focus = {"CENTER",UIParent,"CENTER",600,300},
	focustarget = {"CENTER",UIParent,"CENTER",600,270},
}


size = {
	frameSize_1 = {Width = 240,Height = 30},
	healthSize_1 = {Width = 200,Height = 20},
	powerSize_1 = {Width = 200,Height = 20}
}

media = {
	texture_1 = "Interface\\AddOns\\oUF_Leizy\\textures\\statusbar",
	texture_2 = "Interface\\Buttons\\WHITE8x8"
}
data.boolean = boolean
data.point = point
data.size = size
data.media = media
