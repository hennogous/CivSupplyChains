-- CSC_Quarters
-- Author: Henno
-- DateCreated: 4/19/2025 10:54:43
--------------------------------------------------------------

--===============================================================================================================================================================================--
/* TYPES */
--===============================================================================================================================================================================--

INSERT INTO Types

        ( 	Type,                                                           Kind                    )
VALUES  ( 	'DISTRICT_CSC_BAKERS_QUARTER',                                  'KIND_DISTRICT'         ),
        ( 	'MODIFIER_CSC_PLAYER_DISTRICTS_ATTACH_MODIFIER',                'KIND_MODIFIER'         );



--===============================================================================================================================================================================--
/* QUARTERS */
--===============================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Districts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Districts

	(  	DistrictType,
		Name,
		Description,
		PrereqTech,
		PrereqCivic,
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
		AdvisorType                     	)
VALUES	(
		/* DistrictType, */							'DISTRICT_CSC_BAKERS_QUARTER',
		/* Name, */									'LOC_DISTRICT_CSC_BAKERS_QUARTER_NAME',
		/* Description, */							'LOC_DISTRICT_CSC_BAKERS_QUARTER_DESCRIPTION',
		/* PrereqTech, */							NULL,
		/* PrereqCivic, */							'CIVIC_CRAFTSMANSHIP',
		/* Cost, */									60,
		/* CostProgressionModel, */    				'COST_PROGRESSION_PREVIOUS_COPIES',
		/* CostProgressionParam1, */				100,
		/* MilitaryDomain, */						'NO_DOMAIN',
		/* RequiresPlacement, */					1,
		/* Coast, */								0,
		/* RequiresPopulation, */	    			0,
		/* Aqueduct, */								0,
		/* InternalOnly, */							0,
		/* NoAdjacentCity, */						0,
		/* PlunderType, */							'PLUNDER_HEAL',
		/* PlunderAmount, */						50,
		/* Appeal, */								1,
		/* OnePerCity, */							1,
		/* CaptureRemovesBuildings, */	   			0,
		/* CaptureRemovesCityDefenses, */			0,
		/* Maintenance, */							0,
		/* CityStrengthModifier */					2,
		/* AdvisorType */							'ADVISOR_GENERIC'
		);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tags
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Tags

		(	Tag,									Vocabulary				)
VALUES	( 	'CLASS_CSC_QUARTERS',        			'TAG_REQUIREMENT'       );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TypeTags
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO TypeTags

		(	Type,									Tag			        	)
SELECT		DistrictType,							'CLASS_CSC_QUARTERS'
FROM	  	Districts
WHERE		DistrictType IN
		(	'DISTRICT_CSC_BAKERS_QUARTER'                         	);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- District_CitizenYieldChanges
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------									

INSERT INTO District_CitizenYieldChanges

        (	DistrictType,      		        		YieldType,       		YieldChange	        )
VALUES  (	'DISTRICT_CSC_BAKERS_QUARTER',          'YIELD_FOOD',	        '2'		        	);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- District_TradeRouteYields
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------									

INSERT INTO District_TradeRouteYields
		
		(	DistrictType,					YieldType,			YieldChangeAsOrigin,	YieldChangeAsDomesticDestination,	YieldChangeAsInternationalDestination	)
VALUES	(	'DISTRICT_CSC_BAKERS_QUARTER',	'YIELD_FOOD',		0,						2,									2										);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DistrictModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT INTO DistrictModifiers

        (	DistrictType,		               		ModifierId			                        			)
VALUES  (	'DISTRICT_CSC_BAKERS_QUARTER',     		'CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS'	   				),

		(	'DISTRICT_CITY_CENTER',          		'CSC_ALL_QUARTERS_LOCAL_SALES_ATTACH_QUARTER'           ),
        (  	'DISTRICT_COMMERCIAL_HUB',     			'CSC_ALL_QUARTERS_LOCAL_SALES_ATTACH_QUARTER'           ),
        (  	'DISTRICT_HARBOR',                		'CSC_ALL_QUARTERS_LOCAL_SALES_ATTACH_QUARTER'           );



--===========================================================================================================================================================================--
/* IMPROVEMENTS */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Improvement_YieldChanges
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO Improvement_YieldChanges

        (	ImprovementType,                		YieldType,              YieldChange     )
VALUES  (	'IMPROVEMENT_FARM',             		'YIELD_GOLD',           0               );  

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ImprovementModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT INTO ImprovementModifiers

        (	ImprovementType,		        		ModifierId			                        						)
VALUES  (	'IMPROVEMENT_FARM',                     'CSC_BAKERS_QUARTER_IMPROVEMENT_ATTACH_QUARTER'                    	),
        (	'IMPROVEMENT_PLANTATION',               'CSC_BAKERS_QUARTER_IMPROVEMENT_ATTACH_QUARTER'                    	);



--===========================================================================================================================================================================--
/* MODIFIERS */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DynamicModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO DynamicModifiers 

        ( 	ModifierType,                                                   CollectionType,                         EffectType	                        	)
VALUES  ( 	'MODIFIER_CSC_PLAYER_DISTRICTS_ATTACH_MODIFIER',                'COLLECTION_PLAYER_DISTRICTS',          'EFFECT_ATTACH_MODIFIER'                );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Modifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Modifiers 
		
        (	ModifierId,			                                			ModifierType,			                                OwnerRequirementSetId,            	SubjectRequirementSetId                	)
