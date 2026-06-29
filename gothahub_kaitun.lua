-- GothaHub Kaitun
-- Edit only this config block for normal use.

getgenv().GothaKaitunConfig = getgenv().GothaKaitunConfig or {
    -- Slot
    AutoSlot = "A", -- A, B, C

    -- Farm
    AutoFarm = true,
    MovementMode = "Teleport", -- Hover, Teleport
    MoveSpeed = 400, -- number
    HeightSafe = 155, -- number
    AttackRange = 100, -- number
    MultiHit = true, -- true/false
    MultiHitCount = 2, -- number
    LastTitanWait = true, -- true/false
    LastTitanWaitSecs = 45, -- seconds

    -- Safety / movement
    SoloOnly = true, -- true/false
    SafeFarm = true, -- true/false
    DoubleJump = true, -- true/false
    Noclip = false, -- true/false
    AutoHooks = false, -- true/false

    -- Mission flow
    AutoRetry = true,
    AutoSkip = true,
    AutoChest = true,
    AutoEscape = true,
    AutoReload = true,
    AutoReturnLobby = true,
    ReturnLobbyEvery = 25, -- number, 0 disables return loop
    MissionStartDelay = true, -- true/false, waits before pressing mission start
    MissionStartDelaySecs = 60, -- seconds
    AutoRejoin = true, -- true/false
    AutoFailsafe = false, -- true/false
    AutoExecute = false, -- true/false
    OpenSecondChest = false, -- true/false

    -- Mission mode. Enable only one of AutoMission / AutoRaid / AutoWaves.
    AutoMission = true,
    Mission = {
        Map = "Shiganshina", -- Shiganshina, Trost, Outskirts, Forest, Utgard, Docks, Stohess, Chapel, Colossal
        Objective = "Skirmish", -- Skirmish, Breach, Protect, Escort, Guard, Defend, Stall, Random
        Difficulty = "Hardest", -- Hardest, Aberrant, Severe, Hard, Normal, Easy
    },

    -- Raid mode
    AutoRaid = false,
    Raid = {
        Map = "Trost", -- Trost, Shiganshina, Stohess, Colossal
        Difficulty = "Hardest", -- Hardest, Aberrant, Severe, Hard
    },

    -- Waves mode
    AutoWaves = false,
    Waves = {
        Map = "Trost", -- Trost
        AutoFarm = false, -- true/false
        AutoUpgrade = false, -- true/false
        AutoStart = false, -- true/false
    },

    -- Modifiers
    AutoModifiers = true, -- true/false, for boosted map flow
    Modify = {
        ["No Perks"] = true,
        ["No Skills"] = true,
        ["No Memories"] = true,
        ["Nightmare"] = true,
        ["Oddball"] = true,
        ["Injury Prone"] = true,
        ["Chronic Injuries"] = true,
        ["Fog"] = true,
        ["Glass Cannon"] = true,
        ["Time Trial"] = true,
        ["Boring"] = false,
        ["Simple"] = false,
    },

    -- Boosted map
    AutoJoinBoostedMap = false, -- true/false

    -- Die / failsafe
    DieAtStreak = false, -- true/false
    DieAtStreakCount = 5, -- number

    -- Lobby maintenance
    AutoClaimAchievements = true,
    AutoClaimQuests = true,
    AutoInjury = true,
    AutoUpgrade = true,

    -- Prestige
    AutoPrestige = true,
    PrestigeBoost = "Gold Boost", -- Gold Boost, EXP Boost, Luck Boost
    PrestigeGold = {
        Prestige1 = 0,
        Prestige2 = 0,
        Prestige3 = 0,
        Prestige4 = 0,
        Prestige5 = 1000000000,
    },

    -- Skill tree
    AutoSkillTree = false,
    SkillTree = {
        Middle = "Damage", -- Damage, Critical
        Left = "Cooldown Reduction", -- Regen, Cooldown Reduction
        Right = "Damage Reduction", -- Health, Damage Reduction
        Priority1 = "Middle", -- Left, Middle, Right, None
        Priority2 = "Left", -- Left, Middle, Right, None
        Priority3 = "None", -- Left, Middle, Right, None
    },

    -- Mastery
    MasteryFarm = false,
    MasteryMode = "Both", -- Both, Blades, Spears

    -- Boosts
    AutoUseBoosts = true,
    Boosts = {
        Gold = true,
        Luck = true,
        XP = true,
    },
    AutoBuyBoostGems = {
        Enabled = true,
        BoostType = "Gold", -- Gold, Luck, XP
        Duration = "2H", -- 30M, 1H, 2H
        OnlyWhenExpired = true,
    },

    -- Perks
    AutoEnhancePerks = false,
    EnhancePerkSlot = "Body", -- Defense, Support, Family, Extra, Offense, Body
    EnhanceFoodPerks = {
        Common = false,
        Rare = false,
        Epic = false,
        Legendary = false,
    },
    AutoSellPerksEnabled = true,
    AutoSellPerks = {
        Common = true,
        Rare = true,
        Epic = true,
        Legendary = false,
        Mythic = false,
    },

    -- Family roll
    AutoRoll = false,
    SelectFamilies = "", -- example: Fritz,Yeager
    FamilyRarities = {
        Rare = false,
        Epic = false,
        Legendary = false,
        Mythical = true,
    },

    -- Webhook
    RewardWebhook = true,
    MythicalFamilyWebhook = true,
    ShadowBanWebhook = true,
    WebhookUrl = "https://discord.com/api/webhooks/1510186120061911102/N5pvkVwwXSAe9J77YuxLiy9TgtcqSUX353xIj9TJlJInDldhwvo7U4ZlHSWnHmsg0ZAO",
    ShadowBanWebhookUrl = "https://discord.com/api/webhooks/1521053248063016970/wMTl0fnAB-vEJDyJO_2cPnGX2H3Ty49MbfhUmEb7tSyT0XGBR4EXV99GAsIeWdkQwWXK",

    -- Rendering / CPU
    Disable3DRendering = true,
    DeleteMap = true,
}
-- aotr
repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local lp = Players.LocalPlayer 

