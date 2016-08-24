local Addon, data = ... 

local Boolean = data.boolean
local Point = data.point
local Size = data.size
local Media = data.media
--[[
	style
	
local function CreatePlayerStyle(self)
	self:SetScript("OnEnter",UnitFrame_OnEnter)
	self:SetScript("OnLeave",UnitFrame_OnLeave)
	
	local health = CreateFrame("StatusBar","oUF_LeizyPlayer".."_Health",self)
	-- health:SetStatusBarTexture("Interface\\AddOns\\oUF_Leizy\\textures\\statusbar")
	health:SetStatusBarTexture("Interface\\Buttons\\WHITE8x8")
	health:SetAllPoints()
	
	health.bg = health:CreateTexture(nil,"BACKGROUND")
	health.bg:SetAllPoints(health)
	health.bg:SetTexture(1,1,1,.5)
	
	health.frequentUpdates = true
	health.colorTapping = true
	health.colorDisconnected = true
	health.colorClass = true
	health.colorReaction = true
	health.colorHealth = true
	
	health.bg.multiplier = .5
	
	self.Health = health
	self.Health.bg = health.bg
	
	self:SetSize(240,30)
	self:SetPoint("CENTER",UIParent,"CENTER",0,0)
end
]]

-- [[	ShareStyle	]]

local function ShareStyle(self,unit)
	-- print(unit)
	--	为框体添加默认OnEnter和OnLeave
	self:SetScript("OnEnter",UnitFrame_OnEnter)
	self:SetScript("OnLeave",UnitFrame_OnLeave)
	
	--	Health
	local Health = CreateFrame("StatusBar",Addon.."_Health",self)
	Health:SetStatusBarTexture(Media.texture_1)
	-- Health:SetSize(Size.healthSize_1.Width,Size.healthSize_1.Height)
	-- Health:SetPoint("TOPLEFT",self,"TOPLEFT",0,0)
	
	-- Health:SetBackdrop({bgFile="",edgeFile=Media.texture_1,tile = false,edgeSize = -1})
	-- Health:SetBackdropColor(1,0,0,1)
	-- Health:SetBackdropBorderColor(1,1,1,.9)
	
	
	-- Health.bg = Health:CreateTexture(nil,"BACKGROUND")
	-- Health.bg:SetAllPoints(Health)
	-- Health.bg:SetTexture(1,0,0,0)
	-- Health.bg.multiplier = 0.1  -- test
	-- Health.bg:SetTexture(Media.texture_2)
	
	Health.frequentUpdates = true
	Health.colorTapping = true
	Health.colorDisconnected = true
	Health.colorClass = true
	Health.colorReaction = true
	Health.colorHealth = true
	self.Health = Health
	
	-- Health.bg.colorClass = true
	
	-- local color = self.colors.class[select(2,UnitClass(unit))]
	-- print(color[1]..color[2]..color[3])
	self:SetBackdrop({bgFile=Media.texture_1,edgeFile=Media.texture_1,tile=true,edgeSize=-1})
	self:SetBackdropColor(0.2,0.2,0.2,.9)
	self:SetBackdropBorderColor(0,0,0,1)
	-- self.Health.bg = Health.bg

	--	设置该框体的size[以下可放在各框体的函数中]
	Health:SetSize(Size.healthSize_1.Width,Size.healthSize_1.Height)
	Health:SetPoint("TOPLEFT",self,"TOPLEFT",0,0)
	
	self:SetSize(Size.frameSize_1.Width,Size.frameSize_1.Height)
	self:SetPoint(unpack(Point.player))
end

--[[
	spawn
]]
if Boolean.show_player then
	oUF:RegisterStyle("oUF_LeizyPlayer",ShareStyle)
	oUF:SetActiveStyle("oUF_LeizyPlayer")
	oUF:Spawn("player","oUF_LeizyPlayer")
end

-- if Boolean.show_target then
	-- oUF:RegisterStyle("oUF_LeizyTarget",ShareStyle)
	-- oUF:SetActiveStyle("oUF_LeizyTarget")
	-- oUF:Spawn("target","oUF_LeizyTarget")
-- end

-- frame:SetPoint("CENTER",UIParent,"UIParent",0,0)

-- _G["oUF_LeizyPlayer"]

