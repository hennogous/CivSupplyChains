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
(   'en_US',    'LOC_DISTRICT_CSC_BAKERS_QUARTER_DESCRIPTION',          'A district in your city specializing in baking.[NEWLINE][NEWLINE]+1 [ICON_PRODUCTION] Production from each adjacent base or specialty materials resource from this supply chain, and +1 [ICON_GOLD] Gold in return. +1 [ICON_GOLD] Gold from each adjacent City Center and Commercial Hub, and +1 [ICON_FOOD] Food in return. +1 [ICON_GOLD] Gold from each adjacent Entertainment Complex, Water Park and Garden district (Leugi), and +1 [ICON_CULTURE] Culture in return. +1 [ICON_PRODUCTION] Production from every 2 adjacent river segments.'   ),

(   'en_US',    'LOC_RESOURCE_WINE_NAME',                               'Grapes'    ),

-- ADJACENCIES

(   'en_US',    'LOC_CLASS_CSC_BAKERS_BASE_NAME',                       'base materials'   ),
(   'en_US',    'LOC_CLASS_CSC_BAKERS_SPEC_NAME',                       'specialty materials'   ),

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

-- BUILDINGS

(   'en_US',    'LOC_BUILDING_CSC_BAKERS_RIVER_ACCESS_NAME',            'River access'  ),
(   'en_US',    'LOC_BUILDING_CSC_BAKERS_RIVER_ACCESS_DESCRIPTION',     'This quarter is adjacent to a river.'  ),

(   'en_US',    'LOC_BUILDING_CSC_BAKERS_NO_RIVER_ACCESS_NAME',         'No river access'  ),
(   'en_US',    'LOC_BUILDING_CSC_BAKERS_NO_RIVER_ACCESS_DESCRIPTION',  'This quarter is not adjacent to a river.'  ),

(   'en_US',    'LOC_BUILDING_CSC_BAKERS_WATER_MILL_NAME',              'Water Mill'    ),
(   'en_US',    'LOC_BUILDING_CSC_BAKERS_WATER_MILL_DESCRIPTION',       '[ICON_BULLET]+1 [ICON_Production] Production from each adjacent base materials improvement.[NEWLINE][ICON_BULLET]+1 [ICON_Food] Food, with a -1 [ICON_Gold] Gold maintenance cost.[NEWLINE][ICON_BULLET]+1 [ICON_Gold] Gold from the local Bakery and Café.[NEWLINE][ICON_BULLET]+1 [ICON_Food] Food bonus to [ICON_TradeRoute] trade routes to the city, and +1 [ICON_Gold] Gold in return from international routes.[NEWLINE][ICON_BULLET]+1 [ICON_Food] Food to an adjacent Granary, and receive +1 [ICON_Gold] Gold in return.[NEWLINE][NEWLINE]At Feudalism, a Water Mill adjacent to an improved base materials resource unlocks an additional bonus to an adjacent Granary.'   ),

(   'en_US',    'LOC_BUILDING_CSC_BAKERS_WIND_MILL_NAME',               'Wind Mill'    ),
(   'en_US',    'LOC_BUILDING_CSC_BAKERS_WIND_MILL_DESCRIPTION',        '[ICON_BULLET]+1 [ICON_Production] Production from each adjacent base materials improvement.[NEWLINE][ICON_BULLET]+1 [ICON_Food] Food, with a -1 [ICON_Gold] Gold maintenance cost.[NEWLINE][ICON_BULLET]+1 [ICON_Gold] Gold from the local Bakery and Café.[NEWLINE][ICON_BULLET]+1 [ICON_Food] Food bonus to [ICON_TradeRoute] trade routes to the city, and +1 [ICON_Gold] Gold in return from international routes.[NEWLINE][ICON_BULLET]+1 [ICON_Food] Food to an adjacent Granary, and receive +1 [ICON_Gold] Gold in return.[NEWLINE][NEWLINE]At Feudalism, a Wind Mill adjacent to an improved base materials resource unlocks an additional bonus to an adjacent Granary.'   ),

(   'en_US',    'LOC_BUILDING_CSC_BAKERS_BAKERY_NAME',                  'Bakery'    ),
(   'en_US',    'LOC_BUILDING_CSC_BAKERS_BAKERY_DESCRIPTION',           '[ICON_BULLET]+1 [ICON_Production] Production from the local Flour Mill.[NEWLINE][ICON_BULLET]+2 [ICON_Food] Food, with a -2 [ICON_Gold] Gold maintenance cost.[NEWLINE][ICON_BULLET]+1 [ICON_Food] Food bonus to all [ICON_TradeRoute] trade routes to the city, and +1 [ICON_Gold] Gold in return from international routes.[NEWLINE][ICON_BULLET]+0.2 [ICON_Food] Food and +0.2 [ICON_Gold] Gold per [ICON_Citizen] Citizen to the city for each adjacent Market.[NEWLINE][NEWLINE]At Medieval Faires, a Bakery adjacent to an improved base materials resource unlocks additional bonuses to each adjacent Market.'   ),

