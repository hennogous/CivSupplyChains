-- CSC_Quarters
-- Author: Shadow
-- DateCreated: 4/19/2025 10:54:43
--------------------------------------------------------------

--===============================================================================================================================================================================--
/* SECTION 0: TYPES */
--===============================================================================================================================================================================--

INSERT INTO Types

        (Type,                                                                  Kind)
VALUES  ('DISTRICT_BAKERS_QUARTER',                                             'KIND_DISTRICT'         ),
        ('CSC_COLLECTION_OWNER_EFFECT_DISTRICT_ADJACENCY',                      'KIND_MODIFIER'         ),
        ('CSC_COLLECTION_OWNER_EFFECT_IMPROVEMENT_ADJACENCY',                   'KIND_MODIFIER'         );

INSERT INTO Types (Type, Kind)

SELECT	'EFFECT_IMPROVEMENT_ADJACENCY',	'KIND_EFFECT'

WHERE NOT EXISTS (SELECT 1 FROM Types WHERE Type = 'EFFECT_IMPROVEMENT_ADJACENCY');



--===============================================================================================================================================================================--
/* SECTION 1: QUARTERS */
--===============================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Districts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Districts

        (       DistrictType,                           Name,                                           Description,                                           PrereqCivic,	                PlunderType,		PlunderAmount,	        AdvisorType,	        Cost,   CostProgressionModel,			        CostProgressionParam1,  OnePerCity,     RequiresPlacement,      RequiresPopulation,     NoAdjacentCity,	        CaptureRemovesBuildings,        CaptureRemovesCityDefenses,	MilitaryDomain,	        Aqueduct,       InternalOnly,   Appeal,         Housing,        Entertainment,  Maintenance,    CitizenSlots,   CityStrengthModifier,   CaptureRemovesDistrict,         MaxPerPlayer	)
VALUES  (       'DISTRICT_BAKERS_QUARTER',              'LOC_DISTRICT_BAKERS_QUARTER_NAME',             'LOC_DISTRICT_BAKERS_QUARTER_DESCRIPTION',              NULL,               	        'PLUNDER_HEAL', 	'50',	                'ADVISOR_GENERIC',	'1',   'COST_PROGRESSION_GAME_PROGRESS',	        '1000',		        '1',	        '1',		        '0',		        '0',		        '0',			        '0',			        'NO_DOMAIN',	        '0',            '0',            '-1',	        '0',	        '0',            '1',	        '0',	        '2',		        '0',		                '-1'	        );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Adjacency_YieldChanges
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------		

INSERT INTO Adjacency_YieldChanges
            
        (	ID,			                                Description,				                        YieldType,              YieldChange,    OtherDistrictAdjacent,  TilesRequired,  AdjacentNaturalWonder,  AdjacentSeaResource,    AdjacentImprovement,    AdjacentTerrain,        AdjacentFeature,        PrereqCivic,            PrereqTech,             AdjacentDistrict                )
VALUES  (	'CSC_QUARTER_CITY_CENTER_GOLD',         'LOC_CSC_QUARTER_CITY_CENTER_GOLD_DESCRIPTION',         'YIELD_GOLD',         1,  0,  1,  0,  0,  NULL,  NULL,  NULL,  NULL,  NULL,  'DISTRICT_CITY_CENTER'         ),
        (	'CSC_QUARTER_COMMERCIAL_HUB_GOLD',      'LOC_CSC_QUARTER_COMMERCIAL_HUB_GOLD_DESCRIPTION',      'YIELD_GOLD',         1,  0,  1,  0,  0,  NULL,  NULL,  NULL,  NULL,  NULL,  'DISTRICT_COMMERCIAL_HUB'      ),
        (	'CSC_QUARTER_HARBOR_GOLD',             'LOC_CSC_QUARTER_HARBOR_GOLD_DESCRIPTION',             'YIELD_GOLD',         1,  0,  1,  0,  0,  NULL,  NULL,  NULL,  NULL,  NULL,  'DISTRICT_HARBOR'              );

--        (	'CSC_BAKERS_QUARTER_PRODUCTION_FROM_ALL_ADJ_FARMS',     'LOC_CSC_BAKERS_QUARTER_PRODUCTION_FROM_ALL_ADJACENT_FARMS',    'YIELD_PRODUCTION',	1,	        0,		        1,	        0,		        0,			'IMPROVEMENT_FARM',     NULL,                   NULL,		        NULL,	                NULL,			NULL                            );
--        (	'CSC_ALL_FARMS_GOLD_FROM_ADJACENT_BAKERS_QUARTER',      'LOC_CSC_ALL_FARMS_GOLD_FROM_ADJACENT_BAKERS_QUARTER',          'YIELD_GOLD',	        1,	        0,		        1,	        0,		        0,			NULL,                   NULL,                   NULL,		        NULL,	                NULL,			'DISTRICT_BAKERS_QUARTER'       );


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- District_Adjacencies
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------						

