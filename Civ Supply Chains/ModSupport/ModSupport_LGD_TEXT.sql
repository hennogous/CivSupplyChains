-- ModSupport_LGD_TEXT
-- Author: Shadow
-- DateCreated: 2025-08-09 12:32:31
--------------------------------------------------------------

INSERT OR REPLACE INTO LocalizedText

(   Language,   Tag,                                            Text    )   VALUES
(   'en_US',    'LOC_CSC_GARDEN_GOLD_TO_BAKERS',                '+{1_num} [ICON_Gold] from the adjacent {1_num : plural 1?Garden; other?Gardens;}.' ),

(   'en_US',    'LOC_BUILDING_CSC_BAKERS_STAGE_4_SPECIALIST_GARDEN_NAME',        'Groundskeeper'     ),
(   'en_US',    'LOC_BUILDING_CSC_BAKERS_STAGE_4_SPECIALIST_GARDEN_DESCRIPTION', 'A groundskeeper has been appointed to maintain the Garden''s attractions.'    ),

(   'en_US',    'LOC_BUILDING_CSC_BAKERS_PATISSERIE_DESCRIPTION_GARDEN',       '+1 [ICON_Production] Production from the local Flour Mill.[NEWLINE]+1 [ICON_Production] Production from each adjacent specialty materials improvement, increased to +2 [ICON_Production] Production from an Industry, and +3 [ICON_Production] Production from a Corporation.[NEWLINE]+3 [ICON_Food] Food, with a -3 [ICON_Gold] Gold maintenance cost.[NEWLINE]+1 [ICON_Food] Food bonus to all [ICON_TradeRoute] trade routes to the city, and +2 [ICON_Gold] Gold in return from international routes.[NEWLINE]+1 [ICON_Culture] Culture for every 5 [ICON_Citizen] Citizens in the city to each adjacent Zoo, Ferris Wheel or Conservatory, and +1 [ICON_Gold] Gold to the Patisserie in return.'   ),

(   'en_US',    'LOC_CSC_BAKERS_STAGE_4_SPECIALIST_GARDEN',              '[NEWLINE]+2 [ICON_Tourism] Tourism to the district, and +1 [ICON_Citizen] Citizen slot (Groundskeeper) if the district has a Conservatory.');