(   'en_US',    'LOC_BUILDING_CSC_BAKERS_CAFE_NAME',                    'Café'    ),
(   'en_US',    'LOC_BUILDING_CSC_BAKERS_CAFE_DESCRIPTION',             '[ICON_BULLET]+1 [ICON_Production] Production from the local Flour Mill.[NEWLINE][ICON_BULLET]+1 [ICON_Production] Production from each adjacent specialty materials improvement.[NEWLINE][ICON_BULLET]+3 [ICON_Food] Food, with a -3 [ICON_Gold] Gold maintenance cost.[NEWLINE][ICON_BULLET]+1 [ICON_Food] Food bonus to all [ICON_TradeRoute] trade routes to the city, and +2 [ICON_Gold] Gold in return from international routes.[NEWLINE][ICON_BULLET]+1 [ICON_Culture] Culture for every 5 [ICON_Citizen] Citizens in the city to each adjacent Zoo and Ferris Wheel, and +1 [ICON_Gold] Gold to the Café in return.[NEWLINE][NEWLINE]At Urbanization, a Café adjacent to an improved base and specialty materials resource unlocks additional bonuses to each adjacent Entertainment Complex and Water Park.'   ),

(   'en_US',    'LOC_BUILDING_CSC_BAKERS_STAGE_3_SPECIALIST_NAME',              'Town Crier'     ),
(   'en_US',    'LOC_BUILDING_CSC_BAKERS_STAGE_3_SPECIALIST_DESCRIPTION',       'Hear ye, hear ye! With such a growing population, someone is needed to spread news, laws, or proclamations aloud in public spaces.'    ),

(   'en_US',    'LOC_BUILDING_CSC_BAKERS_STAGE_4_SPECIALIST_ENTER_NAME',              'Groundskeeper'     ),
(   'en_US',    'LOC_BUILDING_CSC_BAKERS_STAGE_4_SPECIALIST_ENTER_DESCRIPTION',       'Growing visitor numbers, in no small part driven by the proximity of the adjacent Café, has created the need for someone to perform some much-needed maintenance on the district''s attractions.'    ),

(   'en_US',    'LOC_BUILDING_CSC_BAKERS_STAGE_4_SPECIALIST_WATER_NAME',              'Ride Technician'     ),
(   'en_US',    'LOC_BUILDING_CSC_BAKERS_STAGE_4_SPECIALIST_WATER_DESCRIPTION',       'Growing visitor numbers, in no small part driven by the proximity of the adjacent Café, has created the need for someone to perform some much-needed maintenance on the district''s attractions.'    ),

-- EFFECT DESCRIPTIONS

(   'en_US',    'LOC_CSC_BAKERS_STAGE_2_EFFECT_DESCRIPTION_WATER',              '{1_iBonus}% growth, as the local Granary has access to an adjacent Water Mill.'        ),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_2_EFFECT_DESCRIPTION_WATER_NEW',          '{1_iBonus}% growth, as the local Granary now has access to an adjacent Water Mill.'    ),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_2_EFFECT_DESCRIPTION_WATER_REMOVED',      '{1_iBonus}% growth, as the local Granary has lost access to the adjacent Water Mill.'  ),

(   'en_US',    'LOC_CSC_BAKERS_STAGE_2_EFFECT_DESCRIPTION_WIND',               '{1_iBonus}% growth, as the local Granary has access to an adjacent Wind Mill.'         ),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_2_EFFECT_DESCRIPTION_WIND_NEW',           '{1_iBonus}% growth, as the local Granary now has access to an adjacent Wind Mill.'     ),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_2_EFFECT_DESCRIPTION_WIND_REMOVED',       '{1_iBonus}% growth, as the local Granary has lost access to the adjacent Wind Mill.'   ),

(   'en_US',    'LOC_CSC_BAKERS_STAGE_2_CIVIC',                         '[NEWLINE][NEWLINE]Growth bonus from a Granary adjacent to a Water Mill or Wind Mill.'  ),

(   'en_US',    'LOC_CSC_BAKERS_STAGE_3_EFFECT',                        '[NEWLINE][NEWLINE]At Medieval Faires, the Market provides +2 [ICON_Housing] Housing, if adjacent to a Bakery that is in turn adjacent to an improved Bakers'' Quarter base materials resource.'  ),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_3_EFFECT_DESCRIPTION',            '{1_iBonus} [ICON_Housing] Housing, as the local Market has access to {2_Num : plural 1?an adjacent Bakery; other?{2_StackAmount} adjacent Bakeries;}.'  ),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_3_EFFECT_DESCRIPTION_NEW',        '{1_iBonus} [ICON_Housing] Housing, as the local Market now has access to {2_Num : plural 1?an adjacent Bakery; other?{2_StackAmount} adjacent Bakeries;}.'  ),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_3_EFFECT_DESCRIPTION_INCREASED',  '{1_iBonus} [ICON_Housing] Housing, as the local Market now has access to {2_StackAmount} more adjacent {2_Num : plural 1?Bakery; other?Bakeries;}.'  ),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_3_EFFECT_DESCRIPTION_DECREASED',  '{1_iBonus} [ICON_Housing] Housing, as the local Market now has access to {2_StackAmount} fewer adjacent {2_Num : plural 1?Bakery; other?Bakeries;}.'  ),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_3_EFFECT_DESCRIPTION_REMOVED',    '{1_iBonus} [ICON_Housing] Housing, as the local Market has lost access to {2_Num : plural 1?the adjacent Bakery; other?all adjacent Bakeries;}.'  ),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_3_SPECIALIST',                    '[NEWLINE][NEWLINE]At Medieval Faires, +1 [ICON_Citizen] Citizen slot ({LOC_BUILDING_CSC_BAKERS_STAGE_3_SPECIALIST_NAME}) is granted to a Commercial Hub with a Market, if adjacent to a Water Mill or Wind Mill that is in turn adjacent to an improved Bakers'' Quarter base materials resource.'    ),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_3_SPECIALIST_GRANT_NEW',          'A {LOC_BUILDING_CSC_BAKERS_STAGE_3_SPECIALIST_NAME} has been appointed.'		),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_3_CIVIC',                         '[ICON_Housing] Housing bonus and a [ICON_Citizen] Citizen slot from a Market adjacent to a Bakery.'  ),