INSERT INTO District_Adjacencies
           
        (	DistrictType,		                YieldChangeID		                                )
VALUES  (	'DISTRICT_BAKERS_QUARTER',		'CSC_QUARTER_CITY_CENTER_GOLD'		                ),
        (	'DISTRICT_BAKERS_QUARTER',		'CSC_QUARTER_COMMERCIAL_HUB_GOLD'	                ),
        (	'DISTRICT_BAKERS_QUARTER',		'CSC_QUARTER_HARBOR_GOLD'	                        );

--        (       'DISTRICT_BAKERS_QUARTER',              'CSC_BAKERS_QUARTER_PRODUCTION_FROM_ALL_ADJ_FARMS'      );

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
VALUES  (	'DISTRICT_BAKERS_QUARTER',              'CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS'	                );


--===========================================================================================================================================================================--
/* SECTION 2: IMPROVEMENTS */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Improvement_YieldChanges
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO Improvement_YieldChanges

        (       ImprovementType,                YieldType,              YieldChange     )
VALUES  (       'IMPROVEMENT_FARM',             'YIELD_GOLD',           0               );  

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Improvement_Adjacencies
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--INSERT INTO Improvement_Adjacencies
		
--        (       ImprovementType,                YieldChangeId			                        )
--VALUES  (	'IMPROVEMENT_FARM',             'CSC_ALL_FARMS_GOLD_FROM_ADJACENT_BAKERS_QUARTER'       );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ImprovementModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT INTO ImprovementModifiers

        (	ImprovementType,		        ModifierId			                                )
VALUES  (	'IMPROVEMENT_FARM',                     'CSC_BAKERS_QUARTER_PRODUCTION_FROM_ALL_ADJACENT_FARMS'         ),
        (       'IMPROVEMENT_FARM',                     'CSC_BAKERS_QUARTER_GOLD_TO_ALL_ADJACENT_FARMS'                 );



--===========================================================================================================================================================================--
/* SECTION 3: MODIFIERS */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DynamicModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO DynamicModifiers 

        (       ModifierType,                                                           CollectionType,                 EffectType	                                )
VALUES  (       'CSC_COLLECTION_OWNER_EFFECT_DISTRICT_ADJACENCY',                       'COLLECTION_OWNER',             'EFFECT_DISTRICT_ADJACENCY'                     ),
        (       'CSC_COLLECTION_OWNER_EFFECT_IMPROVEMENT_ADJACENCY',                    'COLLECTION_OWNER',             'EFFECT_IMPROVEMENT_ADJACENCY'                  );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Modifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Modifiers 
		
        (	ModifierId,			                                ModifierType,			                                SubjectRequirementSetId,                        RunOnce,        Permanent,      OwnerRequirementSetId,  OwnerStackLimit,        SubjectStackLimit        )
VALUES	(	'CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS',                        'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE',            'REQSET_CSC_PLOT_IS_HILLS',                     0,              0,	        NULL,		        NULL,		        NULL	                 ),
        (       'CSC_BAKERS_QUARTER_PRODUCTION_FROM_ALL_ADJACENT_FARMS',        'CSC_COLLECTION_OWNER_EFFECT_DISTRICT_ADJACENCY',               'REQSET_CSC_PLOT_HAS_BAKERS_RAW_MATERIALS',     0,              0,              NULL,                   NULL,                   NULL                     ),
        (       'CSC_BAKERS_QUARTER_GOLD_TO_ALL_ADJACENT_FARMS',                'CSC_COLLECTION_OWNER_EFFECT_IMPROVEMENT_ADJACENCY',            NULL,                                           0,              0,              NULL,                   NULL,                   NULL                     );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ModifierArguments
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
INSERT INTO ModifierArguments
		
        (	ModifierId,			                                Name,                           Value		                )
