-- ModSupport_CL_TEXT
-- Author: Shadow
-- DateCreated: 2025-08-09 12:32:49
--------------------------------------------------------------

INSERT OR REPLACE INTO LocalizedText

(   Language,   Tag,                                                Text    )   VALUES
(   'en_US',    'LOC_CSC_FARMING_TOWN_PRODUCTION_TO_QUARTER',       '+{1_num} [ICON_Production] from the adjacent Farming {1_num : plural 1?Town; other?Towns;}.' ),
(   'en_US',    'LOC_CSC_FRONTIER_TOWN_PRODUCTION_TO_QUARTER',      '+{1_num} [ICON_Production] from the adjacent Frontier {1_num : plural 1?Town; other?Towns;}.' ),

(   'en_US',    'LOC_CSC_MINING_COLONY_PRODUCTION_TO_QUARTER',      '+{1_num} [ICON_Production] from the adjacent Mining {1_num : plural 1?Colony; other?Colonies;}.' ),
(   'en_US',    'LOC_CSC_TROYU_PRODUCTION_TO_QUARTER',              '+{1_num} [ICON_Production] from the adjacent Hetet {1_num : plural 1?district; other?districts;}.' ),
(   'en_US',    'LOC_CSC_TSIKHE_PRODUCTION_TO_QUARTER',             '+{1_num} [ICON_Production] from the adjacent Tsikhe {1_num : plural 1?district; other?districts;}.' ),

(   'en_US',    'LOC_CSC_FISHING_VILLAGE_PRODUCTION_TO_QUARTER',    '+{1_num} [ICON_Production] from the adjacent Fishing {1_num : plural 1?Village; other?Villages;}.' ),
(   'en_US',    'LOC_CSC_GYOSON_PRODUCTION_TO_QUARTER',             '+{1_num} [ICON_Production] from the adjacent Gyoson {1_num : plural 1?district; other?districts;}.' ),

(   'en_US',    'LOC_CSC_CLASSICAL_BOROUGH_GOLD_TO_QUARTER',        '+{1_num} [ICON_Gold] from the adjacent Classical Era {1_num : plural 1?Borough; other?Boroughs;}.' ),
(   'en_US',    'LOC_CSC_XIAN_GOLD_TO_QUARTER',                     '+{1_num} [ICON_Gold] from the adjacent Ling Yi {1_num : plural 1?district; other?districts;}.' ),
(   'en_US',    'LOC_CSC_UPAPITHA_GOLD_TO_QUARTER',                 '+{1_num} [ICON_Gold] from the adjacent Mandala {1_num : plural 1?district; other?districts;}.' ),
(   'en_US',    'LOC_CSC_CLASSICAL_SESTIERE_GOLD_TO_QUARTER',       '+{1_num} [ICON_Gold] from the adjacent Classical Era Sestiere {1_num : plural 1?district; other?districts;}.' ),

(   'en_US',    'LOC_CSC_RENAISSANCE_BOROUGH_GOLD_TO_QUARTER',      '+{1_num} [ICON_Gold] from the adjacent Renaissance Era {1_num : plural 1?Borough; other?Boroughs;}.' ),
(   'en_US',    'LOC_CSC_RENAISSANCE_SESTIERE_GOLD_TO_QUARTER',     '+{1_num} [ICON_Gold] from the adjacent Renaissance Era Sestiere {1_num : plural 1?district; other?districts;}.' ),
(   'en_US',    'LOC_CSC_FUERTE_GOLD_TO_QUARTER',                   '+{1_num} [ICON_Gold] from the adjacent Fuerte Colonial {1_num : plural 1?district; other?districts;}.' ),

(   'en_US',    'LOC_CSC_MODERN_BOROUGH_GOLD_TO_QUARTER',           '+{1_num} [ICON_Gold] from the adjacent Modern Era {1_num : plural 1?Borough; other?Boroughs;}.' ),
(   'en_US',    'LOC_CSC_ELYSEE_GOLD_TO_QUARTER',                   '+{1_num} [ICON_Gold] from the adjacent Arrondissement {1_num : plural 1?district; other?districts;}.' );

UPDATE LocalizedText
SET Text = 'Effects apply to this city only.[NEWLINE][NEWLINE]Grants the Classical Borough +2 [ICON_PRODUCTION] Production for every adjacent unique Engineering district (Aqueduct, Dam, Canal, or Neighborhood). Allows the Prospectors'' Guild Urban improvement to be built by Builder units.[NEWLINE][NEWLINE]The Prospectors'' Guild provides +1 [ICON_Production] Production and an additional +1 [ICON_PRODUCTION] Production for every 2 adjacent districts. If built on a Mine or Quarry Strategic or Luxury resources, the city will gain use of that resource. Cannot be built adjacent to other Prospectors'' Guilds.'
WHERE Tag = 'LOC_BUILDING_COREXA_TIER2_SCI_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Prospectors'' Guild'
WHERE Tag = 'LOC_IMP_CL_CRAFTSMEN_QUARTER_NAME';

UPDATE LocalizedText
SET Text = 'Unlocks the Builder ability to construct the Urban improvement: Prospectors'' Guild.[NEWLINE][NEWLINE]+1 [ICON_Production] Production and an additional +1 [ICON_PRODUCTION] Production for every 2 adjacent districts. If built on a Mine or Quarry Strategic or Luxury resources, the city will gain use of that resource. Cannot be built adjacent to other Prospectors'' Guilds.'
WHERE Tag = 'LOC_IMP_CL_CRAFTSMEN_QUARTER_DESCRIPTION';