-- CSC_Quarters
-- Author: Henno
-- DateCreated: 4/19/2025 10:54:43
--------------------------------------------------------------

--===============================================================================================================================================================================--
/* TYPES */
--===============================================================================================================================================================================--

INSERT INTO Types

        (       Type,                                                           Kind                    )
VALUES  (       'DISTRICT_CSC_BAKERS_QUARTER',                                  'KIND_DISTRICT'         ),
        (       'MODIFIER_CSC_PLAYER_DISTRICTS_ATTACH_MODIFIER',                'KIND_MODIFIER'         );



--===============================================================================================================================================================================--
/* QUARTERS */
--===============================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Districts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Districts

	(       DistrictType,
		Name,
		Description,
		PrereqTech,
		Cost,
		CostProgressionModel,
		CostProgressionParam1,
		MilitaryDomain,
		RequiresPlacement,
		Coast,
		RequiresPopulation,
		Aqueduct,
		InternalOnly,
		NoAdjacentCity,
		PlunderType,
		PlunderAmount,
		Appeal,
		OnePerCity,
		CaptureRemovesBuildings,
		CaptureRemovesCityDefenses,
		Maintenance,
		CityStrengthModifier,
		AdvisorType                     )
VALUES	(
		/* DistrictType, */			'DISTRICT_CSC_BAKERS_QUARTER',
		/* Name, */				'LOC_DISTRICT_CSC_BAKERS_QUARTER_NAME',
		/* Description, */			'LOC_DISTRICT_CSC_BAKERS_QUARTER_DESCRIPTION',
		/* PrereqTech, */			NULL,
		/* Cost, */				10,
		/* CostProgressionModel, */             'COST_PROGRESSION_GAME_PROGRESS',
		/* CostProgressionParam1, */	        1000,
		/* MilitaryDomain, */			'NO_DOMAIN',
		/* RequiresPlacement, */		1,
		/* Coast, */				0,
		/* RequiresPopulation, */	        1,
		/* Aqueduct, */				0,
		/* InternalOnly, */			0,
		/* NoAdjacentCity, */			0,
		/* PlunderType, */			'PLUNDER_HEAL',
		/* PlunderAmount, */			50,
		/* Appeal, */				1,
		/* OnePerCity, */			1,
		/* CaptureRemovesBuildings, */	        0,
		/* CaptureRemovesCityDefenses, */	0,
		/* Maintenance, */			0,
		/* CityStrengthModifier */		2,
		/* AdvisorType */			'ADVISOR_GENERIC'
		);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Adjacency_YieldChanges
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------		

INSERT INTO Adjacency_YieldChanges
            
        (	ID,
                Description,
                YieldType,
                YieldChange,
                OtherDistrictAdjacent,
                TilesRequired,
                AdjacentNaturalWonder,
                AdjacentSeaResource,
                AdjacentImprovement,
                AdjacentTerrain,
                AdjacentFeature,
                PrereqCivic,
                PrereqTech,
                AdjacentDistrict                )
