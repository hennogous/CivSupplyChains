--==========================================================================================================================
-- Loclalization
--==========================================================================================================================
INSERT OR IGNORE  INTO LocalizedText	
		(Tag,																Language,		Text)
VALUES	('LOC_MOD_CSC_BAKERS_STAGE_2_EFFECT_GROWTH_DESC',					'en_US',		"{1_iBonus}% Growth in this City."),
		('LOC_MOD_CSC_BAKERS_STAGE_3_EFFECT_HOUSING_DESC',					'en_US',		"{1_iBonus} [ICON_Housing] Housing in this City."),
		('LOC_MOD_CSC_BAKERS_STAGE_4_EFFECT_TOURISM_DESC',					'en_US',		"{1_iBonus} [ICON_Tourism] Tourism in this City."),
		('LOC_ZEGA_STACK_AMOUNT_DESC',										'en_US',		" (combined from {1_iStackAmount} {1_Num : plural 1?Source; other?Sources;})."),
		
		('LOC_NOTIFICATION_HENNO_NEW_CITY_QUARTER_ABILITY_MESSAGE',			'en_US',		"Henno City Quarter Ability Added!"),
		('LOC_NOTIFICATION_HENNO_NEW_CITY_QUARTER_ABILITY_SUMMARY',			'en_US',		'The City of {1_CityName} has received following City Ability Bonus "{2_Ability}".'),
		
		('LOC_NOTIFICATION_HENNO_UPDATED_CITY_QUARTER_ABILITY_MESSAGE',		'en_US',		"Henno City Quarter Ability Updated!"),
		('LOC_NOTIFICATION_HENNO_UPDATED_CITY_QUARTER_ABILITY_SUMMARY',		'en_US',		'The City of {1_CityName} has its City Ability Bonus {2_ChangeType} by "{3_Ability}".'),
		
		('LOC_NOTIFICATION_HENNO_REMOVED_CITY_QUARTER_ABILITY_MESSAGE',		'en_US',		"Henno City Quarter Ability Removed!"),
		('LOC_NOTIFICATION_HENNO_REMOVED_CITY_QUARTER_ABILITY_SUMMARY',		'en_US',		'The City of {1_CityName} has its City Ability of "{2_Ability}" removed.'),
		
		('LOC_HENNO_CITY_ABILITY_CHANGE_INCREASE',							'en_US',		"increase"),
		('LOC_HENNO_CITY_ABILITY_CHANGE_DECREASE',							'en_US',		"decrease"),
		
		('LOC_ZEGA_STACK_AMOUNT_CHANGE_DESC',								'en_US',		" (from {1_iStackAmount} {2_ChangeType} {1_Num : plural 1?Source; other?Sources;})."),
		('LOC_HENNO_CITY_ABILITY_SOURCE_INCREASE',							'en_US',		"additional"),
		('LOC_HENNO_CITY_ABILITY_SOURCE_DECREASE',							'en_US',		"removed");
		