(   'en_US',    'LOC_CSC_BAKERS_STAGE_4_REQUIREMENT',                           '[NEWLINE][NEWLINE]At Urbanization, if adjacent to a Café that is in turn adjacent to both improved Bakers'' Quarter base and speciality materials resources:'  ),

(   'en_US',    'LOC_CSC_BAKERS_STAGE_4_EFFECT_DESCRIPTION_ENTER',              '{1_iBonus} [ICON_Tourism] Tourism, as visitors to the local Zoo also have access to {2_Num : plural 1?an adjacent Café; other?{2_StackAmount} adjacent Cafés;}.'  ),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_4_EFFECT_DESCRIPTION_ENTER_NEW',          '{1_iBonus} [ICON_Tourism] Tourism, as visitors to the local Zoo now also have access to {2_Num : plural 1?an adjacent Café; other?{2_StackAmount} adjacent Cafés;}.'  ),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_4_EFFECT_DESCRIPTION_ENTER_INCREASED',    '{1_iBonus} [ICON_Tourism] Tourism, as visitors to the local Zoo now also have access to {2_StackAmount} more adjacent {2_Num : plural 1?Café; other?Cafés;}.'  ),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_4_EFFECT_DESCRIPTION_ENTER_DECREASED',    '{1_iBonus} [ICON_Tourism] Tourism, as visitors to the local Zoo now have access to {2_StackAmount} fewer adjacent {2_Num : plural 1?Café; other?Cafés;}.'  ),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_4_EFFECT_DESCRIPTION_ENTER_REMOVED',      '{1_iBonus} [ICON_Tourism] Tourism, as visitors to the local Zoo have lost access to {2_Num : plural 1?the adjacent Café; other?all adjacent Cafés;}.'  ),

(   'en_US',    'LOC_CSC_BAKERS_STAGE_4_EFFECT_DESCRIPTION_WATER',              '{1_iBonus} [ICON_Tourism] Tourism, as visitors to the local Ferris Wheel also have access to {2_Num : plural 1?an adjacent Café; other?{2_StackAmount} adjacent Cafés;}.'  ),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_4_EFFECT_DESCRIPTION_WATER_NEW',          '{1_iBonus} [ICON_Tourism] Tourism, as visitors to the local Ferris Wheel now also have access to {2_Num : plural 1?an adjacent Café; other?{2_StackAmount} adjacent Cafés;}.'  ),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_4_EFFECT_DESCRIPTION_WATER_INCREASED',    '{1_iBonus} [ICON_Tourism] Tourism, as visitors to the local Ferris Wheel now also have access to {2_StackAmount} more adjacent {2_Num : plural 1?Café; other?Cafés;}.'  ),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_4_EFFECT_DESCRIPTION_WATER_DECREASED',    '{1_iBonus} [ICON_Tourism] Tourism, as visitors to the local Ferris Wheel now have access to {2_StackAmount} fewer adjacent {2_Num : plural 1?Café; other?Cafés;}.'  ),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_4_EFFECT_DESCRIPTION_WATER_REMOVED',      '{1_iBonus} [ICON_Tourism] Tourism, as visitors to the local Ferris Wheel have lost access to {2_Num : plural 1?the adjacent Café; other?all adjacent Cafés;}.'  ),

(   'en_US',    'LOC_CSC_BAKERS_STAGE_4_SPECIALIST_ENTER',              '[NEWLINE]+2 [ICON_Tourism] Tourism to the district, and +1 [ICON_Citizen] Citizen slot ({LOC_BUILDING_CSC_BAKERS_STAGE_4_SPECIALIST_ENTER_NAME}) if the district has a Zoo.'),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_4_SPECIALIST_GRANT_ENTER_NEW',    'A {LOC_BUILDING_CSC_BAKERS_STAGE_4_SPECIALIST_ENTER_NAME} has been appointed.'	),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_4_SPECIALIST_WATER',              '[NEWLINE]+2 [ICON_Tourism] Tourism to the district, and +1 [ICON_Citizen] Citizen slot ({LOC_BUILDING_CSC_BAKERS_STAGE_4_SPECIALIST_WATER_NAME}) if the district has a Ferris Wheel.'),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_4_SPECIALIST_GRANT_WATER_NEW',    'A {LOC_BUILDING_CSC_BAKERS_STAGE_4_SPECIALIST_WATER_NAME} has been appointed.'	),
(   'en_US',    'LOC_CSC_BAKERS_STAGE_4_CIVIC',                         '[ICON_Tourism] Tourism bonus and a [ICON_Citizen] Citizen slot from a Zoo or Ferris Wheel adjacent to a Café.'  ),

-- PEDIA: SUPPLY CHAINS OVERVIEW SECTION

(   'en_US',
    'LOC_PEDIA_CONCEPTS_PAGEGROUP_CSC_SUPPLY_CHAINS_NAME',
    'Supply Chains' ),

