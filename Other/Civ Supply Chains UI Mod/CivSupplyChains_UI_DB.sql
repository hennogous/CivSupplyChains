--==========================================================================================================================
-- Zegangani: 
--==========================================================================================================================
-------------------------------------			
-- Notifications
-------------------------------------
INSERT INTO Types
		(Type,													Kind)
VALUES	('NOTIFICATION_HENNO_NEW_CITY_QUARTER_ABILITY',			'KIND_NOTIFICATION'),
		('NOTIFICATION_HENNO_UPDATED_CITY_QUARTER_ABILITY',		'KIND_NOTIFICATION'),
		('NOTIFICATION_HENNO_REMOVED_CITY_QUARTER_ABILITY',		'KIND_NOTIFICATION');

INSERT INTO Notifications
		(NotificationType,										SeverityType,	ExpiresEndOfTurn,		AutoNotify)
VALUES	('NOTIFICATION_HENNO_NEW_CITY_QUARTER_ABILITY',			'HIGH',			0,						0),
		('NOTIFICATION_HENNO_UPDATED_CITY_QUARTER_ABILITY',		'HIGH',			0,						0),
		('NOTIFICATION_HENNO_REMOVED_CITY_QUARTER_ABILITY',		'HIGH',			0,						0);
		
----------------------
-- Henno_ValidCityModifiers
----------------------

CREATE TABLE IF NOT EXISTS Henno_ValidCityModifiers(
		ModifierId TEXT PRIMARY KEY NOT NULL, 
		AttachedModifierId TEXT DEFAULT NULL,
		ArgumentAmount INTEGER DEFAULT 0,
		ModifierDesc TEXT DEFAULT NULL,
		ModifierIcon TEXT DEFAULT NULL
);


INSERT INTO Henno_ValidCityModifiers
		(ModifierId)
VALUES	('MOD_CSC_BAKERS_STAGE_2_EFFECT_ATTACH_CITY_CENTER'),
		('MOD_CSC_BAKERS_STAGE_3_EFFECT_ATTACH_COMHUB'),
		('MOD_CSC_BAKERS_STAGE_4_EFFECT_ATTACH_ENTERTAINMENT'),
		('MOD_CSC_BAKERS_STAGE_4_EFFECT_ATTACH_WATER_PARK');

----------------------
-- ModifierStrings
----------------------

INSERT INTO ModifierStrings
		(ModifierId,								Context,			'Text')
VALUES	('MOD_CSC_BAKERS_STAGE_2_EFFECT_GROWTH',	'Preview',			'LOC_MOD_CSC_BAKERS_STAGE_2_EFFECT_GROWTH_DESC'),
		('MOD_CSC_BAKERS_STAGE_3_EFFECT_HOUSING',	'Preview',			'LOC_MOD_CSC_BAKERS_STAGE_3_EFFECT_HOUSING_DESC'),
		('MOD_CSC_BAKERS_STAGE_4_EFFECT_TOURISM',	'Preview',			'LOC_MOD_CSC_BAKERS_STAGE_4_EFFECT_TOURISM_DESC');
		