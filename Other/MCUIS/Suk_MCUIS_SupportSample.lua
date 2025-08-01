--=================================================================================================================
-- CONSTANTS
-- Global variables should NOT be used if this file is imported for inclusion
--=================================================================================================================
local sMessage = "Thou art a Mighty Banana"
--=================================================================================================================
-- Suk_MCUIS_RequestRegistration
-- This is run once when the script it loaded
-- Simply register the names you want with RegisterUnitIcon or RegisterCityIcon
--
-- If an MCUIS is civ specific for instance, you may not want to register the icon
-- if the local player leads a different civilization
--=================================================================================================================
function OnSuk_MCUIS_RequestRegistration(pRegistration)
	pRegistration:RegisterUnitIcon("Suk_Sample_Basic")
	pRegistration:RegisterCityIcon("Suk_Sample_Advanced")
end
LuaEvents.Suk_MCUIS_RequestRegistration.Add(OnSuk_MCUIS_RequestRegistration)
--=================================================================================================================
-- Suk_MCUIS_QueryIcon
-- This is run whenever the MCUIS panel is refreshed
-- This is where you can set whether an instance should be generated for this icon
-- and basic info, if you're not trying to do anything particularly fancy

-- sContext will be either Unit or City

-- sName will be a registered icon, check that it matches the name registered above
-- before continuing

-- pIcon is a custom Lua class: you will not be able to edit this directly, instead, please use the following methods:

-- pIcon:SetMakeInstance(bBool)			// Controls whether an Instance shoulde be generated, it is false by default
-- pIcon:SetRequestInstance(bBool)		// Controls whether LuaEvent.Suk_MCUIS_RequestedIcon should be called for advanced control, it is false by default

-- pIcon:SetSortOrder(iIndex)			// Sets sort order, lower comes first, it is 0 by default
-- pIcon:SetDescription(sDescription)	// Sets Tooltip String, it is nil by default (no tooltip)
-- pIcon:SetIcon(sIcon)					// Sets Icon, it is ICON_UNITCOMMAND_PET_THE_DOG by default

-- pIcon:SetTexture(sTexture, iX, iY)
	-- // Sets Icon Texture, iX and iY are the TextureOffsets, and will default to 0 if not provided. This overrides SetIcon

-- pIcon:SetBackingTexture(sTexture, iX, iY)
	-- //Same as SetTexture, but for the Icon backing, defaults are UnlockFrames. 114, 0 (the improvement backing from the Tech Tree)

--	pIcon:SetIconData(bMake, bRequest, sDescription, sIcon, iX, iY, iIndex)
	-- // This is a combo of everything aboive except SetBackingTexture
	-- If iX and iY are both provided, it sets the Icon Texture, otherwise, it sets the Icon
	-- if sIcon, or iIndex are not provided, they will not be changed from the default values
--=================================================================================================================
function OnSuk_MCUIS_QueryIcon(sContext, sName, pIcon)
	if sContext == "Unit" and sName == "Suk_Sample_Basic" then
		pIcon:SetIconData(true, false, "This is a Basic Icon", "ICON_UNITCOMMAND_PET_THE_DOG", nil, nil, 20)
	end
	if sContext == "City" and sName == "Suk_Sample_Advanced" then
		pIcon:SetIconData(true, true, "This is an Advanced Icon", "ICON_IMPROVEMENT_ROCK_HEWN_CHURCH", nil, nil, 20)
	end
end
LuaEvents.Suk_MCUIS_QueryIcon.Add(OnSuk_MCUIS_QueryIcon)
--=================================================================================================================
-- Suk_MCUIS_RequestedIcon
-- Danger Zone! With great power comes great responsibility!
-- This event provides you with the Icon Instance to manage directly
-- So you can use this to set up custom tooltips, add input callbacks, and other fancy things
-- But I'm relying on you to clean up after yourself if you make any adjustments!!!
--
-- So if you change anything here aside from Icon, Icon Backing, and Tooltip String
-- You will need to provide a OnResetting function to undo those changes
--=================================================================================================================
function OnSuk_MCUIS_RequestedIcon(sContext, sName, tInstance)
	if sContext == "City" and sName == "Suk_Sample_Advanced" then
		----------------------------
		-- Set Callback Function
		----------------------------
		tInstance.IconFrame:RegisterCallback(Mouse.eLClick,
			function()
				print(sMessage)
			end
		)
		----------------------------
		-- OnResetting
		----------------------------
		tInstance.OnResetting = function(tSelf)

			-- I set a callback function so remove it!
			tSelf.IconFrame:ClearCallback(Mouse.eLClick)

			-- Remove this function
			tSelf.OnResetting = nil
		end
		----------------------------
		----------------------------
	end
end
LuaEvents.Suk_MCUIS_RequestedIcon.Add(OnSuk_MCUIS_RequestedIcon)
--=================================================================================================================
--=================================================================================================================