(   'en_US',
    'LOC_PEDIA_CONCEPTS_PAGE_CSC_INTRODUCTION_CHAPTER_CONTENT_TITLE',
    'Introduction'    ),

(   'en_US',
    'LOC_PEDIA_CONCEPTS_PAGE_CSC_INTRODUCTION_CHAPTER_CONTENT_PARA_1',
    'Introduction text...'    ),

(   'en_US',
    'LOC_PEDIA_CONCEPTS_PAGE_CSC_MATERIALS_CHAPTER_CONTENT_TITLE',
    'Stage 1: Materials extraction'    ),

(   'en_US',
    'LOC_PEDIA_CONCEPTS_PAGE_CSC_MATERIALS_CHAPTER_CONTENT_PARA_1',
    '- Stage 1 of supply chains consist of standard game improvements (e.g. wheat farms, cotton plantations and lumber mills) that extract materials from resources on the map, and sell them as inputs to stage 2 and 4 buildings.[NEWLINE]- Materials mapped to supply chains are classified as either base materials or specialty materials.'    ),

(   'en_US',
    'LOC_PEDIA_CONCEPTS_PAGE_CSC_QUARTERS_CHAPTER_CONTENT_TITLE',
    'Quarters'    ),

(   'en_US',
    'LOC_PEDIA_CONCEPTS_PAGE_CSC_QUARTERS_CHAPTER_CONTENT_PARA_1',
    '- Stages 2, 3 and 4 of supply chains are implemented as 3 buildings inside of 8 new districts called Quarters, each dedicated to the goods supply chain of a specific industry, e.g. Baking or Textiles.[NEWLINE]- All Quarters unlock at Craftsmanship.[NEWLINE]- Each Quarter can only be constructed once per city, and count toward district slots.'    ),

(   'en_US',
    'LOC_PEDIA_CONCEPTS_PAGE_CSC_INTERMEDIARY_CHAPTER_CONTENT_TITLE',
    'Stage 2: Intermediary goods'    ),

(   'en_US',
    'LOC_PEDIA_CONCEPTS_PAGE_CSC_INTERMEDIARY_CHAPTER_CONTENT_PARA_1',
    'Intermediary goods buildings purchase various base materials from stage 1 suppliers and processes those into intermediary goods (e.g. flour, textiles) to sell to customers. These customers could be both downstream actors in its supply chain for further processing, as well as outside of the supply chain for direct use.'    ),

(   'en_US',
    'LOC_PEDIA_CONCEPTS_PAGE_CSC_CONSUMER_CHAPTER_CONTENT_TITLE',
    'Stage 3: Consumer goods'    ),

(   'en_US',
    'LOC_PEDIA_CONCEPTS_PAGE_CSC_CONSUMER_CHAPTER_CONTENT_PARA_1',
    'Consumer goods buildings procure intermediary goods from a stage 2 supplier in the Quarter, and processes those into consumer goods (e.g. bakery, tailor, joinery) ready for sale to the general city population.'    ),

(   'en_US',
    'LOC_PEDIA_CONCEPTS_PAGE_CSC_SPECIALTY_CHAPTER_CONTENT_TITLE',
    'Stage 4: Specialty goods'    ),

(   'en_US',
    'LOC_PEDIA_CONCEPTS_PAGE_CSC_SPECIALTY_CHAPTER_CONTENT_PARA_1',
    'Specialty goods buildings procure intermediary goods from a stage 2 supplier in the Quarter and various specialty materials from stage 1 suppliers, and transforms them into specialty goods (e.g. Café, Fashion House, Sculptor) for sale to select customers.'    ),

(   'en_US',
    'LOC_PEDIA_CONCEPTS_PAGE_CSC_SALES_CHAPTER_CONTENT_TITLE',
    'Stage 5: Goods sales'    ),

(   'en_US',
    'LOC_PEDIA_CONCEPTS_PAGE_CSC_SALES_CHAPTER_CONTENT_PARA_1',
    'For the most part, sales of different types of goods to buyers (stage 5) were described in the sections above along with the building that produced the goods.'    ),

-- PEDIA: BAKERS' QUARTER

(   'en_US',
    'LOC_PEDIA_DISTRICTS_PAGE_DISTRICT_CSC_BAKERS_QUARTER_CHAPTER_CSCBASE_TITLE',
    'Base Materials' ),

(   'en_US',
    'LOC_PEDIA_DISTRICTS_PAGE_DISTRICT_CSC_BAKERS_QUARTER_CHAPTER_CSCSPEC_TITLE',
    'Specialty Materials' ),

-- PEDIA: WATER MILL

(   'en_US',
    'LOC_PEDIA_BUILDINGS_PAGE_BUILDING_CSC_BAKERS_WATER_MILL_CHAPTER_CSCHAIN_TITLE',
    'Supply Chains'   ),

(   'en_US',
    'LOC_PEDIA_BUILDINGS_PAGE_BUILDING_CSC_BAKERS_WATER_MILL_CHAPTER_CSCHAIN_PARA_1',
    'By the flowing river, the Water Mill stands as a testament to the harnessing of natural power. Its massive wheel turns with an insistent groan, transforming the raw harvests of nearby Wheat, Rice, and other Farms into the finely ground flour that is the lifeblood of your city. This essential step in the Bakers'' Quarter''s supply chain delivers its milled bounty to the Bakery and Café, as well as to an adjacent Granary, helping to fill the city''s stores.'   ),

