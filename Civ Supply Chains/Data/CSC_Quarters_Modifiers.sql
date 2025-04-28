-- CSC_Quarters
-- Author:
-- DateCreated: 4/19/2025 10:54:43
--------------------------------------------------------------

--===============================================================================================================================================================================--
/* SECTION 1: TYPES */
--===============================================================================================================================================================================--

INSERT INTO Types

        (       Type,                                                           Kind                    )
VALUES  (       'DISTRICT_BAKERS_QUARTER',                                      'KIND_DISTRICT'         ),
        (       'MODIFIER_CSC_PLAYER_DISTRICTS_ATTACH_MODIFIER',                'KIND_MODIFIER'         ),
        (       'MODIFIER_CSC_PLAYER_PLOT_YIELDS_ATTACH_MODIFIER',              'KIND_MODIFIER'         );



--===============================================================================================================================================================================--
/* SECTION 2: QUARTERS */
--===============================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Districts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Districts

        (       DistrictType,                           Name,                                           Description,                                           PrereqCivic,	                PlunderType,		PlunderAmount,	        AdvisorType,	        Cost,   CostProgressionModel,			        CostProgressionParam1,  OnePerCity,     RequiresPlacement,      RequiresPopulation,     NoAdjacentCity,	        CaptureRemovesBuildings,        CaptureRemovesCityDefenses,	MilitaryDomain,	        Aqueduct,       InternalOnly,   Appeal,         Housing,        Entertainment,  Maintenance,    CitizenSlots,   CityStrengthModifier,   CaptureRemovesDistrict,         MaxPerPlayer	)
VALUES  (       'DISTRICT_BAKERS_QUARTER',              'LOC_DISTRICT_BAKERS_QUARTER_NAME',             'LOC_DISTRICT_BAKERS_QUARTER_DESCRIPTION',              NULL,               	        'PLUNDER_HEAL', 	'50',	                'ADVISOR_GENERIC',	'10',   'COST_PROGRESSION_PREVIOUS_COPIES',	        '10',		        0,	        '1',		        '0',		        '0',		        '0',			        '0',			        'NO_DOMAIN',	        '0',            '0',            '-1',	        '0',	        '0',            '1',	        '0',	        '2',		        '0',		                '-1'	        );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Adjacency_YieldChanges
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------		

INSERT INTO Adjacency_YieldChanges
            
        (	ID,			                                Description,				                        YieldType,              YieldChange,    OtherDistrictAdjacent,  TilesRequired,  AdjacentNaturalWonder,  AdjacentSeaResource,    AdjacentImprovement,    AdjacentTerrain,        AdjacentFeature,        PrereqCivic,            PrereqTech,             AdjacentDistrict                )
VALUES  (	'CSC_QUARTER_CITY_CENTER_GOLD',                         'LOC_CSC_QUARTER_CITY_CENTER_GOLD_DESCRIPTION',                 'YIELD_GOLD',           1,              0,                      1,              0,                      0,                      NULL,                   NULL,                   NULL,                   NULL,                   NULL,                   'DISTRICT_CITY_CENTER'          ),
        (	'CSC_QUARTER_COMMERCIAL_HUB_GOLD',                      'LOC_CSC_QUARTER_COMMERCIAL_HUB_GOLD_DESCRIPTION',              'YIELD_GOLD',           1,              0,                      1,              0,                      0,                      NULL,                   NULL,                   NULL,                   NULL,                   NULL,                   'DISTRICT_COMMERCIAL_HUB'       ),
        (	'CSC_QUARTER_HARBOR_GOLD',                              'LOC_CSC_QUARTER_HARBOR_GOLD_DESCRIPTION',                      'YIELD_GOLD',           1,              0,                      1,              0,                      0,                      NULL,                   NULL,                   NULL,                   NULL,                   NULL,                   'DISTRICT_HARBOR'               );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- District_Adjacencies
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------						

INSERT INTO District_Adjacencies
           
        (	DistrictType,		                YieldChangeID		                                )
VALUES  (	'DISTRICT_BAKERS_QUARTER',		'CSC_QUARTER_CITY_CENTER_GOLD'		                ),
        (	'DISTRICT_BAKERS_QUARTER',		'CSC_QUARTER_COMMERCIAL_HUB_GOLD'	                ),
        (	'DISTRICT_BAKERS_QUARTER',		'CSC_QUARTER_HARBOR_GOLD'	                        );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- District_CitizenYieldChanges
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------									

INSERT INTO District_CitizenYieldChanges

        (	DistrictType,      		        YieldType,       	YieldChange	        )
VALUES  (	'DISTRICT_BAKERS_QUARTER',              'YIELD_FOOD',	        '2'		        );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DistrictModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT INTO DistrictModifiers

        (	DistrictType,		                ModifierId			                        )
