-- CSC_QUARTERS_TEXT
-- Author: Shadow
-- DateCreated: 2025-07-13 15:32:11
--------------------------------------------------------------

--===========================================================================================================================================================================--
/*	ENGLISH */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Bakers' Quarter
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR REPLACE INTO LocalizedText

(   Language,   Tag,                                                    Text    )   VALUES
(   'en_US',    'LOC_DISTRICT_CSC_BAKERS_QUARTER_NAME',                 'Bakers'' Quarter'  ),
(   'en_US',    'LOC_DISTRICT_CSC_BAKERS_QUARTER_DESCRIPTION',          'A district in your city specializing in baking.'   ),

(   'en_US',    'LOC_RESOURCE_WINE_NAME',                               'Grapes'    ),

(   'en_US',    'LOC_CSC_BAKERS_FOOD_TO_ADJACENT_DISTRICT',             '+{1_num} [ICON_Food] Food from the adjacent Bakers'' {1_num : plural 1?Quarter; other?Quarters;}.'   ),
(   'en_US',    'LOC_CSC_BAKERS_CULTURE_TO_ADJACENT_DISTRICT',          '+{1_num} [ICON_Culture] Culture from the adjacent Bakers'' {1_num : plural 1?Quarter; other?Quarters;}.'   ),

(   'en_US',    'LOC_CSC_CITY_CENTER_GOLD_TO_BAKERS',                   '+{1_num} [ICON_Gold] from the adjacent City Center.'    ),
(   'en_US',    'LOC_CSC_COMMERCIAL_HUB_GOLD_TO_BAKERS',                '+{1_num} [ICON_Gold] from the adjacent Commercial {1_num : plural 1?Hub; other?Hubs;}.' ),
(   'en_US',    'LOC_CSC_SUGUBA_GOLD_TO_BAKERS',                        '+{1_num} [ICON_Gold] from the adjacent Suguba {1_num : plural 1?district; other?districts;}.'),
(   'en_US',    'LOC_CSC_ENTERTAINMENT_GOLD_TO_BAKERS',                 '+{1_num} [ICON_Gold] from the adjacent Entertainment {1_num : plural 1?Complex; other?Complexes;}.' ),
(   'en_US',    'LOC_CSC_STREET_CARNIVAL_GOLD_TO_BAKERS',               '+{1_num} [ICON_Gold] from the adjacent Street {1_num : plural 1?Carnival; other?Carnivals;}.' ),
(   'en_US',    'LOC_CSC_HIPPODROME_GOLD_TO_BAKERS',                    '+{1_num} [ICON_Gold] from the adjacent Hippodrome {1_num : plural 1?district; other?districts;}.' ),
(   'en_US',    'LOC_CSC_WATER_PARK_GOLD_TO_BAKERS',                    '+{1_num} [ICON_Gold] from the adjacent Water {1_num : plural 1?Park; other?Parks;}.' ),
(   'en_US',    'LOC_CSC_WATER_STREET_CARNIVAL_GOLD_TO_BAKERS',         '+{1_num} [ICON_Gold] from the adjacent Copacabana {1_num : plural 1?district; other?districts;}.' ),

(   'en_US',    'LOC_CSC_REPLACER_GOLD_TO_BAKERS_FRONT',                '+{1_num} [ICON_Gold] from the adjacent'    ),
(   'en_US',    'LOC_CSC_REPLACER_GOLD_TO_BAKERS_BACK',                 '{1_num : plural 1?district; other?districts;}.'    ),

(   'en_US',    'LOC_CSC_BREWERS_PRODUCTION_TO_BAKERS',                 '+{1_num} [ICON_Production] Production from the adjacent Brewers'' {1_num : plural 1?Quarter; other?Quarters;}.'   ),
(   'en_US',    'LOC_CSC_BAKERS_GOLD_TO_BREWERS',                       '+{1_num} [ICON_Gold] Gold from the adjacent Bakers'' {1_num : plural 1?Quarter; other?Quarters;}.'   ),

(   'en_US',    'LOC_BUILDING_CSC_BAKERS_RIVER_ACCESS_NAME',            'River access'  ),
(   'en_US',    'LOC_BUILDING_CSC_BAKERS_RIVER_ACCESS_DESCRIPTION',     'This quarter is adjacent to a river.'  ),

(   'en_US',    'LOC_BUILDING_CSC_BAKERS_NO_RIVER_ACCESS_NAME',         'No river access'  ),
(   'en_US',    'LOC_BUILDING_CSC_BAKERS_NO_RIVER_ACCESS_DESCRIPTION',  'This quarter is not adjacent to a river.'  ),