-- In lobby, character may not exist - wait max 10s then continue
local charWaitStart = os.clock()
repeat task.wait(0.5) until (lp and lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")) or os.clock() - charWaitStart > 10

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local GuiService = game:GetService("GuiService")
local PlayerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
local remotesFolder = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Remotes")
local getRemote = remotesFolder:WaitForChild("GET")
local postRemote = remotesFolder:WaitForChild("POST")
local vim = game:GetService("VirtualInputManager")
local INTERFACE = PlayerGui:WaitForChild("Interface")
local rewards = INTERFACE:FindFirstChild("Rewards")
local statsFrame = rewards and rewards.Main.Info.Main.Stats or nil
local itemsFrame = rewards and rewards.Main.Info.Main.Items or nil
local customisation = INTERFACE:FindFirstChild("Customisation") or nil
local familyFrame = customisation and customisation:FindFirstChild("Family") or nil
local rollButton = familyFrame and familyFrame.Buttons_2.Roll or nil

local V3_ZERO = Vector3.new(0, 0, 0)

local lastPlayerData, lastPlayerDataTime = nil, 0
local function GetPlayerData()
	if os.clock() - lastPlayerDataTime < 0.5 and lastPlayerData then return lastPlayerData end
	local args = {
		"Functions",
		"Settings",
		"Get"
	}
	lastPlayerData = getRemote:InvokeServer(unpack(args))
	lastPlayerDataTime = os.clock()	
	return lastPlayerData
end

local mapData = nil

local startLoadTime = os.clock()
local isLobby = game.PlaceId == 14916516914

if not isLobby then
	repeat
	    task.wait(1)
	    mapData = getRemote:InvokeServer("Data", "Copy")
	    if not mapData then
	        lastPlayerData = nil
	        GetPlayerData()
	    end
	until mapData ~= nil or os.clock() - startLoadTime > 15
end

if mapData then
	if mapData.Map.Type == "Raids" then
		repeat task.wait() until workspace:GetAttribute("Finalised")
	end
end

local function checkMission()
	local activeType = workspace:GetAttribute("Type")
	if activeType then return true end
	mapData = getRemote:InvokeServer("Data", "Copy")
	return mapData ~= nil and mapData.Map ~= nil and mapData.Slots ~= nil
end

local familyRaritiesOptions = {
	"Rare",
	"Epic",
	"Legendary",
	"Mythical"
}

-- Config system for persistent dropdown state
if not isfolder("./GOTHAHUB") then makefolder("./GOTHAHUB") end
if not isfolder("./GOTHAHUB/aotr") then makefolder("./GOTHAHUB/aotr") end

local ConfigFile = "./GOTHAHUB/aotr/dropdown_config.json"
local returnCounterPath = "./GOTHAHUB/aotr/return_lobby_counter.txt"
local kaitunSlotRefreshPath = "./GOTHAHUB/aotr/kaitun_slot_refresh.txt"
local HttpService = game:GetService("HttpService")

local function LoadConfig()
	if not isfile(ConfigFile) then
		return { Missions = {}, Raids = {}, DeleteMap = false }
	end
	local success, config = pcall(HttpService.JSONDecode, HttpService, readfile(ConfigFile))
	return success and config or { Missions = {}, Raids = {}, DeleteMap = false }
end

local function SaveConfig(config)
	pcall(writefile, ConfigFile, HttpService:JSONEncode(config))
end

local function ShouldRefreshLobbyAfterSlot(slotName)
	if not getgenv().GothaKaitunConfig then return true end
	if type(isfile) ~= "function" or type(readfile) ~= "function" or type(writefile) ~= "function" then
		return false
	end

	local now = os.time()
	local key = tostring(lp.UserId) .. ":" .. tostring(slotName or "")
	if isfile(kaitunSlotRefreshPath) then
		local ok, data = pcall(function()
			return HttpService:JSONDecode(readfile(kaitunSlotRefreshPath))
		end)
		if ok and type(data) == "table" and data.Key == key and tonumber(data.Time) and now - tonumber(data.Time) < 120 then
			return false
		end
	end

	pcall(function()
		writefile(kaitunSlotRefreshPath, HttpService:JSONEncode({ Key = key, Time = now }))
	end)
	return true
end

local DropdownConfig = LoadConfig()
getgenv().AutoExec = false
getgenv().AutoRoll = false
getgenv().AutoSlot = false
getgenv().AutoUpgrade = false
getgenv().AutoPerk = false
getgenv().AutoSellPerksEnabled = false
getgenv().AutoSkillTree = false
getgenv().AutoStart = false
getgenv().AutoChest = false
getgenv().AutoBuyBoostGems = false
getgenv().AutoRetry = false
getgenv().AutoSkip = false
getgenv().AutoPrestige = false
getgenv().AutoFailsafe = false
getgenv().AutoExecute = false
getgenv().RewardWebhook = false
getgenv().MythicalFamilyWebhook = false
getgenv().ShadowBanWebhook = false
getgenv().AutoClaimQuests = false
getgenv().AutoInjury = false
getgenv().AutoReturnLobby = false
getgenv().ReturnAfterGames = 10
getgenv().WaitBeforeStart = false
getgenv().WaitBeforeStartSecs = 0
getgenv().MultiHit = false
getgenv().MultiHitCount = 3
getgenv().LastTitanWait = false
getgenv().LastTitanWaitSecs = 60
getgenv().OpenSecondChest = false
getgenv().DeleteMap = DropdownConfig.DeleteMap or false
getgenv().AutoSellPerks = DropdownConfig.AutoSellPerks or { Common = true, Rare = true, Epic = false, Legendary = false, Mythic = false }
getgenv().AutoBuyBoostGemsConfig = DropdownConfig.AutoBuyBoostGems or { BoostType = "Gold", Duration = "30M", OnlyWhenExpired = true }
getgenv().AdminConfig = false
getgenv().HideDamageText = false
if not isfile(returnCounterPath) then writefile(returnCounterPath, "0") end

getgenv().CurrentStatusLabel = nil
function UpdateStatus(text)
	if getgenv().CurrentStatusLabel then 
		getgenv().CurrentStatusLabel:SetText("Status: " .. text) 
	end
end

-- ==========================================
-- SESSION STATS (defined first so everything can use it)
-- ==========================================

local function SaveSessionStats()
	writefile("./GOTHAHUB/aotr/s_games.txt",     tostring(sessionStats.gamesPlayed))
	writefile("./GOTHAHUB/aotr/s_gold.txt",      tostring(sessionStats.totalGold))
	writefile("./GOTHAHUB/aotr/s_gems.txt",      tostring(sessionStats.totalGems))
	writefile("./GOTHAHUB/aotr/s_xp.txt",        tostring(sessionStats.totalXP))
	writefile("./GOTHAHUB/aotr/s_mythicals.txt", tostring(sessionStats.mythicalDrops))
	writefile("./GOTHAHUB/aotr/s_crashes.txt",   tostring(sessionStats.crashes))
	-- Save elapsed time so timer pauses when script is off
	local elapsed = os.time() - sessionStats.startTime
	writefile("./GOTHAHUB/aotr/s_elapsed.txt",   tostring(elapsed))
end

local function LoadSessionStats()
	local function rf(path, default)
		if isfile(path) then
			return tonumber(readfile(path)) or default
		end
		return default
	end
	-- Resume timer from saved elapsed so time doesnt count when script is off
	local savedElapsed = rf("./GOTHAHUB/aotr/s_elapsed.txt", 0)
	return {
		startTime     = os.time() - savedElapsed,
		gamesPlayed   = rf("./GOTHAHUB/aotr/s_games.txt",     0),
		totalGold     = rf("./GOTHAHUB/aotr/s_gold.txt",      0),
		totalGems     = rf("./GOTHAHUB/aotr/s_gems.txt",      0),
		totalXP       = rf("./GOTHAHUB/aotr/s_xp.txt",        0),
		totalKills    = 0,
		mythicalDrops = rf("./GOTHAHUB/aotr/s_mythicals.txt", 0),
		crashes       = rf("./GOTHAHUB/aotr/s_crashes.txt",   0),
	}
end

sessionStats = LoadSessionStats()


local function getSessionTime()
	local elapsed = os.time() - sessionStats.startTime
	local hours = math.floor(elapsed / 3600)
	local mins = math.floor((elapsed % 3600) / 60)
	local secs = math.floor(elapsed % 60)
	return string.format("%02d:%02d:%02d", hours, mins, secs)
end

local function getGoldPerHour()
	local elapsed = (os.time() - sessionStats.startTime) / 3600
	if elapsed < 0.01 then return 0 end
	return math.floor(sessionStats.totalGold / elapsed)
end

local function getGamesPerHour()
	local elapsed = (os.time() - sessionStats.startTime) / 3600
	if elapsed < 0.01 then return 0 end
	return math.floor(sessionStats.gamesPlayed / elapsed)
end

-- ==========================================
-- AUTO FARM
-- ==========================================

local AutoFarm = {}
AutoFarm._running = false

lp.CharacterAdded:Connect(function()
	task.wait(3)
	if Toggles and Toggles.AutoKillToggle and Toggles.AutoKillToggle.Value then
		AutoFarm:Stop()
		task.wait(0.5)
		AutoFarm:Start()
	end
end)

getgenv().AutoFarmConfig = {
	AttackCooldown = 1,
	ReloadCooldown = 1,
	AttackRange = 150,
	MoveSpeed = 400,
	HeightOffset = 250,
	MovementMode = "Hover",
}

getgenv().MasteryFarmConfig = {
	Enabled = false,
	Mode = "Both",
}

task.spawn(function()
	while true do
		local Injuries = lp.Character:FindFirstChild("Injuries")
		if Injuries then
			for i, v in Injuries:GetChildren() do
				v:Destroy()
			end
		end
		task.wait(2.5)
	end
end)

function AutoFarm:Start()
	if self._running then return end
	if isLobby then return end

	self._running = true
	task.spawn(function()
		UpdateStatus("Waiting for mission...")
		
		local function checkReady()
			local char = lp.Character
			local playerReady = char and (char:GetAttribute("Shifter") or (char:FindFirstChild("Main") and char.Main:FindFirstChild("W")))
			local mapReady = workspace:FindFirstChild("Unclimbable") ~= nil
			local titans = workspace:FindFirstChild("Titans")
			local titansReady = false
			if titans then
				for _, v in ipairs(titans:GetChildren()) do
					if v:FindFirstChild("Fake") and v.Fake:FindFirstChild("Head") and v.Fake.Head:FindFirstChild("Header") then
						titansReady = true
						break
					end
				end
			end
			return playerReady and mapReady and titansReady
		end

		local startTime = os.clock()
		while self._running and not checkReady() do
			if os.clock() - startTime > 10 then
				Library:Notify({
					Title = "GOTHAHUB",
					Description = "Still waiting for mission assets to load...",
					Time = 5
				})
				startTime = os.clock()
			end
			task.wait(1)
		end

		if not self._running then return end
		UpdateStatus("Farming")

		local titansFolder = workspace:FindFirstChild("Titans")
		local lastAttack = 0
		local currentChar, root, charParts = nil, nil, {}

		local bossNames = {Attack_Titan = true, Armored_Titan = true, Female_Titan = true, Colossal_Titan = true}
		local attackTitanSpawnTime = nil
		local AttackRangeSq = getgenv().AutoFarmConfig.AttackRange * getgenv().AutoFarmConfig.AttackRange

		local function updateCharState()
			local char = lp.Character
			if not char then return false end
			local hrp = char:FindFirstChild("HumanoidRootPart")
			if not hrp then return false end
			if char ~= currentChar then
				currentChar = char
				root = hrp
				charParts = {}
				for _, p in ipairs(char:GetDescendants()) do
					if p:IsA("BasePart") then
						p.CanCollide = false
						table.insert(charParts, p)
					end
				end
			end
			return true
		end

		local validNapes = {}
		local nextTitanCacheUpdate = 0
		local nextObjectiveCacheUpdate = 0
		local cachedObjectivePart = nil
		local masteryComboIndex = 1
		local lastMasteryPunch = 0

		while self._running do
			if lp:GetAttribute("Cutscene") then
				task.wait(0.05)
				continue
			end

			if not checkMission() then
				UpdateStatus("Waiting for mission...")
				task.wait(1)
				continue
			end

			local slotIndex = lp:GetAttribute("Slot")
			local slotData = slotIndex and mapData and mapData.Slots and mapData.Slots[slotIndex]

			if not slotData then
				UpdateStatus("Waiting for data...")
				task.wait(1)
				continue
			end

			-- Die at Streak check
			if getgenv().DieAtStreak then
				local streak = lp:GetAttribute("Streak") or 0
				if streak >= (getgenv().DieAtStreakCount or 10000) then
					local char = lp.Character
					if char then
						local hum = char:FindFirstChild("Humanoid")
						if hum then hum.Health = 0 end
					end
				end
			end

			if slotData.Weapon == "Blades" then 
				getgenv().AutoFarmConfig.AttackCooldown = 0.15 
			else 
				getgenv().AutoFarmConfig.AttackCooldown = 1 
			end

			if getgenv().AutoFailsafe then
				if not self.missionStartTime then
					self.missionStartTime = os.clock()
				end
				local missionElapsedTime = os.clock() - self.missionStartTime
				if missionElapsedTime >= 900 then
					self:Stop()
					task.spawn(function() getRemote:InvokeServer("Functions", "Teleport", "Lobby") end)
					task.wait(0.5)
					TeleportService:Teleport(14916516914, lp)
					break
				end
			end

			local playerCount = workspace:GetAttribute("Player_Count") or #Players:GetPlayers()
			if getgenv().SoloOnly and playerCount > 1 then
				self:Stop()
				task.spawn(function() getRemote:InvokeServer("Functions", "Teleport", "Lobby") end)
				task.wait(0.5)
				TeleportService:Teleport(14916516914, lp)
				break
			end
			
			if not updateCharState() then task.wait(0.05) continue end

			titansFolder = workspace:FindFirstChild("Titans") or titansFolder

			local ws_ObjectiveFolder = workspace:FindFirstChild("Unclimbable") and workspace.Unclimbable:FindFirstChild("Objective")
			local rs_ObjectiveFolder = ReplicatedStorage:FindFirstChild("Objectives")
			local mapType = workspace:GetAttribute("Type") or (mapData and mapData.Map and mapData.Map.Type)

			local isArmoredRaid = ws_ObjectiveFolder:FindFirstChild("Armored_Boss")
			local isFemaleRaid = rs_ObjectiveFolder:FindFirstChild("Defeat_Annie")
			local femaleExists = ws_ObjectiveFolder:FindFirstChild("Female_Boss")
			local attackExists = ws_ObjectiveFolder:FindFirstChild("Attack_Boss")
			local armoredTitan = titansFolder and titansFolder:FindFirstChild("Armored_Titan")
			local hasReinerObjective = armoredTitan and armoredTitan:GetAttribute("State")
			local isColossalRaid = rs_ObjectiveFolder:FindFirstChild("Defeat_Bertholdt") or ws_ObjectiveFolder:FindFirstChild("Colossal_Boss")

			if isFemaleRaid and not femaleExists and not attackExists then
				task.wait(0.05)
				continue
			end

			-- COLOSSAL RAID: Phase 1
			if isColossalRaid then
				local stallObjective = rs_ObjectiveFolder:FindFirstChild("Stall_Colossal_Titan")
				local stallDone = stallObjective and stallObjective.Value >= (stallObjective:GetAttribute("Requirement") or 1)

				if not stallDone then
					UpdateStatus("Colossal Raid - Phase 1: Cannon Stalling...")

					local walls = workspace:FindFirstChild("Climbable") and workspace.Climbable:FindFirstChild("Walls")
					local cannonModel = walls and walls:FindFirstChild("Wall") and
						walls.Wall:FindFirstChild("Cannons") and
						walls.Wall.Cannons:FindFirstChild("1")

					if not cannonModel and walls then
						for _, wall in ipairs(walls:GetChildren()) do
							local c = wall:FindFirstChild("Cannons") and wall.Cannons:FindFirstChild("1")
							if c then cannonModel = c break end
						end
					end

					if cannonModel and not getgenv()._colossalCannonRunning then
						getgenv()._colossalCannonRunning = true
						task.spawn(function()
							local function getLiveNapePos()
								local ct = titansFolder:FindFirstChild("Colossal_Titan")
								if not ct then return nil end
								local hit = ct:FindFirstChild("Hitboxes") and ct.Hitboxes:FindFirstChild("Hit")
								if hit and hit:FindFirstChild("Nape") then return hit.Nape.Position end
								local fake = ct:FindFirstChild("Fake")
								local head = fake and fake:FindFirstChild("Head")
								return head and head.Position or nil
							end

							local function isStallDone()
								local so = ReplicatedStorage:FindFirstChild("Objectives") and ReplicatedStorage.Objectives:FindFirstChild("Stall_Colossal_Titan")
								return so and so.Value >= (so:GetAttribute("Requirement") or 1)
							end

							local impactConn = postRemote.OnClientEvent:Connect(function(a1, a2, cannonObj, hitbox, ...)
								if a1 ~= "Skills" or a2 ~= "Impact" then return end
								if not getgenv()._colossalCannonRunning then return end
								local ref = cannonObj or workspace:FindFirstChild("Cannon")
								if not ref then return end
								for i = 1, 30 do
									local napePos = getLiveNapePos()
									if napePos then
										postRemote:FireServer("S_Skills", "Impact", ref, napePos)
									end
								end
							end)

							while self._running and not isStallDone() do
								getRemote:InvokeServer("Cannon", "State", cannonModel, true)
								task.wait(0.1)
								getRemote:InvokeServer("Cannon", "Shoot", {BarrelWood = 40, Base = 0})
								task.wait(2)
							end

							impactConn:Disconnect()
							pcall(function() getRemote:InvokeServer("Cannon", "State", cannonModel, false) end)
							getgenv()._colossalCannonRunning = false
							UpdateStatus("Colossal Raid - Phase 1 Complete!")
						end)
					end
				else
					getgenv()._colossalCannonRunning = false

					if not getgenv()._colossalPhase2Running then
						getgenv()._colossalPhase2Running = true
						task.spawn(function()
							UpdateStatus("Colossal Raid - Phase 2: Kill Colossal!")

							local function getNapeTarget()
								local ct = titansFolder:FindFirstChild("Colossal_Titan")
								if not ct then return nil, nil end
								local hit = ct:FindFirstChild("Hitboxes") and ct.Hitboxes:FindFirstChild("Hit")
								local nape = hit and hit:FindFirstChild("Nape")
								if nape then return nape, nape.Position + Vector3.new(0, 4, 0) end
								return nil, nil
							end

							while self._running do
								local napePart, napePos = getNapeTarget()
								if not napePart or not napePos then task.wait() continue end
								for i = 1, 8 do
									postRemote:FireServer("Spears", "S_Explode", napePos)
								end
								postRemote:FireServer("Hitboxes", "Register", napePart, math.random(625, 850))
								task.wait()
							end

							getgenv()._colossalPhase2Running = false
						end)
					end
				end
			end

			if math.fmod(os.clock(), 0.5) < 0.05 then
				for i = 1, #charParts do
					local p = charParts[i]
					if p and p.Parent then p.CanCollide = false end
				end
			end

			local now = os.clock()
			local isShifted = currentChar and currentChar:GetAttribute("Shifter") or false
			
			if getgenv().MasteryFarmConfig.Enabled then
				local shiftReady = lp:GetAttribute("Bar") and lp:GetAttribute("Bar") == 100
				if not isShifted and shiftReady then
					repeat 
						getRemote:InvokeServer("S_Skills", "Usage", "999", false) 
						task.wait(1) 
					until not self._running or (lp.Character and lp.Character:GetAttribute("Shifter"))
					continue
				end
			end

			if now >= nextTitanCacheUpdate then
				nextTitanCacheUpdate = now + 0.1
				table.clear(validNapes)
				for _, v in ipairs(titansFolder:GetChildren()) do
					if v:GetAttribute("Killed") then continue end
					local hit = v:FindFirstChild("Hitboxes") and v.Hitboxes:FindFirstChild("Hit")
					if hit then
						local fake = v:FindFirstChild("Fake")
						if fake and fake:FindFirstChild("Collision") and not fake.Collision.CanCollide then continue end
						local nape = hit:FindFirstChild("Nape")
						if nape then table.insert(validNapes, nape) end
					end
				end
			end

			local rootPos = root.Position
			local referencePos = rootPos
			local objectiveFound = false

			if now >= nextObjectiveCacheUpdate then
				nextObjectiveCacheUpdate = now + 1
				cachedObjectivePart = nil
				if ws_ObjectiveFolder then
					for _, desc in ipairs(ws_ObjectiveFolder:GetDescendants()) do
						if desc:IsA("BillboardGui") and desc.Parent and desc.Parent:IsA("BasePart") then
							cachedObjectivePart = desc.Parent
							break
						end
					end
				end
			end

			if cachedObjectivePart and cachedObjectivePart.Parent then
				referencePos = cachedObjectivePart.Position
				objectiveFound = true
			end

			local useRangeLimit = objectiveFound and isArmoredRaid and not hasReinerObjective
			local closestDist, closestNape = math.huge, nil
			local closestIsBoss = false
			local bossDist, bossHitPoint = math.huge, nil
			local attackTitanFound = false
			local highestZ = -math.huge
			local isStall = mapData and mapData.Map and mapData.Map.Objective == "Stall"
			local bossIsRoaring = false

			for i = 1, #validNapes do
				local nape = validNapes[i]
				if not nape.Parent then continue end

				local titanModel = nape.Parent.Parent.Parent
				local fake = titanModel:FindFirstChild("Fake")
				if (fake and fake:FindFirstChild("Collision") and not fake.Collision.CanCollide) or (titanModel:GetAttribute("Dead")) then continue end

				local tName = titanModel.Name
				local isBoss = bossNames[tName]

				if isArmoredRaid and not hasReinerObjective and tName == "Armored_Titan" then continue end

				if isColossalRaid then
					if tName == "Colossal_Titan" then continue end
				end
		
				if isBoss and not titanModel:GetAttribute("State") then continue end
			
				local isRoaring = isBoss and (titanModel:GetAttribute("Attack") == "Roar" or titanModel:GetAttribute("Attack") == "Berserk_Mode")

				if tName == "Attack_Titan" then attackTitanFound = true end

				local dx = referencePos.X - nape.Position.X
				local dz = referencePos.Z - nape.Position.Z
				local d = dx*dx + dz*dz
				
				local adjustedDist = d
				if getgenv()._currentTargetNape == nape then
					adjustedDist = adjustedDist - 15000
				end

				if useRangeLimit then
					if d > 90000 then continue end
				end

				if isBoss then
					local hitPart = (titanModel:FindFirstChild("Marker") and titanModel.Marker.Adornee) or titanModel.Hitboxes.Hit.Nape
					if hitPart and adjustedDist < bossDist then
						bossDist = adjustedDist
						bossHitPoint = hitPart
						bossIsRoaring = isRoaring
					end
				end

				if isStall then
					if nape.Position.Z > highestZ then
						highestZ = nape.Position.Z
						closestNape = nape
					end
				elseif adjustedDist < closestDist then
					closestDist = adjustedDist
					closestNape = nape
					closestIsBoss = isBoss
				end
			end

			local targetPart = bossHitPoint or closestNape
			local targetIsRoaring = (targetPart ~= nil and targetPart == bossHitPoint) and bossIsRoaring or false
			
			if useRangeLimit and closestNape then
				targetPart = closestNape
				targetIsRoaring = false
			end

			if not getgenv()._missionStartTime then
				getgenv()._missionStartTime = os.clock()
			end

			if targetPart and #validNapes == 1 and mapType == "Missions" then
				local elapsed = os.clock() - getgenv()._missionStartTime
				local requiredWait = getgenv().LastTitanWait and getgenv().LastTitanWaitSecs or 10
				if elapsed < requiredWait then
					UpdateStatus("Waiting... " .. math.floor(requiredWait - elapsed) .. "s left")
					targetPart = nil
				end
			end

			getgenv()._currentTargetNape = targetPart

			if attackTitanFound then
				attackTitanSpawnTime = attackTitanSpawnTime or now
			else
				attackTitanSpawnTime = nil
			end

			local attackTitanReady = not attackTitanFound or (attackTitanSpawnTime and (now - attackTitanSpawnTime) >= 5)

			if targetPart then
				UpdateStatus(closestIsBoss and "Attacking Boss..." or "Farming Titans...")
				local currentTitanModel = targetPart
				while currentTitanModel and currentTitanModel.Parent ~= titansFolder do
					currentTitanModel = currentTitanModel.Parent
				end

				if isShifted then
					local targetHRP = currentTitanModel:FindFirstChild("HumanoidRootPart")
					local targetCFrame = targetHRP and targetHRP.CFrame or targetPart.CFrame
					
					root.AssemblyLinearVelocity = V3_ZERO
					root.CFrame = targetCFrame * CFrame.new(0, 0, 80)
					local mode = getgenv().MasteryFarmConfig.Mode
					local doPunch = mode == "Punching" or mode == "Both"
					local doSkills = mode == "Skill Usage" or mode == "Both"

					if not targetIsRoaring then
						if doPunch and (now - lastMasteryPunch) >= 1 then
							lastMasteryPunch = now
							postRemote:FireServer("Attacks", "Slash", true)
							postRemote:FireServer("Hitboxes", "Register", targetPart, nil, nil, masteryComboIndex) 
							masteryComboIndex = masteryComboIndex + 1
							if masteryComboIndex > 4 then masteryComboIndex = 1 end
						end

						if doSkills and slotData and slotData.Skills and slotData.Skills.Shifter and not getgenv().ShifterSkillsRunning then
							getgenv().ShifterSkillsRunning = true
							task.spawn(function()
								for _, skillId in ipairs(slotData.Skills.Shifter) do
									local idNum = tonumber(skillId)
									if idNum and idNum ~= 200 and idNum ~= 300 and idNum ~= 400 and idNum ~= 210 and idNum ~= 211 and idNum ~= 306 and idNum ~= 308 and idNum ~= 402 and idNum ~= 403 and idNum ~= 407 then
										getRemote:InvokeServer("S_Skills", "Usage", tostring(skillId), false)
									end
									task.wait(1)
								end
								getgenv().ShifterSkillsRunning = false
							end)
						end
					end
					task.wait(0.05)
					continue
				end

				local titanHRP = currentTitanModel:FindFirstChild("HumanoidRootPart")
				local targetHeightPos
				if titanHRP then
					targetHeightPos = (titanHRP.CFrame * CFrame.new(0, getgenv().AutoFarmConfig.HeightOffset, 30)).Position
				else
					targetHeightPos = targetPart.Position + Vector3.new(0, getgenv().AutoFarmConfig.HeightOffset, 0)
				end
				
				if getgenv().AutoFarmConfig.MovementMode == "Hover" then
					local dir = targetHeightPos - rootPos
					root.AssemblyLinearVelocity = dir.Magnitude > 1 and dir.Unit * getgenv().AutoFarmConfig.MoveSpeed or V3_ZERO
				else
					root.AssemblyLinearVelocity = V3_ZERO
					root.CFrame = CFrame.new(targetHeightPos)
				end

				if not attackTitanReady then task.wait(0.05) continue end

				local dx = root.Position.X - targetPart.Position.X
				local dz = root.Position.Z - targetPart.Position.Z

				if not targetIsRoaring and (dx*dx + dz*dz) <= AttackRangeSq and (now - lastAttack) >= getgenv().AutoFarmConfig.AttackCooldown then
					lastAttack = now

					local hitTargets = { targetPart }
					if getgenv().MultiHit then
						local count = 1
						for i = 1, #validNapes do
							if count >= getgenv().MultiHitCount then break end
							local n = validNapes[i]
							if n ~= targetPart and n.Parent then
								local tm = n.Parent.Parent.Parent
								if not tm:GetAttribute("Dead") then
									table.insert(hitTargets, n)
									count = count + 1
								end
							end
						end
					end

					if slotData.Weapon == "Blades" then
						postRemote:FireServer("Attacks", "Slash", true)
						for _, nape in ipairs(hitTargets) do
							postRemote:FireServer("Hitboxes", "Register", nape, math.random(625, 850))
						end
					else
						local isBoss = bossNames[targetPart.Parent.Parent.Parent.Name]
						local spearsLabel = PlayerGui.Interface.HUD.Main.Top["7"].Spears.Spears
						local text = spearsLabel.Text
						local currentAmmo, maxAmmo = string.match(text, "(%d+)%s*/%s*(%d+)")
						currentAmmo, maxAmmo = tonumber(currentAmmo), tonumber(maxAmmo)

						if currentAmmo and currentAmmo > 0 then
							task.spawn(function()
								local function getAmmo()
									return tonumber(string.match(spearsLabel.Text, "(%d+)"))
								end

								local beforeAmmo = getAmmo()
								getRemote:InvokeServer("Spears", "S_Fire", tostring(currentAmmo))
								local afterAmmo = getAmmo()

								if afterAmmo and beforeAmmo and afterAmmo == beforeAmmo then
									for j = maxAmmo, 1, -1 do
										local prevAmmo = getAmmo()
										getRemote:InvokeServer("Spears", "S_Fire", tostring(j))
										local newAmmo = getAmmo()
										if newAmmo and prevAmmo and newAmmo < prevAmmo then break end
									end
								end
								
								local loops = isBoss and 40 or 1
								for j = 1, loops do
									for _, nape in ipairs(hitTargets) do
										postRemote:FireServer("Spears", "S_Explode", nape.Position)
									end
								end
							end)
						end
					end
				end
			else
				root.AssemblyLinearVelocity = V3_ZERO
			end

			task.wait(0.05)
		end
	end)
end

function AutoFarm:Stop()
	self._running = false
	getgenv()._colossalCannonRunning = false
	getgenv()._colossalPhase2Running = false
end

-- ==========================================
-- NOCLIP
-- ==========================================

local noclipConn = nil
local function setNoclip(enabled)
	if noclipConn then noclipConn:Disconnect(); noclipConn = nil end
	if not enabled then
		local char = lp.Character
		if char then
			for _, p in ipairs(char:GetDescendants()) do
				if p:IsA("BasePart") then p.CanCollide = true end
			end
		end
		return
	end
	noclipConn = RunService.Stepped:Connect(function()
		local char = lp.Character
		if not char then return end
		for _, p in ipairs(char:GetDescendants()) do
			if p:IsA("BasePart") then p.CanCollide = false end
		end
	end)
end

-- ==========================================
-- AUTO REJOIN ON CRASH
-- ==========================================

local lastMissionState = false
local crashCheckRunning = false

local function startCrashDetection()
	if crashCheckRunning then return end
	crashCheckRunning = true
	task.spawn(function()
		while crashCheckRunning do
			task.wait(10)
			if not getgenv().AutoRejoin then continue end
			if isLobby then continue end
			if not AutoFarm._running then continue end

			local titans = workspace:FindFirstChild("Titans")
			local unclimbable = workspace:FindFirstChild("Unclimbable")

			if not titans and not unclimbable then
				task.wait(10)
				titans = workspace:FindFirstChild("Titans")
				unclimbable = workspace:FindFirstChild("Unclimbable")

				if not titans and not unclimbable then
					sessionStats.crashes = sessionStats.crashes + 1
					SaveSessionStats()
					Library:Notify({
						Title = "Auto Rejoin",
						Description = "Crash detected! Rejoining... (" .. sessionStats.crashes .. " total)",
						Time = 5
					})

					AutoFarm:Stop()
					task.wait(0.5)
					pcall(function() getRemote:InvokeServer("Functions", "Teleport", "Lobby") end)
					task.wait(0.5)
					pcall(function() TeleportService:Teleport(14916516914, lp) end)
				end
			end
		end
	end)
end

local function stopCrashDetection()
	crashCheckRunning = false
end

-- ==========================================
-- HELPERS
-- ==========================================

local function formatTable(tbl)
	local str = ""
	for k, v in pairs(tbl) do
		str ..= string.format("%s: %s\n", k, tostring(v))
	end
	return str ~= "" and str or "None"
end

local function formatItems(tbl)
	local str = ""
	for name, qty in pairs(tbl) do
		name = string.gsub(name, "_", " ")
		str ..= string.format("[+] %s (x%s)\n", name, qty)
	end
	return str ~= "" and str or "None"
end

local data = {
	Stats = {},
	Total = {},
	Items = {},
	Special = {}
}

local path = "./GOTHAHUB/aotr/games_played.txt"
if not isfile(path) then writefile(path, "0") end
local gamesPlayed = tonumber(readfile(path))

local webhook
local shadowBanWebhook

local function GetShadowBanInfo()
	local blacklisted = lp:GetAttribute("Blacklisted") == true
	local exploiter = lp:GetAttribute("Exploiter") == true
	local level = tostring(lp:GetAttribute("Level") or "N/A")
	local prestige = tostring(lp:GetAttribute("Prestige") or "N/A")
	local flags = (blacklisted and 1 or 0) + (exploiter and 1 or 0)
	local status = flags == 0 and "Clean" or (flags == 1 and "Flagged" or "Banned")

	return {
		Blacklisted = blacklisted,
		Exploiter = exploiter,
		Level = level,
		Prestige = prestige,
		Status = status,
		Text = "Blacklisted: " .. (blacklisted and "YES" or "No") .. "\n" ..
			"Exploiter: " .. (exploiter and "YES" or "No") .. "\n" ..
			"Level: " .. level .. "\n" ..
			"Prestige: " .. prestige .. "\n" ..
			"Status: " .. status
	}
end

local function SendShadowBanWebhook(shadowInfo)
	if not getgenv().ShadowBanWebhook or not shadowBanWebhook or shadowBanWebhook == "" then return false end
	if not shadowInfo or shadowInfo.Status == "Clean" then return false end

	local payload = {
		embeds = {{
			title = "Shadow Ban Alert",
			color = 16711680,
			fields = {
				{
					name = "Account",
					value = "```" .. lp.Name .. "```",
					inline = true
				},
				{
					name = "Status",
					value = "```Account has been shadow banned```",
					inline = false
				}
			},
			timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
		}}
	}

	local ok = pcall(function()
		request({
			Url = shadowBanWebhook,
			Method = "POST",
			Headers = { ["Content-Type"] = "application/json" },
			Body = HttpService:JSONEncode(payload)
		})
	end)
	return ok
end



-- ==========================================
-- REWARDS LISTENER
-- ==========================================

if rewards then
	rewards:GetPropertyChangedSignal("Visible"):Connect(function()
		if not rewards.Visible then return end

		-- Reset mission start timer
		getgenv()._missionStartTime = nil

		gamesPlayed = gamesPlayed + 1
		writefile("./GOTHAHUB/aotr/games_played.txt", tostring(gamesPlayed))

		-- Update session stats
		sessionStats.gamesPlayed = sessionStats.gamesPlayed + 1
		pcall(function()
			local res = getRemote:InvokeServer("S_Rewards", "Get", true)
			if res and res.Obtained then
				sessionStats.totalGold = sessionStats.totalGold + (res.Obtained.Gold or 0)
				sessionStats.totalGems = sessionStats.totalGems + (res.Obtained.Gems or 0)
				sessionStats.totalXP = sessionStats.totalXP + (res.Obtained.XP or 0)
			end
		end)
		if data.Special and next(data.Special) then
			sessionStats.mythicalDrops = sessionStats.mythicalDrops + 1
		end
		SaveSessionStats()

		local gamesUntilReturn = tonumber(readfile(returnCounterPath)) or 0
		local willReturn = false

		if getgenv().AutoReturnLobby then
			gamesUntilReturn = gamesUntilReturn + 1

			if gamesUntilReturn >= getgenv().ReturnAfterGames then
				gamesUntilReturn = 0
				willReturn = true
			end
			
			writefile(returnCounterPath, tostring(gamesUntilReturn))
			
			if willReturn then
				task.spawn(function()
					getRemote:InvokeServer("Functions", "Teleport", "Lobby")
				end)
				task.wait(0.5)
				TeleportService:Teleport(14916516914, lp)
				return
			end
		elseif gamesUntilReturn >= getgenv().ReturnAfterGames then
			gamesUntilReturn = 0
			writefile(returnCounterPath, "0")
		end
		
		if not getgenv().RewardWebhook then return end
		
		local start = os.clock()
		local hasData
		repeat 
			task.wait(0.1)
			hasData = false
			for _, v in ipairs(statsFrame:GetChildren()) do
				if v:IsA("Frame") and v:FindFirstChild("Amount") and v.Amount.Text ~= "0" and v.Amount.Text ~= "" then
					hasData = true
					break
				end
			end
		until hasData or (os.clock() - start) > 2

		data.Stats = {}
		data.Total = {}
		data.Items = {}
		data.Special = {}
		local dropsData = {} -- itemId -> itemName mapping for Special lookup

		for i, v in ipairs(statsFrame:GetChildren()) do
			if v:IsA("Frame") and v:FindFirstChild("Stat") and v:FindFirstChild("Amount") then
				data.Stats[string.gsub(v.Name, "_", " ")] = v.Amount.Text
			end
		end

		pcall(function()
			local res = getRemote:InvokeServer("S_Rewards", "Get", true)
			if res and res.Obtained then
				local ob = res.Obtained
				if ob.Gold   and ob.Gold   > 0 then data.Items["Gold"]   = tostring(ob.Gold)   end
				if ob.XP     and ob.XP     > 0 then data.Items["XP"]     = tostring(ob.XP)     end
				if ob.Gems   and ob.Gems   > 0 then data.Items["Gems"]   = tostring(ob.Gems)   end
				if ob.Canes  and ob.Canes  > 0 then data.Items["Canes"]  = tostring(ob.Canes)  end
				if ob.Shards and ob.Shards > 0 then data.Items["Shards"] = tostring(ob.Shards) end
				if ob.Silver and ob.Silver > 0 then data.Items["Silver"] = tostring(ob.Silver) end
				if ob.BP_XP  and ob.BP_XP  > 0 then data.Items["BP XP"]  = tostring(ob.BP_XP)  end
				if ob.Perks then
					for _, perkName in ipairs(ob.Perks) do
						data.Items["Perk: " .. perkName] = "1"
					end
				end
				if ob.Drops then
					for itemId, itemName in pairs(ob.Drops) do
						local name = tostring(itemName)
						dropsData[tostring(itemId)] = name
						local existing = tonumber(data.Items[name]) or 0
						data.Items[name] = tostring(existing + 1)
					end
				end
				if ob.Chests then
					for chestName, qty in pairs(ob.Chests) do
						if qty and qty > 0 then
							data.Items["Chest: " .. chestName] = tostring(qty)
						end
					end
				end
			end
		end)

		-- SECRET PERK DETECTION (server-side, reliable)
		pcall(function()
			local res2 = getRemote:InvokeServer("S_Rewards", "Get", true)
			if res2 and res2.Obtained and res2.Obtained.Perks then
				for _, perkName in ipairs(res2.Obtained.Perks) do
					if GetPerkRarity(perkName) == "Secret" then
						data.Special["Perk: " .. perkName] = "1"
					end
				end
			end
		end)

		-- MYTHICAL ITEM DROPS (non-perk, GUI scan)
		if itemsFrame then
			for _, v in ipairs(itemsFrame:GetChildren()) do
				if v:IsA("Frame") and v:FindFirstChild("Main") then
					local inner = v.Main:FindFirstChild("Inner")
					if inner and inner:FindFirstChild("Rarity")
					   and inner.Rarity.BackgroundColor3 == Color3.fromRGB(255, 0, 0) then
						local qty = inner:FindFirstChild("Quantity")
						local itemId = string.match(tostring(v.Name), "(%d+)$")
						local displayName = (itemId and dropsData[itemId]) or v.Name
						if not data.Special[displayName] then
							data.Special[displayName] = qty and qty.Text or "1"
						end
					end
				end
			end
		end

		local currentSlot = lp:GetAttribute("Slot") or "A"
		local slotData = mapData and mapData.Slots and mapData.Slots[currentSlot]
		local executor = identifyexecutor and identifyexecutor() or "Unknown"

		if slotData then
			if slotData.Currency then
				for i, v in pairs(slotData.Currency) do
					if i == "Gems" or i == "Gold" then data.Total[i] = v end
				end
			end
			if slotData.Progression then
				for i, v in pairs(slotData.Progression) do
					if i == "Prestige" or i == "Level" or i == "Streak" then data.Total[i] = v end
				end
			end
		end

		local hasSpecial = data.Special and next(data.Special) ~= nil

		if webhook and webhook ~= "" then
			local payload = {
				content = hasSpecial and "MYTHICAL DROP! @everyone" or nil,
				embeds = {{
					title = "GothaHub Rewards",
					color = hasSpecial and 16711680 or 2829617,
					fields = {
						{
							name = "Information",
							value = "```\n" ..
								"User: " .. lp.Name .. "\n" ..
								"Games Played: " .. tostring(gamesPlayed) .. "\n" ..
								"Executor: " .. executor .. "\n" ..
								"\n```",
							inline = true
						},
						{
							name = "Total Stats",
							value = "```\n" ..
								"Prestige : " .. tostring(data.Total.Prestige or "0") .. "\n" ..
								"Level : " .. tostring(data.Total.Level or "1") .. "\n" ..
								"Gold  : " .. tostring(data.Total.Gold or "0") .. "\n" ..
								"Gems  : " .. tostring(data.Total.Gems or "0") ..
								"\n```",
							inline = true
						},
						{
							name = "Combat",
							value = "```\n" .. formatTable(data.Stats) .. "\n```",
							inline = true
						},
						{
							name = "Rewards",
							value = "```\n" .. formatItems(data.Items) .. "\n```",
							inline = true
						},
						{
							name = "Special",
							value = "```\n" .. (hasSpecial and formatItems(data.Special) or "None") .. "\n```",
							inline = true
						}
					},
					footer = {
						text = "GOTHAHUB • " .. DateTime.now():FormatLocalTime("LTS", "en-us")
					},
					timestamp = DateTime.now():ToIsoDate()
				}}
			}

			request({
				Url = webhook,
				Method = "POST",
				Headers = { ["Content-Type"] = "application/json" },
				Body = HttpService:JSONEncode(payload)
			})
		end
	end)
end


-- ==========================================
-- PERKS & TALENTS DATA
-- ==========================================

local Perks = {
	Legendary = {
		"Peerless Commander","Indefatigable","Tyrant's Stare","Invincible","Eviscerate",
		"Font of Vitality","Flame Rhapsody","Robust","Sixth Sense","Gear Master",
		"Carnifex","Munitions Master","Sanctified","Wind Rhapsody","Peerless Constitution",
		"Exhumation","Warchief","Peerless Focus","Perfect Form","Courage Catalyst",
		"Aegis","Unparalleled Strength","Perfect Soul"
	},
	Common = {
		"Cripple","Lucky","Enhanced Metabolism","First Aid","Mighty",
		"Fortitude","Hollow","Gear Beginner","Enduring"
	},
	Epic = {
		"Munitions Expert","Gear Expert","Butcher","Resilient","Speedy",
		"Reckless Abandon","Focus","Stalwart Durability","Adrenaline","Safeguard",
		"Warrior","Solo","Mutilate","Trauma Battery","Hardy",
		"Unbreakable","Siphoning","Flawed Release","Luminous","Peerless Strength"
	},
	Rare = {
		"Blessed","Gear Intermediate","Unyielding","Fully Stocked","Forceful",
		"Lightweight","Protection","Mangle","Experimental Shells","Critical Hunter",
		"Tough","Heightened Vitality"
	},
	Secret = {
		"Everlasting Flame","Heavenly Restriction","Adaptation","Maximum Firepower",
		"Soulfeed","Kengo","Black Flash","Font of Inspiration","Explosive Fortune",
		"Immortal","Art of War","Tatsujin","Founder's Blessing","Unwavering Belief"
	}
}

local PerkRarityMap = {}
for rarity, names in pairs(Perks) do
	for _, name in pairs(names) do PerkRarityMap[name] = rarity end
end

local Talents = {
	"Blitzblade","Crescendo","Swiftshot","Surgeshot","Guardian","Deflectra",
	"Mendmaster","Cooldown Blitz","Stalwart","Stormcharged","Aegisurge","Riposte",
	"Lifefeed","Vitalize","Gem Fiend","Luck Boost","EXP Boost","Gold Boost",
	"Furyforge","Quakestrike","Assassin","Amputation","Steel Frame","Resilience",
	"Vengeflare","Flashstep","Omnirange","Tactician","Gambler","Overslash",
	"Afterimages","Necromantic","Thanatophobia","Apotheosis","Bloodthief"
}

local PrestigeTalentData = {
	["1"] = { Tag = "Blitzblade", Stars = 1, Category = "Offense" },
	["2"] = { Tag = "Crescendo", Stars = 1, Category = "Offense" },
	["3"] = { Tag = "Swiftshot", Stars = 1, Category = "Offense" },
	["4"] = { Tag = "Stalwart", Stars = 2, Category = "Offense" },
	["5"] = { Tag = "Furyforge", Stars = 3, Category = "Offense" },
	["6"] = { Tag = "Quakestrike", Stars = 3, Category = "Offense" },
	["7"] = { Tag = "Guardian", Stars = 1, Category = "Defense" },
	["8"] = { Tag = "Deflectra", Stars = 1, Category = "Defense" },
	["9"] = { Tag = "Aegisurge", Stars = 2, Category = "Defense" },
	["10"] = { Tag = "Vengeflare", Stars = 3, Category = "Defense" },
	["11"] = { Tag = "Resilience", Stars = 3, Category = "Defense" },
	["12"] = { Tag = "Mendmaster", Stars = 1, Category = "Support" },
	["13"] = { Tag = "Cooldown Blitz", Stars = 1, Category = "Support" },
	["14"] = { Tag = "Lifefeed", Stars = 2, Category = "Support" },
	["15"] = { Tag = "Vitalize", Stars = 2, Category = "Support" },
	["16"] = { Tag = "Flashstep", Stars = 3, Category = "Support" },
	["17"] = { Tag = "Omnirange", Stars = 3, Category = "Support" },
	["18"] = { Tag = "Stormcharged", Stars = 2, Category = "Offense" },
	["19"] = { Tag = "Assassin", Stars = 3, Category = "Offense" },
	["20"] = { Tag = "Amputation", Stars = 3, Category = "Offense" },
	["21"] = { Tag = "Gambler", Stars = 4, Category = "Offense" },
	["22"] = { Tag = "Riposte", Stars = 2, Category = "Defense" },
	["23"] = { Tag = "Necromantic", Stars = 4, Category = "Defense" },
	["24"] = { Tag = "Thanatophobia", Stars = 4, Category = "Defense" },
	["25"] = { Tag = "Tactician", Stars = 3, Category = "Support" },
	["26"] = { Tag = "Gem Fiend", Stars = 2, Category = "Support" },
	["27"] = { Tag = "Apotheosis", Stars = 4, Category = "Support" },
	["28"] = { Tag = "Bloodthief", Stars = 4, Category = "Support" },
	["29"] = { Tag = "Overslash", Stars = 4, Category = "Offense" },
	["30"] = { Tag = "Surgeshot", Stars = 1, Category = "Offense" },
	["31"] = { Tag = "Supernova", Stars = 3, Category = "Offense" },
	["32"] = { Tag = "Afterimages", Stars = 4, Category = "Offense" },
	["33"] = { Tag = "Steel Frame", Stars = 3, Category = "Defense" },
}

local Perk_Level_XP = {
	Common    = {50, 100, 150, 200, 250, 300, 350, 400, 450, 500},
	Rare      = {125, 250, 375, 500, 625, 750, 875, 1000, 1125, 1250},
	Epic      = {250, 500, 750, 1000, 1250, 1500, 1750, 2000, 2250, 2500},
	Legendary = {500, 1000, 1500, 2000, 2500, 3000, 3500, 4000, 4500, 5000},
	Secret    = {2000, 4000, 6000, 8000, 10000, 12000, 14000, 16000, 18000, 20000},
}

local Perk_Base_XP = {
	Common    = 100,
	Rare      = 250,
	Epic      = 625,
	Legendary = 2500,
	Secret    = 10000,
}

local Blades_Critical = {
	"1","2","3","4","5","6","7","8","9","10","11","12","13",
	"14","15","16","17","18","19","20","21","22","23","24","25"
}

local Blades_Damage = {
	"1","2","3","4","5","6","7","8","9","10","11","12","13",
	"26","27","28","29","30","31","32","33","34","35","36","37"
}

local Spears_Critical = {
	"113","114","115","116","117","118","119","120",
	"121","122","123","124","125",
	"126","127","128","129","130","131","132",
	"133","134","135","136","137"
}

local Spears_Damage = {
	"113","114","115","116","117","118","119","120",
	"121","122","123","124","125",
	"138","139","140","141","142","143","144",
	"145","146","147","148","149"
}

local Defense_Health = {
	"38","39","40","41","42","43","44","45",
	"46","47","48","49","50","51","52","53","54","55","56","57"
}

local Defense_Damage_Reduction = {
	"38","39","40","41","42","43","44","45",
	"58","59","60","61","62","63","64","65","66","67","68","69"
}

local Support_Regen = {
	"70","71","72","73","74","75","76","77","78","79","80",
	"81","82","83","84","85","86","87","88","89"
}

local Support_Cooldown_Reduction = {
	"70","71","72","73","74","75","76","77","78","79","80",
	"90","91","92","93","94","95","96","97","98"
}

local Missions = {
	["Shiganshina"] = { "Skirmish", "Breach", "Random" },
	["Trost"] = { "Skirmish", "Protect", "Random" },
	["Outskirts"] = { "Skirmish", "Escort", "Random" },
	["Forest"] = { "Skirmish", "Guard", "Random" },
	["Utgard"] = { "Skirmish", "Defend", "Random" },
	["Docks"] = { "Skirmish", "Stall", "Random" },
	["Stohess"] = { "Skirmish", "Random" },
	["Chapel"] = {"Skirmish", "Random"},
	["Colossal"] = { "Random" },
	["Waves"] = { "Waves" }
}

local RaidObjectives = {
	["Trost"]       = "Attack Titan",
	["Shiganshina"] = "Armored Titan",
	["Stohess"]     = "Female Titan",
	["Colossal"]    = "Colossal Titan",
}

local RaidMapNames = {
	["Trost"]       = "Trost",
	["Shiganshina"] = "Shiganshina",
	["Stohess"]     = "Stohess",
	["Colossal"]    = "Shiganshina",
}

local SkillPaths = {
	Blades = { Damage = Blades_Damage, Critical = Blades_Critical },
	Spears = { Damage = Spears_Damage, Critical = Spears_Critical },
	Defense = { Health = Defense_Health, ["Damage Reduction"] = Defense_Damage_Reduction },
	Support = { Regen = Support_Regen, ["Cooldown Reduction"] = Support_Cooldown_Reduction }
}

local function GetPerkRarity(perkName)
	return PerkRarityMap[perkName]
end

local function GetPerkXP(rarity, level)
	local base = Perk_Base_XP[rarity] or 0
	return base * math.max(level, 1)
end

local function GetPerkPlayerData()
	local attempts = {
		{ "Functions", "Settings", "Get" },
		{ "Data", "Copy" },
		{ "S_Equipment", "Talents" },
	}

	for _, args in ipairs(attempts) do
		local ok, result = pcall(function()
			return getRemote:InvokeServer(unpack(args))
		end)

		if ok and type(result) == "table" and type(result.Slots) == "table" then
			local slotId = result.Current_Slot or lp:GetAttribute("Slot") or "A"
			local slot = result.Slots[slotId]
			if type(slot) == "table" and type(slot.Perks) == "table" then
				return result
			end
		end

		task.wait(0.15)
	end

	return nil
end

local function GetSlotPerksFromData(data)
	if type(data) ~= "table" or type(data.Slots) ~= "table" then return nil, nil end

	local slotId = data.Current_Slot or lp:GetAttribute("Slot") or "A"
	local slot = data.Slots[slotId]
	if type(slot) == "table" and type(slot.Perks) == "table" then
		return slot.Perks, slotId
	end

	for id, candidate in pairs(data.Slots) do
		if type(candidate) == "table" and type(candidate.Perks) == "table" then
			return candidate.Perks, id
		end
	end

	return nil, slotId
end

local function IsAutoSellPerkRarity(rarity)
	local selected = getgenv().AutoSellPerks or {}
	if selected[rarity] == true then return true end
	return rarity == "Secret" and selected.Mythic == true
end

local function BuildEquippedPerkSet(equipped)
	local set = {}
	if type(equipped) ~= "table" then return set end

	for _, id in pairs(equipped) do
		if id ~= nil and id ~= "" then
			set[tostring(id)] = true
		end
	end

	return set
end

local function CollectAutoSellPerks(perks)
	local storage = perks and perks.Storage
	if type(storage) ~= "table" then return {} end

	local equipped = BuildEquippedPerkSet(perks.Equipped)
	local candidates = {}

	for id, perk in pairs(storage) do
		local perkId = tostring(id)
		local name = type(perk) == "table" and perk.Name or nil
		local rarity = name and GetPerkRarity(name) or nil
		if rarity and IsAutoSellPerkRarity(rarity) and not equipped[perkId] then
			table.insert(candidates, perkId)
		end
	end

	return candidates
end

local function SellAutoPerksOnce()
	local data = GetPerkPlayerData()
	local perks = nil
	if data then
		perks = GetSlotPerksFromData(data)
	end
	if type(perks) ~= "table" then return 0 end

	local candidates = CollectAutoSellPerks(perks)
	if #candidates == 0 then return 0 end

	local sold = 0
	local batchSize = 40
	for i = 1, #candidates, batchSize do
		local batch = {}
		for j = i, math.min(i + batchSize - 1, #candidates) do
			table.insert(batch, candidates[j])
		end

		local ok, result = pcall(function()
			return getRemote:InvokeServer("S_Equipment", "Delete", "Perk", batch)
		end)

		if ok and type(result) == "table" then
			sold += #batch
		else
			break
		end

		task.wait(0.2)
	end

	return sold
end

local function ReadInjuryPlayerData()
	local ok, result = pcall(function()
		return getRemote:InvokeServer("S_Equipment", "Talents")
	end)

	if ok and type(result) == "table" and type(result.Slots) == "table" then
		lastPlayerData = result
		lastPlayerDataTime = os.clock()
		return result
	end

	return nil
end

local function GetCurrentSlotData(data)
	if type(data) ~= "table" or type(data.Slots) ~= "table" then return nil end

	local slotId = data.Current_Slot or lp:GetAttribute("Slot") or "A"
	local slot = data.Slots[slotId] or data.Slots[tostring(slotId)]
	if type(slot) == "table" then
		return slot
	end

	for _, candidate in pairs(data.Slots) do
		if type(candidate) == "table" then
			return candidate
		end
	end

	return nil
end

local function AddInjuryCandidate(candidates, seen, injuryName)
	if type(injuryName) ~= "string" or injuryName == "" or seen[injuryName] then return end
	seen[injuryName] = true
	table.insert(candidates, injuryName)
end

local function CollectInjuryCandidates()
	local candidates = {}
	local seen = {}
	local slot = GetCurrentSlotData(ReadInjuryPlayerData())
	local injuries = slot and slot.Injuries

	if type(injuries) == "table" then
		for injuryName, value in pairs(injuries) do
			if value ~= nil and value ~= false then
				if type(value) == "string" then
					AddInjuryCandidate(candidates, seen, value)
				elseif type(injuryName) == "string" then
					AddInjuryCandidate(candidates, seen, injuryName)
				end
			end
		end
	end

	local char = lp.Character
	local charInjuries = char and char:FindFirstChild("Injuries")
	if charInjuries then
		for _, injury in ipairs(charInjuries:GetChildren()) do
			AddInjuryCandidate(candidates, seen, injury.Name)
		end
	end

	return candidates
end

local function HealInjuriesOnce()
	if game.PlaceId ~= 14916516914 then return 0, "lobby" end

	local injuries = CollectInjuryCandidates()
	if #injuries == 0 then return 0, "none" end

	local healed = 0
	for _, injuryName in ipairs(injuries) do
		local ok, result = pcall(function()
			return getRemote:InvokeServer("S_Equipment", "Injury", injuryName)
		end)

		if ok and type(result) == "table" then
			healed += 1
			lastPlayerData = result
			lastPlayerDataTime = os.clock()
		end

		task.wait(0.2)
	end

	return healed, healed > 0 and "healed" or "failed"
end

local function UseButton(button)
	if not button or not button.Parent then return false end
	if not button.Visible then return false end
	if GuiService.MenuIsOpen then
		vim:SendKeyEvent(true, Enum.KeyCode.Escape, false, game) 
		vim:SendKeyEvent(false, Enum.KeyCode.Escape, false, game)
		task.wait(0.1)
	end
	GuiService.SelectedObject = button
	task.wait(0.05)
	vim:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
	vim:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
	return true
end

local _deleteMapRunning = false
local function DeleteMap()
	if _deleteMapRunning or not getgenv().DeleteMap or not workspace:FindFirstChild("Climbable") or mapData.Map.Type == "Raids" then return end
	task.spawn(function()
		_deleteMapRunning = true
		while getgenv().DeleteMap do
			if not workspace:FindFirstChild("Climbable") or mapData.Map.Type == "Raids" then break end
			for i, v in workspace.Climbable:GetChildren() do v:Destroy() end
			for i, v in workspace.Unclimbable:GetChildren() do
				if v.Name ~= "Reloads" and v.Name ~= "Objective" and v.Name ~= "Cutscene" then
					v:Destroy()
				end
			end
			task.wait(3)
		end
		_deleteMapRunning = false
	end)
end

local function setupAutoExecute()
	if getgenv().AutoExecute and not getgenv().AutoExec then
		if not queue_on_teleport then
			Library:Notify({ Title = "Auto Execute", Description = "Your executor doesn't support Auto Execute!", Time = 5 })
			return
		end
		getgenv().AutoExec = true
		queue_on_teleport([[
			repeat task.wait() until game:IsLoaded()
			task.wait(5)
			getgenv().AutoExec = false
			loadstring(game:HttpGet("https://raw.githubusercontent.com/L-Lawliet-Hub/THUB/main/ins.lua"))()
		]])
	end
end

local function ExecuteImmediateAutomation()
	
-- Auto Skip Cutscenes + Always TP to Refill
if getgenv().AutoSkip then
    local skip = INTERFACE:FindFirstChild("Skip")
    
    if skip and skip.Visible then
        -- Click skip multiple times
        for i = 1, 5 do
            local interact = skip:FindFirstChild("Interact")
            if interact then
                UseButton(interact)
            end
            task.wait(0.3)
            if not skip.Visible then break end
        end
    end
    
    -- ✅ ALWAYS TP to refill (chahe skip tha ya nahi)
    task.wait(0.5)
    pcall(function()
        local refillPart = getCachedRefillPart()
        if refillPart and refillPart.Parent then
            local root = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
            if root then
                root.CFrame = refillPart.CFrame * CFrame.new(0, 5, 10)
            end
        end
    end)
end
	-- Auto Open Chests (US Suite logic — polling based, works even if event missed)
	-- Auto Open Chests (ULTRA FIX - forces both chests to open)
if getgenv().AutoChest then
    local chests = INTERFACE:FindFirstChild("Chests")
    if chests and chests.Visible then
        local free = chests:FindFirstChild("Free")
        local premium = chests:FindFirstChild("Premium")
        local finish = chests:FindFirstChild("Finish")

        -- Step 1: Open Free Chest + WAIT
        if free and free.Visible then
            UseButton(free)
            repeat task.wait(0.5) until not free.Visible or not chests.Visible
        end

        -- Step 2: Open Premium Chest + WAIT (if enabled)
        if premium and premium.Visible and getgenv().OpenSecondChest then
            -- Small delay to ensure free chest animation completes
            task.wait(0.5)
            
            if premium.Visible then
                UseButton(premium)
                repeat task.wait(0.5) until not premium.Visible or not chests.Visible
            end
        end

        -- Step 3: Finish button (ONLY after both done)
        if finish and finish.Visible then
            task.wait(0.3)
            UseButton(finish)
        end
    end
end

if getgenv().AutoRetry then
        local rewardsGui = INTERFACE:FindFirstChild("Rewards")
        if rewardsGui and rewardsGui.Visible then
            if getgenv()._autoRetryHandling then return end
            getgenv()._autoRetryHandling = true
            task.wait(2)
            if not getgenv().AutoRetry or not rewardsGui.Parent or not rewardsGui.Visible then
                getgenv()._autoRetryHandling = false
                return
            end

            -- Method 1: Direct button path
            local retryBtn = rewardsGui:FindFirstChild("Main")
                and rewardsGui.Main:FindFirstChild("Info")
                and rewardsGui.Main.Info:FindFirstChild("Main")
                and rewardsGui.Main.Info.Main:FindFirstChild("Buttons")
                and rewardsGui.Main.Info.Main.Buttons:FindFirstChild("Retry")
            
            -- Method 2: Search all descendants for "Retry" button
            if not retryBtn or not retryBtn.Visible then
                for _, btn in ipairs(rewardsGui:GetDescendants()) do
                    if (btn:IsA("TextButton") or btn:IsA("ImageButton")) and btn.Visible and btn.Active then
                        if btn.Name == "Retry" or (btn:IsA("TextButton") and btn.Text:find("Retry")) then
                            retryBtn = btn
                            break
                        end
                    end
                end
            end
            
            local function tryRetryRemote()
                local calls = {
                    { "S_Rewards", "Retry" },
                    { "S_Rewards", "Replay" },
                    { "S_Missions", "Retry" },
                    { "S_Missions", "Replay" },
                    { "Functions", "Retry" },
                }

                for _, args in ipairs(calls) do
                    pcall(function()
                        getRemote:InvokeServer(unpack(args))
                    end)
                    task.wait(0.25)
                    if not rewardsGui.Visible then
                        return true
                    end
                end

                return false
            end

            local function startRetriedMission()
                task.wait(1)
                pcall(function()
                    getRemote:InvokeServer("S_Missions", "Start")
                end)
            end

            local function fallbackToLobbyIfStuck()
                task.spawn(function()
                    local started = os.clock()
                    repeat
                        task.wait(1)
                    until not getgenv().AutoRetry
                        or not rewardsGui.Parent
                        or not rewardsGui.Visible
                        or (os.clock() - started) >= 40

                    if getgenv().AutoRetry and rewardsGui.Parent and rewardsGui.Visible then
                        Library:Notify({
                            Title = "Auto Retry",
                            Description = "Mission did not restart in 40s. Returning to lobby...",
                            Time = 5
                        })
                        pcall(function()
                            getRemote:InvokeServer("Functions", "Teleport", "Lobby")
                        end)
                        task.wait(0.5)
                        pcall(function()
                            TeleportService:Teleport(14916516914, lp)
                        end)
                    end

                    getgenv()._autoRetryHandling = false
                end)
            end

            -- Method 3: Click via VirtualInputManager directly
            if retryBtn and retryBtn.Visible and retryBtn.Active then
                -- Wait a bit for UI to fully load
                task.wait(1)
                
                -- Try multiple click methods
                local clicked = false
                
                -- Try 1: UseButton function
                clicked = UseButton(retryBtn)
                
                -- Try 2: Direct VIM click
                if not clicked then
                    GuiService.SelectedObject = retryBtn
                    task.wait(0.1)
                    vim:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                    vim:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                    clicked = true
                end
                
                -- Try 3: Mouse click simulation
                if not clicked then
                    local pos = retryBtn.AbsolutePosition + retryBtn.AbsoluteSize / 2
                    vim:SendMouseButtonEvent(pos.X, pos.Y, 0, true, game, 0)
                    task.wait(0.1)
                    vim:SendMouseButtonEvent(pos.X, pos.Y, 0, false, game, 0)
                    clicked = true
                end
                
                if clicked then
                    print("Retry button clicked!")
                    task.wait(1)
                    if rewardsGui.Visible then
                        tryRetryRemote()
                    end
                    startRetriedMission()
                    fallbackToLobbyIfStuck()
                else
                    getgenv()._autoRetryHandling = false
                end
            else
                -- Button not found or not active, force refresh
                print("Retry button not ready, waiting...")
                tryRetryRemote()
                startRetriedMission()
                fallbackToLobbyIfStuck()
                task.wait(0.5)
            end
        end
    end
end

local function roll(targets, rarities)
	if not PlayerGui.Interface.Customisation.Visible then return end

	local familyString = PlayerGui.Interface.Customisation.Family.Family.Title.Text
	local familyName = targets and string.lower(string.split(familyString, " ")[1]) or nil
	local familyRarity = string.lower(string.match(familyString, "%((.-)%)") or "")

	local stopRolling = false
	if targets and familyName and table.find(targets, familyName) then stopRolling = true end
	if rarities and table.find(rarities, familyRarity) then stopRolling = true end
	if familyRarity == "mythical" then stopRolling = true end

	if stopRolling then
		getgenv().AutoRoll = false
		pcall(function()
			if Library and Library.Toggles and Library.Toggles.AutoRollToggle then
				Library.Toggles.AutoRollToggle:SetValue(false)
			end
		end)

		if familyRarity == "mythical" and webhook and webhook ~= "" then
			local rareMythicals = {"helos", "fritz", "reiss", "tybur"}
			local isRareMythical = false
			for _, name in ipairs(rareMythicals) do
				if string.find(string.lower(familyString), name) then
					isRareMythical = true
					break
				end
			end

			local payload = {
				content = isRareMythical and "🔥 RARE MYTHICAL! @everyone" or "✨ MYTHICAL FAMILY! @everyone",
				embeds = {{
					title = "Family Roll",
					color = isRareMythical and 16711680 or 16750848,
					fields = {
						{
							name = "Information",
							value = "```\n" ..
								"User: " .. lp.Name .. "\n" ..
								"Family: " .. tostring(familyString) .. "\n" ..
								"Rare Mythical: " .. (isRareMythical and "YES 🔥" or "No") .. "\n" ..
								"\n```",
							inline = true
						}
					},
					footer = { text = "GOTHAHUB • " .. DateTime.now():FormatLocalTime("LTS", "en-us") },
					timestamp = DateTime.now():ToIsoDate()
				}}
			}

			request({
				Url = webhook,
				Method = "POST",
				Headers = { ["Content-Type"] = "application/json" },
				Body = HttpService:JSONEncode(payload)
			})
		end

		pcall(function()
			Library:Notify({
				Title = "GOTHAHUB",
				Description = "Target family rolled: " .. familyString,
				Time = 5,
			})
		end)
		return
	end

	if PlayerGui.Interface.Warning.Prompt.Visible then
		UseButton(PlayerGui.Interface.Warning.Prompt.Main.Yes)
		task.wait(0.5)
	end

	if familyFrame and not familyFrame.Visible then
		UseButton(PlayerGui.Interface.Customisation.Categories.Family.Interact)
		task.wait(1)
	end

	if rollButton then
		UseButton(rollButton)
	end
end

-- ==========================================
-- WEAPON RELOAD
-- ==========================================

local lastReloadTime = 0
local autoReloadEnabled = false
local autoRefillEnabled = false
local isReloading = false

local function getWeaponHUDFrame()
	local HUD = INTERFACE:FindFirstChild("HUD")
	if not HUD then return nil end
	local top = HUD:FindFirstChild("Main") and HUD.Main:FindFirstChild("Top")
	if not top then return nil end
	return top:FindFirstChild("7")
end

local function getBladeCount()
	local frame7 = getWeaponHUDFrame()
	if not frame7 then return nil end
	local blades = frame7:FindFirstChild("Blades")
	if not blades then return nil end
	local sets = blades:FindFirstChild("Sets")
	if not sets then return nil end
	return tonumber(sets.Text:match("(%d+)"))
end

local function getRefillPart()
	local unclimbable = workspace:FindFirstChild("Unclimbable")
	if not unclimbable then return nil end

	local reloads = unclimbable:FindFirstChild("Reloads")
	if reloads then
		local gasTanks = reloads:FindFirstChild("GasTanks")
		if gasTanks then
			local refill = gasTanks:FindFirstChild("Refill")
			if refill then return refill end
		end
	end

	local props = unclimbable:FindFirstChild("Props")
	if props then
		local hq = props:FindFirstChild("HQ")
		if hq then
			local gasTank = hq:FindFirstChild("GasTanks")
			if gasTank then
				local refill = gasTank:FindFirstChild("Refill")
				if refill then return refill end
			end
			for _, child in ipairs(hq:GetChildren()) do
				local refill = child:FindFirstChild("Refill")
				if refill then return refill end
			end
		end
	end

	return unclimbable:FindFirstChild("Refill", true)
end

local function getWeaponType()
	local frame7 = getWeaponHUDFrame()
	if not frame7 then return nil end
	local bladesFrame = frame7:FindFirstChild("Blades")
	local spearsFrame = frame7:FindFirstChild("Spears")
	if bladesFrame and bladesFrame.Visible then return "Blades" end
	if spearsFrame and spearsFrame.Visible then return "Spears" end
	return nil
end

local lastBladeReloadTime = 0
local lastRefillTime = 0
local cachedRefillPart = nil

local function getCachedRefillPart()
	if cachedRefillPart and cachedRefillPart.Parent then return cachedRefillPart end
	cachedRefillPart = getRefillPart()
	return cachedRefillPart
end

local function handleWeaponReload()
	if not autoReloadEnabled then return end
	if isReloading then return end
	if isLobby then return end
	if os.clock() - lastReloadTime < getgenv().AutoFarmConfig.ReloadCooldown then return end

	local HUD = INTERFACE:FindFirstChild("HUD")
	if not HUD then return end

	local weaponType = getWeaponType()
	if not weaponType then return end

	local refillPart = getCachedRefillPart()

	if weaponType == "Blades" then
		local current = getBladeCount() or 0

		if current == 0 and autoRefillEnabled then
			if os.clock() - lastRefillTime < 1.5 then return end
			isReloading = true
			lastReloadTime = os.clock()
			lastRefillTime = os.clock()
			pcall(function() postRemote:FireServer("Attacks", "Reload") end)
			task.delay(1.5, function() isReloading = false end)
			return
		end

		local char = lp.Character
		local rig = char and char:FindFirstChild("Rig_" .. lp.Name)
		local blade = rig and rig:FindFirstChild("LeftHand") and rig.LeftHand:FindFirstChild("Blade_1")
		if blade and blade.Transparency == 1 and current > 0 then
			isReloading = true
			lastReloadTime = os.clock()
			lastBladeReloadTime = os.clock()
			pcall(function() getRemote:InvokeServer("Blades", "Reload") end)
			task.delay(0.5, function() isReloading = false end)
			return
		end

	elseif weaponType == "Spears" then
		local frame7 = getWeaponHUDFrame()
		if not frame7 then return end
		local spearsFrame = frame7:FindFirstChild("Spears")
		local spearsLabel = spearsFrame and spearsFrame:FindFirstChild("Spears")
		if not spearsLabel then return end
		local spearCount = tonumber(spearsLabel.Text:match("(%d+)")) or 0
		if spearCount == 0 and autoRefillEnabled then
			if os.clock() - lastRefillTime < 1.5 then return end
			isReloading = true
			lastReloadTime = os.clock()
			lastRefillTime = os.clock()
			pcall(function() postRemote:FireServer("Attacks", "Reload") end)
			task.delay(1.5, function() isReloading = false end)
		end
	end
end

task.spawn(function()
	while true do
		pcall(handleWeaponReload)
		task.wait(0.5)
	end
end)

getgenv().AutoEscape = false
postRemote.OnClientEvent:Connect(function(...)
	local args = {...}
	if getgenv().AutoEscape and args[1] == "Titans" and args[2] == "Grab_Event" then
		game:GetService("Players").LocalPlayer.PlayerGui.Interface.Buttons.Visible = not getgenv().AutoEscape
		postRemote:FireServer("Attacks", "Slash_Escape")
	end
end)

-- ==========================================
-- GOTHAHUB KAITUN STATUS UI + FAKE GUI BRIDGE
-- ==========================================

local KaitunConfig = getgenv().GothaKaitunConfig
local MissionConfig = KaitunConfig.Mission or {}
local RaidConfig = KaitunConfig.Raid or {}
local WavesConfig = KaitunConfig.Waves or {}
local SkillTreeConfig = KaitunConfig.SkillTree or {}
local AutoBuyBoostConfig = KaitunConfig.AutoBuyBoostGems or {}

local function GetStartTypeFromConfig()
    if KaitunConfig.AutoMission then return "Missions" end
    if KaitunConfig.AutoRaid then return "Raids" end
    if KaitunConfig.AutoWaves then return "Waves" end
    return "Missions"
end

local function IsAutoStartEnabled()
    return KaitunConfig.AutoMission == true or KaitunConfig.AutoRaid == true or KaitunConfig.AutoWaves == true
end

getgenv().AutoSellPerks = KaitunConfig.AutoSellPerks or getgenv().AutoSellPerks
getgenv().AutoBuyBoostGemsConfig = AutoBuyBoostConfig or getgenv().AutoBuyBoostGemsConfig
getgenv().ReturnAfterGames = KaitunConfig.ReturnLobbyEvery or getgenv().ReturnAfterGames
getgenv().LastTitanWait = KaitunConfig.LastTitanWait == true
getgenv().LastTitanWaitSecs = KaitunConfig.LastTitanWaitSecs or getgenv().LastTitanWaitSecs
getgenv().MultiHitCount = KaitunConfig.MultiHitCount or getgenv().MultiHitCount
getgenv().DieAtStreak = KaitunConfig.DieAtStreak == true
getgenv().DieAtStreakCount = KaitunConfig.DieAtStreakCount or getgenv().DieAtStreakCount
getgenv().AutoRejoin = KaitunConfig.AutoRejoin == true
if getgenv().AutoFarmConfig then
    getgenv().AutoFarmConfig.MovementMode = KaitunConfig.MovementMode or getgenv().AutoFarmConfig.MovementMode
    getgenv().AutoFarmConfig.MoveSpeed = KaitunConfig.MoveSpeed or getgenv().AutoFarmConfig.MoveSpeed
    getgenv().AutoFarmConfig.HeightOffset = KaitunConfig.HeightSafe or getgenv().AutoFarmConfig.HeightOffset
    getgenv().AutoFarmConfig.AttackRange = KaitunConfig.AttackRange or getgenv().AutoFarmConfig.AttackRange
end

local statusGui = Instance.new("ScreenGui")
statusGui.Name = "GothaHubKaitunStatus"
statusGui.ResetOnSpawn = false
statusGui.IgnoreGuiInset = true
pcall(function() statusGui.Parent = game:GetService("CoreGui") end)
if not statusGui.Parent then statusGui.Parent = PlayerGui end

local statusFrame = Instance.new("Frame")
statusFrame.Name = "Status"
statusFrame.AnchorPoint = Vector2.new(0.5, 0.5)
statusFrame.Position = UDim2.fromScale(0.5, 0.25)
statusFrame.Size = UDim2.fromOffset(640, 240)
statusFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
statusFrame.BackgroundTransparency = 0.32
statusFrame.BorderSizePixel = 0
statusFrame.Parent = statusGui

local statusCorner = Instance.new("UICorner")
statusCorner.CornerRadius = UDim.new(0, 8)
statusCorner.Parent = statusFrame

local statusStroke = Instance.new("UIStroke")
statusStroke.Color = Color3.fromRGB(255, 255, 255)
statusStroke.Transparency = 0.7
statusStroke.Thickness = 1
statusStroke.Parent = statusFrame

local function NewStatusLabel(name, y, height, font, color, text)
    local label = Instance.new("TextLabel")
    label.Name = name
    label.BackgroundTransparency = 1
    label.Position = UDim2.fromOffset(18, y)
    label.Size = UDim2.new(1, -36, 0, height)
    label.Font = font
    label.TextColor3 = color
    label.TextScaled = true
    label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    label.TextStrokeTransparency = 0.18
    label.Text = text
    label.Parent = statusFrame
    return label
end

local statusTitle = NewStatusLabel("Title", 14, 40, Enum.Font.GothamBold, Color3.fromRGB(255, 72, 72), "GothaHub")
local statusGame = NewStatusLabel("Action", 58, 32, Enum.Font.GothamBold, Color3.fromRGB(255, 220, 88), "Starting")
local statusLine = NewStatusLabel("Runtime", 96, 28, Enum.Font.GothamSemibold, Color3.fromRGB(245, 245, 245), "0 Hours, 0 Minutes, 0 Seconds (v1.0b)")
local statusStats = NewStatusLabel("Stats", 132, 28, Enum.Font.GothamBold, Color3.fromRGB(170, 255, 175), "Level: ? | Prestige: ? | Gold: ? | Gems: ?")
local statusMission = NewStatusLabel("Mission", 166, 24, Enum.Font.GothamSemibold, Color3.fromRGB(235, 238, 255), "Loading config...")
local statusFooter = NewStatusLabel("Footer", 196, 26, Enum.Font.GothamBold, Color3.fromRGB(255, 255, 255), "GOTHAHUB KAITUN")
statusFooter.TextTransparency = 0.05

local kaitunStartTime = os.clock()
local function FormatRuntime()
    local elapsed = math.floor(os.clock() - kaitunStartTime)
    local hours = math.floor(elapsed / 3600)
    local minutes = math.floor((elapsed % 3600) / 60)
    local seconds = elapsed % 60
    return string.format("%d Hours, %d Minutes, %d Seconds", hours, minutes, seconds)
end

local function FormatNumber(value)
    value = tonumber(value) or 0
    local str = tostring(math.floor(value))
    while true do
        local nextStr, replaced = str:gsub("^(-?%d+)(%d%d%d)", "%1.%2")
        str = nextStr
        if replaced == 0 then break end
    end
    return str
end

local function KaitunSetStatus(text)
    statusLine.Text = FormatRuntime() .. " (v1.0b)"
    statusGame.Text = tostring(text or "Idle")
end

local oldUpdateStatus = UpdateStatus
function UpdateStatus(text)
    KaitunSetStatus(text)
    if oldUpdateStatus then pcall(oldUpdateStatus, text) end
end

local function RefreshKaitunStats()
    local data = lastPlayerData
    if type(data) ~= "table" or type(data.Slots) ~= "table" then
        for _, args in ipairs({
            { "S_Equipment", "Talents" },
            { "Functions", "Settings", "Get" },
            { "Data", "Copy" },
        }) do
            local ok, result = pcall(function()
                return getRemote:InvokeServer(unpack(args))
            end)
            if ok and type(result) == "table" and type(result.Slots) == "table" then
                data = result
                lastPlayerData = result
                lastPlayerDataTime = os.clock()
                break
            end
        end
    end
    local slotId = lp:GetAttribute("Slot") or (type(data) == "table" and data.Current_Slot) or KaitunConfig.AutoSlot or "A"
    local slot = type(data) == "table" and type(data.Slots) == "table" and (data.Slots[slotId] or data.Slots[tostring(slotId)]) or nil
    if type(slot) == "table" then
        local progression = slot.Progression or {}
        local currency = slot.Currency or {}
        statusStats.Text = "Level: " .. tostring(progression.Level or "?") .. " | Prestige: " .. tostring(progression.Prestige or 0) .. " | Gold: " .. FormatNumber(currency.Gold) .. " | Gems: " .. FormatNumber(currency.Gems)
        statusMission.Text = tostring(MissionConfig.Map or RaidConfig.Map or WavesConfig.Map or "?") .. " | " .. GetStartTypeFromConfig() .. " | Slot: " .. tostring(slotId)
    end
end

task.spawn(function()
    while statusGui.Parent do
        pcall(RefreshKaitunStats)
        statusLine.Text = FormatRuntime() .. " (v1.0b)"
        task.wait(5)
    end
end)

local Options = {}
local Toggles = {}
local ToggleOverrides = {
    AutoKillToggle = KaitunConfig.AutoFarm,
    LastTitanWaitToggle = KaitunConfig.LastTitanWait,
    AutoRetryToggle = KaitunConfig.AutoRetry,
    SoloOnlyToggle = KaitunConfig.SoloOnly,
    AutoReturnLobbyToggle = KaitunConfig.AutoReturnLobby == true and (tonumber(KaitunConfig.ReturnLobbyEvery) or 0) > 0,
    NoclipToggle = KaitunConfig.Noclip,
    AutoHooksToggle = KaitunConfig.AutoHooks,
    SafeFarmToggle = KaitunConfig.SafeFarm,
    DoubleJumpToggle = KaitunConfig.DoubleJump,
    AutoReloadToggle = KaitunConfig.AutoReload,
    AutoEscapeToggle = KaitunConfig.AutoEscape,
    MultiHitToggle = KaitunConfig.MultiHit,
    AutoJoinBoostedMapToggle = KaitunConfig.AutoJoinBoostedMap,
    AutoModifiersToggle = KaitunConfig.AutoModifiers,
    MasteryFarmToggle = KaitunConfig.MasteryFarm,
    AutoSkipToggle = KaitunConfig.AutoSkip,
    DieAtStreakToggle = KaitunConfig.DieAtStreak,
    AutoChestToggle = KaitunConfig.AutoChest,
    DeleteMapToggle = KaitunConfig.DeleteMap,
    AutoBoostToggle = KaitunConfig.AutoUseBoosts,
    AutoBuyBoostGemsToggle = AutoBuyBoostConfig.Enabled,
    AutoStartToggle = IsAutoStartEnabled(),
    WaitBeforeStartToggle = KaitunConfig.MissionStartDelay,
    AutoUpgradeToggle = KaitunConfig.AutoUpgrade,
    AutoEnhanceToggle = KaitunConfig.AutoEnhancePerks,
    AutoSkillTree = KaitunConfig.AutoSkillTree == true,
    AutoSellPerksToggle = KaitunConfig.AutoSellPerksEnabled,
    AutoWavesToggle = WavesConfig.AutoFarm,
    AutoWavesUpgradeToggle = WavesConfig.AutoUpgrade,
    AutoStartWavesToggle = WavesConfig.AutoStart,
    AutoSelectSlot = KaitunConfig.AutoSlot ~= false,
    AutoPrestigeToggle = KaitunConfig.AutoPrestige,
    AutoRollToggle = KaitunConfig.AutoRoll,
    AutoHideToggle = false,
    AutoClaimAchievementsToggle = KaitunConfig.AutoClaimAchievements,
    AutoClaimQuestsToggle = KaitunConfig.AutoClaimQuests,
    AutoInjuryToggle = KaitunConfig.AutoInjury,
    Disable3DRendering = KaitunConfig.Disable3DRendering,
    ToggleRewardWebhook = KaitunConfig.RewardWebhook,
    ToggleMythicalFamilyWebhook = KaitunConfig.MythicalFamilyWebhook,
    ToggleShadowBanWebhook = KaitunConfig.ShadowBanWebhook,
    AutoRejoinToggle = KaitunConfig.AutoRejoin,
    BuyBoostOnlyExpiredToggle = AutoBuyBoostConfig.OnlyWhenExpired,
}

local OptionOverrides = {
    FarmOptionsDropdown = {
        ["Auto Execute"] = KaitunConfig.AutoExecute == true,
        ["Failsafe"] = KaitunConfig.AutoFailsafe == true,
        ["Open Second Chest"] = KaitunConfig.OpenSecondChest == true,
    },
    StartTypeDropdown = GetStartTypeFromConfig(),
    MissionMapDropdown = MissionConfig.Map or "Shiganshina",
    MissionObjectiveDropdown = MissionConfig.Objective or "Breach",
    MissionDifficultyDropdown = MissionConfig.Difficulty or "Hardest",
    RaidMapDropdown = RaidConfig.Map or "Trost",
    RaidDifficultyDropdown = RaidConfig.Difficulty or "Hardest",
    WavesMapDropdown = WavesConfig.Map or "Trost",
    ModifiersDropdown = KaitunConfig.Modify or {},
    MovementModeDropdown = KaitunConfig.MovementMode or "Hover",
    HoverSpeedSlider = KaitunConfig.MoveSpeed or 400,
    FloatHeightSlider = KaitunConfig.HeightSafe or 155,
    AttackRangeSlider = KaitunConfig.AttackRange or 100,
    MultiHitCountSlider = KaitunConfig.MultiHitCount or 2,
    LastTitanWaitSlider = KaitunConfig.LastTitanWaitSecs or 60,
    WaitBeforeStartSlider = KaitunConfig.MissionStartDelaySecs or 0,
    DieAtStreakSlider = KaitunConfig.DieAtStreakCount or 5,
    ReturnAfterGamesSlider = KaitunConfig.ReturnLobbyEvery or 10,
    MasteryModeDropdown = KaitunConfig.MasteryMode or "Both",
    SelectSlotDropdown = "Slot " .. tostring(KaitunConfig.AutoSlot or "A"),
    SelectBoostDropdown = KaitunConfig.PrestigeBoost or "Gold Boost",
    BoostSelectDropdown = KaitunConfig.Boosts or { Gold = true, Luck = true, XP = true },
    BuyBoostTypeDropdown = AutoBuyBoostConfig.BoostType or "Gold",
    BuyBoostDurationDropdown = AutoBuyBoostConfig.Duration or "30M",
    PerkSlotDropdown = KaitunConfig.EnhancePerkSlot or "Body",
    SelectPerksDropdown = KaitunConfig.EnhanceFoodPerks or {},
    AutoSellPerksDropdown = KaitunConfig.AutoSellPerks or { Common = true, Rare = true },
    MiddlePathDropdown = SkillTreeConfig.Middle or "Damage",
    LeftPathDropdown = SkillTreeConfig.Left or "Cooldown Reduction",
    RightPathDropdown = SkillTreeConfig.Right or "Damage Reduction",
    Priority1Dropdown = SkillTreeConfig.Priority1 or "Middle",
    Priority2Dropdown = SkillTreeConfig.Priority2 or "Left",
    Priority3Dropdown = SkillTreeConfig.Priority3 or "None",
    P1GoldInput = tostring(KaitunConfig.PrestigeGold and KaitunConfig.PrestigeGold.Prestige1 or 0),
    P2GoldInput = tostring(KaitunConfig.PrestigeGold and KaitunConfig.PrestigeGold.Prestige2 or 0),
    P3GoldInput = tostring(KaitunConfig.PrestigeGold and KaitunConfig.PrestigeGold.Prestige3 or 0),
    P4GoldInput = tostring(KaitunConfig.PrestigeGold and KaitunConfig.PrestigeGold.Prestige4 or 0),
    P5GoldInput = tostring(KaitunConfig.PrestigeGold and KaitunConfig.PrestigeGold.Prestige5 or 0),
    SelectFamily = KaitunConfig.SelectFamilies or "",
    SelectFamilyRarity = KaitunConfig.FamilyRarities or {},
    WebhookUrl = KaitunConfig.WebhookUrl or "",
    ShadowBanWebhookUrl = KaitunConfig.ShadowBanWebhookUrl or "",
}

local function MakeControl(id, value)
    local control = { Value = value, _callbacks = {} }
    function control:OnChanged(fn)
        table.insert(self._callbacks, fn)
        if self.Value ~= false and self.Value ~= nil then task.defer(fn) end
    end
    function control:SetValue(newValue)
        self.Value = newValue
        for _, fn in ipairs(self._callbacks) do task.defer(fn) end
    end
    function control:SetVisible() return self end
    function control:SetDisabled() return self end
    function control:AddKeyPicker() return self end
    return control
end

local fakeGroup = {}
function fakeGroup:AddToggle(id, opts)
    local value = ToggleOverrides[id]
    if value == nil then value = opts and opts.Default or false end
    local control = MakeControl(id, value == true)
    Toggles[id] = control
    return control
end
function fakeGroup:AddDropdown(id, opts)
    local value = OptionOverrides[id]
    if value == nil and opts then
        if opts.Multi then value = {} else value = opts.Default end
        if type(value) == "number" and type(opts.Values) == "table" then value = opts.Values[value] end
    end
    local control = MakeControl(id, value)
    Options[id] = control
    return control
end
function fakeGroup:AddSlider(id, opts)
    local value = OptionOverrides[id]
    if value == nil and opts then value = opts.Default end
    local control = MakeControl(id, value)
    Options[id] = control
    return control
end
function fakeGroup:AddInput(id, opts)
    local value = OptionOverrides[id]
    if value == nil and opts then value = opts.Default or "" end
    local control = MakeControl(id, value)
    Options[id] = control
    return control
end
function fakeGroup:AddButton() return MakeControl("button", false) end
function fakeGroup:AddDivider() return MakeControl("divider", false) end
function fakeGroup:AddLabel(text)
    local label = MakeControl("label", text or "")
    function label:SetText(newText)
        self.Value = newText
        if tostring(newText):find("Status:") then KaitunSetStatus(tostring(newText):gsub("^Status:%s*", "")) end
    end
    return label
end
function fakeGroup:AddKeyPicker() return MakeControl("key", false) end

local fakeTab = {}
function fakeTab:AddLeftGroupbox() return fakeGroup end
function fakeTab:AddRightGroupbox() return fakeGroup end

local fakeWindow = {}
function fakeWindow:AddTab() return fakeTab end

local Library = { Options = Options, Toggles = Toggles }
getgenv().Library = Library
getgenv().Options = Options
getgenv().Toggles = Toggles
function Library:CreateWindow() return fakeWindow end
function Library:SetFont() end
function Library:Notify(payload)
    if type(payload) == "table" then KaitunSetStatus((payload.Title and (payload.Title .. ": ") or "") .. tostring(payload.Description or "")) end
end
function Library:OnUnload() end
function Library:Toggle() end

local ThemeManager = {}
function ThemeManager:SetLibrary() end
function ThemeManager:SetFolder() end
function ThemeManager:SetDefaultTheme() end
function ThemeManager:ApplyToTab() end
function ThemeManager:LoadDefault() end

local SaveManager = {}
function SaveManager:SetLibrary() end
function SaveManager:SetFolder() end
function SaveManager:BuildConfigSection() end
function SaveManager:LoadAutoloadConfig() end
local Window = Library:CreateWindow({
	Title = "GOTHAHUB",
	Footer = "AOT:R | FREE",
	Center = true,
	AutoShow = true,
	Resizable = true,
	ShowCustomCursor = true,
})

local Tabs = {
	Farm     = Window:AddTab("Main",     "house"),
	Utility  = Window:AddTab("Utils",  "zap"),
	Configs  = Window:AddTab("Configs", "settings-2"),
	Upgrades = Window:AddTab("Upgrades", "trending-up"),
	Waves    = Window:AddTab("Waves", "waves-horizontal"),
	Global   = Window:AddTab("Central",   "globe"),
	Stats    = Window:AddTab("Stats",    "activity"),
	Settings = Window:AddTab("Settings", "settings"),
}

-- Farm tab
local MiscGroup      = Tabs.Farm:AddLeftGroupbox("Misc", "compass")
local MainGroup      = Tabs.Farm:AddLeftGroupbox("Farm", "tractor")
local MovementGroup  = Tabs.Farm:AddRightGroupbox("Movement", "move")
local AutoStartGroup = Tabs.Farm:AddRightGroupbox("Auto Start", "power")

-- Utility tab
local CombatGroup   = Tabs.Utility:AddLeftGroupbox("Combat Settings", "shield")
local SecurityGroup = Tabs.Utility:AddLeftGroupbox("Security", "shield-check")
local BoostGroup    = Tabs.Utility:AddLeftGroupbox("Boosted Maps", "flame")
local MasteryGroup  = Tabs.Utility:AddRightGroupbox("Mastery Farm", "award")
local FeaturesGroup = Tabs.Utility:AddRightGroupbox("Extras", "menu")

-- Configs tab
local ConfigsGroup = Tabs.Configs:AddLeftGroupbox("Quick Configs", "zap")

-- Upgrades tab
local UpgradesGroup  = Tabs.Upgrades:AddLeftGroupbox("Upgrades", "trending-up")
local SkillTreeGroup = Tabs.Upgrades:AddRightGroupbox("Skill Tree", "git-branch")

-- Waves tab
local WavesFarmGroup = Tabs.Waves:AddLeftGroupbox("Waves Farm", "flame")
local WavesSettingsGroup = Tabs.Waves:AddRightGroupbox("Features", "menu")


-- Global tab
local FamilyRollGroup = Tabs.Global:AddLeftGroupbox("Family Roll", "shuffle")
local SettingsGroup   = Tabs.Global:AddLeftGroupbox("Settings", "settings")
local SlotGroup       = Tabs.Global:AddRightGroupbox("Slots", "list")
local WebhookGroup    = Tabs.Global:AddRightGroupbox("Webhook", "link")

-- Stats tab
local SessionGroup = Tabs.Stats:AddLeftGroupbox("Session Stats", "clock")
local RatesGroup   = Tabs.Stats:AddRightGroupbox("Rates", "gauge")
local CrashGroup   = Tabs.Stats:AddRightGroupbox("Auto Rejoin", "log-in")


-- ==========================================
-- FARM TAB : Misc
-- ==========================================

MiscGroup:AddButton({
	Text = "Return to Lobby",
	Func = function()
		getRemote:InvokeServer("Functions", "Teleport", "Lobby")
		TeleportService:Teleport(14916516914, lp)
	end,
})

MiscGroup:AddButton({
	Text = "Check Shadow Ban",
	Func = function()
		if game.PlaceId ~= 14916516914 then
			Library:Notify({ Title = "Error", Description = "Must be in lobby!", Time = 3 })
			return
		end
		do
			local shadowInfo = GetShadowBanInfo()
			Library:Notify({
				Title = "Shadow Ban Check",
				Description = shadowInfo.Text,
				Time = 8
			})
			return
		end
		local bl = lp:GetAttribute("Blacklisted") == true
		local ex = lp:GetAttribute("Exploiter") == true
		local lv = tostring(lp:GetAttribute("Level") or "N/A")
		local pr = tostring(lp:GetAttribute("Prestige") or "N/A")
		local flags = (bl and 1 or 0) + (ex and 1 or 0)
		local res = flags == 0 and "✅ Clean" or (flags == 1 and "⚠️ Flagged" or "🚫 Banned")
		Library:Notify({
			Title = "Shadow Ban Check",
			Description = 
				"Blacklisted: " .. (bl and "YES ❌" or "No ✅") ..
				"\nExploiter: " .. (ex and "YES ❌" or "No ✅") ..
				"\nLevel: " .. lv ..
				"\nPrestige: " .. pr ..
				"\n\nStatus: " .. res,
			Time = 8
		})
	end,
})

MiscGroup:AddButton({
	Text = "Join Discord",
	Func = function()
		setclipboard("https://discord.gg/r9yDvcmW7Q")
		Library:Notify({ Title = "Discord", Description = "Invite link copied!", Time = 5 })
	end,
})

-- ==========================================
-- FARM TAB : Farm
-- ==========================================

getgenv().CurrentStatusLabel = MainGroup:AddLabel("Status: Idle")

MainGroup:AddToggle("AutoKillToggle", {
	Text = "Auto Farm",
	Default = false,
})
Toggles.AutoKillToggle:OnChanged(function()
	if Toggles.AutoKillToggle.Value then AutoFarm:Start() else AutoFarm:Stop() end
end)

MainGroup:AddToggle("LastTitanWaitToggle", {
	Text = "Wait Before Last Titan Kill",
	Default = false,
})
Toggles.LastTitanWaitToggle:OnChanged(function()
	getgenv().LastTitanWait = Toggles.LastTitanWaitToggle.Value
end)

MainGroup:AddSlider("LastTitanWaitSlider", {
	Text = "Wait x sec (from mission start)",
	Default = 60,
	Min = 10,
	Max = 300,
	Rounding = 0,
})
Options.LastTitanWaitSlider:OnChanged(function()
	getgenv().LastTitanWaitSecs = Options.LastTitanWaitSlider.Value
end)


MainGroup:AddToggle("AutoRetryToggle", {
	Text = "Auto Retry",
	Default = false,
})
Toggles.AutoRetryToggle:OnChanged(function()
	getgenv().AutoRetry = Toggles.AutoRetryToggle.Value
	if getgenv().AutoRetry then ExecuteImmediateAutomation() end
end)

MainGroup:AddToggle("SoloOnlyToggle", {
	Text = "Solo Only",
	Default = false,
	Tooltip = "Automatically leaves if another player joins your mission"
})
Toggles.SoloOnlyToggle:OnChanged(function()
	getgenv().SoloOnly = Toggles.SoloOnlyToggle.Value
end)

MainGroup:AddToggle("AutoReturnLobbyToggle", {
	Text = "Auto Return to Lobby",
	Default = false,
	Tooltip = "Returns to lobby after completing specified number of games"
})
Toggles.AutoReturnLobbyToggle:OnChanged(function()
	getgenv().AutoReturnLobby = Toggles.AutoReturnLobbyToggle.Value
	if not getgenv().AutoReturnLobby then
		pcall(function() writefile(returnCounterPath, "0") end)
	end
end)

MainGroup:AddSlider("ReturnAfterGamesSlider", {
	Text = "Return to lobby after x games",
	Default = 10,
	Min = 1,
	Max = 250,
	Rounding = 0,
	Tooltip = "Number of games to complete before auto returning to lobby"
})
Options.ReturnAfterGamesSlider:OnChanged(function()
	getgenv().ReturnAfterGames = Options.ReturnAfterGamesSlider.Value
end)

-- ==========================================
-- FARM TAB : Movement
-- ==========================================

MovementGroup:AddDropdown("MovementModeDropdown", {
	Values = {"Hover", "Teleport"},
	Default = 1,
	Multi = false,
	Text = "Movement Mode",
	Tooltip = "Hover: Smooth flight | Teleport: Instant movement"
})
Options.MovementModeDropdown:OnChanged(function()
	getgenv().AutoFarmConfig.MovementMode = Options.MovementModeDropdown.Value
end)

MovementGroup:AddSlider("HoverSpeedSlider", {
	Text = "Hover Speed",
	Default = 400,
	Min = 100,
	Max = 700,
	Rounding = 0,
	Tooltip = "Movement speed when using hover mode"
})
Options.HoverSpeedSlider:OnChanged(function()
	getgenv().AutoFarmConfig.MoveSpeed = Options.HoverSpeedSlider.Value
end)

MovementGroup:AddSlider("FloatHeightSlider", {
	Text = "Float Height",
	Default = 250,
	Min = 100,
	Max = 1000,
	Rounding = 0,
	Tooltip = "Height above titans when attacking"
})
Options.FloatHeightSlider:OnChanged(function()
	getgenv().AutoFarmConfig.HeightOffset = Options.FloatHeightSlider.Value
end)

MovementGroup:AddToggle("NoclipToggle", {
	Text = "Noclip",
	Default = false,
	Tooltip = "Walk through walls and objects"
})
Toggles.NoclipToggle:OnChanged(function()
	setNoclip(Toggles.NoclipToggle.Value)
end)

-- ==========================================
-- AUTO USE HOOKS
-- ==========================================

getgenv().AutoHooks = false

MovementGroup:AddToggle("AutoHooksToggle", {
    Text = "Auto Use Hooks",
    Default = false,
    Tooltip = "Auto Use hooks for playing with safety"
})
Toggles.AutoHooksToggle:OnChanged(function()
    getgenv().AutoHooks = Toggles.AutoHooksToggle.Value
    
    if getgenv().AutoHooks then
        task.spawn(function()
            local vim = game:GetService("VirtualInputManager")
            
            while getgenv().AutoHooks do
                -- Press Q
                vim:SendKeyEvent(true, Enum.KeyCode.Q, false, game)
                task.wait(2)
                vim:SendKeyEvent(false, Enum.KeyCode.Q, false, game)
                
                task.wait(0.1)
                
                -- Press E
                vim:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                task.wait(2)
                vim:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                
                -- Wait 3 seconds before next hooks
                task.wait(3)
            end
        end)
    end
end)

-- ==========================================
-- SAFE FARM (Auto Click Every 1s)
-- ==========================================

getgenv().SafeFarm = false

MovementGroup:AddToggle("SafeFarmToggle", {
    Text = "Auto M1(Safety)",
    Default = false,
    Tooltip = "Auto Use M1 - Safety"
})
Toggles.SafeFarmToggle:OnChanged(function()
    getgenv().SafeFarm = Toggles.SafeFarmToggle.Value
    
    if getgenv().SafeFarm then
        task.spawn(function()
            local vim = game:GetService("VirtualInputManager")
            
            while getgenv().SafeFarm do
                pcall(function()
                    -- Left click down
                    vim:SendMouseButtonEvent(0, 0, 0, true, game, 0)
                    task.wait(0.5)
                    -- Left click up
                    vim:SendMouseButtonEvent(0, 0, 0, false, game, 0)
                end)
                task.wait(1) -- Every 1 second
            end
        end)
    end
end)
-- ==========================================
-- AUTO DOUBLE JUMP BOOST (Auto Space Press)
-- ==========================================

getgenv().DoubleJumpBoost = false

MovementGroup:AddToggle("DoubleJumpToggle", {
    Text = "Auto Jump Boost(Safety)",
    Default = false,
    Tooltip = "Auto Use jump boost every 5s for safety"
})
Toggles.DoubleJumpToggle:OnChanged(function()
    getgenv().DoubleJumpBoost = Toggles.DoubleJumpToggle.Value
    
    if getgenv().DoubleJumpBoost then
        task.spawn(function()
            local vim = game:GetService("VirtualInputManager")
            
            while getgenv().DoubleJumpBoost do
                -- Press Space twice quickly
                vim:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
                task.wait(0.1)
                vim:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
                
                task.wait(0.05)
                
                vim:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
                task.wait(0.1)
                vim:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
                
                -- Wait 4 seconds before next boost
                task.wait(5)
            end
        end)
    end
end)


-- ==========================================
-- UTILITY TAB : Combat
-- ==========================================

CombatGroup:AddToggle("AutoReloadToggle", {
	Text = "Auto Reload/Refill",
	Default = false,
	Tooltip = "Automatically reloads and refills blades/spears"
})
Toggles.AutoReloadToggle:OnChanged(function()
	autoReloadEnabled = Toggles.AutoReloadToggle.Value
	autoRefillEnabled = Toggles.AutoReloadToggle.Value
end)

CombatGroup:AddButton({
	Text = "TP to Refill",
	Func = function()
		local refillPart = getRefillPart()
		if not refillPart then
			Library:Notify({ Title = "GOTHAHUB", Description = "Refill station not found!", Time = 3 })
			return
		end
		local root = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
		if not root then
			Library:Notify({ Title = "GOTHAHUB", Description = "Character not loaded yet!", Time = 3 })
			return
		end
		root.CFrame = refillPart.CFrame * CFrame.new(0, 5, 10)
		Library:Notify({ Title = "GOTHAHUB", Description = "Teleported to refill station!", Time = 2 })
	end,
	Tooltip = "Teleports directly to the nearest refill station"
})

CombatGroup:AddToggle("AutoEscapeToggle", {
	Text = "Auto Escape",
	Default = false,
	Tooltip = "Automatically escapes when grabbed by a titan"
})
Toggles.AutoEscapeToggle:OnChanged(function()
	getgenv().AutoEscape = Toggles.AutoEscapeToggle.Value
end)

CombatGroup:AddSlider("AttackRangeSlider", {
    Text = "Multihits Range",
    Default = 150,
    Min = 100,
    Max = 1500,
    Rounding = 0,
    Tooltip = "Maximum distance to attack titans from"
	
})
Options.AttackRangeSlider:OnChanged(function()
    getgenv().AutoFarmConfig.AttackRange = Options.AttackRangeSlider.Value
end)


CombatGroup:AddToggle("MultiHitToggle", {
	Text = "Multi Hit",
	Default = false,
	Tooltip = "Hits multiple titans with a single attack"
})
Toggles.MultiHitToggle:OnChanged(function()
	getgenv().MultiHit = Toggles.MultiHitToggle.Value
end)

CombatGroup:AddSlider("MultiHitCountSlider", {
	Text = "Titans per hit",
	Default = 3,
	Min = 2,
	Max = 20,
	Rounding = 0,
	Tooltip = "Number of titans to hit simultaneously"
})
Options.MultiHitCountSlider:OnChanged(function()
	getgenv().MultiHitCount = Options.MultiHitCountSlider.Value
end)

-- ==========================================
-- UTILITY TAB : Security
-- ==========================================

SecurityGroup:AddDropdown("FarmOptionsDropdown", {
	Values = {"Auto Execute", "Failsafe", "Open Second Chest"},
	Default = {},
	Multi = true,
	Text = "Farm Options",
	Tooltip = "Auto Execute: Re-run script after teleport | Failsafe: Return to lobby after timeout | Open Second Chest: Open premium chests"
})
Options.FarmOptionsDropdown:OnChanged(function()
	local vals = Options.FarmOptionsDropdown.Value
	getgenv().AutoFailsafe = vals["Failsafe"] or false
	getgenv().AutoExecute = vals["Auto Execute"] or false
	getgenv().OpenSecondChest = vals["Open Second Chest"] or false
	if getgenv().AutoExecute then setupAutoExecute() end
end)

SecurityGroup:AddLabel("Failsafe tps you back to lobby\nafter a timeout.")

-- ==========================================
-- UTILITY TAB : Boosted Maps
-- ==========================================

BoostGroup:AddToggle("AutoJoinBoostedMapToggle", {
	Text = "Auto Join Boosted Map",
	Default = false,
	Tooltip = "Automatically detects and joins maps with active 2x rewards boost"
})
Toggles.AutoJoinBoostedMapToggle:OnChanged(function()
	getgenv().AutoJoinBoostedMap = Toggles.AutoJoinBoostedMapToggle.Value
	if getgenv().AutoJoinBoostedMap then
		task.spawn(function()
			local lastBoostedMap = nil
			while getgenv().AutoJoinBoostedMap do
				if game.PlaceId ~= 14916516914 then
					local currentBoostedMap = workspace:GetAttribute("Boosted_Map")
					if currentBoostedMap and currentBoostedMap ~= lastBoostedMap then
						Library:Notify({ Title = "🔄 Boost Changed!", Description = "New boost: " .. currentBoostedMap .. "\nReturning to lobby...", Time = 5 })
						if AutoFarm and AutoFarm._running then AutoFarm:Stop() end
						pcall(function() getRemote:InvokeServer("Functions", "Teleport", "Lobby") end)
						task.wait(0.5)
						pcall(function() TeleportService:Teleport(14916516914, lp) end)
						lastBoostedMap = nil
						task.wait(5)
						continue
					end
					task.wait(10)
					continue
				end

				local boostedMap = workspace:GetAttribute("Boosted_Map")
				local boostedTimer = workspace:GetAttribute("Boosted_Timer")
				
				if boostedMap and boostedMap ~= "" and boostedMap ~= lastBoostedMap then
					lastBoostedMap = boostedMap
					Library:Notify({ Title = "🎯 Boost Found!", Description = "Map: " .. boostedMap .. " | Time: " .. tostring(boostedTimer or "N/A") .. "s", Time = 5 })
					
					pcall(function()
						for _, m in next, ReplicatedStorage.Missions:GetChildren() do
							if m:FindFirstChild("Leader") and m.Leader.Value == lp.Name then
								getRemote:InvokeServer("S_Missions", "Leave")
							end
						end
					end)
					task.wait(1)
					
					local created = false
					for _, diff in ipairs({"Aberrant", "Severe", "Hard", "Normal"}) do
						if created then break end
						pcall(function()
							getRemote:InvokeServer("S_Missions", "Create", {
								Difficulty = diff, Type = "Missions",
								Name = boostedMap, Objective = "Skirmish"
							})
						end)
						task.wait(0.5)
						for _, m in next, ReplicatedStorage.Missions:GetChildren() do
							if m:FindFirstChild("Leader") and m.Leader.Value == lp.Name then
								created = true; break
							end
						end
					end
					
					if created then
						task.wait(0.5)
						if getgenv().AutoModifiers then
							for _, mod in ipairs({"No Perks","No Skills","No Memories","Nightmare","Oddball","Injury Prone","Chronic Injuries","Fog","Glass Cannon","Time Trial"}) do
								pcall(function() getRemote:InvokeServer("S_Missions", "Modify", mod) end)
								task.wait(0.3)
							end
						end
						task.wait(1)
						pcall(function() getRemote:InvokeServer("S_Missions", "Start") end)
						Library:Notify({ Title = "✅ Farming Boosted Map!", Description = "Map: " .. boostedMap, Time = 3 })
					end
				else
					task.wait(5)
				end
			end
		end)
	end
end)

BoostGroup:AddToggle("AutoModifiersToggle", {
	Text = "Auto Enable All Modifiers",
	Default = false,
	Tooltip = "Enables all mission modifiers for maximum rewards multiplier"
})
Toggles.AutoModifiersToggle:OnChanged(function()
	getgenv().AutoModifiers = Toggles.AutoModifiersToggle.Value
end)

BoostGroup:AddButton({
	Text = "Check Boosted Map",
	Func = function()
		local boostedMap = workspace:GetAttribute("Boosted_Map")
		local boostedTimer = workspace:GetAttribute("Boosted_Timer")
		if boostedMap and boostedMap ~= "" then
			Library:Notify({ Title = "Current Boost", Description = "Map: " .. boostedMap .. "\nTime Left: " .. tostring(boostedTimer or "N/A") .. "s", Time = 8 })
		else
			Library:Notify({ Title = "No Boost", Description = "No boosted map active!", Time = 5 })
		end
	end,
	Tooltip = "Shows which map currently has active boost"
})

BoostGroup:AddLabel("Auto joins boosted map with\nall modifiers for max rewards!")

-- ==========================================
-- UTILITY TAB : Mastery Farm
-- ==========================================

MasteryGroup:AddToggle("MasteryFarmToggle", {
	Text = "Titan Mastery Farm",
	Default = false,
	Tooltip = "Farms titan mastery by auto punch and using skills"
})
Toggles.MasteryFarmToggle:OnChanged(function()
	getgenv().MasteryFarmConfig.Enabled = Toggles.MasteryFarmToggle.Value
	if Toggles.MasteryFarmToggle.Value then
		if not Toggles.AutoKillToggle.Value then
			Toggles.AutoKillToggle:SetValue(true)
		elseif not AutoFarm._running then
			AutoFarm:Start()
		end
	end
end)

MasteryGroup:AddDropdown("MasteryModeDropdown", {
	Values = {"Punching", "Skill Usage", "Both"},
	Default = 3,
	Multi = false,
	Text = "Mastery Mode",
})
Options.MasteryModeDropdown:OnChanged(function()
	getgenv().MasteryFarmConfig.Mode = Options.MasteryModeDropdown.Value
end)

-- ==========================================
-- UTILITY TAB : Extras
-- ==========================================

FeaturesGroup:AddToggle("AutoSkipToggle", {
	Text = "Auto Skip Cutscenes",
	Default = false,
	Tooltip = "Automatically skips mission cutscenes and animations"
})
Toggles.AutoSkipToggle:OnChanged(function()
	getgenv().AutoSkip = Toggles.AutoSkipToggle.Value
	if getgenv().AutoSkip then ExecuteImmediateAutomation() end
end)


FeaturesGroup:AddToggle("DieAtStreakToggle", {
	Text = "Die at Streak",
	Default = false,
	Tooltip = "Automatically dies when reaching specified streak count"
})
Toggles.DieAtStreakToggle:OnChanged(function()
	getgenv().DieAtStreak = Toggles.DieAtStreakToggle.Value
end)

FeaturesGroup:AddSlider("DieAtStreakSlider", {
	Text = "Die at x streak",
	Default = 10000,
	Min = 100,
	Max = 100000,
	Rounding = 0,
	Tooltip = "Streak count at which to auto die"
})
Options.DieAtStreakSlider:OnChanged(function()
	getgenv().DieAtStreakCount = Options.DieAtStreakSlider.Value
end)

FeaturesGroup:AddToggle("AutoChestToggle", {
	Text = "Auto Open Chests",
	Default = false,
	Tooltip = "Automatically opens free and premium chests after missions"
})
Toggles.AutoChestToggle:OnChanged(function()
	getgenv().AutoChest = Toggles.AutoChestToggle.Value
end)

FeaturesGroup:AddToggle("DeleteMapToggle", {
	Text = "Delete Map (FPS Boost)",
	Default = DropdownConfig.DeleteMap or false,
	Tooltip = "Removes map objects for significant FPS improvement"
})
Toggles.DeleteMapToggle:OnChanged(function()
	getgenv().DeleteMap = Toggles.DeleteMapToggle.Value
	DropdownConfig.DeleteMap = getgenv().DeleteMap
	SaveConfig(DropdownConfig)
	if getgenv().DeleteMap then DeleteMap() end
end)

FeaturesGroup:AddDivider()

local BoostMarketItems = {
	XP = {
		["30M"] = { Index = 1, Item = "2x XP Boost [30m]" },
		["1H"] = { Index = 2, Item = "2x XP Boost [1h]" },
		["2H"] = { Index = 3, Item = "2x XP Boost [2h]" },
	},
	Luck = {
		["30M"] = { Index = 4, Item = "2x Luck Boost [30m]" },
		["1H"] = { Index = 5, Item = "2x Luck Boost [1h]" },
		["2H"] = { Index = 6, Item = "2x Luck Boost [2h]" },
	},
	Gold = {
		["30M"] = { Index = 7, Item = "2x Gold Boost [30m]" },
		["1H"] = { Index = 8, Item = "2x Gold Boost [1h]" },
		["2H"] = { Index = 9, Item = "2x Gold Boost [2h]" },
	},
}

local function ReadBoostPlayerData()
	local attempts = {
		{ "Functions", "Settings", "Get" },
		{ "Data", "Copy" },
		{ "S_Equipment", "Talents" },
	}

	for _, args in ipairs(attempts) do
		local ok, result = pcall(function()
			return getRemote:InvokeServer(unpack(args))
		end)

		if ok and type(result) == "table" then
			return result
		end

		task.wait(0.15)
	end

	return nil
end

local function IsBoostExpired(data, boostType)
	local boosts = type(data) == "table" and data.Boosts or nil
	local value = type(boosts) == "table" and tonumber(boosts[boostType]) or nil
	if not value or value <= 0 then return true end
	return value <= os.time()
end

local function GetBoostUiMultiplier(boostType)
	local interface = PlayerGui:FindFirstChild("Interface")
	local gearUp = interface and interface:FindFirstChild("Gear_Up")
	local boosts = gearUp and gearUp:FindFirstChild("Boosts")
	local boostFrame = boosts and boosts:FindFirstChild(boostType)
	local main = boostFrame and boostFrame:FindFirstChild("Main")
	local multiplier = main and main:FindFirstChild("Multiplier")
	if not multiplier or not multiplier:IsA("TextLabel") then return nil end

	local value = tonumber((multiplier.Text or ""):match("([%d%.]+)"))
	return value
end

local function IsBoostActiveFromUi(boostType)
	local value = GetBoostUiMultiplier(boostType)
	if not value then return nil end
	-- Permanent prestige/family boosts can show values like 1.15x.
	-- A consumable boost is the 2x layer, so treat roughly 2x+ as active.
	return value >= 1.9
end

local function UseBoostItem(itemName)
	local ok, result = pcall(function()
		return getRemote:InvokeServer("S_Inventory", "Item", itemName)
	end)
	return ok and result ~= nil and result ~= false, result
end

local function BuyBoostWithGems(boostType, duration)
	local info = BoostMarketItems[boostType] and BoostMarketItems[boostType][duration]
	if not info then return false, nil, nil end

	local ok, result = pcall(function()
		return getRemote:InvokeServer("S_Market", "Buy", "1_Boosts", info.Index, 1)
	end)

	if ok and type(result) == "table" then
		return true, result, info.Item
	end

	return false, result, info.Item
end

local function BuyAndUseBoostIfNeeded()
	local cfg = getgenv().AutoBuyBoostGemsConfig or {}
	local boostType = cfg.BoostType or "Gold"
	local duration = cfg.Duration or "30M"
	local data = ReadBoostPlayerData()

	if cfg.OnlyWhenExpired ~= false then
		if data then
			if not IsBoostExpired(data, boostType) then return "active" end
		else
			local uiActive = IsBoostActiveFromUi(boostType)
			if uiActive == true then return "active_ui" end
			if uiActive == nil then return "data_failed" end
		end
	end

	local info = BoostMarketItems[boostType] and BoostMarketItems[boostType][duration]
	if not info then return "invalid" end

	local used = UseBoostItem(info.Item)
	if used then return "used" end

	local bought, buyResult, itemName = BuyBoostWithGems(boostType, duration)
	if not bought then
		return type(buyResult) == "string" and buyResult or "buy_failed"
	end

	task.wait(0.35)
	local usedAfterBuy = UseBoostItem(itemName)
	return usedAfterBuy and "bought_used" or "bought"
end

FeaturesGroup:AddToggle("AutoBoostToggle", {
	Text = "Auto Use Boosts",
	Default = false,
	Tooltip = "Automatically uses XP/Gold/Luck boosts from inventory when available"
})
Toggles.AutoBoostToggle:OnChanged(function()
	getgenv().AutoBoost = Toggles.AutoBoostToggle.Value
	if not getgenv().AutoBoost then return end
	task.spawn(function()
		local boostItems = {
			Gold = {"2x Gold Boost [30m]", "2x Gold Boost [15m]"},
			Luck = {"2x Luck Boost [30m]", "2x Luck Boost [15m]"},
			XP   = {"2x XP Boost [30m]",  "2x XP Boost [15m]"},
		}
		local function useBoost(boostType)
			for _, itemName in ipairs(boostItems[boostType]) do
				local ok, result = pcall(function()
					return getRemote:InvokeServer("S_Inventory", "Item", itemName)
				end)
				if ok and result ~= nil and result ~= false then
					Library:Notify({ Title = "Auto Boost", Description = "✅ " .. itemName, Time = 3 })
					return true
				end
			end
			return false
		end
		while getgenv().AutoBoost do
			local cfg = Options.BoostSelectDropdown.Value or {}
			if cfg["Gold"] then useBoost("Gold"); task.wait(0.5) end
			if cfg["Luck"] then useBoost("Luck"); task.wait(0.5) end
			if cfg["XP"]   then useBoost("XP");   task.wait(0.5) end
			task.wait(60)
		end
	end)
end)

FeaturesGroup:AddDropdown("BoostSelectDropdown", {
	Values = {"Gold", "Luck", "XP"},
	Default = {},
	Multi = true,
	Text = "Boosts to Auto Use",
	Tooltip = "Select which boost types to automatically use"
})

local boostBuyConfig = getgenv().AutoBuyBoostGemsConfig or {}

FeaturesGroup:AddToggle("AutoBuyBoostGemsToggle", {
	Text = "Auto Buy Boost Gems",
	Default = false,
	Tooltip = "Buys one selected boost with gems, then uses it."
})
Toggles.AutoBuyBoostGemsToggle:OnChanged(function()
	getgenv().AutoBuyBoostGems = Toggles.AutoBuyBoostGemsToggle.Value
	if not getgenv().AutoBuyBoostGems then return end

	task.spawn(function()
		if getgenv().AutoBuyBoostGemsRunning then return end
		getgenv().AutoBuyBoostGemsRunning = true

		while getgenv().AutoBuyBoostGems do
			if game.PlaceId ~= 14916516914 then
				Library:Notify({ Title = "Auto Buy Boost", Description = "Works in lobby!", Time = 3 })
				getgenv().AutoBuyBoostGems = false
				Toggles.AutoBuyBoostGemsToggle:SetValue(false)
				break
			end

			local status = BuyAndUseBoostIfNeeded()
			if status == "bought_used" then
				Library:Notify({ Title = "Auto Buy Boost", Description = "Bought and used boost.", Time = 3 })
				task.wait(60)
			elseif status == "used" then
				Library:Notify({ Title = "Auto Buy Boost", Description = "Used boost from inventory.", Time = 3 })
				task.wait(60)
			elseif status == "active" or status == "active_ui" then
				task.wait(60)
			else
				Library:Notify({ Title = "Auto Buy Boost", Description = tostring(status), Time = 3 })
				task.wait(60)
			end
		end

		getgenv().AutoBuyBoostGemsRunning = false
	end)
end)

FeaturesGroup:AddDropdown("BuyBoostTypeDropdown", {
	Values = {"Gold", "Luck", "XP"},
	Default = table.find({"Gold", "Luck", "XP"}, boostBuyConfig.BoostType or "Gold") or 1,
	Multi = false,
	Text = "Buy Boost Type",
})
Options.BuyBoostTypeDropdown:OnChanged(function()
	getgenv().AutoBuyBoostGemsConfig.BoostType = Options.BuyBoostTypeDropdown.Value or "Gold"
	DropdownConfig.AutoBuyBoostGems = getgenv().AutoBuyBoostGemsConfig
	SaveConfig(DropdownConfig)
end)

FeaturesGroup:AddDropdown("BuyBoostDurationDropdown", {
	Values = {"30M", "1H", "2H"},
	Default = table.find({"30M", "1H", "2H"}, boostBuyConfig.Duration or "30M") or 1,
	Multi = false,
	Text = "Buy Boost Duration",
})
Options.BuyBoostDurationDropdown:OnChanged(function()
	getgenv().AutoBuyBoostGemsConfig.Duration = Options.BuyBoostDurationDropdown.Value or "30M"
	DropdownConfig.AutoBuyBoostGems = getgenv().AutoBuyBoostGemsConfig
	SaveConfig(DropdownConfig)
end)

FeaturesGroup:AddToggle("BuyBoostOnlyExpiredToggle", {
	Text = "Only When Expired",
	Default = boostBuyConfig.OnlyWhenExpired ~= false,
	Tooltip = "Prevents buying while the selected boost is still active."
})
Toggles.BuyBoostOnlyExpiredToggle:OnChanged(function()
	getgenv().AutoBuyBoostGemsConfig.OnlyWhenExpired = Toggles.BuyBoostOnlyExpiredToggle.Value
	DropdownConfig.AutoBuyBoostGems = getgenv().AutoBuyBoostGemsConfig
	SaveConfig(DropdownConfig)
end)

FeaturesGroup:AddButton({
	Text = "Buy/Use Boost Now",
	Func = function()
		if game.PlaceId ~= 14916516914 then
			Library:Notify({ Title = "Auto Buy Boost", Description = "Must be in lobby!", Time = 3 })
			return
		end

		local status = BuyAndUseBoostIfNeeded()
		Library:Notify({ Title = "Auto Buy Boost", Description = tostring(status), Time = 4 })
	end,
	Tooltip = "Buys and uses the selected boost if allowed by Only When Expired."
})

FeaturesGroup:AddButton({
	Text = "Use Boosts Now",
	Func = function()
		task.spawn(function()
			local boostItems = {
				Gold = {"2x Gold Boost [2h]", "2x Gold Boost [1h]", "2x Gold Boost [30m]", "2x Gold Boost [15m]"},
	Luck = {"2x Luck Boost [2h]", "2x Luck Boost [1h]", "2x Luck Boost [30m]", "2x Luck Boost [15m]"},
	XP   = {"2x XP Boost [2h]",  "2x XP Boost [1h]", "2x XP Boost [30m]", "2x XP Boost [15m]"},
			}
			local cfg = Options.BoostSelectDropdown.Value or {}
			local used = 0
			for boostType, items in pairs(boostItems) do
				if cfg[boostType] then
					for _, itemName in ipairs(items) do
						local ok, result = pcall(function()
							return getRemote:InvokeServer("S_Inventory", "Item", itemName)
						end)
						if ok and result ~= nil and result ~= false then
							Library:Notify({ Title = "Auto Boost", Description = "✅ " .. itemName, Time = 3 })
							used += 1
							break
						end
					end
					task.wait(0.4)
				end
			end
			if used == 0 then
				Library:Notify({ Title = "Auto Boost", Description = "No items available!", Time = 3 })
			end
		end)
	end,
	Tooltip = "Immediately uses all available selected boosts"
})

-- ==========================================
-- FARM TAB : Auto Start
-- ==========================================

AutoStartGroup:AddToggle("AutoStartToggle", {
	Text = "Auto Start",
	Default = false,
	Tooltip = "Automatically creates and starts missions with selected settings"
})
Toggles.AutoStartToggle:OnChanged(function()
	getgenv().AutoStart = Toggles.AutoStartToggle.Value

	if getgenv().AutoStart and game.PlaceId == 14916516914 then
		task.spawn(function()
			local MAX_RETRIES = 10
			local retries = 0
			local modifierOrder = {
				"No Perks", "No Skills", "No Memories", "Nightmare", "Oddball", "Injury Prone",
				"Chronic Injuries", "Fog", "Glass Cannon", "Time Trial", "Boring", "Simple"
			}

			local function getMyMission()
				local start = os.clock()
				while (os.clock() - start) < 2 do
					for _, mission in next, ReplicatedStorage.Missions:GetChildren() do
						if mission:FindFirstChild("Leader") and mission.Leader.Value == lp.Name then
							return mission
						end
					end
					task.wait(0.1)
				end
				return nil
			end

			local function missionModifierState(mission, modifier)
				if not mission then return nil end

				local modifiers = mission:FindFirstChild("Modifiers") or mission:FindFirstChild("ModifiersFolder")
				if modifiers then
					local value = modifiers:FindFirstChild(modifier)
					if value then
						if value:IsA("BoolValue") then return value.Value end
						return true
					end
					return false
				end

				for _, item in ipairs(mission:GetDescendants()) do
					if item.Name == modifier then
						if item:IsA("BoolValue") then return item.Value end
						return true
					end
				end

				return nil
			end

			local function applySelectedModifiers(activeMods)
				if #activeMods == 0 then return true end

				local selected = {}
				for _, modifier in ipairs(activeMods) do
					selected[modifier] = true
				end

				for _, modifier in ipairs(modifierOrder) do
					if selected[modifier] then
						pcall(function()
							getRemote:InvokeServer("S_Missions", "Modify", modifier)
						end)
						task.wait(0.3)
					end
				end

				task.wait(1)
				local canVerify = false
				for attempt = 1, 3 do
					if not getgenv().AutoStart then return false end

					local mission = getMyMission()
					if not mission then return false end

					local missing = 0
					for _, modifier in ipairs(modifierOrder) do
						if selected[modifier] then
							local state = missionModifierState(mission, modifier)
							if state ~= nil then
								canVerify = true
								if state == false then
									missing = missing + 1
									pcall(function()
										getRemote:InvokeServer("S_Missions", "Modify", modifier)
									end)
									task.wait(0.3)
								end
							end
						end
					end

					if not canVerify or missing == 0 then
						return true
					end

					task.wait(0.75)
				end

				return true
			end

			while getgenv().AutoStart do
				for _, mission in next, ReplicatedStorage.Missions:GetChildren() do
					if mission:FindFirstChild("Leader") and mission.Leader.Value == lp.Name then
						getRemote:InvokeServer("S_Missions", "Leave")
					end
				end

				local missionType = Options.StartTypeDropdown.Value
				local selectedDifficulty
				local mapName
				local objective

				if missionType == "Missions" then
					selectedDifficulty = Options.MissionDifficultyDropdown.Value
					mapName = Options.MissionMapDropdown.Value
					objective = Options.MissionObjectiveDropdown.Value
				elseif missionType == "Raids" then
    selectedDifficulty = Options.RaidDifficultyDropdown.Value
    mapName = Options.RaidMapDropdown.Value
    objective = RaidObjectives[mapName] or Options.RaidObjectiveDropdown.Value
    mapName = RaidMapNames[mapName] or mapName
elseif missionType == "Waves" then
    selectedDifficulty = "Easy"  -- Fixed Easy
    mapName = Options.WavesMapDropdown.Value or "Trost"
    objective = "Waves"
end

				local created = false

				if selectedDifficulty == "Hardest" then
					local diffOrder = missionType == "Raids"
						and {"Aberrant", "Severe", "Hard"}
						or {"Aberrant", "Severe", "Hard", "Normal", "Easy"}

					for _, diff in ipairs(diffOrder) do
						if not getgenv().AutoStart then break end
						getRemote:InvokeServer("S_Missions", "Create", {
							Difficulty = diff,
							Type = missionType,
							Name = mapName,
							Objective = objective
						})
						if getMyMission() then
							Library:Notify({ Title = "Auto Start", Description = "Selected difficulty: " .. diff, Time = 3 })
							created = true
							break
						end
					end
				else
					getRemote:InvokeServer("S_Missions", "Create", {
						Difficulty = selectedDifficulty,
						Type = missionType,
						Name = mapName,
						Objective = objective
					})
					if getMyMission() then created = true end
				end

				if not getgenv().AutoStart then break end

				if not created then
					retries = retries + 1
					local backoff = math.min(retries * 2, 20)
					if retries >= MAX_RETRIES then
						Library:Notify({ Title = "Auto Start", Description = "Failed after " .. MAX_RETRIES .. " retries. Stopping.", Time = 10 })
						getgenv().AutoStart = false
						Toggles.AutoStartToggle:SetValue(false)
						break
					end
					Library:Notify({ Title = "Auto Start", Description = "Failed to create. Retry " .. retries .. "/" .. MAX_RETRIES .. " in " .. backoff .. "s", Time = backoff })
					task.wait(backoff)
					continue
				end

				retries = 0

				local activeMods = {}
				if Options.ModifiersDropdown.Value then
					for _, modName in ipairs(modifierOrder) do
						if Options.ModifiersDropdown.Value[modName] then
							table.insert(activeMods, modName)
						end
					end
				end

				applySelectedModifiers(activeMods)
				task.wait(1)

				if getgenv().WaitBeforeStart and getgenv().WaitBeforeStartSecs > 0 then
					Library:Notify({ Title = "Auto Start", Description = "Waiting " .. getgenv().WaitBeforeStartSecs .. "s before starting...", Time = getgenv().WaitBeforeStartSecs })
					task.wait(getgenv().WaitBeforeStartSecs)
				end

				pcall(function()
					getRemote:InvokeServer("S_Missions", "Start")
				end)
				task.wait(5)
			end
		end)
	end
end)

AutoStartGroup:AddToggle("WaitBeforeStartToggle", {
	Text = "Wait Before Start",
	Default = false,
	Tooltip = "Adds a delay before starting the mission after creation"
})
Toggles.WaitBeforeStartToggle:OnChanged(function()
	getgenv().WaitBeforeStart = Toggles.WaitBeforeStartToggle.Value
end)

AutoStartGroup:AddSlider("WaitBeforeStartSlider", {
	Text = "Start after x seconds",
	Default = 0,
	Min = 0,
	Max = 500,
	Rounding = 0,
	Tooltip = "Delay in seconds before mission starts"
})
Options.WaitBeforeStartSlider:OnChanged(function()
	getgenv().WaitBeforeStartSecs = Options.WaitBeforeStartSlider.Value
end)

AutoStartGroup:AddDropdown("StartTypeDropdown", {
	Values = {"Missions", "Raids", "Waves"},
	Default = DropdownConfig._lastType and table.find({"Missions", "Raids", "Waves"}, DropdownConfig._lastType) or 1,
	Multi = false,
	Text = "Type",
})
Options.StartTypeDropdown:OnChanged(function()
    local Value = Options.StartTypeDropdown.Value
    if not Value then return end
    DropdownConfig._lastType = Value
    SaveConfig(DropdownConfig)
    local isMission = Value == "Missions"
    local isRaid = Value == "Raids"
    local isWaves = Value == "Waves"
    
    -- Mission settings
    Options.MissionMapDropdown:SetVisible(isMission)
    Options.MissionObjectiveDropdown:SetVisible(isMission)
    Options.MissionDifficultyDropdown:SetVisible(isMission)
    
    -- Raid settings
    Options.RaidMapDropdown:SetVisible(isRaid)
    Options.RaidObjectiveDropdown:SetVisible(isRaid)
    Options.RaidDifficultyDropdown:SetVisible(isRaid)
    
    -- Waves settings
    Options.WavesMapDropdown:SetVisible(isWaves)
end)

AutoStartGroup:AddDropdown("MissionMapDropdown", {
	Values = {"Shiganshina","Trost","Outskirts","Forest","Utgard","Docks","Stohess","Chapel"},
	Default = DropdownConfig.Missions and table.find({"Shiganshina","Trost","Outskirts","Forest","Utgard","Docks","Stohess","Chapel"}, DropdownConfig.Missions.map) or 1,
	Multi = false,
	Text = "Mission Map",
})
Options.MissionMapDropdown:OnChanged(function()
	local Value = Options.MissionMapDropdown.Value
	if not Value then return end
	Options.MissionObjectiveDropdown:SetValues(Missions[Value] or {})
	DropdownConfig.Missions = DropdownConfig.Missions or {}
	DropdownConfig.Missions.map = Value
	SaveConfig(DropdownConfig)
end)

local initMissionMap = DropdownConfig.Missions and DropdownConfig.Missions.map or "Shiganshina"
local initMissionObjVals = Missions[initMissionMap] or {}
local initMissionObjDef = 1
if DropdownConfig.Missions and DropdownConfig.Missions.objective then
	initMissionObjDef = table.find(initMissionObjVals, DropdownConfig.Missions.objective) or 1
end

AutoStartGroup:AddDropdown("MissionObjectiveDropdown", {
	Values = initMissionObjVals,
	Default = initMissionObjDef,
	Multi = false,
	Text = "Mission Objective",
})
Options.MissionObjectiveDropdown:OnChanged(function()
	local Value = Options.MissionObjectiveDropdown.Value
	DropdownConfig.Missions = DropdownConfig.Missions or {}
	DropdownConfig.Missions.objective = Value
	SaveConfig(DropdownConfig)
end)

AutoStartGroup:AddDropdown("MissionDifficultyDropdown", {
	Values = {"Easy","Normal","Hard","Severe","Aberrant","Hardest"},
	Default = DropdownConfig.Missions and table.find({"Easy","Normal","Hard","Severe","Aberrant","Hardest"}, DropdownConfig.Missions.difficulty) or 2,
	Multi = false,
	Text = "Mission Difficulty",
})
Options.MissionDifficultyDropdown:OnChanged(function()
	local Value = Options.MissionDifficultyDropdown.Value
	DropdownConfig.Missions = DropdownConfig.Missions or {}
	DropdownConfig.Missions.difficulty = Value
	SaveConfig(DropdownConfig)
end)

AutoStartGroup:AddDivider()

AutoStartGroup:AddDropdown("RaidMapDropdown", {
	Values = {"Trost","Shiganshina","Stohess","Colossal"},
	Default = DropdownConfig.Raids and table.find({"Trost","Shiganshina","Stohess","Colossal"}, DropdownConfig.Raids.map) or 1,
	Multi = false,
	Text = "Raid Map",
})
Options.RaidMapDropdown:OnChanged(function()
	local Value = Options.RaidMapDropdown.Value
	if not Value then return end
	Options.RaidObjectiveDropdown:SetValues(Missions[Value] or {})
	DropdownConfig.Raids = DropdownConfig.Raids or {}
	DropdownConfig.Raids.map = Value
	SaveConfig(DropdownConfig)
end)

local initRaidMap = DropdownConfig.Raids and DropdownConfig.Raids.map or "Trost"
local initRaidObjVals = Missions[initRaidMap] or {}
local initRaidObjDef = 1
if DropdownConfig.Raids and DropdownConfig.Raids.objective then
	initRaidObjDef = table.find(initRaidObjVals, DropdownConfig.Raids.objective) or 1
end

AutoStartGroup:AddDropdown("RaidObjectiveDropdown", {
	Values = initRaidObjVals,
	Default = initRaidObjDef,
	Multi = false,
	Text = "Raid Objective",
})
Options.RaidObjectiveDropdown:OnChanged(function()
	local Value = Options.RaidObjectiveDropdown.Value
	DropdownConfig.Raids = DropdownConfig.Raids or {}
	DropdownConfig.Raids.objective = Value
	SaveConfig(DropdownConfig)
end)

AutoStartGroup:AddDropdown("RaidDifficultyDropdown", {
	Values = {"Hard","Severe","Aberrant","Hardest"},
	Default = DropdownConfig.Raids and table.find({"Hard","Severe","Aberrant","Hardest"}, DropdownConfig.Raids.difficulty) or 1,
	Multi = false,
	Text = "Raid Difficulty",
})
Options.RaidDifficultyDropdown:OnChanged(function()
	local Value = Options.RaidDifficultyDropdown.Value
	DropdownConfig.Raids = DropdownConfig.Raids or {}
	DropdownConfig.Raids.difficulty = Value
	SaveConfig(DropdownConfig)
end)

AutoStartGroup:AddLabel("Trost: Attack Titan\nShiganshina: Armored Titan\nStohess: Female Titan\nColossal: Colossal Titan", true)

AutoStartGroup:AddDivider()
-- Waves settings (only Easy difficulty)

AutoStartGroup:AddLabel("Waves Mode Settings:", true)

AutoStartGroup:AddDropdown("WavesMapDropdown", {
    Values = {"Trost"},
    Default = 1,
    Multi = false,
    Text = "Waves Map",
    Tooltip = "Select map for Waves mode"
})

-- Waves difficulty always Easy - no dropdown needed
AutoStartGroup:AddDivider()

AutoStartGroup:AddDropdown("ModifiersDropdown", {
	Values = {"No Perks","No Skills","No Memories","Nightmare","Oddball","Injury Prone","Chronic Injuries","Fog","Glass Cannon","Time Trial","Boring","Simple"},
	Default = {},
	Multi = true,
	Text = "Modifiers",
})

AutoStartGroup:AddToggle("AllModifiersToggle", {
	Text = "Enable All Modifiers (Max Rewards)",
	Default = false,
	Tooltip = "Enables all 9 modifiers for maximum 3.5x reward multiplier"
})
Toggles.AllModifiersToggle:OnChanged(function()
	if Toggles.AllModifiersToggle.Value then
		Options.ModifiersDropdown:SetValue({
			["No Perks"] = true, ["No Skills"] = true, ["No Memories"] = true,
			["Nightmare"] = true, ["Oddball"] = true, ["Injury Prone"] = true,
			["Chronic Injuries"] = true, ["Fog"] = true, ["Glass Cannon"] = true,
		})
		Library:Notify({ Title = "Auto Start", Description = "All 9 modifiers enabled!", Time = 3 })
	else
		Options.ModifiersDropdown:SetValue({})
		Library:Notify({ Title = "Auto Start", Description = "Modifiers cleared!", Time = 3 })
	end
end)

task.defer(function()
	task.wait(0.2)
	local savedType = DropdownConfig._lastType or "Missions"
	Options.StartTypeDropdown:SetValue(savedType)
end)


-- ==========================================
-- CONFIGS TAB
-- ==========================================

ConfigsGroup:AddLabel("One-Click Config Presets")

-- ==========================================
-- CONFIG 1: AFK Farming (Breach)
-- ==========================================
ConfigsGroup:AddToggle("AFKFarmingBreachToggle", {
    Text = "AFK Farming (Breach)",
    Default = false,
    Tooltip = "AFK Farming for breach"
})
Toggles.AFKFarmingBreachToggle:OnChanged(function()
    if Toggles.AFKFarmingBreachToggle.Value then
        -- Turn OFF other configs
        pcall(function() Toggles.AFKFarmingDefendToggle:SetValue(false) end)
        pcall(function() Toggles.AFKFarmingStallToggle:SetValue(false) end)
		pcall(function() Toggles.AFKFarmingWavesToggle:SetValue(false) end)
        
        -- Farm Settings
        pcall(function() Toggles.AutoKillToggle:SetValue(true) end)
        pcall(function() Toggles.AutoRetryToggle:SetValue(true) end)
        pcall(function() Toggles.SoloOnlyToggle:SetValue(true) end)
        
        -- Movement
        pcall(function() Options.MovementModeDropdown:SetValue("Teleport") end)
        pcall(function() Options.FloatHeightSlider:SetValue(170) end)
        pcall(function() Toggles.NoclipToggle:SetValue(true) end)
	    pcall(function() Toggles.AutoBoostToggle:SetValue(true) end) -- Auto boost
        
        -- Combat
        pcall(function() Toggles.AutoReloadToggle:SetValue(true) end)
        pcall(function() Toggles.AutoEscapeToggle:SetValue(true) end)
        pcall(function() Toggles.MultiHitToggle:SetValue(true) end)
        pcall(function() Options.MultiHitCountSlider:SetValue(3) end)
        
        -- Security
        pcall(function() Options.FarmOptionsDropdown:SetValue({
            ["Auto Execute"] = true, ["Failsafe"] = true
        }) end)
        
        -- Extras
        pcall(function() Toggles.DeleteMapToggle:SetValue(true) end)
        
        -- Auto Start - Breach
        pcall(function() Options.StartTypeDropdown:SetValue("Missions") end)
        pcall(function() Options.MissionMapDropdown:SetValue("Shiganshina") end)
        pcall(function() Options.MissionObjectiveDropdown:SetValue("Breach") end)
        pcall(function() Options.MissionDifficultyDropdown:SetValue("Hardest") end)
        pcall(function() Options.ModifiersDropdown:SetValue({
            ["No Perks"] = true, ["No Skills"] = true, ["No Memories"] = true,
            ["Nightmare"] = true, ["Oddball"] = true, ["Injury Prone"] = true,
            ["Chronic Injuries"] = true, ["Fog"] = true, ["Glass Cannon"] = true,
            ["Time Trial"] = true
        }) end)
        pcall(function() Toggles.AutoStartToggle:SetValue(true) end)
        
        pcall(function() Toggles.AutoHideToggle:SetValue(true) end)
        
        Library:Notify({
            Title = "⚙️ AFK Farming (Breach) Applied!",
            Description = "Shiganshina | Breach | Hardest\nAll 10 Mods | Solo | Teleport",
            Time = 5
        })
        
        task.delay(3, function()
            if Library then Library:Toggle(false) end
        end)
    end
end)

-- ==========================================
-- CONFIG 2: AFK Farming (Defend)
-- ==========================================
ConfigsGroup:AddToggle("AFKFarmingDefendToggle", {
    Text = "AFK Farming (Defend)",
    Default = false,
    Tooltip = "AFK Farming for Defend mission"
})
Toggles.AFKFarmingDefendToggle:OnChanged(function()
    if Toggles.AFKFarmingDefendToggle.Value then
        -- Turn OFF other configs
        pcall(function() Toggles.AFKFarmingBreachToggle:SetValue(false) end)
        pcall(function() Toggles.AFKFarmingStallToggle:SetValue(false) end)
		pcall(function() Toggles.AFKFarmingWavesToggle:SetValue(false) end)
        
        -- Farm Settings
        pcall(function() Toggles.AutoKillToggle:SetValue(true) end)
        pcall(function() Toggles.AutoRetryToggle:SetValue(true) end)
        pcall(function() Toggles.SoloOnlyToggle:SetValue(true) end)
        
        -- Movement
        pcall(function() Options.MovementModeDropdown:SetValue("Teleport") end)
        pcall(function() Options.FloatHeightSlider:SetValue(170) end)
        pcall(function() Toggles.NoclipToggle:SetValue(true) end)
		pcall(function() Toggles.AutoBoostToggle:SetValue(true) end) -- Auto boost

		-- Extras
		pcall(function() Toggles.AutoSkipToggle:SetValue(true) end)
        
        -- Combat
        pcall(function() Toggles.AutoReloadToggle:SetValue(true) end)
        pcall(function() Toggles.AutoEscapeToggle:SetValue(true) end)
        pcall(function() Toggles.MultiHitToggle:SetValue(true) end)
        pcall(function() Options.MultiHitCountSlider:SetValue(3) end)
        
        -- Security
        pcall(function() Options.FarmOptionsDropdown:SetValue({
            ["Auto Execute"] = true, ["Failsafe"] = true
        }) end)
        
        -- Extras
        pcall(function() Toggles.DeleteMapToggle:SetValue(true) end)
        
        -- Auto Start - Defend
        pcall(function() Options.StartTypeDropdown:SetValue("Missions") end)
        pcall(function() Options.MissionMapDropdown:SetValue("Utgard") end)
        pcall(function() Options.MissionObjectiveDropdown:SetValue("Defend") end)
        pcall(function() Options.MissionDifficultyDropdown:SetValue("Hardest") end)
        pcall(function() Options.ModifiersDropdown:SetValue({
            ["No Perks"] = true, ["No Skills"] = true, ["No Memories"] = true,
            ["Nightmare"] = true, ["Oddball"] = true, ["Injury Prone"] = true,
            ["Chronic Injuries"] = true, ["Fog"] = true, ["Glass Cannon"] = true,
            ["Time Trial"] = true
        }) end)
        pcall(function() Toggles.AutoStartToggle:SetValue(true) end)
        
        pcall(function() Toggles.AutoHideToggle:SetValue(true) end)
        
        Library:Notify({
            Title = "⚙️ AFK Farming (Defend) Applied!",
            Description = "Utgard | Defend | Hardest\nAll 10 Mods | Solo | Teleport",
            Time = 5
        })
        
        task.delay(3, function()
            if Library then Library:Toggle(false) end
        end)
    end
end)


-- ==========================================
-- CONFIG 3: AFK Farming (Stall)
-- ==========================================
ConfigsGroup:AddToggle("AFKFarmingStallToggle", {
    Text = "AFK Farming (Stall)",
    Default = false,
    Tooltip = "AFK Faming for Stall mission"
})
Toggles.AFKFarmingStallToggle:OnChanged(function()
    if Toggles.AFKFarmingStallToggle.Value then
        -- Turn OFF other configs
        pcall(function() Toggles.AFKFarmingBreachToggle:SetValue(false) end)
        pcall(function() Toggles.AFKFarmingDefendToggle:SetValue(false) end)
		pcall(function() Toggles.AFKFarmingWavesToggle:SetValue(false) end)
        
        -- Farm Settings
        pcall(function() Toggles.AutoKillToggle:SetValue(true) end)
        pcall(function() Toggles.AutoRetryToggle:SetValue(true) end)
        pcall(function() Toggles.SoloOnlyToggle:SetValue(true) end)
        
        -- Movement
        pcall(function() Options.MovementModeDropdown:SetValue("Teleport") end)
        pcall(function() Options.FloatHeightSlider:SetValue(310) end)
        pcall(function() Toggles.NoclipToggle:SetValue(true) end)
		pcall(function() Toggles.AutoBoostToggle:SetValue(true) end) -- Auto boost

	    -- Extras
		pcall(function() Toggles.AutoSkipToggle:SetValue(true) end)
        
        -- Combat
        pcall(function() Toggles.AutoReloadToggle:SetValue(true) end)
        pcall(function() Toggles.AutoEscapeToggle:SetValue(true) end)
        pcall(function() Toggles.MultiHitToggle:SetValue(false) end)
        pcall(function() Options.MultiHitCountSlider:SetValue(2) end)
        
        -- Security
        pcall(function() Options.FarmOptionsDropdown:SetValue({
            ["Auto Execute"] = true, ["Failsafe"] = true
        }) end)
        
        -- Extras
        pcall(function() Toggles.DeleteMapToggle:SetValue(false) end)
        
        -- Auto Start - Stall
        pcall(function() Options.StartTypeDropdown:SetValue("Missions") end)
        pcall(function() Options.MissionMapDropdown:SetValue("Docks") end)
        pcall(function() Options.MissionObjectiveDropdown:SetValue("Stall") end)
        pcall(function() Options.MissionDifficultyDropdown:SetValue("Hardest") end)
        pcall(function() Options.ModifiersDropdown:SetValue({
            ["No Perks"] = true, ["No Skills"] = true, ["No Memories"] = true,
            ["Nightmare"] = true, ["Oddball"] = true, ["Injury Prone"] = true,
            ["Chronic Injuries"] = true, ["Fog"] = true, ["Glass Cannon"] = true,
            ["Time Trial"] = true
        }) end)
        pcall(function() Toggles.AutoStartToggle:SetValue(true) end)
        
        pcall(function() Toggles.AutoHideToggle:SetValue(true) end)
        
        Library:Notify({
            Title = "⚙️ AFK Farming (Stall) Applied!",
            Description = "Docks | Stall | Hardest\nAll 10 Mods | Solo | Teleport",
            Time = 5
        })
        
        task.delay(3, function()
            if Library then Library:Toggle(false) end
        end)
    end
end)

-- ==========================================
-- CONFIG 4: AFK Farming (Waves)
-- ==========================================
ConfigsGroup:AddToggle("AFKFarmingWavesToggle", {
    Text = "AFK Farming (Waves)",
    Default = false,
    Tooltip = "Waves Config"
})
Toggles.AFKFarmingWavesToggle:OnChanged(function()
    if Toggles.AFKFarmingWavesToggle.Value then
        -- Turn OFF other configs
        pcall(function() Toggles.AFKFarmingBreachToggle:SetValue(false) end)
        pcall(function() Toggles.AFKFarmingDefendToggle:SetValue(false) end)
        pcall(function() Toggles.AFKFarmingStallToggle:SetValue(false) end)
        
        -- Farm Settings
        pcall(function() Toggles.AutoKillToggle:SetValue(true) end)
        pcall(function() Toggles.AutoRetryToggle:SetValue(true) end)
        pcall(function() Toggles.SoloOnlyToggle:SetValue(true) end)
        
        -- Movement
        pcall(function() Options.MovementModeDropdown:SetValue("Hover") end)
        pcall(function() Options.FloatHeightSlider:SetValue(250) end)
        pcall(function() Toggles.NoclipToggle:SetValue(true) end)
        pcall(function() Toggles.AutoBoostToggle:SetValue(false) end) -- Auto boost
        
        -- Combat
        pcall(function() Toggles.AutoReloadToggle:SetValue(true) end)
        pcall(function() Toggles.AutoEscapeToggle:SetValue(true) end)
		pcall(function() Toggles.MultiHitToggle:SetValue(true) end)
        pcall(function() Options.MultiHitCountSlider:SetValue(2) end)
        
        -- Security
        pcall(function() Options.FarmOptionsDropdown:SetValue({
            ["Auto Execute"] = true, ["Failsafe"] = true
        }) end)
        
        -- Extras
        pcall(function() Toggles.AutoSkipToggle:SetValue(true) end)
        pcall(function() Toggles.DeleteMapToggle:SetValue(false) end)
        
        -- Waves Settings
        pcall(function() Toggles.AutoWavesToggle:SetValue(true) end)
        pcall(function() Toggles.AutoWavesUpgradeToggle:SetValue(true) end)
        
        -- Auto Start - Waves
        pcall(function() Options.StartTypeDropdown:SetValue("Waves") end)
        pcall(function() Options.WavesMapDropdown:SetValue("Trost") end)
        pcall(function() Toggles.AutoStartToggle:SetValue(true) end)
        
        pcall(function() Toggles.AutoHideToggle:SetValue(true) end)
        
        Library:Notify({
            Title = "Waves Config Applied!",
            Description = "Waves | Trost | Easy\nAuto Farm + Upgrade",
            Time = 5
        })
        
        task.delay(3, function()
            if Library then Library:Toggle(false) end
        end)
    end
end)

-- Configs Info
ConfigsGroup:AddDivider()
ConfigsGroup:AddLabel("Configs Summary:")
ConfigsGroup:AddLabel("• Breach: AFK Farming")
ConfigsGroup:AddLabel("• Defend: AFK Farming")
ConfigsGroup:AddLabel("• Stall: AFK Farming")
ConfigsGroup:AddLabel("• Waves: Auto")
ConfigsGroup:AddLabel("• All: Hardest + 10 Mods + Solo")


-- ==========================================
-- UPGRADES TAB
-- ==========================================

UpgradesGroup:AddToggle("AutoUpgradeToggle", {
    Text = "Upgrade Gear",
    Default = false,
})
Toggles.AutoUpgradeToggle:OnChanged(function()
    getgenv().AutoUpgrade = Toggles.AutoUpgradeToggle.Value
    if not getgenv().AutoUpgrade then return end
    task.spawn(function()
        if game.PlaceId ~= 14916516914 then
            Library:Notify({ Title = "Auto Upgrade", Description = "Works in lobby!", Time = 3 })
            getgenv().AutoUpgrade = false
            Toggles.AutoUpgradeToggle:SetValue(false)
            return
        end

        local slot = lp:GetAttribute("Slot")
        if not slot then
            getRemote:InvokeServer("Functions", "Select", "A")
            local waited = 0
            repeat task.wait(0.5); waited += 0.5 until lp:GetAttribute("Slot") or waited >= 5
            slot = lp:GetAttribute("Slot")
        end

        if not slot then
            Library:Notify({ Title = "Auto Upgrade", Description = "Slot not selected!", Time = 3 })
            getgenv().AutoUpgrade = false
            Toggles.AutoUpgradeToggle:SetValue(false)
            return
        end

        Library:Notify({ Title = "Auto Upgrade", Description = "Slot " .. slot .. " upgrading...", Time = 2 })

        local allUpgrades = {
            "Crit_Damage", "Crit_Chance",
            "ODM_Damage", "ODM_Control", "ODM_Gas", "ODM_Speed", "Blade_Durability", "ODM_Range",
            "Blast_Radius", "TS_Control", "TS_Range", "TS_Damage", "TS_Gas", "TS_Speed",
        }

        while getgenv().AutoUpgrade do
            local anyDone = false
            for _, upg in ipairs(allUpgrades) do
                if not getgenv().AutoUpgrade then break end
                local ok, result = pcall(function()
                    return getRemote:InvokeServer("S_Equipment", "Upgrade", {upg})
                end)
                if ok and result ~= nil and result ~= false then
                    anyDone = true
                    Library:Notify({ Title = "Upgraded!", Description = string.gsub(upg, "_", " "), Time = 1.5 })
                    task.wait(0.5)
                end
            end
            if not anyDone then
                Library:Notify({ Title = "Auto Upgrade", Description = "Slot " .. slot .. " fully maxed! Still checking...", Time = 3 })
                -- ❌ getgenv().AutoUpgrade = false -- REMOVED
                -- ❌ Toggles.AutoUpgradeToggle:SetValue(false) -- REMOVED
                -- ❌ break -- REMOVED
                task.wait(10) -- Check every 10s if all maxed
            else
                task.wait(1)
            end
        end
    end)
end)

UpgradesGroup:AddToggle("AutoEnhanceToggle", {
	Text = "Enhance Perks",
	Default = false,
})
Toggles.AutoEnhanceToggle:OnChanged(function()
	getgenv().AutoPerk = Toggles.AutoEnhanceToggle.Value
	if not getgenv().AutoPerk then return end
	task.spawn(function()
		-- Slot select pehle
		local slot = lp:GetAttribute("Slot")
		if not slot then
			getRemote:InvokeServer("Functions", "Select", "A")
			local waited = 0
			repeat task.wait(0.5); waited += 0.5 until lp:GetAttribute("Slot") or waited >= 5
			slot = lp:GetAttribute("Slot")
		end

		if not slot then
			Library:Notify({ Title = "Auto Perk", Description = "Slot select nahi hua!", Time = 3 })
			getgenv().AutoPerk = false
			Toggles.AutoEnhanceToggle:SetValue(false)
			return
		end

		-- Data fetch with retry
		local plrData = nil
		for i = 1, 5 do
			lastPlayerDataTime = 0
			lastPlayerData = nil
			local ok, result = pcall(GetPlayerData)
			if ok and type(result) == "table" and result.Slots then
				plrData = result
				break
			end
			task.wait(1)
		end

		if not plrData or not plrData.Slots then
			Library:Notify({ Title = "Auto Perk", Description = "Data fetch failed!", Time = 3 })
			getgenv().AutoPerk = false
			Toggles.AutoEnhanceToggle:SetValue(false)
			return
		end

		local slotIndex = lp:GetAttribute("Slot")
		if not slotIndex or not plrData.Slots[slotIndex] then
			getgenv().AutoPerk = false
			Toggles.AutoEnhanceToggle:SetValue(false)
			return
		end

		local slotPerkData = plrData.Slots[slotIndex]
		local storagePerks = {}
		for id, val in pairs(slotPerkData.Perks.Storage) do
			storagePerks[id] = val
		end

		local perkSlot = Options.PerkSlotDropdown.Value
		local equippedPerkId = slotPerkData.Perks.Equipped[perkSlot]
		if not equippedPerkId then
			Library:Notify({ Title = "Auto Perk", Description = "No perk in " .. tostring(perkSlot) .. " slot!", Time = 3 })
			getgenv().AutoPerk = false
			Toggles.AutoEnhanceToggle:SetValue(false)
			return
		end

		local perkData = storagePerks[equippedPerkId]
		if not perkData then
			Library:Notify({ Title = "Auto Perk", Description = "Equipped perk data not found!", Time = 3 })
			getgenv().AutoPerk = false
			Toggles.AutoEnhanceToggle:SetValue(false)
			return
		end

		local perkName = perkData.Name
		local rarity = GetPerkRarity(perkName)
		local currentLevel = perkData.Level or 0
		local currentXP = perkData.XP or 0

		while getgenv().AutoPerk do
			if currentLevel >= 10 then
				Library:Notify({ Title = "Auto Perk", Description = perkName .. " Level 10 max!", Time = 3 })
				break
			end

			local selectedRarities = Options.SelectPerksDropdown.Value
			local rarityPerks = {}
			if selectedRarities then
				for r, isActive in pairs(selectedRarities) do
					if isActive then rarityPerks[r] = true end
				end
			end

			-- Build food perks as DICT {[id] = qty} — server expects this format
			local foodPerkDict = {}
			local totalXPGain = 0
			local count = 0

			for perkId, tbl in pairs(storagePerks) do
				if count >= 5 then break end
				local r = GetPerkRarity(tbl.Name)
				if perkId ~= equippedPerkId and rarityPerks[r] then
					foodPerkDict[perkId] = 1
					totalXPGain = totalXPGain + GetPerkXP(r, math.max(tbl.Level or 0, 1))
					count = count + 1
				end
			end

			if count == 0 then
				Library:Notify({ Title = "Auto Perk", Description = "No food perks found!", Time = 3 })
				break
			end

			local ok, result = pcall(function()
				return getRemote:InvokeServer("S_Equipment", "Enhance", equippedPerkId, foodPerkDict)
			end)

			if ok and result ~= nil and result ~= false then
				-- Remove used food perks from storage
				for id in pairs(foodPerkDict) do storagePerks[id] = nil end
				currentXP = currentXP + totalXPGain
				while currentLevel < 10 do
					local thresholds = Perk_Level_XP[rarity]
					if not thresholds then break end
					local needed = thresholds[currentLevel + 1]
					if not needed or currentXP < needed then break end
					currentXP = currentXP - needed
					currentLevel = currentLevel + 1
				end
				Library:Notify({ Title = "Enhanced: " .. perkName, Description = "Lv " .. currentLevel .. " (+" .. totalXPGain .. " XP)", Time = 1 })
			else
				Library:Notify({ Title = "Auto Perk", Description = "Enhance failed, stopping.", Time = 3 })
				break
			end
			task.wait(0.5)
		end

		getgenv().AutoPerk = false
		Toggles.AutoEnhanceToggle:SetValue(false)
	end)
end)
UpgradesGroup:AddDropdown("PerkSlotDropdown", {
	Values = {"Defense", "Support", "Family", "Extra", "Offense", "Body"},
	Default = 6,
	Multi = false,
	Text = "Perk Slot",
})

UpgradesGroup:AddDropdown("SelectPerksDropdown", {
	Values = {"Common", "Rare", "Epic", "Legendary"},
	Default = {},
	Multi = true,
	Text = "Perks to use (Food)",
})

local autoSellPerkDefaults = getgenv().AutoSellPerks or {}
if autoSellPerkDefaults.Secret == true then autoSellPerkDefaults.Mythic = true end

UpgradesGroup:AddDropdown("AutoSellPerksDropdown", {
	Values = {"Common", "Rare", "Epic", "Legendary", "Mythic"},
	Default = autoSellPerkDefaults,
	Multi = true,
	Text = "Perks to sell",
})
Options.AutoSellPerksDropdown:OnChanged(function()
	local selected = Options.AutoSellPerksDropdown.Value or {}
	getgenv().AutoSellPerks = {
		Common = selected.Common == true,
		Rare = selected.Rare == true,
		Epic = selected.Epic == true,
		Legendary = selected.Legendary == true,
		Mythic = selected.Mythic == true,
	}
	DropdownConfig.AutoSellPerks = getgenv().AutoSellPerks
	SaveConfig(DropdownConfig)
end)

UpgradesGroup:AddToggle("AutoSellPerksToggle", {
	Text = "Auto Sell Perks",
	Default = false,
	Tooltip = "Sells stored perks matching the selected rarities. Equipped perks are skipped.",
})
Toggles.AutoSellPerksToggle:OnChanged(function()
	getgenv().AutoSellPerksEnabled = Toggles.AutoSellPerksToggle.Value
	if not getgenv().AutoSellPerksEnabled then return end

	task.spawn(function()
		if getgenv().AutoSellPerksRunning then return end
		getgenv().AutoSellPerksRunning = true

		while getgenv().AutoSellPerksEnabled do
			if game.PlaceId ~= 14916516914 then
				Library:Notify({ Title = "Auto Sell Perks", Description = "Works in lobby!", Time = 3 })
				getgenv().AutoSellPerksEnabled = false
				Toggles.AutoSellPerksToggle:SetValue(false)
				break
			end

			local sold = SellAutoPerksOnce()
			if sold > 0 then
				Library:Notify({ Title = "Auto Sell Perks", Description = "Sold " .. tostring(sold) .. " perk(s).", Time = 3 })
				task.wait(3)
			else
				task.wait(30)
			end
		end

		getgenv().AutoSellPerksRunning = false
	end)
end)

UpgradesGroup:AddButton({
	Text = "Sell Perks Now",
	Func = function()
		if game.PlaceId ~= 14916516914 then
			Library:Notify({ Title = "Auto Sell Perks", Description = "Must be in lobby!", Time = 3 })
			return
		end

		local sold = SellAutoPerksOnce()
		Library:Notify({
			Title = "Auto Sell Perks",
			Description = sold > 0 and ("Sold " .. tostring(sold) .. " perk(s).") or "No matching perks found.",
			Time = 4
		})
	end,
})

UpgradesGroup:AddLabel("Default perk slot is Body")

-- ==========================================
-- UPGRADES TAB : Skill Tree
-- ==========================================

SkillTreeGroup:AddToggle("AutoSkillTree", {
	Text = "Auto Skill Tree",
	Default = false,
})
Toggles.AutoSkillTree:OnChanged(function()
	getgenv().AutoSkillTree = Toggles.AutoSkillTree.Value
	if not getgenv().AutoSkillTree then return end
	if game.PlaceId ~= 14916516914 then return end

	task.spawn(function()
		local slot = lp:GetAttribute("Slot")
		if not slot then
			getRemote:InvokeServer("Functions", "Select", "A")
			local waited = 0
			repeat task.wait(0.5); waited += 0.5 until lp:GetAttribute("Slot") or waited >= 5
			slot = lp:GetAttribute("Slot")
		end

		if not slot then
			Library:Notify({ Title = "Skill Tree", Description = "Slot not Selected!", Time = 3 })
			getgenv().AutoSkillTree = false
			Toggles.AutoSkillTree:SetValue(false)
			return
		end

		local weapon = Options.MiddlePathDropdown.Value == "Damage" and "Blades" or "Blades"

		local middle = Options.MiddlePathDropdown.Value
		local left   = Options.LeftPathDropdown.Value
		local right  = Options.RightPathDropdown.Value

		local middlePath = SkillPaths[weapon] and SkillPaths[weapon][middle]
		local leftPath   = SkillPaths.Support[left]
		local rightPath  = SkillPaths.Defense[right]

		local p1 = Options.Priority1Dropdown.Value or "Middle"
		local p2 = Options.Priority2Dropdown.Value or "Left"
		local p3 = Options.Priority3Dropdown.Value or "None"

		local pathMap = { Left = leftPath, Middle = middlePath, Right = rightPath }
		local paths, used = {}, {}
		local function addPath(p)
			if not used[p] and pathMap[p] then
				table.insert(paths, pathMap[p])
				used[p] = true
			end
		end
		addPath(p1); addPath(p2); addPath(p3)

		while getgenv().AutoSkillTree do
			local anyUnlocked = false
			for _, path in ipairs(paths) do
				for _, skillId in ipairs(path) do
					if not getgenv().AutoSkillTree then break end
					local ok, result = pcall(function()
						return getRemote:InvokeServer("S_Equipment", "Unlock", {skillId})
					end)
					if ok and result ~= nil and result ~= false then
						anyUnlocked = true
						Library:Notify({ Title = "Skill Unlocked", Description = "ID: " .. skillId, Time = 1 })
						task.wait(0.5)
					end
				end
			end

			if not anyUnlocked then
				Library:Notify({ Title = "Skill Tree", Description = "All selected paths complete!", Time = 3 })
				getgenv().AutoSkillTree = false
				Toggles.AutoSkillTree:SetValue(false)
				break
			end
			task.wait(1)
		end
	end)
end)

SkillTreeGroup:AddDropdown("MiddlePathDropdown", {
	Values = {"Damage", "Critical"},
	Default = 2,
	Multi = false,
	Text = "Middle Path",
})

SkillTreeGroup:AddDropdown("LeftPathDropdown", {
	Values = {"Regen", "Cooldown Reduction"},
	Default = 2,
	Multi = false,
	Text = "Left Path",
})

SkillTreeGroup:AddDropdown("RightPathDropdown", {
	Values = {"Health", "Damage Reduction"},
	Default = 2,
	Multi = false,
	Text = "Right Path",
})

SkillTreeGroup:AddDropdown("Priority1Dropdown", {
	Values = {"Left", "Middle", "Right", "None"},
	Default = 2,
	Multi = false,
	Text = "Priority 1",
})

SkillTreeGroup:AddDropdown("Priority2Dropdown", {
	Values = {"Left", "Middle", "Right", "None"},
	Default = 1,
	Multi = false,
	Text = "Priority 2",
})

SkillTreeGroup:AddDropdown("Priority3Dropdown", {
	Values = {"Left", "Middle", "Right", "None"},
	Default = 4,
	Multi = false,
	Text = "Priority 3",
})


-- ==========================================
-- WAVES TAB
-- ==========================================

getgenv().AutoWaves = false
getgenv().AutoWavesUpgrade = false

WavesFarmGroup:AddToggle("AutoWavesToggle", {
    Text = "Auto Farm Waves",
    Default = false,
    Tooltip = "Auto Waves Farm !"
})
Toggles.AutoWavesToggle:OnChanged(function()
    getgenv().AutoWaves = Toggles.AutoWavesToggle.Value
    
    if getgenv().AutoWaves then
        -- Start farm
        if not Toggles.AutoKillToggle.Value then
            Toggles.AutoKillToggle:SetValue(true)
        elseif not AutoFarm._running then
            AutoFarm:Start()
        end
    else
        -- ✅ Stop farm when toggle OFF
        if AutoFarm._running then
            AutoFarm:Stop()
        end
        -- Also turn off main toggle
        if Toggles.AutoKillToggle.Value then
            Toggles.AutoKillToggle:SetValue(false)
        end
    end
end)


WavesSettingsGroup:AddToggle("AutoWavesUpgradeToggle", {
    Text = "Auto Upgrade Gears",
    Default = false,
    Tooltip = "Auto upgrade ODM/TS gear using Waves currency"
})
Toggles.AutoWavesUpgradeToggle:OnChanged(function()
    getgenv().AutoWavesUpgrade = Toggles.AutoWavesUpgradeToggle.Value
    
    if getgenv().AutoWavesUpgrade then
        task.spawn(function()
            local upgrades = {
                "ODM_Damage", "ODM_Control", "ODM_Gas", "ODM_Speed", 
                "Blade_Durability", "ODM_Range",
                "Blast_Radius", "TS_Control", "TS_Range", "TS_Damage", 
                "TS_Gas", "TS_Speed",
                "Crit_Damage", "Crit_Chance"
            }
            
            while getgenv().AutoWavesUpgrade do
                local anyUpgraded = false
                
                for _, upg in ipairs(upgrades) do
                    if not getgenv().AutoWavesUpgrade then break end
                    
                    local ok, result = pcall(function()
                        return getRemote:InvokeServer("Equipment", "Upgrade", {upg})
                    end)
                    
                    if ok and result ~= nil and result ~= false then
                        anyUpgraded = true
                        local upgName = string.gsub(upg, "_", " ")
                        Library:Notify({
                            Title = "Upgraded!",
                            Description = upgName .. " upgraded!",
                            Time = 1.5
                        })
                        task.wait(0.3)
                    elseif ok and result == false then
                        -- Already maxed, skip
                        Library:Notify({
                            Title = "Maxed or not enough coins",
                            Description = string.gsub(upg, "_", " ") .. " already max!",
                            Time = 1
                        })
                    end
                end
                
                if not anyUpgraded then
                    Library:Notify({
                        Title = "All Maxed or not enough coins!",
                        Description = "All gear fully upgraded! Still checking...",
                        Time = 3
                    })
                end
                
                task.wait(5) -- Check every 5 seconds
            end
        end)
    end
end)

-- ==========================================
-- AUTO START/VOTE WAVES
-- ==========================================

getgenv().AutoStartWaves = false

WavesFarmGroup:AddToggle("AutoStartWavesToggle", {
    Text = "Auto Start/Vote Waves",
    Default = false,
    Tooltip = "Auto vote and start waves mode when available"
})
Toggles.AutoStartWavesToggle:OnChanged(function()
    getgenv().AutoStartWaves = Toggles.AutoStartWavesToggle.Value
    
    if getgenv().AutoStartWaves then
        task.spawn(function()
            while getgenv().AutoStartWaves do
                pcall(function()
                    -- Check if waves vote/start UI is visible
                    local wavesFrame = INTERFACE:FindFirstChild("Waves") or 
                                      INTERFACE:FindFirstChild("WaveVote") or
                                      INTERFACE:FindFirstChild("Vote")
                    
                    if wavesFrame and wavesFrame.Visible then
                        -- Try to click vote/start button
                        local startBtn = wavesFrame:FindFirstChild("Start") or
                                        wavesFrame:FindFirstChild("Vote") or
                                        wavesFrame:FindFirstChild("Interact")
                        
                        if startBtn then
                            UseButton(startBtn)
                        end
                    end
                    
                    -- Send remote to vote/update waves
                    postRemote:FireServer("Waves", "Update")
                end)
                task.wait(5) -- Check every 5 seconds
            end
        end)
    end
end)

WavesFarmGroup:AddLabel("More Features Coming Soon")
WavesSettingsGroup:AddLabel("More Features Coming Soon")


-- ==========================================
-- GLOBAL TAB : Slots
-- ==========================================

SlotGroup:AddToggle("AutoSelectSlot", {
	Text = "Auto Select Slot",
	Default = false,
})
Toggles.AutoSelectSlot:OnChanged(function()
	getgenv().AutoSlot = Toggles.AutoSelectSlot.Value
	if getgenv().AutoSlot and not lp:GetAttribute("Slot") then
		local selectedSlot = Options.SelectSlotDropdown.Value
		local args = { "Functions", "Select", string.sub(selectedSlot, -1) }
		task.spawn(function()
			repeat
				getRemote:InvokeServer(unpack(args))
				task.wait(1)
			until lp:GetAttribute("Slot") or not getgenv().AutoSlot
			if ShouldRefreshLobbyAfterSlot(string.sub(selectedSlot, -1)) then
				getRemote:InvokeServer("Functions", "Teleport", "Lobby")
			end
		end)
	end
end)

SlotGroup:AddDropdown("SelectSlotDropdown", {
	Values = {"Slot A", "Slot B", "Slot C"},
	Default = 1,
	Multi = false,
	Text = "Select Slot",
})

SlotGroup:AddToggle("AutoPrestigeToggle", {
	Text = "Auto Prestige",
	Default = false,
})
Toggles.AutoPrestigeToggle:OnChanged(function()
	getgenv().AutoPrestige = Toggles.AutoPrestigeToggle.Value
	if getgenv().AutoPrestige then
		task.spawn(function()
			if game.PlaceId ~= 14916516914 then
				Library:Notify({ Title = "Auto Prestige", Description = "Works in lobby only!", Time = 3 })
				getgenv().AutoPrestige = false
				Toggles.AutoPrestigeToggle:SetValue(false)
				return
			end

			local function getSlotData(pData)
				if not pData or not pData.Slots then return nil, nil end
				local slotIdx = lp:GetAttribute("Slot") or pData.Current_Slot
				if not slotIdx then return nil, nil end
				return pData.Slots[slotIdx] or pData.Slots[tostring(slotIdx)], slotIdx
			end

			local function getPrestigeGoldRequirement(currentPrestige)
				local optionNames = {
					[0] = "P1GoldInput",
					[1] = "P2GoldInput",
					[2] = "P3GoldInput",
					[3] = "P4GoldInput",
					[4] = "P5GoldInput",
				}
				local optionName = optionNames[tonumber(currentPrestige) or 0]
				local option = optionName and Options[optionName]
				local raw = option and tostring(option.Value or "") or "0"
				raw = raw:gsub("[,%s]", "")
				return tonumber(raw) or 0
			end

			local function pickBestPrestigeTalent(nextTalents)
				local best = nil
				for _, id in ipairs(nextTalents or {}) do
					local info = PrestigeTalentData[tostring(id)]
					if info and (not best or info.Stars > best.Stars) then
						best = info
					end
				end
				return best
			end

			local function extractNextTalents(dataResult, talentsResult)
				if type(dataResult) == "table" then
					if type(dataResult.Next_Talents) == "table" then return dataResult.Next_Talents end
					if type(dataResult.NextTalents) == "table" then return dataResult.NextTalents end
				end
				if type(talentsResult) == "table" then return talentsResult end
				return nil
			end

			local function returnLobbyAfterPrestige()
				Library:Notify({ Title = "Auto Prestige", Description = "Refreshing lobby after prestige...", Time = 4 })
				task.wait(2)
				pcall(function()
					getRemote:InvokeServer("Functions", "Teleport", "Lobby")
				end)
				task.wait(0.5)
				pcall(function()
					TeleportService:Teleport(14916516914, lp)
				end)
			end

			local lastNotice = 0
			while getgenv().AutoPrestige do
				if not lp:GetAttribute("Slot") then
					pcall(function()
						getRemote:InvokeServer("Functions", "Select", tostring(KaitunConfig.AutoSlot or "A"))
					end)
					task.wait(2)
				end

				local okTalents, dataResult, nextTalents, itemCount = pcall(function()
					return getRemote:InvokeServer("S_Equipment", "Talents")
				end)

				if not okTalents then
					Library:Notify({ Title = "Auto Prestige", Description = "Could not get prestige talents.", Time = 3 })
					task.wait(5)
					continue
				end

				if type(dataResult) ~= "table" then
					if os.clock() - lastNotice > 30 then
						lastNotice = os.clock()
						Library:Notify({ Title = "Auto Prestige", Description = "Waiting for lobby player data...", Time = 3 })
					end
					task.wait(10)
					continue
				end

				lastPlayerData = dataResult
				lastPlayerDataTime = os.clock()

				local slotData, slotIdx = getSlotData(dataResult)
				if not slotData or not slotIdx then
					pcall(function() getRemote:InvokeServer("Functions", "Select", "A") end)
					local waited = 0
					repeat
						task.wait(0.5)
						waited += 0.5
					until lp:GetAttribute("Slot") or waited >= 5 or not getgenv().AutoPrestige
					if os.clock() - lastNotice > 10 then
						lastNotice = os.clock()
						Library:Notify({ Title = "Auto Prestige", Description = "Slot data not ready yet.", Time = 3 })
					end
					task.wait(5)
					continue
				end

				local currency = slotData.Currency or {}
				local progression = slotData.Progression or {}
				local gold = currency.Gold or 0
				local currentPrestige = tonumber(progression.Prestige or lp:GetAttribute("Prestige") or 0) or 0
				local requiredGold = getPrestigeGoldRequirement(currentPrestige)

				if gold < requiredGold then
					if os.clock() - lastNotice > 30 then
						lastNotice = os.clock()
						Library:Notify({
							Title = "Auto Prestige",
							Description = "Waiting for gold: " .. tostring(gold) .. " / " .. tostring(requiredGold),
							Time = 4
						})
					end
					task.wait(10)
					continue
				end

				local requiredLevel = 100 + currentPrestige * 25
				local level = progression.Level or 0
				local xp = progression.XP or 0
				local maxXP = progression.Max_XP or 0
				if level < requiredLevel or xp < maxXP then
					if os.clock() - lastNotice > 30 then
						lastNotice = os.clock()
						Library:Notify({
							Title = "Auto Prestige",
							Description = "Waiting for max level/XP: Lv " .. tostring(level) .. "/" .. tostring(requiredLevel) .. ", XP " .. tostring(xp) .. "/" .. tostring(maxXP),
							Time = 4
						})
					end
					task.wait(10)
					continue
				end

				nextTalents = extractNextTalents(dataResult, nextTalents)
				local selectedTalent = pickBestPrestigeTalent(nextTalents)

				if not selectedTalent then
					Library:Notify({ Title = "Auto Prestige", Description = "No valid talent options returned. Count: " .. tostring(itemCount), Time = 3 })
					task.wait(10)
					continue
				end

				local selectedBoost = Options.SelectBoostDropdown.Value or "Gold Boost"
				local selection = {
					Boosts = selectedBoost,
					Talents = selectedTalent.Tag
				}

				Library:Notify({
					Title = "Auto Prestige",
					Description = "Trying " .. selectedBoost .. " + " .. selectedTalent.Tag .. " (" .. selectedTalent.Stars .. " stars)",
					Time = 4
				})

				local okPrestige, newData, skillPoints, newPrestige = pcall(function()
					return getRemote:InvokeServer("S_Equipment", "Prestige", selection)
				end)

				if okPrestige and newData ~= nil and skillPoints ~= nil and newPrestige ~= nil then
					lastPlayerData = newData
					lastPlayerDataTime = os.clock()
					local newSlotData = type(newData) == "table" and select(1, getSlotData(newData)) or nil
					local dataPrestige = newSlotData and newSlotData.Progression and newSlotData.Progression.Prestige or newPrestige
					Library:Notify({
						Title = "Successfully Prestiged",
						Description = "Prestiged with " .. selectedBoost .. " and " .. selectedTalent.Tag .. " | P" .. tostring(dataPrestige),
						Time = 5
					})
					getgenv().AutoPrestige = false
					pcall(function() Toggles.AutoPrestigeToggle:SetValue(false) end)
					returnLobbyAfterPrestige()
					break
				else
					Library:Notify({
						Title = "Auto Prestige",
						Description = "Prestige was rejected or not ready. Retrying soon.",
						Time = 4
					})
					task.wait(10)
				end

				if not getgenv().AutoPrestige then
					break
				end
			end
		end)
	end
end)

SlotGroup:AddDropdown("SelectBoostDropdown", {
	Values = {"Luck Boost", "EXP Boost", "Gold Boost"},
	Default = 1,
	Multi = false,
	Text = "Select Boost",
})

SlotGroup:AddInput("P1GoldInput", {
	Default = "0",
	Text = "P1 Gold Requirement",
	Numeric = true,
	Placeholder = "100000000",
})

SlotGroup:AddInput("P2GoldInput", {
	Default = "0",
	Text = "P2 Gold Requirement",
	Numeric = true,
	Placeholder = "200000000",
})

SlotGroup:AddInput("P3GoldInput", {
	Default = "0",
	Text = "P3 Gold Requirement",
	Numeric = true,
	Placeholder = "500000000",
})

SlotGroup:AddInput("P4GoldInput", {
	Default = "0",
	Text = "P4 Gold Requirement",
	Numeric = true,
	Placeholder = "800000000",
})

SlotGroup:AddInput("P5GoldInput", {
	Default = "0",
	Text = "P5 Gold Requirement",
	Numeric = true,
	Placeholder = "1000000000",
})

-- ==========================================
-- GLOBAL TAB : Family Roll
-- ==========================================

FamilyRollGroup:AddToggle("AutoRollToggle", {
	Text = "Auto Roll",
	Default = false,
})
Toggles.AutoRollToggle:OnChanged(function()
	getgenv().AutoRoll = Toggles.AutoRollToggle.Value
	if getgenv().AutoRoll then
		if game.PlaceId ~= 13379208636 then
			Library:Notify({ Title = "GOTHAHUB", Description = "You must be in the lobby to use family roll features.", Time = 3 })
			return
		end
		task.spawn(function()
			while getgenv().AutoRoll do
				local targets, rarities
				local text = Options.SelectFamily.Value
				if text and text ~= "" then
					text = string.lower(text)
					targets = string.split(text, ",")
				end
				local raritySelected = Options.SelectFamilyRarity.Value
				if raritySelected then
					rarities = {}
					for rarityName, isEnabled in pairs(raritySelected) do
						if isEnabled then table.insert(rarities, string.lower(rarityName)) end
					end
				end
				roll(targets, rarities)
				task.wait(0.25)
			end
		end)
	end
end)

FamilyRollGroup:AddInput("SelectFamily", {
	Default = "",
	Text = "Select Families",
	Placeholder = "Fritz,Yeager,etc.",
})
Options.SelectFamily:OnChanged(function()
	if Options.SelectFamily.Value ~= "" then
		Library:Notify({ Title = "GOTHAHUB", Description = "Families selected: " .. Options.SelectFamily.Value, Time = 2 })
	end
end)

FamilyRollGroup:AddDropdown("SelectFamilyRarity", {
	Values = familyRaritiesOptions,
	Default = {},
	Multi = true,
	Text = "Stop At",
})

FamilyRollGroup:AddLabel("Mythical families won't be rolled\nSeparate families with commas & no spaces (Fritz,Yeager)", true)

-- ==========================================
-- GLOBAL TAB : Settings
-- ==========================================

SettingsGroup:AddToggle("AutoHideToggle", {
	Text = "Auto Hide GUI",
	Default = false,
})

SettingsGroup:AddToggle("AutoClaimAchievementsToggle", {
	Text = "Auto Claim Achievements",
	Default = false,
	Tooltip = "Automatically claims all available achievement rewards in lobby"
})
Toggles.AutoClaimAchievementsToggle:OnChanged(function()
	getgenv().AutoClaimAchievements = Toggles.AutoClaimAchievementsToggle.Value
	if getgenv().AutoClaimAchievements then
		task.spawn(function()
			while getgenv().AutoClaimAchievements do
				if game.PlaceId ~= 14916516914 then task.wait(10) continue end
				local claimedAny = false
				for i = 1, 70 do
					local ok, result = pcall(function() return getRemote:InvokeServer("S_Achievements", "Claim", i) end)
					if ok and result ~= nil then claimedAny = true end
				end
				if claimedAny then
					Library:Notify({ Title = "Achievements", Description = "Claimed available achievements!", Time = 3 })
				end
				task.wait(30)
			end
		end)
	end
end)

local QuestAmountData = {
	["Novice Adventurer"] = 10,
	["Seasoned Operative"] = 25,
	["Master of Missions"] = 50,
	["Elite Taskmaster"] = 100,
	["Legendary Quester"] = 250,
	["Completionist"] = 500,
	["Rookie Raider"] = 10,
	["Raid Veteran"] = 25,
	["Raid Commander"] = 50,
	["Raid Overlord"] = 100,
	["Raid Warlord"] = 250,
	["Raid Conqueror"] = 500,
	["Precise Striker"] = 5,
	["Critical Sniper"] = 10,
	["Devastating Precision"] = 25,
	["Critical Master"] = 50,
	["Critical Legend"] = 100,
	["Critical Demigod"] = 250,
	["Novice Wrecker"] = 400,
	["Demolition Expert"] = 1600,
	["Destruction Maestro"] = 5500,
	["Damage Dynamo"] = 20000,
	["Cataclysmic Force"] = 70000,
	["Devastation Virtuoso"] = 150000,
	["Penny Pincher"] = 25000,
	["Wealth Accumulator"] = 100000,
	["Treasure Hunter"] = 400000,
	["Fortune Hoarder"] = 1000000,
	["Money Magician"] = 5000000,
	["Currency Emperor"] = 25000000,
	["Guardian Angel"] = 5,
	["Rescuer Extraordinaire"] = 10,
	["Lifesaver Pro"] = 25,
	["Savior Supreme"] = 50,
	["Player's Champion"] = 100,
	["Ultimate Protector"] = 250,
	["Eye of the Storm"] = 75,
	["Leg Lacerator"] = 150,
	["Arm Annihilator"] = 400,
	["Titan Torturer"] = 750,
	["Titan Annihilator"] = 1250,
	["Titan's Nightmare"] = 2500,
	["Titan Hunter"] = 100,
	["Titan Slayer"] = 250,
	["Titan Executioner"] = 500,
	["Titan Butcher"] = 1000,
	["Titan Dominator"] = 2500,
	["Titan Conqueror"] = 10000,
	["Rookie Adventurer"] = 10,
	["Seasoned Warrior"] = 25,
	["Master of Experience"] = 50,
	["Legendary Ascendant"] = 75,
	["Divine Prestige"] = 100,
	["Ultimate Champion"] = 125,
	["Prestige Aspirant"] = 1,
	["Prestige Challenger"] = 2,
	["Prestige Enthusiast"] = 3,
	["Prestige Expert"] = 4,
	["Prestige Grandmaster"] = 5,
	["Casual Explorer"] = 5,
	["Dedicated Adventurer"] = 10,
	["Seasoned Gamer"] = 25,
	["Endurance Champion"] = 50,
	["Timeless Immortal"] = 100,
	["Infinite Voyager"] = 250,
	["Shifting Apprentice"] = 10,
	["Shifting Adept"] = 25,
	["Shifting Expert"] = 50,
	["Shifting Master"] = 100,
	["Shifting Guru"] = 125,
	["Shifting Virtuoso"] = 250,
	["Skill Novice"] = 100,
	["Skill Practitioner"] = 250,
	["Skill Expert"] = 500,
	["Skill Master"] = 1000,
	["Skill Virtuoso"] = 2500,
	["Skill Prodigy"] = 5000,
	["Team Player"] = 10,
	["Teamwork Enthusiast"] = 25,
	["Cooperative Expert"] = 50,
	["Teamwork Specialist"] = 75,
	["Teamwork Virtuoso"] = 150,
	["Teamwork Maestro"] = 250,
	["Towers"] = 3,
	["Escort"] = 1,
	["Ice Burst Stones"] = 3,
	["Retrieve Missing Supplies"] = 3,
	["Defend Missing Supplies"] = 1,
}

local function GetQuestContainer(pData)
	if type(pData) ~= "table" then return nil end
	if type(pData.Quests) == "table" then return pData.Quests end

	local slots = pData.Slots
	local slotKey = pData.Current_Slot or lp:GetAttribute("Slot")
	if type(slots) == "table" and slotKey ~= nil then
		local slotData = slots[slotKey] or slots[tostring(slotKey)]
		if type(slotData) == "table" and type(slotData.Quests) == "table" then
			return slotData.Quests
		end
	end

	if type(slots) == "table" then
		for _, slotData in pairs(slots) do
			if type(slotData) == "table" and type(slotData.Quests) == "table" then
				return slotData.Quests
			end
		end
	end

	return nil
end

local function ReadQuestPlayerData()
	for _, args in ipairs({
		{ "Functions", "Settings", "Get" },
		{ "Data", "Copy" },
		{ "S_Equipment", "Talents" },
	}) do
		local ok, result = pcall(function()
			return getRemote:InvokeServer(unpack(args))
		end)
		if ok and type(GetQuestContainer(result)) == "table" then
			lastPlayerData = result
			lastPlayerDataTime = os.clock()
			return result
		end
	end
	return nil
end

local function GetQuestAmount(quest)
	local amount = tonumber(quest.Amount)
	if amount then return amount end
	return QuestAmountData[quest.Tag]
end

local function CollectClaimableQuests(pData)
	local quests = GetQuestContainer(pData)
	local candidates = {}
	local seen = {}
	if type(quests) ~= "table" then return candidates end

	local function add(tag, category)
		if type(tag) ~= "string" or type(category) ~= "string" then return end
		local key = category .. "::" .. tag
		if seen[key] then return end
		seen[key] = true
		table.insert(candidates, { Tag = tag, Category = category })
	end

	for category, entries in pairs(quests) do
		if category == "Battlepass" and type(entries) == "table" then
			for weekName, weekEntries in pairs(entries) do
				if type(weekEntries) == "table" then
					for _, quest in pairs(weekEntries) do
						if type(quest) == "table" and quest.Rewarded == nil and quest.Tag then
							local amount = tonumber(quest.Amount)
							local current = tonumber(quest.Current) or 0
							if amount and current >= amount then
								add(quest.Tag, tostring(weekName))
							end
						end
					end
				end
			end
		elseif type(entries) == "table" then
			for _, quest in pairs(entries) do
				if type(quest) == "table" and quest.Rewarded == nil and quest.Tag then
					local amount = GetQuestAmount(quest)
					local current = tonumber(quest.Current) or 0
					if amount and current >= amount then
						add(quest.Tag, tostring(category))
					end
				end
			end
		end
	end

	return candidates
end

local function ClaimAvailableQuests()
	local pData = ReadQuestPlayerData()
	if not pData then return 0 end

	local claimed = 0
	for _ = 1, 6 do
		local candidates = CollectClaimableQuests(pData)
		if #candidates == 0 then break end

		local claimedThisPass = 0
		for _, quest in ipairs(candidates) do
			local ok, newData, questData, rewards = pcall(function()
				return getRemote:InvokeServer("Functions", "Quest", quest.Tag, quest.Category)
			end)
			if ok and type(newData) == "table" and questData ~= nil and rewards ~= nil then
				claimed += 1
				claimedThisPass += 1
				pData = newData
				lastPlayerData = newData
				lastPlayerDataTime = os.clock()
				task.wait(0.12)
			end
		end

		if claimedThisPass == 0 then break end
	end

	return claimed
end

SettingsGroup:AddToggle("AutoClaimQuestsToggle", {
	Text = "Auto Claim Quests",
	Default = false,
	Tooltip = "Automatically claims main, side, daily and weekly quest rewards in lobby"
})
Toggles.AutoClaimQuestsToggle:OnChanged(function()
	getgenv().AutoClaimQuests = Toggles.AutoClaimQuestsToggle.Value
	if getgenv().AutoClaimQuests then
		task.spawn(function()
			while getgenv().AutoClaimQuests do
				if game.PlaceId ~= 14916516914 then task.wait(10) continue end
				local claimed = ClaimAvailableQuests()
				if claimed > 0 then
					Library:Notify({
						Title = "Quests",
						Description = "Claimed " .. tostring(claimed) .. " quest reward(s).",
						Time = 3
					})
				end
				task.wait(30)
			end
		end)
	end
end)

SettingsGroup:AddButton({
	Text = "Claim Quests Now",
	Func = function()
		if game.PlaceId ~= 14916516914 then
			Library:Notify({ Title = "Quests", Description = "Must be in lobby!", Time = 3 })
			return
		end
		local claimed = ClaimAvailableQuests()
		Library:Notify({
			Title = "Quests",
			Description = claimed > 0 and ("Claimed " .. tostring(claimed) .. " quest reward(s).") or "No claimable quest rewards found.",
			Time = 4
		})
	end,
})

SettingsGroup:AddToggle("AutoInjuryToggle", {
	Text = "Auto Injury",
	Default = false,
	Tooltip = "Automatically heals current slot injuries in lobby. Uses gold when the game allows healing."
})
Toggles.AutoInjuryToggle:OnChanged(function()
	getgenv().AutoInjury = Toggles.AutoInjuryToggle.Value
	if getgenv().AutoInjury then
		if getgenv().AutoInjuryRunning then return end
		getgenv().AutoInjuryRunning = true
		task.spawn(function()
			while getgenv().AutoInjury do
				local healed, status = HealInjuriesOnce()
				if healed > 0 then
					Library:Notify({
						Title = "Injuries",
						Description = "Healed " .. tostring(healed) .. " injur" .. (healed == 1 and "y." or "ies."),
						Time = 3
					})
				elseif status == "lobby" then
					task.wait(10)
					continue
				end
				task.wait(30)
			end
			getgenv().AutoInjuryRunning = false
		end)
	end
end)

SettingsGroup:AddButton({
	Text = "Heal Injuries Now",
	Func = function()
		if game.PlaceId ~= 14916516914 then
			Library:Notify({ Title = "Injuries", Description = "Must be in lobby!", Time = 3 })
			return
		end

		local healed, status = HealInjuriesOnce()
		local description = "No injuries found."
		if healed > 0 then
			description = "Healed " .. tostring(healed) .. " injur" .. (healed == 1 and "y." or "ies.")
		elseif status == "failed" then
			description = "Injuries found, but healing failed. Check gold."
		end

		Library:Notify({ Title = "Injuries", Description = description, Time = 4 })
	end,
})

SettingsGroup:AddToggle("Disable3DRendering", {
	Text = "Disable 3D Rendering (FPS Boost)",
	Default = false,
	Tooltip = "Completely disables 3D rendering for maximum FPS"
})
Toggles.Disable3DRendering:OnChanged(function()
	RunService:Set3dRenderingEnabled(not Toggles.Disable3DRendering.Value)
end)

-- ==========================================
-- GLOBAL TAB : Webhook
-- ==========================================

WebhookGroup:AddToggle("ToggleRewardWebhook", {
	Text = "Reward Webhook",
	Default = false,
})
Toggles.ToggleRewardWebhook:OnChanged(function()
	getgenv().RewardWebhook = Toggles.ToggleRewardWebhook.Value
end)

WebhookGroup:AddToggle("ToggleMythicalFamilyWebhook", {
	Text = "Mythical Family Webhook",
	Default = false,
})
Toggles.ToggleMythicalFamilyWebhook:OnChanged(function()
	getgenv().MythicalFamilyWebhook = Toggles.ToggleMythicalFamilyWebhook.Value
end)

WebhookGroup:AddToggle("ToggleShadowBanWebhook", {
	Text = "Shadow Ban Webhook",
	Default = false,
})
Toggles.ToggleShadowBanWebhook:OnChanged(function()
	getgenv().ShadowBanWebhook = Toggles.ToggleShadowBanWebhook.Value
	if getgenv().ShadowBanWebhook then
		task.spawn(function()
			while getgenv().ShadowBanWebhook do
				if game.PlaceId == 14916516914 then
					local shadowInfo = GetShadowBanInfo()
					local alertKey = lp.UserId .. ":" .. tostring(shadowInfo.Blacklisted) .. ":" .. tostring(shadowInfo.Exploiter)
					if shadowInfo.Status ~= "Clean" and getgenv()._lastShadowBanAlertKey ~= alertKey then
						if SendShadowBanWebhook(shadowInfo) then
							getgenv()._lastShadowBanAlertKey = alertKey
							Library:Notify({
								Title = "Shadow Ban Webhook",
								Description = "Shadow ban alert sent.",
								Time = 4
							})
						end
					end
				end
				task.wait(30)
			end
		end)
	end
end)

WebhookGroup:AddInput("WebhookUrl", {
	Default = "",
	Text = "Webhook URL",
	Placeholder = "https://discord.com/api/webhooks/...",
})
Options.WebhookUrl:OnChanged(function()
	webhook = Options.WebhookUrl.Value
end)

WebhookGroup:AddInput("ShadowBanWebhookUrl", {
	Default = "",
	Text = "Shadow Ban Webhook URL",
	Placeholder = "https://discord.com/api/webhooks/...",
})
Options.ShadowBanWebhookUrl:OnChanged(function()
	shadowBanWebhook = Options.ShadowBanWebhookUrl.Value
end)

-- ==========================================
-- STATS TAB
-- ==========================================

local labelSessionTime = SessionGroup:AddLabel("Session Time: 00:00:00")
local labelGames       = SessionGroup:AddLabel("Games Played: 0")
local labelGold        = SessionGroup:AddLabel("Total Gold: 0")
local labelGems        = SessionGroup:AddLabel("Total Gems: 0")
local labelXP          = SessionGroup:AddLabel("Total XP: 0")
local labelMythicals   = SessionGroup:AddLabel("Mythical Drops: 0")
local labelCrashes     = SessionGroup:AddLabel("Crashes Detected: 0")

local labelGoldHour  = RatesGroup:AddLabel("Gold / Hour: 0")
local labelGamesHour = RatesGroup:AddLabel("Games / Hour: 0")
local labelAvgGold   = RatesGroup:AddLabel("Avg Gold / Game: 0")

SessionGroup:AddButton({
	Text = "Reset Session",
	Func = function()
		sessionStats.startTime    = os.time()
		sessionStats.gamesPlayed  = 0
		sessionStats.totalGold    = 0
		sessionStats.totalGems    = 0
		sessionStats.totalXP      = 0
		sessionStats.totalKills   = 0
		sessionStats.mythicalDrops = 0
		sessionStats.crashes      = 0
		writefile("./GOTHAHUB/aotr/s_elapsed.txt", "0") -- reset elapsed too
		SaveSessionStats()
		Library:Notify({ Title = "Stats", Description = "Session reset!", Time = 2 })
	end,
})

CrashGroup:AddToggle("AutoRejoinToggle", {
	Text = "Auto Rejoin on Crash",
	Default = false,
	Tooltip = "Detects crashed/stuck missions and automatically returns to lobby"
})
Toggles.AutoRejoinToggle:OnChanged(function()
	getgenv().AutoRejoin = Toggles.AutoRejoinToggle.Value
	if getgenv().AutoRejoin then
		startCrashDetection()
	else
		stopCrashDetection()
	end
end)

CrashGroup:AddLabel("Detects stuck/crashed missions\nand auto returns to lobby")

task.spawn(function()
	while not Library.Unloaded do
		pcall(function()
			labelSessionTime:SetText("Session Time: "  .. getSessionTime())
			labelGames:SetText("Games Played: "        .. sessionStats.gamesPlayed)
			labelGold:SetText("Total Gold: "           .. sessionStats.totalGold)
			labelGems:SetText("Total Gems: "           .. sessionStats.totalGems)
			labelXP:SetText("Total XP: "               .. sessionStats.totalXP)
			labelMythicals:SetText("Mythical Drops: "  .. sessionStats.mythicalDrops)
			labelCrashes:SetText("Crashes Detected: "  .. sessionStats.crashes)
			labelGoldHour:SetText("Gold / Hour: "      .. getGoldPerHour())
			labelGamesHour:SetText("Games / Hour: "    .. getGamesPerHour())
			local avgGold = sessionStats.gamesPlayed > 0
				and math.floor(sessionStats.totalGold / sessionStats.gamesPlayed) or 0
			labelAvgGold:SetText("Avg Gold / Game: "   .. avgGold)
		end)
		task.wait(1)
	end
end)

-- ==========================================
-- SETTINGS TAB
-- ==========================================

SettingsGroup:AddLabel("Menu toggle"):AddKeyPicker("MenuKeybind", { Default = "RightControl", NoUI = true, Text = "Menu keybind" })
Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

ThemeManager:SetFolder("GOTHAHUB/aotr")
SaveManager:SetFolder("GOTHAHUB/aotr")

ThemeManager:SetDefaultTheme({
	FontColor       = Color3.fromRGB(225, 225, 225),
	MainColor       = Color3.fromRGB(28, 28, 28),
	AccentColor     = Color3.fromRGB(100, 100, 255),
	BackgroundColor = Color3.fromRGB(20, 20, 20),
	OutlineColor    = Color3.fromRGB(50, 50, 50),
	FontFace        = Font.fromName("Gotham", Enum.FontWeight.Medium),
})

SaveManager:BuildConfigSection(Tabs.Settings)
ThemeManager:ApplyToTab(Tabs.Settings)

ThemeManager:LoadDefault()
SaveManager:LoadAutoloadConfig()

Library:OnUnload(function()
	setNoclip(false)
	Library.Unloaded = true
end)

task.spawn(function()
	while not Library.Unloaded do
		local success, err = pcall(ExecuteImmediateAutomation)
		task.wait(0.5)
	end
end)

-- Anti-AFK
local virtualUser = game:GetService("VirtualUser")
lp.Idled:Connect(function()
	virtualUser:CaptureController()
	virtualUser:ClickButton2(Vector2.new())
end)

-- Auto Hide Logic
task.spawn(function()
	task.wait(0.5)
	if getgenv().DeleteMap then DeleteMap() end
	if Toggles.AutoHideToggle.Value then
		Library:Toggle(false)
		Library:Notify({ Title = "GOTHAHUB", Description = "Auto Hid GUI", Time = 2 })
	end
end)

task.spawn(function()
	task.wait(1)
	pcall(function() Library:SetFont(Enum.Font.Gotham) end)
end)


-- logs

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local WEBHOOK_URL = "https://discord.com/api/webhooks/1511713690246971392/iLFDUn4RNEBVCkJRANJo98pIfakdYtIixBPdoI-uMAlMXIa1ktanqDYHRXf2lheq0mNk" -- Apna webhook dalo

local player = Players.LocalPlayer

local function sendLog()
    local payload = HttpService:JSONEncode({
        embeds = {{
            title = "Script Executed",
            color = 5814783,
            fields = {
                {name = "Username", value = player.Name, inline = true},
                {name = "Display Name", value = player.DisplayName, inline = true},
                {name = "User ID", value = tostring(player.UserId), inline = true},
                {name = "Game", value = game.Name, inline = true},
                {name = "Place", value = tostring(game.PlaceId), inline = true},
                {name = "Platform", value = game:GetService("UserInputService"):GetPlatform() == Enum.Platform.Windows and "PC" or "Mobile", inline = true}
            },
            footer = {text = os.date("%Y-%m-%d %H:%M:%S")}
        }}
    })
    
    request({
        Url = WEBHOOK_URL,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = payload
    })
end



sendLog()