VALUES  (	
                /* ID, */                               'CSC_QUARTER_CITY_CENTER_GOLD',
                /* Description, */                      'LOC_CSC_QUARTER_CITY_CENTER_GOLD_DESCRIPTION',
                /* YieldType, */                        'YIELD_GOLD',
                /* YieldChange, */                      1,
                /* OtherDistrictAdjacent, */            0,
                /* TilesRequired, */                    1,
                /* AdjacentNaturalWonder, */            0,
                /* AdjacentSeaResource, */              0,
                /* AdjacentImprovement, */              NULL,
                /* AdjacentTerrain, */                  NULL,
                /* AdjacentFeature, */                  NULL,
                /* PrereqCivic, */                      NULL, 
                /* PrereqTech, */                       NULL,
                /* AdjacentDistrict */                  'DISTRICT_CITY_CENTER'
                ),        
        (	
                /* ID, */                               'CSC_QUARTER_COMMERCIAL_HUB_GOLD',
                /* Description, */                      'LOC_CSC_QUARTER_COMMERCIAL_HUB_GOLD_DESCRIPTION',
                /* YieldType, */                        'YIELD_GOLD',
                /* YieldChange, */                      1,
                /* OtherDistrictAdjacent, */            0,
                /* TilesRequired, */                    1,
                /* AdjacentNaturalWonder, */            0,
                /* AdjacentSeaResource, */              0,
                /* AdjacentImprovement, */              NULL,
                /* AdjacentTerrain, */                  NULL,
                /* AdjacentFeature, */                  NULL,
                /* PrereqCivic, */                      NULL,
                /* PrereqTech, */                       NULL,
                /* AdjacentDistrict */                  'DISTRICT_COMMERCIAL_HUB'
                ),
        (	
                /* ID, */                               'CSC_QUARTER_HARBOR_GOLD',
                /* Description, */                      'LOC_CSC_QUARTER_HARBOR_GOLD_DESCRIPTION',
                /* YieldType, */                        'YIELD_GOLD',
                /* YieldChange, */                      1,
                /* OtherDistrictAdjacent, */            0,
                /* TilesRequired, */                    1,
                /* AdjacentNaturalWonder, */            0,
                /* AdjacentSeaResource, */              0,
                /* AdjacentImprovement, */              NULL,
                /* AdjacentTerrain, */                  NULL,
                /* AdjacentFeature, */                  NULL,
                /* PrereqCivic, */                      NULL,
                /* PrereqTech, */                       NULL,
                /* AdjacentDistrict */                  'DISTRICT_HARBOR'
                );
                
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- District_Adjacencies
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------						

INSERT INTO District_Adjacencies
           
        (	DistrictType,		                YieldChangeID		                                )
VALUES  (	'DISTRICT_CSC_BAKERS_QUARTER',		'CSC_QUARTER_CITY_CENTER_GOLD'		                ),
        (	'DISTRICT_CSC_BAKERS_QUARTER',		'CSC_QUARTER_COMMERCIAL_HUB_GOLD'	                ),
        (	'DISTRICT_CSC_BAKERS_QUARTER',		'CSC_QUARTER_HARBOR_GOLD'	                        );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- District_CitizenYieldChanges
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------									

INSERT INTO District_CitizenYieldChanges

        (	DistrictType,      		        YieldType,       	YieldChange	        )
VALUES  (	'DISTRICT_CSC_BAKERS_QUARTER',          'YIELD_FOOD',	        '2'		        );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DistrictModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT INTO DistrictModifiers

        (	DistrictType,		                ModifierId			                        )
VALUES  (	'DISTRICT_CSC_BAKERS_QUARTER',          'CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS'	                );



--===============================================================================================================================================================================--
/* TRAITS */
--===============================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TraitModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

--INSERT INTO TraitModifiers

--        (	TraitType,		                ModifierId			                        )
--VALUES  (	'',               ''                );



--===========================================================================================================================================================================--
/* IMPROVEMENTS */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Improvement_YieldChanges
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO Improvement_YieldChanges

        (       ImprovementType,                YieldType,              YieldChange     )
VALUES  (       'IMPROVEMENT_FARM',             'YIELD_GOLD',           0               );  

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ImprovementModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT INTO ImprovementModifiers

        (	ImprovementType,		        ModifierId			                        )
VALUES  (	'IMPROVEMENT_FARM',                     'CSC_BAKERS_QUARTER_DISTRICT_ATTACH'                    ),
        (	'IMPROVEMENT_PLANTATION',               'CSC_BAKERS_QUARTER_DISTRICT_ATTACH'                    );



--===========================================================================================================================================================================--
/* MODIFIERS */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DynamicModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO DynamicModifiers 

        (       ModifierType,                                                   CollectionType,                         EffectType	                        )
