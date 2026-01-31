-- ModSupport_LGD_TEXT
-- Author: Shadow
-- DateCreated: 2025-08-09 12:32:31
--------------------------------------------------------------

INSERT OR REPLACE INTO LocalizedText

(   Language,   Tag,                                                                Text    )   VALUES
(   'en_US',    'LOC_CSC_GARDEN_GOLD_TO_BAKERS',                                    '+{1_num} [ICON_Gold] from the adjacent {1_num : plural 1?Garden; other?Gardens;}.' ),

(   'en_US',    'LOC_BUILDING_CSC_BAKERS_CAFE_DESCRIPTION_GARDEN',                  '[ICON_BULLET]+1 [ICON_Production] Production from the local Flour Mill.[NEWLINE][ICON_BULLET]+1 [ICON_Production] Production from each adjacent specialty materials improvement.[NEWLINE][ICON_BULLET]+3 [ICON_Food] Food, with a -3 [ICON_Gold] Gold maintenance cost.[NEWLINE][ICON_BULLET]+1 [ICON_Food] Food bonus to all [ICON_TradeRoute] trade routes to the city, and +2 [ICON_Gold] Gold in return from international routes.[NEWLINE][ICON_BULLET]+1 [ICON_Culture] Culture for every 5 [ICON_Citizen] Citizens in the city to each adjacent Zoo, Ferris Wheel or Conservatory, and +1 [ICON_Gold] Gold to the Cafè in return.[NEWLINE][NEWLINE]At Urbanization, a Café adjacent to an improved base and specialty materials resource unlocks additional bonuses to each adjacent Entertainment Complex, Water Park and Garden.'   ),

(   'en_US',    'LOC_BUILDING_CSC_BAKERS_STAGE_4_SPECIALIST_GARDEN_NAME',           'Horticulturist'),
(   'en_US',    'LOC_BUILDING_CSC_BAKERS_STAGE_4_SPECIALIST_GARDEN_DESCRIPTION',    'Growing visitor numbers, in no small part driven by the proximity of the adjacent Café, has created the need for someone to perform some much-needed maintenance on the district''s attractions.'),

(   'en_US',    'LOC_CSC_BAKERS_STAGE_4_SPECIALIST_GARDEN',                         '[NEWLINE]+2 [ICON_Tourism] Tourism to the district, and +1 [ICON_Citizen] Citizen slot ({LOC_BUILDING_CSC_BAKERS_STAGE_4_SPECIALIST_GARDEN_NAME}) if the district has a Conservatory.'),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_4_CIVIC',                                     '[ICON_Tourism] Tourism bonus and a [ICON_Citizen] Citizen slot from a Zoo, Ferris Wheel or Conservatory adjacent to a Café.'  ),

(	'en_US',    'LOC_CSC_BAKERS_STAGE_4_EFFECT_DESCRIPTION_GARDEN',                 '{1_iBonus} [ICON_Tourism] Tourism, as visitors to the local Conservatory also have access to {2_Num : plural 1?an adjacent Café; other?{2_StackAmount} adjacent Cafés;}.'	),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_4_EFFECT_DESCRIPTION_GARDEN_NEW',             '{1_iBonus} [ICON_Tourism] Tourism, as visitors to the local Conservatory now also have access to {2_Num : plural 1?an adjacent Café; other?{2_StackAmount} adjacent Cafés;}.'  ),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_4_EFFECT_DESCRIPTION_GARDEN_INCREASED',       '{1_iBonus} [ICON_Tourism] Tourism, as visitors to the local Conservatory now also have access to {2_StackAmount} more adjacent {2_Num : plural 1?Café; other?Cafés;}.'  ),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_4_EFFECT_DESCRIPTION_GARDEN_DECREASED',       '{1_iBonus} [ICON_Tourism] Tourism, as visitors to the local Conservatory now have access to {2_StackAmount} fewer adjacent {2_Num : plural 1?Café; other?Cafés;}.'  ),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_4_EFFECT_DESCRIPTION_GARDEN_REMOVED',         '{1_iBonus} [ICON_Tourism] Tourism, as visitors to the local Conservatory have lost access to {2_Num : plural 1?the adjacent Café; other?all adjacent Cafés;}.'  ),

(	'en_US',    'LOC_CSC_BAKERS_STAGE_4_SPECIALIST_GRANT_GARDEN_NEW',               'A {LOC_BUILDING_CSC_BAKERS_STAGE_4_SPECIALIST_GARDEN_NAME} has been appointed.'	),

(   'en_US',
    'LOC_PEDIA_BUILDINGS_PAGE_BUILDING_CSC_BAKERS_CAFE_CHAPTER_HISTORY_PARA_3',
    'The sales interaction of a Café with the local Zoo, Ferris Wheel, or Conservatory is a reflection of the rise of leisure culture and the "day out." As cities grew and the middle class expanded, public entertainment venues became popular destinations. A café adjacent to these attractions would have been a natural fit, offering a place for people to relax and socialize as part of their visit. This connection demonstrates how the Café was not just a place for intellectual discussion, but a vital part of a burgeoning urban entertainment industry, catering to a public seeking new forms of recreation and social engagement.'   ),

(   'en_US',
    'LOC_PEDIA_BUILDINGS_PAGE_BUILDING_CSC_BAKERS_CAFE_CHAPTER_CSCHAIN_PARA_1',
    'The Café procures flour from the Water Mill or Wind Mill in the Quarter, as well as various specialty materials from adjacent improvements on those specific resources, and transforms them into fine baked goods and drinks for sale to select customers visiting the adjacent Entertainment Complex, Water Park or Garden.'   ),

(   'en_US',
    'LOC_PEDIA_DISTRICTS_PAGE_DISTRICT_LEU_GARDEN_CHAPTER_CSCHAIN_TITLE',
    'Supply Chains'   ),

(   'en_US',
    'LOC_PEDIA_DISTRICTS_PAGE_DISTRICT_LEU_GARDEN_CHAPTER_CSCHAIN_PARA_1',
    'The Garden offers a point of sale for an adjacent Café.[NEWLINE][NEWLINE]At Urbanization, each Café adjacent to improved base and speciality materials resources unlocks +2 [ICON_TOURISM] Tourism to the Garden. This also grants +1 [ICON_CITIZEN] Citizen slot (the appointment of a {LOC_BUILDING_CSC_BAKERS_STAGE_4_SPECIALIST_GARDEN_NAME}) to the Garden if it has a Conservatory.'   ),

(   'en_US',
    'LOC_PEDIA_BUILDINGS_PAGE_BUILDING_LEU_CONSERVATORY_CHAPTER_CSCHAIN_TITLE',
    'Supply Chains'   ),

(   'en_US',
    'LOC_PEDIA_BUILDINGS_PAGE_BUILDING_LEU_CONSERVATORY_CHAPTER_CSCHAIN_PARA_1',
    'Some visitors to the Conservatory also enjoy some refreshments from the adjacent Café.[NEWLINE][NEWLINE]At Urbanization, a Café adjacent to improved base and speciality materials resources grants +1 [ICON_CITIZEN] Citizen slot (the appointment of a {LOC_BUILDING_CSC_BAKERS_STAGE_4_SPECIALIST_GARDEN_NAME}) to an adjacent Garden if it has a Conservatory.'   );