VALUES  (	'DISTRICT_BAKERS_QUARTER',              'CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS'	                ),
        (       'DISTRICT_BAKERS_QUARTER',              'CSC_BAKERS_QUARTER_IMPROVEMENT_ATTACH'                 );



--===============================================================================================================================================================================--
/* SECTION 3: TRAITS */
--===============================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TraitModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

--INSERT INTO TraitModifiers

--        (	TraitType,		                ModifierId			                        )
--VALUES  (	'',               ''                );



--===========================================================================================================================================================================--
/* SECTION 4: IMPROVEMENTS */
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
VALUES  (	'IMPROVEMENT_FARM',                     'CSC_BAKERS_QUARTER_DISTRICT_ATTACH'                    );



--===========================================================================================================================================================================--
/* SECTION 5: MODIFIERS */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DynamicModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO DynamicModifiers 

        (       ModifierType,                                                           CollectionType,                         EffectType	                        )
VALUES  (       'MODIFIER_CSC_PLAYER_DISTRICTS_ATTACH_MODIFIER',                        'COLLECTION_PLAYER_DISTRICTS',          'EFFECT_ATTACH_MODIFIER'                ),
        (       'MODIFIER_CSC_PLAYER_PLOT_YIELDS_ATTACH_MODIFIER',                      'COLLECTION_SINGLE_PLOT_YIELDS',          'EFFECT_ATTACH_MODIFIER'                );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Modifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Modifiers 
		
        (	ModifierId,			                                ModifierType,			                                        SubjectRequirementSetId,                                OwnerRequirementSetId,                          RunOnce,        Permanent,      OwnerStackLimit,        SubjectStackLimit       )