(   'en_US',
    'LOC_PEDIA_BUILDINGS_PAGE_BUILDING_CSC_BAKERS_WATER_MILL_CHAPTER_HISTORY_TITLE',
    'Historical Context'   ),
    
(   'en_US',
    'LOC_PEDIA_BUILDINGS_PAGE_BUILDING_CSC_BAKERS_WATER_MILL_CHAPTER_HISTORY_PARA_1',
    'Water Mills were a significant technological innovation, building on earlier inventions like the wheel, which was fundamental to harnessing mechanical energy. They have a long and ancient history, with some of the earliest known examples dating back to ancient Persia and the Hellenistic world. Unlike windmills, they were tied to specific geographic locations, relying on the power of rivers and streams, and their use made them focal points for communities and settlements throughout history.'   ),

(   'en_US',
    'LOC_PEDIA_BUILDINGS_PAGE_BUILDING_CSC_BAKERS_WATER_MILL_CHAPTER_HISTORY_PARA_2',
    'The interaction between a water mill and a granary was central to the agrarian economy and became particularly significant during the feudal era. While the water mill itself was a powerful tool for processing grain, its value was tied directly to the ability to store the resulting product. The granary served as the secure, central repository for the milled grain, making it a critical component for managing food supplies. In many societies, this pairing of a powered mill and a central granary became a foundation of economic power, as it allowed landowners or authorities to control the processing, storage, and distribution of a community''s most essential commodity.'   ),

-- PEDIA: WIND MILL

(   'en_US',
    'LOC_PEDIA_BUILDINGS_PAGE_BUILDING_CSC_BAKERS_WIND_MILL_CHAPTER_CSCHAIN_TITLE',
    'Supply Chains'   ),

(   'en_US',
    'LOC_PEDIA_BUILDINGS_PAGE_BUILDING_CSC_BAKERS_WIND_MILL_CHAPTER_CSCHAIN_PARA_1',
    'Perched on a hill or an open plain, the Wind Mill stands ready to capture the invisible force of the air itself. With its great sails turning against the sky, it grinds raw materials from nearby Wheat, Rice, and other Farms into flour. This essential step in the Bakers'' Quarter''s supply chain provides flour to the Bakery and Café, and also stocks any adjacent Granary.'   ),

(   'en_US',
    'LOC_PEDIA_BUILDINGS_PAGE_BUILDING_CSC_BAKERS_WIND_MILL_CHAPTER_HISTORY_TITLE',
    'Historical Context'   ),

(   'en_US',
    'LOC_PEDIA_BUILDINGS_PAGE_BUILDING_CSC_BAKERS_WIND_MILL_CHAPTER_HISTORY_PARA_1',
    'Windmills were a significant technological innovation with a long and ancient history, building upon earlier inventions like the wheel, which was fundamental to harnessing mechanical energy. While they played a pivotal role in medieval Europe, their origins are believed to be much older, with evidence suggesting that the earliest designs were developed in Persia (modern-day Iran and Afghanistan) as early as the 9th century. These early windmills were primarily used for tasks like grinding grain and pumping water, and their use meant that communities were no longer solely reliant on rivers and streams for a power source, allowing them to establish mills in a wider range of locations.'   ),

(   'en_US',
    'LOC_PEDIA_BUILDINGS_PAGE_BUILDING_CSC_BAKERS_WIND_MILL_CHAPTER_HISTORY_PARA_2',
    'The interaction between a windmill and a granary reflects a self-contained system of production and storage that was vital for agricultural societies across different cultures and eras. During the feudal era, this relationship was particularly significant. The windmill, regardless of its specific design or origin, provided a new source of power to process crops, while the granary served as the central hub for storing the milled grain. This pairing was fundamental to economic and social structures, enabling communities to manage food supplies more efficiently and consolidating the control of resources in the hands of a ruling class. This combination of a powered mill and a central storage facility represents a timeless agricultural advancement, independent of any single region''s history.'   ),

-- PEDIA: GRANARY

(   'en_US',
    'LOC_PEDIA_BUILDINGS_PAGE_BUILDING_GRANARY_CHAPTER_CSCHAIN_TITLE',
    'Supply Chains'   ),

(   'en_US',
    'LOC_PEDIA_BUILDINGS_PAGE_BUILDING_GRANARY_CHAPTER_CSCHAIN_PARA_1',
    'The Granary stands as the final stop for flour before it reaches the city’s bakers. A bustling storehouse of grain and flour, it purchases the milled output from an adjacent Water Mill or Wind Mill, ensuring a constant supply of the raw materials needed to feed your populace.[NEWLINE][NEWLINE]At Feudalism, the Granary provides +10% growth in the city, if adjacent to a Water Mill or Wind Mill that is in turn adjacent to an improved Bakers'' Quarter base materials resource.'   ),

-- PEDIA: BAKERY

(   'en_US',
    'LOC_PEDIA_BUILDINGS_PAGE_BUILDING_CSC_BAKERS_BAKERY_CHAPTER_CSCHAIN_TITLE',
    'Supply Chains'   ),

(   'en_US',
    'LOC_PEDIA_BUILDINGS_PAGE_BUILDING_CSC_BAKERS_BAKERY_CHAPTER_CSCHAIN_PARA_1',
    'The Bakery is where the smell of freshly baked bread fills the air from early in the morning. Taking the finely milled flour from the local Water Mill or Wind Mill, this building transforms it into a variety of baked goods available at the Market, providing nourishment to the general population.'   ),

