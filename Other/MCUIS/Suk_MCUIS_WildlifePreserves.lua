--==========================================================================================================================
--<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
--==========================================================================================================================
-- CONSTANTS
--==========================================================================================================================
-- Ok so, this is imported rather than added to gameplay scripts. Also it has to start with "Suk_MCUIS_"
-- since it is imported one MUST NOT use global variables
-- Anyway, it is useful to define the local variables first
--==========================================================================================================================
--<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
--==========================================================================================================================
local iWildlifeClass = "CLASS_PRESERVE_WILDLIFE"
local iWildlifeFavor = 1
local iPrehistoricClass = "CLASS_PRESERVE_PREHISTORIC_WILDLIFE"
local iPrehistoricFavor = 2

local iWildlifeFaith = 3
local iWildlifeScience = 3

print("Wildlife MCUIS icon loaded")

local tvalidDistricts = {}
tvalidDistricts[1] = "DISTRICT_PRESERVE"
tvalidDistricts[2] = "DISTRICT_LEU_GARDEN"


local tvalidBuildings = {}
tvalidBuildings[1] = "BUILDING_GROVE"
tvalidBuildings[2] = "BUILDING_SANCTUARY"
tvalidBuildings[3] = "BUILDING_LEU_PAVILLION"
tvalidBuildings[5] = "BUILDING_LEU_CONSERVATORY"

-- Canine/Ursa Names
local tUrsaCanineNames = {"Wojtek", "Balto", "Fenrir", "White Fang", "Lupa", "Baloo", "Hei Bai", "Teddy", "Misha", "Nanook", "Winnie", "Yogi", "Faljor", "Bosco", "Kuma", "Mei Xiang", "Lassie", "Smoky", "Ralph", "Xoloitzcuintli", "Sherman", "Koda"}
local iClassUrsaCanine = "CLASS_LEU_WILDLIFE_CANINE_URSA";
-- Feline Names
local tFelineNames = {"Mufasa", "Scar", "Simba", "Kimba", "Smudge", "Aslan", "Bagheera", "Tiberius", "Shere Khan", "Hunter", "Sekhmet", "Byakko", "Tony", "Paws", "Elsa", "Foggy", "Hobbes", "Pura", "Chester", "Titi", "Willow", "Tiny"}
local iClassFeline = "CLASS_LEU_WILDLIFE_FELINE";
-- Reptile Names
local tReptileNames = {"Mushu", "Wally", "King Kururu", "Barney", "Loki", "Tick Tock", "Sobek", "Lacoste", "Ghidorah", "Smaug", "Godzilla", "Jormungandr", "Snek", "Reggie", "Bumpy", "Bindi", "Graham", "Acco", "Little Foot", "Puk", "Norbert", "Croc"}
local iClassReptile = "CLASS_LEU_WILDLIFE_REPTILE";
-- Marine Names
local tMarineNames = {"Willy", "Keiko", "Nemo", "Neptune", "Poseidon", "Bubbles", "Moby Dick", "Monstro", "Bruce", "Leviathan", "Tilikum", "Shamu", "Winter", "Baby", "Humphrey", "Migaloo", "Kanik", "Mitzie", "Namu", "Rongomai", "Jake", "Cousteau"}
local iClassMarine = "CLASS_LEU_WILDLIFE_MARINE";
-- Herbivore Names
local tHerbivoreNames = {"Harambe", "Bigfoot", "Aldo", "Caesar", "Winston", "Goliath", "Jiggs", "Wukong", "Fiona", "Koko", "Mukenko", "Clara", "Ham", "David", "Abu", "Spike", "George", "Bubbles", "Zaius", "Sudan", "Kong", "Pogo"}
local iClassHerbivore = "CLASS_LEU_WILDLIFE_HERBIVORE";