VALUES	(	'CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS',                        'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE',                    'REQSET_CSC_PLOT_IS_HILLS',                             NULL,                                           0,              0,	        NULL,		        NULL	                ),

        (       'CSC_BAKERS_QUARTER_DISTRICT_ATTACH',                           'MODIFIER_CSC_PLAYER_DISTRICTS_ATTACH_MODIFIER',                        'REQSET_CSC_ADJACENT_BAKERS_QUARTER',                   'REQSET_CSC_PLOT_HAS_BAKERS_RAW_MATERIALS',     0,              0,              NULL,                   NULL                    ),
        (       'CSC_BAKERS_QUARTER_PRODUCTION_FROM_ADJACENT_RAW_MATERIALS',    'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE',                    NULL,                                                   NULL,                                           0,              0,              NULL,                   NULL                    ),

        (       'CSC_BAKERS_QUARTER_IMPROVEMENT_ATTACH',                        'MODIFIER_CSC_PLAYER_PLOT_YIELDS_ATTACH_MODIFIER',                      'REQSET_CSC_ADJACENT_BAKERS_QUARTER_RAW_MATERIALS',     NULL,                                           0,              0,              NULL,                   NULL                    ),
        (       'CSC_BAKERS_QUARTER_GOLD_TO_ADJACENT_RAW_MATERIALS',            'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                                    NULL,                                                   NULL,                                           0,              0,              NULL,                   NULL                    );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ModifierArguments
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
INSERT INTO ModifierArguments
		
        (	ModifierId,			                                        Name,                           Value		                                                )
VALUES  (	'CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS',                                'YieldType',	                'YIELD_PRODUCTION'                                              ),
        (	'CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS',                                'Amount',		        1		                                                ),

        (       'CSC_BAKERS_QUARTER_DISTRICT_ATTACH',                                   'ModifierId',                   'CSC_BAKERS_QUARTER_PRODUCTION_FROM_ADJACENT_RAW_MATERIALS'     ),    
        (       'CSC_BAKERS_QUARTER_PRODUCTION_FROM_ADJACENT_RAW_MATERIALS',            'YieldType',                    'YIELD_PRODUCTION'                                              ),
        (       'CSC_BAKERS_QUARTER_PRODUCTION_FROM_ADJACENT_RAW_MATERIALS',            'Amount',                       1                                                               ),

        (       'CSC_BAKERS_QUARTER_IMPROVEMENT_ATTACH',                                'ModifierId',                   'CSC_BAKERS_QUARTER_GOLD_TO_ADJACENT_RAW_MATERIALS'             ),
        (       'CSC_BAKERS_QUARTER_GOLD_TO_ADJACENT_RAW_MATERIALS',                    'YieldType',                    'YIELD_GOLD'                                                    ),
        (       'CSC_BAKERS_QUARTER_GOLD_TO_ADJACENT_RAW_MATERIALS',                    'Amount',                       1                                                               );



--===========================================================================================================================================================================--
/* SECTION 6: REQUIREMENTS */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Requirements
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Requirements
        
        (	RequirementId,		                                RequirementType,	                                Inverse         )
VALUES  (	'REQ_CSC_PLOT_IS_HILLS',                                'REQUIREMENT_PLOT_IS_HILLS',                            0	        ),

        (       'REQ_CSC_ADJACENT_PLOT',                                'REQUIREMENT_PLOT_ADJACENT_TO_OWNER',                   0               ),
        (       'REQ_CSC_DISTRICT_IS_BAKERS_QUARTER',                   'REQUIREMENT_PLOT_DISTRICT_TYPE_MATCHES',               0               ),
        (       'REQ_CSC_BAKERS_QUARTER_RAW_MATERIALS_CHECK',           'REQUIREMENT_REQUIREMENTSET_IS_MET',                    0               ),
        
        (       'REQ_CSC_PLOT_HAS_WHEAT',                               'REQUIREMENT_PLOT_RESOURCE_TYPE_MATCHES',               0               ),
        (       'REQ_CSC_PLOT_HAS_RICE',                                'REQUIREMENT_PLOT_RESOURCE_TYPE_MATCHES',               0               ),
        (       'REQ_CSC_PLOT_HAS_MAIZE',                               'REQUIREMENT_PLOT_RESOURCE_TYPE_MATCHES',               0               ),
        (       'REQ_CSC_PLOT_HAS_BANANAS',                             'REQUIREMENT_PLOT_RESOURCE_TYPE_MATCHES',               0               );


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RequirementArguments
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO RequirementArguments 

        (	RequirementId,				                Name,                           Value		                                )
VALUES  (       'REQ_CSC_DISTRICT_IS_BAKERS_QUARTER',                   'DistrictType',                 'DISTRICT_BAKERS_QUARTER'                       ),
        (       'REQ_CSC_BAKERS_QUARTER_RAW_MATERIALS_CHECK',           'RequirementSetId',             'REQSET_CSC_PLOT_HAS_BAKERS_RAW_MATERIALS'      ),

        (	'REQ_CSC_PLOT_HAS_WHEAT',	                        'ResourceType',	                'RESOURCE_WHEAT'	                        ),
        (	'REQ_CSC_PLOT_HAS_RICE',	                        'ResourceType',	                'RESOURCE_RICE'	                                ),
        (	'REQ_CSC_PLOT_HAS_MAIZE',	                        'ResourceType',	                'RESOURCE_MAIZE'	                        ),
        (	'REQ_CSC_PLOT_HAS_BANANAS',	                        'ResourceType',	                'RESOURCE_BANANAS'	                        );        

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RequirementSets
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
INSERT INTO RequirementSets 
		
        (	RequirementSetId,                                       RequirementSetType              )
VALUES  (	'REQSET_CSC_PLOT_IS_HILLS',	                        'REQUIREMENTSET_TEST_ALL'       ),
        (       'REQSET_CSC_PLOT_HAS_BAKERS_RAW_MATERIALS',             'REQUIREMENTSET_TEST_ANY'       ),
        (       'REQSET_CSC_ADJACENT_BAKERS_QUARTER',                   'REQUIREMENTSET_TEST_ALL'       ),
        (       'REQSET_CSC_ADJACENT_BAKERS_QUARTER_RAW_MATERIALS',     'REQUIREMENTSET_TEST_ALL'       );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RequirementSetRequirements
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
				
INSERT INTO RequirementSetRequirements
		
        (	RequirementSetId,		                        RequirementId	                                        )
VALUES  (	'REQSET_CSC_PLOT_IS_HILLS',                             'REQ_CSC_PLOT_IS_HILLS'			                ),

        (       'REQSET_CSC_PLOT_HAS_BAKERS_RAW_MATERIALS',             'REQ_CSC_PLOT_HAS_WHEAT'                                ),
        (       'REQSET_CSC_PLOT_HAS_BAKERS_RAW_MATERIALS',             'REQ_CSC_PLOT_HAS_RICE'                                 ),
        (       'REQSET_CSC_PLOT_HAS_BAKERS_RAW_MATERIALS',             'REQ_CSC_PLOT_HAS_MAIZE'                                ),
        (       'REQSET_CSC_PLOT_HAS_BAKERS_RAW_MATERIALS',             'REQ_CSC_PLOT_HAS_BANANAS'                              ),

        (       'REQSET_CSC_ADJACENT_BAKERS_QUARTER',                   'REQ_CSC_ADJACENT_PLOT'                                 ),
        (       'REQSET_CSC_ADJACENT_BAKERS_QUARTER',                   'REQ_CSC_DISTRICT_IS_BAKERS_QUARTER'                    ),

        (       'REQSET_CSC_ADJACENT_BAKERS_QUARTER_RAW_MATERIALS',     'REQ_CSC_ADJACENT_PLOT'                                 ),
        (       'REQSET_CSC_ADJACENT_BAKERS_QUARTER_RAW_MATERIALS',     'REQ_CSC_BAKERS_QUARTER_RAW_MATERIALS_CHECK'            );

        
        