(   'en_US',
    'LOC_PEDIA_BUILDINGS_PAGE_BUILDING_CSC_BAKERS_BAKERY_CHAPTER_HISTORY_TITLE',
    'Historical Context'   ),

(   'en_US',
    'LOC_PEDIA_BUILDINGS_PAGE_BUILDING_CSC_BAKERS_BAKERY_CHAPTER_HISTORY_PARA_1',
    'The Bakery is an institution with a rich history, deeply tied to the rise of urban centers and the specialization of labor. The professional baker emerged with the advent of guilds, which regulated the trade and ensured the quality of products. A baker''s work was fundamentally dependent on the existence of a local Wind Mill or Water Mill, as these structures provided the milled flour essential for their craft. This relationship highlights a key supply chain, where the output of one industry—the milling of grain—becomes the primary input for another, the baking of bread. The presence of these mills allowed a baker to produce a consistent and reliable supply of bread, which was a dietary staple for a city''s growing population.'   ),

(   'en_US',
    'LOC_PEDIA_BUILDINGS_PAGE_BUILDING_CSC_BAKERS_BAKERY_CHAPTER_HISTORY_PARA_2',
    'With the advent of the Market, the role of the Bakery expanded beyond simple production. The Market provided a dedicated space for commerce, allowing bakers to sell their goods directly to the public rather than just to their immediate neighbors. This commercial link became even more pronounced with the development of Medieval Faires, which were large, periodic gatherings that attracted merchants and customers from a wide area. For the baker, a fair was a prime opportunity to sell a variety of breads and other baked goods, and to engage in larger-scale trade. This connection between the Bakery and the Market, particularly during special events like fairs, demonstrates how specialized crafts integrated into and helped to fuel the broader medieval economy.'   ),

-- PEDIA: MARKET

(   'en_US',
    'LOC_PEDIA_BUILDINGS_PAGE_BUILDING_MARKET_CHAPTER_CSCHAIN_TITLE',
    'Supply Chains'   ),

(   'en_US',
    'LOC_PEDIA_BUILDINGS_PAGE_BUILDING_MARKET_CHAPTER_CSCHAIN_PARA_1',
    'The Market is where the general population can purchase freshly baked goods from the Bakery every day, ensuring that the economic chain is completed and your citizens are well-fed.[NEWLINE][NEWLINE]At Medieval Faires, the Market provides +1 [ICON_Housing] Housing for each adjacent Bakery that is in turn adjacent to an improved base materials resource. This also grants +1 [ICON_CITIZEN] Citizen slot (the appointment of a {LOC_BUILDING_CSC_BAKERS_STAGE_3_SPECIALIST_NAME}) to the Commercial Hub.'   ),

-- PEDIA: CAFÉ

(   'en_US',
    'LOC_PEDIA_BUILDINGS_PAGE_BUILDING_CSC_BAKERS_CAFE_CHAPTER_CSCHAIN_TITLE',
    'Supply Chains'   ),

(   'en_US',
    'LOC_PEDIA_BUILDINGS_PAGE_BUILDING_CSC_BAKERS_CAFE_CHAPTER_CSCHAIN_PARA_1',
    'The Café is the final, exclusive step in the Bakers'' Quarter supply chain. It procures its flour from the local Water Mill or Wind Mill, but its true distinction comes from its use of rare specialty materials like coffee, sugar, cocoa, and spices. These are sourced from adjacent improvements and transformed into fine baked goods and rich drinks for the select customers who also frequent an adjacent Entertainment Complex or Water Park.'   ),

(   'en_US',
    'LOC_PEDIA_BUILDINGS_PAGE_BUILDING_CSC_BAKERS_CAFE_CHAPTER_HISTORY_TITLE',
    'Historical Context'   ),

(   'en_US',
    'LOC_PEDIA_BUILDINGS_PAGE_BUILDING_CSC_BAKERS_CAFE_CHAPTER_HISTORY_PARA_1',
    'The Café is an establishment that reflects the rise of a new kind of social and intellectual life, particularly with the advent of the Enlightenment. Its roots can be traced to the coffee houses that emerged in the Ottoman Empire and spread throughout Europe via trade routes. Its reliance on a local mill is a nod to a key supply chain, as it needs finely milled ingredients for its pastries and beverages. As society became more urbanized, cafes became vibrant social spaces, a departure from the traditional tavern or alehouse. They also had a crucial dependency on specialty materials like coffee, tea, and cocoa, which were increasingly imported as a result of global trade networks.'   ),

(   'en_US',
    'LOC_PEDIA_BUILDINGS_PAGE_BUILDING_CSC_BAKERS_CAFE_CHAPTER_HISTORY_PARA_2',
    'During the Enlightenment, cafés evolved from simple establishments into crucial centers for the exchange of ideas. They became known as "penny universities" because for the price of a cup of coffee, anyone could sit, read the daily papers, and engage in conversation with others. They were a more accessible alternative to official salons or universities, and because they were not subject to the same strict censorship as printed materials, they became hotbeds for intellectual discourse. Thinkers such as Voltaire, Rousseau, and Diderot were known to frequent these establishments, and it was in this atmosphere of open debate that many of their revolutionary ideas were refined and disseminated.'   ),