VALUES  (       'MODIFIER_CSC_PLAYER_DISTRICTS_ATTACH_MODIFIER',                'COLLECTION_PLAYER_DISTRICTS',          'EFFECT_ATTACH_MODIFIER'                );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Modifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Modifiers 
		
        (	ModifierId,			                                ModifierType,			                                OwnerRequirementSetId,                          SubjectRequirementSetId                )
VALUES	(	'CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS',                        'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE',            NULL,                                           'REQSET_CSC_PLOT_IS_HILLS'              ),

        (       'CSC_BAKERS_QUARTER_DISTRICT_ATTACH',                           'MODIFIER_CSC_PLAYER_DISTRICTS_ATTACH_MODIFIER',                'REQSET_CSC_PLOT_HAS_BAKERS_RAW',               'REQSET_CSC_ADJACENT_BAKERS_QUARTER'    ),
        (       'CSC_BAKERS_QUARTER_PRODUCTION_FROM_ADJACENT_RAW_MATERIALS',    'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE',            NULL,                                           NULL                                    );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ModifierArguments
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
INSERT INTO ModifierArguments
		
        (	ModifierId,			                                        Name,                           Value		                                                )
VALUES  (	'CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS',                                'YieldType',	                'YIELD_PRODUCTION'                                              ),
        (	'CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS',                                'Amount',		        1		                                                ),

        (       'CSC_BAKERS_QUARTER_DISTRICT_ATTACH',                                   'ModifierId',                   'CSC_BAKERS_QUARTER_PRODUCTION_FROM_ADJACENT_RAW_MATERIALS'     ),    
        (       'CSC_BAKERS_QUARTER_PRODUCTION_FROM_ADJACENT_RAW_MATERIALS',            'YieldType',                    'YIELD_PRODUCTION'                                              ),
        (       'CSC_BAKERS_QUARTER_PRODUCTION_FROM_ADJACENT_RAW_MATERIALS',            'Amount',                       1                                                               );



--===========================================================================================================================================================================--
/* REQUIREMENTS */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RequirementSets
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
INSERT INTO RequirementSets 
		
        (	RequirementSetId,                                       RequirementSetType              )
VALUES  (	'REQSET_CSC_PLOT_IS_HILLS',	                        'REQUIREMENTSET_TEST_ALL'       ),

        (       'REQSET_CSC_ADJACENT_BAKERS_QUARTER',                   'REQUIREMENTSET_TEST_ALL'       );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RequirementSetRequirements
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
				
INSERT INTO RequirementSetRequirements
		
        (	RequirementSetId,		                        RequirementId	                                        )
VALUES  (	'REQSET_CSC_PLOT_IS_HILLS',                             'REQ_CSC_PLOT_IS_HILLS'			                ),

        (       'REQSET_CSC_ADJACENT_BAKERS_QUARTER',                   'REQ_CSC_PLOT_ADJACENT_TO_OWNER'                        ),
        (       'REQSET_CSC_ADJACENT_BAKERS_QUARTER',                   'REQ_CSC_DISTRICT_IS_BAKERS_QUARTER'                    );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Requirements
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Requirements
        
        (	RequirementId,		                                RequirementType,	                                Inverse         )
VALUES  (	'REQ_CSC_PLOT_IS_HILLS',                                'REQUIREMENT_PLOT_IS_HILLS',                            0	        ),

        (       'REQ_CSC_DISTRICT_IS_BAKERS_QUARTER',                   'REQUIREMENT_PLOT_DISTRICT_TYPE_MATCHES',               0               );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RequirementArguments
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO RequirementArguments 

        (	RequirementId,				                Name,                           Value		                                )
VALUES  (       'REQ_CSC_DISTRICT_IS_BAKERS_QUARTER',                   'DistrictType',                 'DISTRICT_CSC_BAKERS_QUARTER'                   );
       


        
        