VALUES	(	'CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS',                        'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE', 	NULL,                            	'REQSET_CSC_PLOT_IS_HILLS'              ),

        (  	'CSC_BAKERS_QUARTER_IMPROVEMENT_ATTACH_QUARTER',              	'MODIFIER_CSC_PLAYER_DISTRICTS_ATTACH_MODIFIER',     	'REQSET_CSC_PLOT_HAS_BAKERS_RAW', 	'REQSET_CSC_ADJACENT_BAKERS_QUARTER'    ),
        (  	'CSC_BAKERS_QUARTER_PRODUCTION_FROM_ADJACENT_RAW',    			'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE',  	NULL,                           	NULL                                    ),

        ( 	'CSC_ALL_QUARTERS_LOCAL_SALES_ATTACH_QUARTER',                  'MODIFIER_CSC_PLAYER_DISTRICTS_ATTACH_MODIFIER',    	NULL,                             	'REQSET_CSC_ANY_QUARTER_ADJACENT'     	),
        (  	'CSC_ALL_QUARTERS_GOLD_FROM_LOCAL_SALES',                       'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE',   	NULL,                             	NULL                                    );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ModifierArguments
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
INSERT INTO ModifierArguments
		
        (	ModifierId,			                                        	Name,                	Value		                                                	)
VALUES  (	'CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS',                        'YieldType',	      	'YIELD_PRODUCTION'                                              ),
        (	'CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS',                        'Amount',		        1		                                                		),

        (  	'CSC_BAKERS_QUARTER_IMPROVEMENT_ATTACH_QUARTER',                'ModifierId',         	'CSC_BAKERS_QUARTER_PRODUCTION_FROM_ADJACENT_RAW'     			),    
        (  	'CSC_BAKERS_QUARTER_PRODUCTION_FROM_ADJACENT_RAW',       		'YieldType',           	'YIELD_PRODUCTION'                                              ),
        ( 	'CSC_BAKERS_QUARTER_PRODUCTION_FROM_ADJACENT_RAW',       		'Amount',             	1                                                               ),

		(   'CSC_ALL_QUARTERS_LOCAL_SALES_ATTACH_QUARTER',                  'ModifierId',          	'CSC_ALL_QUARTERS_GOLD_FROM_LOCAL_SALES'                        ),
        (   'CSC_ALL_QUARTERS_GOLD_FROM_LOCAL_SALES',                       'YieldType',          	'YIELD_GOLD'                                                    ),
        (   'CSC_ALL_QUARTERS_GOLD_FROM_LOCAL_SALES',                       'Amount',              	1                                                            	);



--===========================================================================================================================================================================--
/* REQUIREMENTS */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RequirementSets
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
INSERT INTO RequirementSets 
		
        (	RequirementSetId,                              	RequirementSetType              )
VALUES  (	'REQSET_CSC_PLOT_IS_HILLS',	                  	'REQUIREMENTSET_TEST_ALL'       ),
        (  	'REQSET_CSC_ADJACENT_BAKERS_QUARTER',          	'REQUIREMENTSET_TEST_ALL'       ),

		(  	'REQSET_CSC_ANY_QUARTER',                     	'REQUIREMENTSET_TEST_ALL'       ),
		(	'REQSET_CSC_ANY_QUARTER_ADJACENT',				'REQUIREMENTSET_TEST_ALL'		);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RequirementSetRequirements
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
				
INSERT INTO RequirementSetRequirements
		
        (	RequirementSetId,		                      	RequirementId	                               	)
VALUES  (	'REQSET_CSC_PLOT_IS_HILLS',                    	'REQ_CSC_PLOT_IS_HILLS'			                ),

        ( 	'REQSET_CSC_ADJACENT_BAKERS_QUARTER',         	'REQ_CSC_PLOT_ADJACENT_TO_OWNER'              	),
        (  	'REQSET_CSC_ADJACENT_BAKERS_QUARTER',         	'REQ_CSC_DISTRICT_IS_BAKERS_QUARTER'           	),

		(  	'REQSET_CSC_ANY_QUARTER',                   	'REQ_CSC_DISTRICT_IS_ANY_QUARTER'             	),

		(	'REQSET_CSC_ANY_QUARTER_ADJACENT',				'REQ_CSC_DISTRICT_IS_ANY_QUARTER'				),
		(	'REQSET_CSC_ANY_QUARTER_ADJACENT',				'REQ_CSC_PLOT_ADJACENT_TO_OWNER'				);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Requirements
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Requirements
        
        (	RequirementId,		                          	RequirementType,	                                Inverse         )
VALUES  (	'REQ_CSC_PLOT_IS_HILLS',                       	'REQUIREMENT_PLOT_IS_HILLS',                      	0	        	),
        (   'REQ_CSC_DISTRICT_IS_BAKERS_QUARTER',          	'REQUIREMENT_PLOT_DISTRICT_TYPE_MATCHES',          	0               ),

		(  	'REQ_CSC_DISTRICT_IS_ANY_QUARTER',            	'REQUIREMENT_PLOT_DISTRICT_TAG_MATCHES',          	0               );


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RequirementArguments
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO RequirementArguments 

        (	RequirementId,				               		Name,                           Value		                    	)
VALUES  ( 	'REQ_CSC_DISTRICT_IS_BAKERS_QUARTER',         	'DistrictType',                 'DISTRICT_CSC_BAKERS_QUARTER'     	),

        ( 	'REQ_CSC_DISTRICT_IS_ANY_QUARTER',             	'Tag',                          'CLASS_CSC_QUARTERS'              	);