(   'en_US',
    'LOC_PEDIA_BUILDINGS_PAGE_BUILDING_CSC_BAKERS_CAFE_CHAPTER_HISTORY_PARA_3',
    'The sales interaction of a Café with the local Zoo or Ferris Wheel is a reflection of the rise of leisure culture and the "day out." As cities grew and the middle class expanded, public entertainment venues became popular destinations. A café adjacent to these attractions would have been a natural fit, offering a place for people to relax and socialize as part of their visit. This connection demonstrates how the Café was not just a place for intellectual discussion, but a vital part of a burgeoning urban entertainment industry, catering to a public seeking new forms of recreation and social engagement.'   ),

-- PEDIA: ENTERTAINMENT COMPLEX

(   'en_US',
    'LOC_PEDIA_DISTRICTS_PAGE_DISTRICT_ENTERTAINMENT_COMPLEX_CHAPTER_CSCHAIN_TITLE',
    'Supply Chains'   ),

(   'en_US',
    'LOC_PEDIA_DISTRICTS_PAGE_DISTRICT_ENTERTAINMENT_COMPLEX_CHAPTER_CSCHAIN_PARA_1',
    'Some visitors to the Entertainment Complex also enjoy some refreshments from the adjacent Café.[NEWLINE][NEWLINE]At Urbanization, each Café adjacent to improved base and speciality materials resources unlocks +2 [ICON_TOURISM] Tourism to the Entertainment Complex. This also grants +1 [ICON_CITIZEN] Citizen slot (the appointment of a {LOC_BUILDING_CSC_BAKERS_STAGE_4_SPECIALIST_ENTER_NAME}) to the Entertainment Complex if it has a Zoo.'   ),

(   'en_US',
    'LOC_PEDIA_DISTRICTS_PAGE_DISTRICT_STREET_CARNIVAL_CHAPTER_CSCHAIN_TITLE',
    'Supply Chains'   ),

(   'en_US',
    'LOC_PEDIA_DISTRICTS_PAGE_DISTRICT_STREET_CARNIVAL_CHAPTER_CSCHAIN_PARA_1',
    'Some visitors to the Street Carnival also enjoy some refreshments from the adjacent Café.[NEWLINE][NEWLINE]At Urbanization, each Café adjacent to improved base and speciality materials resources unlocks +2 [ICON_TOURISM] Tourism to the Street Carnical. This also grants +1 [ICON_CITIZEN] Citizen slot (the appointment of a {LOC_BUILDING_CSC_BAKERS_STAGE_4_SPECIALIST_ENTER_NAME}) to the Street Carnival if it has a Zoo.'   ),

(   'en_US',
    'LOC_PEDIA_DISTRICTS_PAGE_DISTRICT_HIPPODROME_CHAPTER_CSCHAIN_TITLE',
    'Supply Chains'   ),

(   'en_US',
    'LOC_PEDIA_DISTRICTS_PAGE_DISTRICT_HIPPODROME_CHAPTER_CSCHAIN_PARA_1',
    'Some visitors to the Hippodrome also enjoy some refreshments from the adjacent Café.[NEWLINE][NEWLINE]At Urbanization, each Café adjacent to improved base and speciality materials resources unlocks +2 [ICON_TOURISM] Tourism to the Hippodrome. This also grants +1 [ICON_CITIZEN] Citizen slot (the appointment of a {LOC_BUILDING_CSC_BAKERS_STAGE_4_SPECIALIST_ENTER_NAME}) to the Hippodrome if it has a Zoo.'   ),

(   'en_US',
    'LOC_PEDIA_BUILDINGS_PAGE_BUILDING_ZOO_CHAPTER_CSCHAIN_TITLE',
    'Supply Chains'   ),

(   'en_US',
    'LOC_PEDIA_BUILDINGS_PAGE_BUILDING_ZOO_CHAPTER_CSCHAIN_PARA_1',
    'Some visitors to the Zoo also enjoy some refreshments from the adjacent Café.[NEWLINE][NEWLINE]At Urbanization, a Café adjacent to improved base and speciality materials resources grants +1 [ICON_CITIZEN] Citizen slot (the appointment of a {LOC_BUILDING_CSC_BAKERS_STAGE_4_SPECIALIST_ENTER_NAME}) to an adjacent Entertainment Complex, Street Carnival or Hippodrome if it has a Zoo.'   ),

-- PEDIA: WATER PARK

(   'en_US',
    'LOC_PEDIA_DISTRICTS_PAGE_DISTRICT_WATER_ENTERTAINMENT_COMPLEX_CHAPTER_CSCHAIN_TITLE',
    'Supply Chains'   ),

(   'en_US',
    'LOC_PEDIA_DISTRICTS_PAGE_DISTRICT_WATER_ENTERTAINMENT_COMPLEX_CHAPTER_CSCHAIN_PARA_1',
    'Some visitors to the Water Park also enjoy some refreshments from the adjacent Café.[NEWLINE][NEWLINE]At Urbanization, each Café adjacent to improved base and speciality materials resources unlocks +2 [ICON_TOURISM] Tourism to the Water Park. This also grants +1 [ICON_CITIZEN] Citizen slot (the appointment of a {LOC_BUILDING_CSC_BAKERS_STAGE_4_SPECIALIST_WATER_NAME}) to the Water Park if it has a Ferris Wheel.'   ),

(   'en_US',
    'LOC_PEDIA_DISTRICTS_PAGE_DISTRICT_WATER_STREET_CARNIVAL_CHAPTER_CSCHAIN_TITLE',
    'Supply Chains'   ),