(   'en_US',    'LOC_BUILDING_CSC_BAKERS_WATER_MILL_NAME',              'Water Mill'    ),
(   'en_US',    'LOC_BUILDING_CSC_BAKERS_WIND_MILL_NAME',               'Wind Mill'    ),
(   'en_US',    'LOC_BUILDING_CSC_BAKERS_FLOUR_MILL_DESCRIPTION',       '+1 [ICON_Production] Production from each adjacent base materials improvement.[NEWLINE]+1 [ICON_Food] Food, with a -1 [ICON_Gold] Gold maintenance cost.[NEWLINE]+1 [ICON_Gold] Gold from the local Bakery and Patisserie.[NEWLINE]+1 [ICON_Food] Food bonus to [ICON_TradeRoute] trade routes to the city, and +1 [ICON_Gold] Gold in return from international routes.[NEWLINE]+1 [ICON_Food] Food to an adjacent Granary, and receive +1 [ICON_Gold] Gold in return.'   ),

(   'en_US',    'LOC_BUILDING_CSC_BAKERS_BAKERY_NAME',                  'Bakery'    ),
(   'en_US',    'LOC_BUILDING_CSC_BAKERS_BAKERY_DESCRIPTION',           '+1 [ICON_Production] Production from the local Flour Mill.[NEWLINE]+2 [ICON_Food] Food, with a -2 [ICON_Gold] Gold maintenance cost.[NEWLINE]+1 [ICON_Food] Food bonus to all [ICON_TradeRoute] trade routes to the city, and +1 [ICON_Gold] Gold in return from international routes.[NEWLINE]+0.2 [ICON_Food] Food and +0.2 [ICON_Gold] Gold per [ICON_Citizen] Citizen to the city for each adjacent Market.'   ),

(   'en_US',    'LOC_BUILDING_CSC_BAKERS_PATISSERIE_NAME',              'Patisserie'    ),
(   'en_US',    'LOC_BUILDING_CSC_BAKERS_PATISSERIE_DESCRIPTION',       '+1 [ICON_Production] Production from the local Flour Mill.[NEWLINE]+1 [ICON_Production] Production from each adjacent specialty materials improvement, increased to +2 [ICON_Production] Production from an Industry, and +3 [ICON_Production] Production from a Corporation.[NEWLINE]+3 [ICON_Food] Food, with a -3 [ICON_Gold] Gold maintenance cost.[NEWLINE]+1 [ICON_Food] Food bonus to all [ICON_TradeRoute] trade routes to the city, and +2 [ICON_Gold] Gold in return from international routes.[NEWLINE]+1 [ICON_Culture] Culture for every 5 [ICON_Citizen] Citizens in the city to each adjacent Zoo or Ferris Wheel, and +1 [ICON_Gold] Gold to the Patisserie in return.'   ),

(   'en_US',    'LOC_BUILDING_CSC_BAKERS_STAGE_3_SPECIALIST_NAME',              'Merchant Guildhall'     ),
(   'en_US',    'LOC_BUILDING_CSC_BAKERS_STAGE_3_SPECIALIST_DESCRIPTION',       'The central meeting place and administrative office of Merchants in this growing economy.'    ),

(   'en_US',    'LOC_BUILDING_CSC_BAKERS_STAGE_4_SPECIALIST_NAME',              'Groundskeeper'     ),
(   'en_US',    'LOC_BUILDING_CSC_BAKERS_STAGE_4_SPECIALIST_DESCRIPTION',       'A groundskeeper has been appointed to maintain the attractions in this district.'    ),

(   'en_US',    'LOC_CSC_BAKERS_STAGE_2_EFFECT',                        'At Feudalism, the Granary provides +10% growth in the city, if adjacent to a Water Mill or Wind Mill that is in turn adjacent to an improved Bakers'' Quarter base materials resource.'  ),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_2_CIVIC',                         '[NEWLINE][NEWLINE]Growth bonus from Granaries adjacent to Water Mills or Wind Mills.'  ),

(   'en_US',    'LOC_CSC_BAKERS_STAGE_3_EFFECT',                        '[NEWLINE][NEWLINE]At Medieval Faires, the Market provides +2 [ICON_Housing] Housing, if adjacent to a Bakery that is in turn adjacent to an improved Bakers'' Quarter base materials resource.'  ),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_3_SPECIALIST',                    '[NEWLINE][NEWLINE]At Medieval Faires, +1 [ICON_Citizen] Citizen slot (Merchant Guildhall) is granted to a Commercial Hub with a Market, if adjacent to a Water Mill or Wind Mill that is in turn adjacent to an improved Bakers'' Quarter base materials resource.'    ),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_3_CIVIC',                         '[ICON_Housing] Housing bonus and a [ICON_Citizen] Citizen slot from Markets adjacent to Bakeries.'  ),