--==========================================================================================================================
--==========================================================================================================================
--<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
--==========================================================================================================================
--==========================================================================================================================
--<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
--==========================================================================================================================
--==========================================================================================================================
--<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
--==========================================================================================================================
--==========================================================================================================================
--<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
--==========================================================================================================================
--==========================================================================================================================
--<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
--==========================================================================================================================
--==========================================================================================================================
--<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
--==========================================================================================================================
--==========================================================================================================================
--<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
--==========================================================================================================================
--==========================================================================================================================
--<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
--==========================================================================================================================
--==========================================================================================================================
--<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
--==========================================================================================================================
--==========================================================================================================================
--<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
--==========================================================================================================================
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- UTILS
----------------------------------------------------------------------------------------------------------------------------
local iMod = (GameInfo.GameSpeeds[GameConfiguration.GetGameSpeedType()].CostMultiplier)/100;

-- HasPolicy
function Leu_PlayerHasPolicy(pPlayer, strPolicy)
	return pPlayer:GetCulture():IsPolicyActive(GameInfo.Policies["" .. strPolicy .. ""].Index)
end
-- Valid Units from Class checker
function Leu_IsUnitClass(unitname, validclass)
	for row in GameInfo.TypeTags() do
		local iUnitType = row.Type
		local iUnitClass = row.Tag
		if iUnitType == unitname then
			if iUnitClass == validclass then
				return true
			end
		end 
	end
	return false
end


-- Valid District Table Maker
local iDistrict
local nValidDistricts=0

for n, iDistrict in ipairs(tvalidDistricts) do
	nValidDistricts = nValidDistricts+1
	----print(iDistrict)
end
local currentnValidDistricts = nValidDistricts
for row in GameInfo.DistrictReplaces() do
	local iUniqueDistrictType = row.CivUniqueDistrictType
	local iReplacesDistrictType = row.ReplacesDistrictType
	for i = 1, currentnValidDistricts, 1 do
		if iReplacesDistrictType == tvalidDistricts[i] then
			nValidDistricts = nValidDistricts + 1
			tvalidDistricts[nValidDistricts] = iUniqueDistrictType
			----print(iUniqueDistrictType)
		end
	end
end

local iBuilding
local nValidBuildings = 0
-- Valid District Table Maker
for n, iBuilding in ipairs(tvalidBuildings) do
	nValidBuildings = nValidBuildings + 1
	----print(iDistrict)
end
local currentnValidBuildings = nValidBuildings
for row in GameInfo.BuildingReplaces() do

	local iUniqueBuildingType = row.CivUniqueBuildingType
	local iReplacesBuildingType = row.ReplacesBuildingType
	for i = 1, currentnValidBuildings, 1 do
		if iReplacesBuildingtType == tvalidBuildings[i] then
			nValidBuildings = nValidBuildings + 1
			tvalidBuildings[nValidBuildings] = iUniqueBuildingType
		end
	end
end

-- WildlifeChecker
function Leu_CheckNumWildlife(iPlot)
	--print("Checking if plot has wildlife")
	local iNum = 0
	local pUnitList = Map.GetUnitsAt(iPlot);
	--print("We got the unit table")
	if pUnitList ~= nil and table.count(pUnitList) > 0 then
		--print("the unit table aint nil")
		--print("the table has " .. table.count(pUnitList) .. " units")
		local pUnit
		for pUnit in pUnitList:Units() do
			if pUnit ~= nil then
				--print("Checking units at the tile")
				local pUnitName = GameInfo.Units[pUnit:GetUnitType()].UnitType;
				--print(pUnitName)
				if Leu_IsUnitClass(pUnitName, iWildlifeClass) then
					--print ("We found wildlife")
					iNum = iNum + 1
				end
				--print("finished checking units")
			end
		end
	end
	--if iNum > 0 then --print("Wildlife unit found") end
	--print (iNum)
	return iNum
end

function Leu_GetRandomName(iTable)
	--print("b")
	local wildlifeRand = math.random(1, 22)
	--print(wildlifeRand)
	local str = "Cookie"
	if iTable == 1 then
		str = tUrsaCanineNames[wildlifeRand]
	elseif iTable == 2 then
		--print("C")
		str = tFelineNames[wildlifeRand]
	elseif iTable == 3 then
		str = tReptileNames[wildlifeRand]
	elseif iTable == 4 then
		str = tMarineNames[wildlifeRand]
	elseif iTable == 5 then
		str = tHerbivoreNames[wildlifeRand]
	end
	--print(str)
	return str
