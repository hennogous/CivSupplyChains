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

(   'en_US',    'LOC_CSC_CITY_CENTER_GOLD_TO_BAKERS',                   '+{1_num} [ICON_Gold] from the adjacent City Center.'    ),
(   'en_US',    'LOC_CSC_BAKERS_FOOD_TO_CITY_CENTER',                   '+{1_num} [ICON_Food] Food from the adjacent Bakers'' {1_num : plural 1?Quarter; other?Quarters;}.'   ),

(   'en_US',    'LOC_CSC_COMMERCIAL_HUB_GOLD_TO_BAKERS',                '+{1_num} [ICON_Gold] from the adjacent Commercial {1_num : plural 1?Hub; other?Hubs;}.' ),
(   'en_US',    'LOC_CSC_BAKERS_FOOD_TO_COMMERCIAL_HUB',                '+{1_num} [ICON_Food] Food from the adjacent Bakers'' {1_num : plural 1?Quarter; other?Quarters;}.'   ),

(   'en_US',    'LOC_CSC_REPLACER_GOLD_TO_BAKERS_FRONT',                '+{1_num} [ICON_Gold] from the adjacent'    ),
(   'en_US',    'LOC_CSC_REPLACER_GOLD_TO_BAKERS_BACK',                 '{1_num : plural 1?district; other?districts;}.'    ),

(   'en_US',    'LOC_CSC_NEIGHBORHOOD_GOLD_TO_BAKERS',                  '+{1_num} [ICON_Gold] from the adjacent {1_num : plural 1?Neighborhood; other?Neighborhoods;}.'  ),
(   'en_US',    'LOC_CSC_BAKERS_FOOD_TO_NEIGHBORHOOD',                  '+{1_num} [ICON_Food] Food from the adjacent Bakers'' {1_num : plural 1?Quarter; other?Quarters;}.[NEWLINE]'   ),

(   'en_US',    'LOC_BUILDING_CSC_BAKERS_RIVER_ACCESS_NAME',            'River access'  ),
(   'en_US',    'LOC_BUILDING_CSC_BAKERS_RIVER_ACCESS_DESCRIPTION',     'This quarter is adjacent to a river.'  ),

(   'en_US',    'LOC_BUILDING_CSC_BAKERS_NO_RIVER_ACCESS_NAME',         'No river access'  ),
(   'en_US',    'LOC_BUILDING_CSC_BAKERS_NO_RIVER_ACCESS_DESCRIPTION',  'This quarter is not adjacent to a river.'  ),

(   'en_US',    'LOC_BUILDING_CSC_BAKERS_WATER_MILL_NAME',              'Water Mill'    ),
(   'en_US',    'LOC_BUILDING_CSC_BAKERS_WATER_MILL_DESCRIPTION',       '+1 [ICON_Production] Production from each adjacent base materials improvement, and +1 [ICON_Gold] Gold in return.[NEWLINE]+1 [ICON_Food] Food, with a -1 [ICON_Gold] Gold maintenance cost.[NEWLINE]+1 [ICON_Food] Food to an adjacent Granary, and +1 [ICON_Gold] Gold in return.[NEWLINE]With Feudalism, a Granary adjacent to a Water Mill provides +10% growth in the city.[NEWLINE]+1 [ICON_Gold] Gold from the local Bakery and Patisserie.[NEWLINE]+1 [ICON_Food] Food bonus to [ICON_TradeRoute] trade routes to the city, and +1 [ICON_Gold] Gold in return from international routes.'   ),

(   'en_US',    'LOC_BUILDING_CSC_BAKERS_WIND_MILL_NAME',               'Wind Mill'    ),
(   'en_US',    'LOC_BUILDING_CSC_BAKERS_WIND_MILL_DESCRIPTION',        '+1 [ICON_Production] Production from each adjacent base materials improvement, and +1 [ICON_Gold] Gold in return.[NEWLINE]+1 [ICON_Food] Food, with a -1 [ICON_Gold] Gold maintenance cost.[NEWLINE]+1 [ICON_Food] Food to an adjacent Granary, and +1 [ICON_Gold] Gold in return.[NEWLINE]With Feudalism, a Granary adjacent to a Wind Mill provides +10% growth in the city.[NEWLINE]+1 [ICON_Gold] Gold from the local Bakery and Patisserie.[NEWLINE]+1 [ICON_Food] Food bonus to [ICON_TradeRoute] trade routes to the city, and +1 [ICON_Gold] Gold in return from international routes.'   ),

(   'en_US',    'LOC_BUILDING_CSC_BAKERS_BAKERY_NAME',                  'Bakery'    ),
(   'en_US',    'LOC_BUILDING_CSC_BAKERS_BAKERY_DESCRIPTION',           ''   ),

(   'en_US',    'LOC_BUILDING_CSC_BAKERS_PATISSERIE_NAME',              'Patisserie'    ),
(   'en_US',    'LOC_BUILDING_CSC_BAKERS_PATISSERIE_DESCRIPTION',       ''   );

INSERT OR REPLACE INTO BaseGameText
(   Tag,					                                    Text        )       VALUES
(   'LOC_MOD_CSC_BAKERS_STAGE_2_EFFECT_GROWTH',                 'With Feudalism, a Granary adjacent to a Flour Mill provides +10% growth in the city.'	),
(   'LOC_MOD_CSC_BAKERS_SPECIALTY_SLOT_GRANT_DESCRIPTION',      'Extra specialist slot from fancy pastries!'    );

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