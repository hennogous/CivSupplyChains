-- CSC_REMOVE_MC_BONUSES
-- Author: Shadow
-- DateCreated: 2025-06-15 15:12:38
--------------------------------------------------------------

--===========================================================================================================================================================================--
/*	MONOPOLIES & CORPORATIONS */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	RequirementSetRequirements
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
				
INSERT INTO RequirementSetRequirements
		
        (	RequirementSetId,                           RequirementId                       )	VALUES
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