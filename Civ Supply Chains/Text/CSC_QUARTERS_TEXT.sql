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

(   'en_US',    'LOC_DISTRICT_CSC_BAKERS_QUARTER_NAME',         'Bakers'' Quarter'  ),
(   'en_US',    'LOC_DISTRICT_CSC_BAKERS_QUARTER_DESCRIPTION',  'A district in your city specializing in baking.'   ),

(   'en_US',    'LOC_RESOURCE_WINE_NAME',                       'Grapes'    ),

(   'en_US',    'LOC_CSC_CITY_CENTER_GOLD_TO_BAKERS',           '+{1_num} [ICON_Gold] from the adjacent City Center.'    ),
(   'en_US',    'LOC_CSC_BAKERS_FOOD_TO_CITY_CENTER',           '+{1_num} [ICON_Food] Food from the adjacent Bakers'' {1_num : plural 1?Quarter; other?Quarters;}.'   ),

(   'en_US',    'LOC_CSC_COMMERCIAL_HUB_GOLD_TO_BAKERS',        '+{1_num} [ICON_Gold] from the adjacent Commercial {1_num : plural 1?Hub; other?Hubs;}.' ),
(   'en_US',    'LOC_CSC_BAKERS_FOOD_TO_COMMERCIAL_HUB',        '+{1_num} [ICON_Food] Food from the adjacent Bakers'' {1_num : plural 1?Quarter; other?Quarters;}.'   ),

(   'en_US',    'LOC_CSC_NEIGHBORHOOD_GOLD_TO_BAKERS',          '+{1_num} [ICON_Gold] from the adjacent {1_num : plural 1?Neighborhood; other?Neighborhoods;}.'  ),
(   'en_US',    'LOC_CSC_BAKERS_FOOD_TO_NEIGHBORHOOD',          '+{1_num} [ICON_Food] Food from the adjacent Bakers'' {1_num : plural 1?Quarter; other?Quarters;}.[NEWLINE]'   );