(   'en_US',
    'LOC_PEDIA_DISTRICTS_PAGE_DISTRICT_WATER_STREET_CARNIVAL_CHAPTER_CSCHAIN_PARA_1',
    'Some visitors to the Copacabana also enjoy some refreshments from the adjacent Café.[NEWLINE][NEWLINE]At Urbanization, each Café adjacent to improved base and speciality materials resources unlocks +2 [ICON_TOURISM] Tourism to the Copacabana. This also grants +1 [ICON_CITIZEN] Citizen slot (the appointment of a {LOC_BUILDING_CSC_BAKERS_STAGE_4_SPECIALIST_WATER_NAME}) to the Copacabana if it has a Ferris Wheel.'   ),

(   'en_US',
    'LOC_PEDIA_BUILDINGS_PAGE_BUILDING_FERRIS_WHEEL_CHAPTER_CSCHAIN_TITLE',
    'Supply Chains'   ),

(   'en_US',
    'LOC_PEDIA_BUILDINGS_PAGE_BUILDING_FERRIS_WHEEL_CHAPTER_CSCHAIN_PARA_1',
    'Some visitors to the Ferris Wheel also enjoy some refreshments from the adjacent Café.[NEWLINE][NEWLINE]At Urbanization, a Café adjacent to improved base and speciality materials resources grants +1 [ICON_CITIZEN] Citizen slot (the appointment of a {LOC_BUILDING_CSC_BAKERS_STAGE_4_SPECIALIST_WATER_NAME}) to an adjacent Water Park or Copacabana if it has a Ferris Wheel.'   );

-- PEDIA: RESOURCES

CREATE TEMP TABLE BAKERS_RESOURCES (
    ResourceName TEXT,
    ResourceCategory TEXT
);

INSERT INTO BAKERS_RESOURCES (ResourceName, ResourceCategory) VALUES

--	Bakers' Quarter base materials
		(	'RESOURCE_BANANAS',		'CLASS_CSC_BAKERS_BASE'		),
		(	'RESOURCE_MAIZE',		'CLASS_CSC_BAKERS_BASE'		),
		(	'RESOURCE_RICE',		'CLASS_CSC_BAKERS_BASE'		),
		(	'RESOURCE_WHEAT',		'CLASS_CSC_BAKERS_BASE'		),
        (   'RESOURCE_CSC_FLAX',    'CLASS_CSC_BAKERS_BASE'     ),

--	Bakers' Quarter specialty materials
		(	'RESOURCE_COCOA',		'CLASS_CSC_BAKERS_SPEC'		),
		(	'RESOURCE_COFFEE',		'CLASS_CSC_BAKERS_SPEC'		),
		(	'RESOURCE_WINE',		'CLASS_CSC_BAKERS_SPEC'		),
		(	'RESOURCE_OLIVES',		'CLASS_CSC_BAKERS_SPEC'		),
		(	'RESOURCE_SALT',		'CLASS_CSC_BAKERS_SPEC'		),
		(	'RESOURCE_SPICES',		'CLASS_CSC_BAKERS_SPEC'		),
		(	'RESOURCE_SUGAR',		'CLASS_CSC_BAKERS_SPEC'		),
		(	'RESOURCE_TEA',			'CLASS_CSC_BAKERS_SPEC'		);

INSERT OR REPLACE INTO LocalizedText (Language, Tag, Text)
SELECT
    'en_US',
    CASE
        WHEN ResourceCategory = 'CLASS_CSC_BAKERS_BASE' THEN 'LOC_PEDIA_DISTRICTS_PAGE_DISTRICT_CSC_BAKERS_QUARTER_CHAPTER_CSCBASE_PARA_1'
        WHEN ResourceCategory = 'CLASS_CSC_BAKERS_SPEC' THEN 'LOC_PEDIA_DISTRICTS_PAGE_DISTRICT_CSC_BAKERS_QUARTER_CHAPTER_CSCSPEC_PARA_1'
    END,
    '[ICON_BULLET]' || GROUP_CONCAT('[ICON_' || ResourceName || '] ' ||
        CASE ResourceName
            WHEN 'RESOURCE_CSC_FLAX' THEN 'Flax'
            WHEN 'RESOURCE_WINE' THEN 'Grapes'
            ELSE
                UPPER(SUBSTR(ResourceName, INSTR(ResourceName, '_') + 1, 1)) ||
                LOWER(SUBSTR(ResourceName, INSTR(ResourceName, '_') + 2))
        END, ' [NEWLINE][ICON_BULLET]')
FROM
    BAKERS_RESOURCES
GROUP BY
    ResourceCategory;

INSERT OR REPLACE INTO LocalizedText (Language, Tag, Text)
SELECT 'en_US', 'LOC_PEDIA_RESOURCES_PAGE_' || ResourceName || '_CHAPTER_CSCQUAR_TITLE', 'Supply Chains'
FROM BAKERS_RESOURCES
UNION ALL
SELECT
    'en_US',
    'LOC_PEDIA_RESOURCES_PAGE_' || ResourceName || '_CHAPTER_CSCQUAR_PARA_1',
    CASE
        WHEN ResourceCategory = 'CLASS_CSC_BAKERS_BASE' THEN 'Base material: [ICON_BAKERS] Bakers'' Quarter'
        WHEN ResourceCategory = 'CLASS_CSC_BAKERS_SPEC' THEN 'Specialty material: [ICON_BAKERS] Bakers'' Quarter'
    END
FROM BAKERS_RESOURCES;

DROP TABLE BAKERS_RESOURCES;

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