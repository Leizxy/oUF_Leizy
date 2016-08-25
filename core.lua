local Addon, data = ... 

local Boolean = data.boolean
local Point = data.point
local Size = data.size
local Media = data.media

local BASENAME = Addon.."_"

-- [[	HealthBarStyle	]]

local function HealthBarStyle(self,unit)
		
	--	Health
	local Health = CreateFrame("StatusBar",BASENAME..unit.."_Health",self)
	-- Health:SetFrameLevel(1)
	Health:SetStatusBarTexture(Media.texture_1)
	Health.frequentUpdates = true
	-- Health.colorTapping = true -- 非玩家会出错。这个值是什么意思
	Health.colorDisconnected = true
	Health.colorClass = true
	Health.colorReaction = true
	Health.colorHealth = true
	-- Health:SetReverseFill()
	-- bg
	Health.bg = Health:CreateTexture(nil,'BACKGROUND')
	Health.bg:SetAllPoints(Health)
	Health.bg:SetTexture(1,1,1,.5)
	Health.bg.multiplier = .5
	
	
	if unit == "player" or unit == "target" then
		Health:SetSize(Size.healthSize_1.Width,Size.healthSize_1.Height)
		Health:SetPoint("TOP",self,"TOP",0,-1)
	end
	local Name = Health:CreateFontString(nil,"OVERLAY")
	Name:SetPoint("LEFT",Health,"TOPLEFT",0,0)
	Name:SetFont("Fonts\\ARHei.ttf",13,"OUTLINE")
	Name:SetTextColor(1,1,1)
	-- self.Name = Name
	self:Tag(Name,"[name]")
	self.Health = Health

	
end
-- [[	PowerBarStyle	]]

local function PowerBarStyle(self,unit)
	--	Power
	local Power = CreateFrame("StatusBar",BASENAME..unit.."_Power",self)
	-- Power:SetFrameLevel(2)
	Power:SetStatusBarTexture(Media.texture_4)
	Power.frequentUpdates = true
	-- Power.colorTapping = true
	Power.colorDisconnected = true
	Power.colorPower = true
	-- Power.colorClass = true
	-- Power.colorReaction = true
	-- Power:SetReverseFill()
	Power.bg = Power:CreateTexture(nil,'BACKGROUND')
	Power.bg.colorPower = true
	Power.bg:SetAllPoints(Power)
	Power.bg:SetTexture(1,1,0,.5)
	Power.bg.multiplier = .1
	
	-- Power.
	
	if unit == "player" or unit == "target" then
		Power:SetSize(Size.powerSize_1.Width,Size.powerSize_1.Height)
		Power:SetPoint("TOP",self,"TOP",0,-12)		
	end
	

	
	self.Power = Power
end

-- [[	ShareStyle	]]

local function ShareStyle(self,unit) -- self表示某个unit的框体
	-- print(unit)
	--	为框体添加默认OnEnter和OnLeave
	self:SetScript("OnEnter",UnitFrame_OnEnter)
	self:SetScript("OnLeave",UnitFrame_OnLeave)
	self:RegisterForClicks("AnyUp")
	
	HealthBarStyle(self,unit)
	PowerBarStyle(self,unit)
	-- leader
	local Leader = self:CreateTexture(nil,"OVERLAY")
	Leader:SetHeight(16)
	Leader:SetWidth(16)
	Leader:SetPoint("BOTTOMLEFT",self,"TOPLEFT",0,1)
	
	self.Leader = Leader
	-- looter
	local MasterLooter = self:CreateTexture(nil, 'OVERLAY')
	MasterLooter:SetHeight(16)
	MasterLooter:SetWidth(16)
	MasterLooter:SetPoint('LEFT', Leader, 'RIGHT')
	
	self.MasterLooter = MasterLooter
	
	
	-- 整个框体的背景
	-- self:SetBackdrop({bgFile=Media.texture_1,edgeFile=Media.texture_1,tile=true,edgeSize=-1})
	-- self:SetBackdropColor(0.2,0.2,0.2,.9)
	-- self:SetBackdropBorderColor(0,0,0,1)

	self:SetSize(Size.frameSize_1.Width,Size.frameSize_1.Height)
	self:SetPoint(unpack(Point[unit]))
end

--[[
	spawn
]]
if Boolean.show_player then
	oUF:RegisterStyle("oUF_LeizyPlayer",ShareStyle)
	oUF:SetActiveStyle("oUF_LeizyPlayer")
	oUF:Spawn("player","oUF_LeizyPlayer")
end

if Boolean.show_target then
	oUF:RegisterStyle("oUF_LeizyTarget",ShareStyle)
	oUF:SetActiveStyle("oUF_LeizyTarget")
	oUF:Spawn("target","oUF_LeizyTarget")
end


