local Addon, data = ... 

--[[
	UIParent:GetWidth()全屏、窗口的数值不同
]]

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
	["player"] = {"CENTER",UIParent,"CENTER",-200,-300},
	["target"] = {"CENTER",UIParent,"CENTER",200,-300},
	["targettarget"] = {"CENTER",UIParent,"CENTER",0,-130},
	["pet"] = {"CENTER",UIParent,"CENTER",-300,-130},
	["focus"] = {"CENTER",UIParent,"CENTER",600,300},
	["focustarget"] = {"CENTER",UIParent,"CENTER",600,270},
}


size = {
	frameSize_1 = {Width = 300,Height = 20},
	healthSize_1 = {Width = 298,Height = 10},
	powerSize_1 = {Width = 298,Height = 7}
}

media = {
	texture_1 = "Interface\\Buttons\\WHITE8x8",
	texture_2 = "Interface\\AddOns\\oUF_Leizy\\textures\\statusbar",
	texture_3 = "Interface\\AddOns\\oUF_Leizy\\textures\\glow",
	texture_4 = "Interface\\AddOns\\oUF_Leizy\\textures\\texture",
	texture_5 = "Interface\\AddOns\\oUF_Leizy\\textures\\tga",
	texture_6 = "Interface\\AddOns\\oUF_Leizy\\textures\\tga2",
	texture_7 = "Interface\\AddOns\\oUF_Leizy\\textures\\tga3",
	texture_8 = "Interface\\AddOns\\oUF_Leizy\\textures\\test"
}

data.boolean = boolean
data.point = point
data.size = size
data.media = media
