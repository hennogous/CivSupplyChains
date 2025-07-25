-- CSC_QUARTERS_TEXT
-- Author: Shadow
-- DateCreated: 2025-07-13 15:32:11
--------------------------------------------------------------

--===========================================================================================================================================================================--
/*	ENGLISH */
--===========================================================================================================================================================================--

INSERT OR REPLACE INTO LocalizedText
(   Language,   Tag,    Text    )   VALUES

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Bakers' Quarter
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

(   'en_US',    'LOC_DISTRICT_CSC_BAKERS_QUARTER_NAME',             'Bakers'' Quarter'  ),
(   'en_US',    'LOC_DISTRICT_CSC_BAKERS_QUARTER_DESCRIPTION',      'A district in your city specializing in baking.'   ),

(   'en_US',    'LOC_RESOURCE_WINE_NAME',                           'Grapes'    ),

(   'en_US',    'LOC_CSC_CITY_CENTER_GOLD_TO_BAKERS',               '+{1_num} [ICON_Gold] from the adjacent City Center.'    ),
(   'en_US',    'LOC_CSC_BAKERS_FOOD_TO_CITY_CENTER',               '+{1_num} [ICON_Food] Food from the adjacent Bakers'' {1_num : plural 1?Quarter; other?Quarters;}.'   ),

(   'en_US',    'LOC_CSC_COMMERCIAL_HUB_GOLD_TO_BAKERS',            '+{1_num} [ICON_Gold] from the adjacent Commercial {1_num : plural 1?Hub; other?Hubs;}.' ),
(   'en_US',    'LOC_CSC_BAKERS_FOOD_TO_COMMERCIAL_HUB',            '+{1_num} [ICON_Food] Food from the adjacent Bakers'' {1_num : plural 1?Quarter; other?Quarters;}.'   ),

(   'en_US',    'LOC_CSC_NEIGHBORHOOD_GOLD_TO_BAKERS',              '+{1_num} [ICON_Gold] from the adjacent {1_num : plural 1?Neighborhood; other?Neighborhoods;}.'  ),
(   'en_US',    'LOC_CSC_BAKERS_FOOD_TO_NEIGHBORHOOD',              '+{1_num} [ICON_Food] Food from the adjacent Bakers'' {1_num : plural 1?Quarter; other?Quarters;}.[NEWLINE]'   ),

(   'en_US',    'LOC_BUILDING_CSC_BAKERS_FLOUR_MILL_NAME',          'Flour Mill'    ),
(   'en_US',    'LOC_BUILDING_CSC_BAKERS_FLOUR_MILL_DESCRIPTION',   '+1 [ICON_Production] Production from each adjacent base materials improvement, and +1 [ICON_Gold] Gold in return.[NEWLINE]+1 [ICON_Food] Food, with a -1 [ICON_Gold] Gold maintenance cost.[NEWLINE]+1 [ICON_Food] Food to an adjacent Granary, and +1 [ICON_Gold] Gold in return.[NEWLINE]With Feudalism, a Granary adjacent to a Flour Mill provides +10% growth in the city.[NEWLINE]+1 [ICON_Gold] Gold from the local Bakery and Patisserie.[NEWLINE]+1 [ICON_Food] Food bonus to [ICON_TradeRoute] trade routes to the city, and +1 [ICON_Gold] Gold in return from international routes.'   ),

(   'en_US',    'LOC_BUILDING_CSC_BAKERS_BAKERY_NAME',              'Bakery'    ),
(   'en_US',    'LOC_BUILDING_CSC_BAKERS_BAKERY_DESCRIPTION',       ''   ),

(   'en_US',    'LOC_BUILDING_CSC_BAKERS_PATISSERIE_NAME',          'Patisserie'    ),
(   'en_US',    'LOC_BUILDING_CSC_BAKERS_PATISSERIE_DESCRIPTION',   ''   );