VALUES  (	'CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS',                        'YieldType',	                'YIELD_PRODUCTION'              ),
        (	'CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS',                        'Amount',		        '1'		                ),

        (       'CSC_BAKERS_QUARTER_GOLD_TO_ALL_ADJACENT_FARMS',                'ImprovementType',              'IMPROVEMENT_FARM'              ),
        (       'CSC_BAKERS_QUARTER_GOLD_TO_ALL_ADJACENT_FARMS',                'DistrictType',                 'DISTRICT_BAKERS_QUARTER'       ),
        (       'CSC_BAKERS_QUARTER_GOLD_TO_ALL_ADJACENT_FARMS',                'TilesRequired',                '1'                             ),
        (       'CSC_BAKERS_QUARTER_GOLD_TO_ALL_ADJACENT_FARMS',                'YieldType',                    'YIELD_GOLD'                    ),
        (       'CSC_BAKERS_QUARTER_GOLD_TO_ALL_ADJACENT_FARMS',                'Amount',                       '1'                             ),
        (       'CSC_BAKERS_QUARTER_GOLD_TO_ALL_ADJACENT_FARMS',                'Description',                  'LOC_CSC_BAKERS_QUARTER_GOLD_TO_ALL_ADJACENT_FARMS'                   ),

        (       'CSC_BAKERS_QUARTER_PRODUCTION_FROM_ALL_ADJACENT_FARMS',        'DistrictType',                 'DISTRICT_BAKERS_QUARTER'       ),
        (       'CSC_BAKERS_QUARTER_PRODUCTION_FROM_ALL_ADJACENT_FARMS',        'TilesRequired',                '1'                             ),
        (       'CSC_BAKERS_QUARTER_PRODUCTION_FROM_ALL_ADJACENT_FARMS',        'YieldType',                    'YIELD_PRODUCTION'              ),
        (       'CSC_BAKERS_QUARTER_PRODUCTION_FROM_ALL_ADJACENT_FARMS',        'Amount',                       '1'                             ),
        (       'CSC_BAKERS_QUARTER_PRODUCTION_FROM_ALL_ADJACENT_FARMS',        'Description',                  'LOC_CSC_BAKERS_QUARTER_PRODUCTION_FROM_ALL_ADJACENT_FARMS'                   );
        


--===========================================================================================================================================================================--
/* SECTION 4: REQUIREMENTS */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Requirements
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Requirements
        
        (	RequirementId,		                RequirementType,	                        Inverse         )
VALUES  (	'REQ_CSC_PLOT_IS_HILLS',                'REQUIREMENT_PLOT_IS_HILLS',                    0	        ),
        (       'REQ_CSC_PLOT_HAS_WHEAT',               'REQUIREMENT_PLOT_RESOURCE_TYPE_MATCHES',       0               ),
        (       'REQ_CSC_PLOT_HAS_RICE',                'REQUIREMENT_PLOT_RESOURCE_TYPE_MATCHES',       0               ),
        (       'REQ_CSC_PLOT_HAS_MAIZE',               'REQUIREMENT_PLOT_RESOURCE_TYPE_MATCHES',       0               ),
        (       'REQ_CSC_PLOT_HAS_BANANAS',             'REQUIREMENT_PLOT_RESOURCE_TYPE_MATCHES',       0               );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RequirementArguments
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO RequirementArguments 

        (	RequirementId,				        Name,                           Value		                )
VALUES  (	'REQ_CSC_PLOT_HAS_WHEAT',	                'ResourceType',	                'RESOURCE_WHEAT'	        ),
        (	'REQ_CSC_PLOT_HAS_RICE',	                'ResourceType',	                'RESOURCE_RICE'	                ),
        (	'REQ_CSC_PLOT_HAS_MAIZE',	                'ResourceType',	                'RESOURCE_MAIZE'	        ),
        (	'REQ_CSC_PLOT_HAS_BANANAS',	                'ResourceType',	                'RESOURCE_BANANAS'	        );        

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RequirementSets
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
INSERT INTO RequirementSets 
		
        (	RequirementSetId,                               RequirementSetType              )
VALUES  (	'REQSET_CSC_PLOT_IS_HILLS',	                'REQUIREMENTSET_TEST_ALL'       ),
        (       'REQSET_CSC_PLOT_HAS_BAKERS_RAW_MATERIALS',     'REQUIREMENTSET_TEST_ANY'       );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RequirementSetRequirements
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
				
INSERT INTO RequirementSetRequirements
		
        (	RequirementSetId,		                        RequirementId	                                )
VALUES  (	'REQSET_CSC_PLOT_IS_HILLS',                             'REQ_CSC_PLOT_IS_HILLS'			        ),
        (       'REQSET_CSC_PLOT_HAS_BAKERS_RAW_MATERIALS',             'REQ_CSC_PLOT_HAS_WHEAT'                        ),
        (       'REQSET_CSC_PLOT_HAS_BAKERS_RAW_MATERIALS',             'REQ_CSC_PLOT_HAS_RICE'                         ),
        (       'REQSET_CSC_PLOT_HAS_BAKERS_RAW_MATERIALS',             'REQ_CSC_PLOT_HAS_MAIZE'                        ),
        (       'REQSET_CSC_PLOT_HAS_BAKERS_RAW_MATERIALS',             'REQ_CSC_PLOT_HAS_BANANAS'                      );
        

