-- CSC_REMOVE_MC_BONUSES
-- Author: Shadow
-- DateCreated: 2025-06-15 15:12:38
--------------------------------------------------------------

--===========================================================================================================================================================================--
/*	MONOPOLIES & CORPORATIONS */
--===========================================================================================================================================================================--

DELETE FROM Modifiers
WHERE ModifierId IN (
        'INDUSTRY_CITY_GROWTH',
        'INDUSTRY_CITY_GROWTH_HOUSING',
        'INDUSTRY_MILITARY_UNIT_DISCOUNT',
        'INDUSTRY_CIVILIAN_UNIT_DISCOUNT',
        'INDUSTRY_BUILDING_DISCOUNT',
        'INDUSTRY_GOLD_YIELD_BONUS',
        'INDUSTRY_FAITH_YIELD_BONUS',
        'INDUSTRY_CULTURE_YIELD_BONUS',
        'INDUSTRY_SCIENCE_YIELD_BONUS',

        'CORPORATION_CITY_GROWTH',
        'CORPORATION_CITY_GROWTH_HOUSING',
        'CORPORATION_MILITARY_UNIT_DISCOUNT',
        'CORPORATION_CIVILIAN_UNIT_DISCOUNT',
        'CORPORATION_BUILDING_DISCOUNT',
        'CORPORATION_GOLD_YIELD_BONUS',
        'CORPORATION_FAITH_YIELD_BONUS',
        'CORPORATION_CULTURE_YIELD_BONUS',     
        'CORPORATION_SCIENCE_YIELD_BONUS'
        );



-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	RequirementSetRequirements
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*				
INSERT INTO RequirementSetRequirements
		
        (   RequirementSetId,                           RequirementId                       )	VALUES
        (   'REQUIRES_CITY_GROWTH_RESOURCE',            'REQ_CSC_DISABLE_BONUS'             ),
        (   'REQUIRES_MILITARY_DISCOUNT_RESOURCE',      'REQ_CSC_DISABLE_BONUS'             ),
        (   'REQUIRES_CIVILIAN_DISCOUNT_RESOURCE',      'REQ_CSC_DISABLE_BONUS'             ),
        (   'REQUIRES_BUILDING_DISCOUNT_RESOURCE',      'REQ_CSC_DISABLE_BONUS'             ),
        (   'REQUIRES_GOLD_BONUS_RESOURCE',             'REQ_CSC_DISABLE_BONUS'             ),
        (   'REQUIRES_FAITH_BONUS_RESOURCE',            'REQ_CSC_DISABLE_BONUS'             ),
        (   'REQUIRES_SCIENCE_BONUS_RESOURCE',          'REQ_CSC_DISABLE_BONUS'             ),
        (   'REQUIRES_CULTURE_BONUS_RESOURCE',          'REQ_CSC_DISABLE_BONUS'             );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Requirements
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Requirements
        
        (	RequirementId,                              RequirementType,                    Inverse         )	VALUES
        (   'REQ_CSC_DISABLE_BONUS',                    'REQUIREMENT_NEVER_MET',            0               );
*/