end
--==========================================================================================================================
-- REGISTRATION
--==========================================================================================================================
-- Suk_MCUIS_RequestRegistration
-- This is run once when the script it loaded
-- Simply register the names you want with RegisterUnitIcon or RegisterCityIcon
--
-- If an MCUIS is civ specific for instance, you may not want to register the icon
-- if the local player leads a different civilization
--=================================================================================================================
function OnSuk_MCUIS_RequestRegistration(pRegistration)
	pRegistration:RegisterCityIcon("LEU_WILDLIFE_PRESERVE_INFO")
	pRegistration:RegisterUnitIcon("LEU_WILDLIFE_RENAME")
end
LuaEvents.Suk_MCUIS_RequestRegistration.Add(OnSuk_MCUIS_RequestRegistration)

--==========================================================================================================================
-- QUERY ICON
--==========================================================================================================================
-- Suk_MCUIS_QueryIcon
-- This is run whenever the MCUIS panel is refreshed
-- This is where you can set whether an instance should be generated for this icon
-- and basic info, if you're not trying to do anything particularly fancy
-- You can check info from the selected unit or city using UI.GetSelectedUnit() or UI.GetHeadSelectedCity() respectively
-- the data is then showin with pIcon:SetIconData (bMake, bRequest, sDescription, sIcon, iX, iY, iIndex)
----- bMake refers to whether the instance should be generated (false means no icon)
----- bRequest controls whether LuaEvent.Suk_MCUIS_RequestedIcon should be called for advanced control, it is false by default (and unless you need a clickable button it is best left as false)
----- sDescription is jus the tooltip
----- sIcon is just the icon 
----- iX and iY is if you need texture offfset coordinates from the texture file, like if its an atlas and shite, but y'know icons usually already have this by default (so its 0,0)
----- iIndex is the sort order, lower comes first, 20 seems like a good default if its secondary information.
--=================================================================================================================
function OnSuk_MCUIS_QueryIcon(sContext, sName, pIcon)
	if sContext == "City" and sName == "LEU_WILDLIFE_PRESERVE_INFO" then
		--print("We are trying to show the preserve icon now")
		-- All of this is just specific info getting for this icon
		pObject = UI.GetHeadSelectedCity()
		if not pObject then return end
		--
		local numBuildings = 0
		local iBuilding
		for n, iBuilding in pairs(tvalidBuildings) do
			if pObject:GetBuildings():HasBuilding(GameInfo.Buildings[tvalidBuildings[n]].Index) then 
				numBuildings = numBuildings + 1
			end
		end
		--
		local iNumberWildlife = 0
		local pCityDistricts = pObject:GetDistricts()
		for i, district in pCityDistricts:Members() do
			local locX = district:GetX();
			local locY = district:GetY();
			local kPlot = Map.GetPlot(locX,locY);
			if district:IsComplete() then
				local districtInfo = GameInfo.Districts[district:GetType()];
				local districtType = districtInfo.DistrictType;	
				local plotID		:number = kPlot:GetIndex();	
				for n, iDistrict in pairs(tvalidDistricts) do
					if districtType == iDistrict then
						print("MCUIS player has a preserve")
						if pCityDistricts:IsPillaged(district:GetType(), plotID) == false then
							--print ("The preserve is NOT pillaged")
							-- So now we check how many Wildlife and Prehistoric unit are within 1 tile of the Preserve
							iNumberWildlife = Leu_CheckNumWildlife(kPlot)
							for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1  do
								local adjacentPlot = Map.GetAdjacentPlot(locX, locY, direction);
								if (adjacentPlot ~= nil) then
									local iAdjNumberWildlife = Leu_CheckNumWildlife(adjacentPlot)
									iNumberWildlife = iNumberWildlife + iAdjNumberWildlife
								end
							end
						end
					end
				end
			end
		end
		--
		--print (iNumberScienceWildlife)
		--print (iNumberFaithWildlife)
		--print (iNumberFavorWildlife)
		if iNumberWildlife == 0 then return end
		if numBuildings == 0 then
			pIcon:SetIconData(true, false, Locale.Lookup("MOD_LEU_WILDLIFE_PRESERVE_ACTIVE", iNumberWildlife*3), "ICON_MCUIS_LEU_LOCAL_FAUNA", nil, nil, 20)
		elseif numBuildings == 1 then
			pIcon:SetIconData(true, false, Locale.Lookup("MOD_LEU_WILDLIFE_PRESERVE_ACTIVE_GROVE", iNumberWildlife*3, iNumberWildlife), "ICON_MCUIS_LEU_LOCAL_FAUNA", nil, nil, 20)
		elseif numBuildings == 2 then
			pIcon:SetIconData(true, false, Locale.Lookup("MOD_LEU_WILDLIFE_PRESERVE_ACTIVE_SANCTUARY", iNumberWildlife*3, iNumberWildlife, iNumberWildlife), "ICON_MCUIS_LEU_LOCAL_FAUNA", nil, nil, 20)
		end
		
			if iNumberFavorWildlife < 1 then
				
			else
				pIcon:SetIconData(true, false, Locale.Lookup("MOD_LEU_WILDLIFE_PRESERVE_FAVOR_ACTIVE", iNumberScienceWildlife, iNumberFaithWildlife, iNumberFavorWildlife), "ICON_MCUIS_LEU_LOCAL_FAUNA", nil, nil, 20)
			end
		--print("Displaying MCUIS for Wildlife Preserve")
		pIcon:SetBackingTexture("Leu-UnlockFrame-District", 0, 0)
	end
	if sContext == "Unit" and sName == "LEU_WILDLIFE_RENAME" then
		local pUnit = UI.GetHeadSelectedUnit();
		if pUnit == nil then return end
		local pUnitName = GameInfo.Units[pUnit:GetUnitType()].UnitType;
		local pUnitVetName = pUnit:GetExperience():GetVeteranName();
		local pUnitHasVetName = "fal" .. pUnitVetName .. "se"
		----print(pUnitVetName)
		if pUnitHasVetName ~= "false" then return end
		--
		if Leu_IsUnitClass(pUnitName, iClassUrsaCanine) then
			--
			local strName1 = Leu_GetRandomName(1)
			local strName2 = Leu_GetRandomName(1)
			if strName2 == strName1 then 
				strName2 = ", "
			end
			local strName3 = Leu_GetRandomName(1)
			local strLOC = "LOC_LEU_WILDLIFE_RENAME"
			if strName3 == strName1 or strName3 == strName2 then
				strName3 = "." 
			else
				if strName2 == ", " then strName2 = "" end
				strName3 = ", " .. strName3 .. "."
			end
			if srtName2 ~= ", " or strName2 ~= "" then
				strName2 = ", " .. strName2
			end
			if strName3 == "." and strName2 == ", " then 
				--print("k")
				strName2 = "."
				strName3 = ""
				strLOC = "LOC_LEU_WILDLIFE_RENAME_SINGULAR"	
			end
			--
			local str = strName1 .. strName2 .. strName3
			pIcon:SetIconData(true, false, Locale.Lookup(strLOC, str), "ICON_UNITCOMMAND_NAME_UNIT", nil, nil, 1)
			pIcon:SetBackingTexture("Leu-MCUIS-Frame-Action", 0, 0)
			--
		elseif Leu_IsUnitClass(pUnitName, iClassFeline) then
			--
			local strName1 = Leu_GetRandomName(2)
			local strName2 = Leu_GetRandomName(2)
			if strName2 == strName1 then 
				strName2 = ", "
			end
			local strName3 = Leu_GetRandomName(2)
			local strLOC = "LOC_LEU_WILDLIFE_RENAME"
			if strName3 == strName1 or strName3 == strName2 then
				strName3 = "." 
			else
				if strName2 == ", " then strName2 = "" end
				strName3 = ", " .. strName3 .. "."
			end
			if srtName2 ~= ", " or strName2 ~= "" then
				strName2 = ", " .. strName2
			end
			if strName3 == "." and strName2 == ", " then 
				--print("k")
				strName2 = "."
				strName3 = ""
				strLOC = "LOC_LEU_WILDLIFE_RENAME_SINGULAR"	
			end
			--
			local str = strName1 .. strName2 .. strName3
			pIcon:SetIconData(true, false, Locale.Lookup(strLOC, str), "ICON_UNITCOMMAND_NAME_UNIT", nil, nil, 1)
			pIcon:SetBackingTexture("Leu-MCUIS-Frame-Action", 0, 0)
			--
		elseif Leu_IsUnitClass(pUnitName, iClassReptile) then
			--
			local strName1 = Leu_GetRandomName(3)
			local strName2 = Leu_GetRandomName(3)
			if strName2 == strName1 then 
				strName2 = ", "
			end
			local strName3 = Leu_GetRandomName(3)
			local strLOC = "LOC_LEU_WILDLIFE_RENAME"
			if strName3 == strName1 or strName3 == strName2 then
				strName3 = "." 
			else
				if strName2 == ", " then strName2 = "" end
				strName3 = ", " .. strName3 .. "."
			end
			if srtName2 ~= ", " or strName2 ~= "" then
				strName2 = ", " .. strName2
			end
			if strName3 == "." and strName2 == ", " then 
				--print("k")
				strName2 = "."
				strName3 = ""
				strLOC = "LOC_LEU_WILDLIFE_RENAME_SINGULAR"	
			end
			--
			local str = strName1 .. strName2 .. strName3
			pIcon:SetIconData(true, false, Locale.Lookup(strLOC, str), "ICON_UNITCOMMAND_NAME_UNIT", nil, nil, 1)
			pIcon:SetBackingTexture("Leu-MCUIS-Frame-Action", 0, 0)
			--
		elseif Leu_IsUnitClass(pUnitName, iClassMarine) then
			--
			local strName1 = Leu_GetRandomName(4)
			local strName2 = Leu_GetRandomName(4)
			if strName2 == strName1 then 
				strName2 = ", "
			end
			local strName3 = Leu_GetRandomName(4)
			local strLOC = "LOC_LEU_WILDLIFE_RENAME"
			if strName3 == strName1 or strName3 == strName2 then
				strName3 = "." 
			else
				if strName2 == ", " then strName2 = "" end
				strName3 = ", " .. strName3 .. "."
			end
			if srtName2 ~= ", " or strName2 ~= "" then
				strName2 = ", " .. strName2
			end
			if strName3 == "." and strName2 == ", " then 
				--print("k")
				strName2 = "."
				strName3 = ""
				strLOC = "LOC_LEU_WILDLIFE_RENAME_SINGULAR"	
			end
			--
			local str = strName1 .. strName2 .. strName3
			pIcon:SetIconData(true, false, Locale.Lookup(strLOC, str), "ICON_UNITCOMMAND_NAME_UNIT", nil, nil, 1)
			pIcon:SetBackingTexture("Leu-MCUIS-Frame-Action", 0, 0)
			--
		elseif Leu_IsUnitClass(pUnitName, iClassHerbivore) then
			--
			local strName1 = Leu_GetRandomName(5)
			local strName2 = Leu_GetRandomName(5)
			if strName2 == strName1 then 
				strName2 = ", "
			end
			local strName3 = Leu_GetRandomName(5)
			local strLOC = "LOC_LEU_WILDLIFE_RENAME"
			if strName3 == strName1 or strName3 == strName2 then
				strName3 = "." 
			else
				if strName2 == ", " then strName2 = "" end
				strName3 = ", " .. strName3 .. "."
			end
			if srtName2 ~= ", " or strName2 ~= "" then
				strName2 = ", " .. strName2
			end
			if strName3 == "." and strName2 == ", " then 
				--print("k")
				strName2 = "."
				strName3 = ""
				strLOC = "LOC_LEU_WILDLIFE_RENAME_SINGULAR"	
			end
			--
			local str = strName1 .. strName2 .. strName3
			pIcon:SetIconData(true, false, Locale.Lookup(strLOC, str), "ICON_UNITCOMMAND_NAME_UNIT", nil, nil, 1)
			pIcon:SetBackingTexture("Leu-MCUIS-Frame-Action", 0, 0)
			--
		end
		--
	end
end

LuaEvents.Suk_MCUIS_QueryIcon.Add(OnSuk_MCUIS_QueryIcon)
--==========================================================================================================================
--==========================================================================================================================