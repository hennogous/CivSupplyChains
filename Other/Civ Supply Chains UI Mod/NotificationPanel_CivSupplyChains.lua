-- ===========================================================================
-- CACHE BASE FUNCTIONS
-- ===========================================================================
print("NotificationPanel_CivSupplyChains script loaded!!!")
local BASE_RegisterHandlers = RegisterHandlers;

local NewCityQuarterAbilityNotification 	= DB.MakeHash("NOTIFICATION_HENNO_NEW_CITY_QUARTER_ABILITY")
local UpdatedCityQuarterAbilityNotification = DB.MakeHash("NOTIFICATION_HENNO_UPDATED_CITY_QUARTER_ABILITY")
local RemovedCityQuarterAbilityNotification = DB.MakeHash("NOTIFICATION_HENNO_REMOVED_CITY_QUARTER_ABILITY")
-- ===========================================================================
function RegisterHandlers()
	BASE_RegisterHandlers();

	g_notificationHandlers[NewCityQuarterAbilityNotification]			= MakeDefaultHandlers();
	g_notificationHandlers[NewCityQuarterAbilityNotification].AddSound	= "ALERT_POSITIVE";
	--
	g_notificationHandlers[UpdatedCityQuarterAbilityNotification]			= MakeDefaultHandlers();
	g_notificationHandlers[UpdatedCityQuarterAbilityNotification].AddSound	= "ALERT_POSITIVE";
	
	g_notificationHandlers[RemovedCityQuarterAbilityNotification]			= MakeDefaultHandlers();
	g_notificationHandlers[RemovedCityQuarterAbilityNotification].AddSound	= "ALERT_NEGATIVE";
	-- Sounds
	----- ALERT_NEGATIVE
	----- ALERT_NEUTRAL
	----- ALERT_POSITIVE
	----- NOTIFICATION_MISC_POSITIVE
	----- NOTIFICATION_REBELLION
	----- UNIT_PROMOTION_AVAILABLE
	----- NOTIFICATION_OTHER_CIV_BUILD_WONDER
	----- NOTIFICATION_ESPIONAGE_OP_SUCCESS
	----- NOTIFICATION_ESPIONAGE_OP_FAILED
end