(   'en_US',    'LOC_CSC_BAKERS_STAGE_4_REQUIREMENT',                   '[NEWLINE][NEWLINE]At Urbanization, if adjacent to a Patisserie that is in turn adjacent to both improved Bakers'' Quarter base and speciality materials resources:'  ),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_4_SPECIALIST_ENTER',              '[NEWLINE]+2 [ICON_Tourism] Tourism to the district, and +1 [ICON_Citizen] Citizen slot (Groundskeeper) if the district has a Zoo.'),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_4_SPECIALIST_WATER',              '[NEWLINE]+2 [ICON_Tourism] Tourism to the district, and +1 [ICON_Citizen] Citizen slot (Groundskeeper) if the district has a Ferris Wheel.'),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_4_CIVIC',                         '[ICON_Tourism] Tourism bonus and a [ICON_Citizen] Citizen slot from Zoos and Ferris Wheels adjacent to Patisseries.'  );


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Tailors' Quarter
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR REPLACE INTO LocalizedText

(   Language,   Tag,                                                    Text    )   VALUES
(   'en_US',    'LOC_DISTRICT_CSC_TAILORS_QUARTER_NAME',                'Tailors'' Quarter'  ),
(   'en_US',    'LOC_DISTRICT_CSC_TAILORS_QUARTER_DESCRIPTION',         'A district in your city specializing in textiles.'   );



-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Apothecaries' Quarter
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR REPLACE INTO LocalizedText

(   Language,   Tag,                                                    Text    )   VALUES
(   'en_US',    'LOC_DISTRICT_CSC_APOTHECARIES_QUARTER_NAME',           'Apothecaries'' Quarter'  ),
(   'en_US',    'LOC_DISTRICT_CSC_APOTHECARIES_QUARTER_DESCRIPTION',    'A district in your city specializing in medicine.'   );



-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Stonemasons' Quarter
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR REPLACE INTO LocalizedText

(   Language,   Tag,                                                    Text    )   VALUES
(   'en_US',    'LOC_DISTRICT_CSC_STONEMASONS_QUARTER_NAME',            'Stonemasons'' Quarter'  ),
(   'en_US',    'LOC_DISTRICT_CSC_STONEMASONS_QUARTER_DESCRIPTION',     'A district in your city specializing in stoneworking.'   );



-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Carpenters' Quarter
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR REPLACE INTO LocalizedText

(   Language,   Tag,                                                    Text    )   VALUES
(   'en_US',    'LOC_DISTRICT_CSC_CARPENTERS_QUARTER_NAME',             'Carpenters'' Quarter'  ),
(   'en_US',    'LOC_DISTRICT_CSC_CARPENTERS_QUARTER_DESCRIPTION',      'A district in your city specializing in woodworking.'   ),

(   'en_US',    'LOC_BUILDING_CSC_CARPENTERS_JOINERY_NAME',             'Joinery'    ),
(   'en_US',    'LOC_BUILDING_CSC_CARPENTERS_JOINERY_DESCRIPTION',      ''   ),

(   'en_US',    'LOC_BOOST_TRIGGER_CONSTRUCTION_CSC',                   'Build a Joinery.'),
(   'en_US',    'LOC_BOOST_TRIGGER_LONGDESC_CONSTRUCTION_CSC',          'Work in the Joinery has taught your workers much about construction practices.');



-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Blacksmiths' Quarter
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR REPLACE INTO LocalizedText

(   Language,   Tag,                                                    Text    )   VALUES
(   'en_US',    'LOC_DISTRICT_CSC_BLACKSMITHS_QUARTER_NAME',            'Blacksmiths'' Quarter'  ),
(   'en_US',    'LOC_DISTRICT_CSC_BLACKSMITHS_QUARTER_DESCRIPTION',     'A district in your city specializing in metalworking.'   );



-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Goldsmiths' Quarter
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR REPLACE INTO LocalizedText

(   Language,   Tag,                                                    Text    )   VALUES
(   'en_US',    'LOC_DISTRICT_CSC_GOLDSMITHS_QUARTER_NAME',             'Goldsmiths'' Quarter'  ),
(   'en_US',    'LOC_DISTRICT_CSC_GOLDSMITHS_QUARTER_DESCRIPTION',      'A district in your city specializing in jewelry.'   );



-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Brewers' Quarter
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR REPLACE INTO LocalizedText

(   Language,   Tag,                                                    Text    )   VALUES
(   'en_US',    'LOC_DISTRICT_CSC_BREWERS_QUARTER_NAME',                'Brewers'' Quarter'  ),
(   'en_US',    'LOC_DISTRICT_CSC_BREWERS_QUARTER_DESCRIPTION',         'A district in your city specializing in fermentation.'   );