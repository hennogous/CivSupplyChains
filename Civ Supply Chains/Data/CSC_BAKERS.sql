-- CSC_BAKERS
-- Author: Henno
-- DateCreated: 4/19/2025 10:53:23
--------------------------------------------------------------

--===========================================================================================================================================================================--
/* TYPES */
--===========================================================================================================================================================================--

INSERT INTO Types

		(	Type,														Kind)
VALUES	( 	'DISTRICT_CSC_BAKERS_QUARTER',                              'KIND_DISTRICT'         ),

		(	'BUILDING_CSC_BAKERS_FLOUR_MILL',							'KIND_BUILDING'			),
		(	'BUILDING_CSC_BAKERS_BAKERY',								'KIND_BUILDING'			),
		(	'BUILDING_CSC_BAKERS_PATISSERIE',							'KIND_BUILDING'			),

        ( 	'MODIFIER_CSC_PLAYER_DISTRICTS_ATTACH_MODIFIER',          	'KIND_MODIFIER'			),
		(	'MODIFIER_CSC_PLAYER_DISTRICTS_ADJUST_DISTRICT_AMENITY',	'KIND_MODIFIER'			);



--===========================================================================================================================================================================--
/* SUPPLY CHAIN */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tags
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Tags

		(   Tag,							Vocabulary			)
VALUES	(	'CLASS_CSC_BAKERS_RAW',	    	'RESOURCE_CLASS'	);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TypeTags
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO TypeTags

	(	Type,					Tag			        )
SELECT	ResourceType,			'CLASS_CSC_BAKERS_RAW'
FROM	Resources
WHERE	ResourceType 			IN
	(	'RESOURCE_BANANAS',
		'RESOURCE_MAIZE',
		'RESOURCE_RICE',
		'RESOURCE_WHEAT'        );



--===========================================================================================================================================================================--
/* STAGE 1 - RAW MATERIALS IMPROVEMENTS */
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

        (	ImprovementType,		        		ModifierId			                        								)
VALUES  (	'IMPROVEMENT_FARM',                     'MOD_CSC_BAKERS_RAW_IMPROVEMENT_ATTACH_QUARTER'                 			),

--		(	'IMPROVEMENT_FARM',                     'MOD_CSC_BAKERS_FLOUR_MILL_IMPROVEMENT_FOOD_ATTACH_QUARTER'             	),
--		(	'IMPROVEMENT_FARM',                     'MOD_CSC_BAKERS_FLOUR_MILL_IMPROVEMENT_GOLD_ATTACH_QUARTER'             	),		

        (	'IMPROVEMENT_PLANTATION',               'MOD_CSC_BAKERS_RAW_IMPROVEMENT_ATTACH_QUARTER'                 			);

--        (	'IMPROVEMENT_PLANTATION',               'MOD_CSC_BAKERS_FLOUR_MILL_IMPROVEMENT_FOOD_ATTACH_QUARTER'                	),
--		(	'IMPROVEMENT_PLANTATION',               'MOD_CSC_BAKERS_FLOUR_MILL_IMPROVEMENT_GOLD_ATTACH_QUARTER'                	)



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
			AdvisorType                     		)
VALUES	(
		/*  DistrictType, */						'DISTRICT_CSC_BAKERS_QUARTER',
		/*  Name, */								'LOC_DISTRICT_CSC_BAKERS_QUARTER_NAME',
		/*  Description, */							'LOC_DISTRICT_CSC_BAKERS_QUARTER_DESCRIPTION',
		/*  PrereqTech, */							NULL,
		/*  PrereqCivic, */							'CIVIC_CRAFTSMANSHIP',
		/*  Cost, */								60,
		/*  CostProgressionModel, */    			'COST_PROGRESSION_PREVIOUS_COPIES',
		/*  CostProgressionParam1, */				100,
		/*  MilitaryDomain, */						'NO_DOMAIN',
		/*  RequiresPlacement, */					1,
		/*  Coast, */								0,
		/*  RequiresPopulation, */	    			0,
		/*  Aqueduct, */							0,
		/*  InternalOnly, */						0,
		/*  NoAdjacentCity, */						0,
		/*  PlunderType, */							'PLUNDER_HEAL',
		/*  PlunderAmount, */						50,
		/*  Appeal, */								1,
		/*  OnePerCity, */							1,
		/*  CaptureRemovesBuildings, */	   			0,
		/*  CaptureRemovesCityDefenses, */			0,
		/*  Maintenance, */							0,
		/*  CityStrengthModifier */					2,
		/*  AdvisorType */							'ADVISOR_GENERIC'
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
		(	'DISTRICT_CSC_BAKERS_QUARTER'                         			);

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
VALUES  (	'DISTRICT_CSC_BAKERS_QUARTER',     		'MOD_CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS'	   			),

		(	'DISTRICT_CITY_CENTER',          		'MOD_CSC_ALL_QUARTERS_LOCAL_SALES_ATTACH_QUARTER'       ),
        (  	'DISTRICT_COMMERCIAL_HUB',     			'MOD_CSC_ALL_QUARTERS_LOCAL_SALES_ATTACH_QUARTER'       ),
        (  	'DISTRICT_HARBOR',                		'MOD_CSC_ALL_QUARTERS_LOCAL_SALES_ATTACH_QUARTER'       );



--===========================================================================================================================================================================--
/* STAGES 2-4 - BUILDINGS */
--===========================================================================================================================================================================--

INSERT INTO Buildings

		(	BuildingType,
			Name,
			Description,
			PrereqTech,
			PrereqCivic,
			Cost,
			PrereqDistrict,
			PurchaseYield,
			CitizenSlots,
			AdvisorType				)
VALUES	(
		/*  BuildingType, */		'BUILDING_CSC_BAKERS_FLOUR_MILL',
		/*  Name, */				'LOC_BUILDING_CSC_BAKERS_FLOUR_MILL_NAME',
		/*  Description, */			'LOC_BUILDING_CSC_BAKERS_FLOUR_MILL_DESCRIPTION',
		/*  PrereqTech, */			'TECH_THE_WHEEL',
		/*  PrereqCivic, */			NULL,
		/*  Cost, */				80,
		/*  PrereqDistrict, */		'DISTRICT_CSC_BAKERS_QUARTER',
		/*  PurchaseYield, */		'YIELD_GOLD',
		/*	CitizenSlots */			0,
		/*  AdvisorType, */			'ADVISOR_GENERIC'
									),
		(
		/*  BuildingType, */		'BUILDING_CSC_BAKERS_BAKERY',
		/*  Name, */				'LOC_BUILDING_CSC_BAKERS_BAKERY_NAME',
		/*  Description, */			'LOC_BUILDING_CSC_BAKERS_BAKERY_DESCRIPTION',
		/*  PrereqTech, */			NULL,
		/*  PrereqCivic, */			'CIVIC_GUILDS',
		/*  Cost, */				160,
		/*  PrereqDistrict, */		'DISTRICT_CSC_BAKERS_QUARTER',
		/*  PurchaseYield, */		'YIELD_GOLD',
		/*	CitizenSlots */			1,
		/*  AdvisorType, */			'ADVISOR_GENERIC'
									);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BuildingPrereqs
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	

INSERT INTO BuildingPrereqs

        (	Building,      		        				PrereqBuilding												)
VALUES  (	'BUILDING_CSC_BAKERS_BAKERY',				'BUILDING_CSC_BAKERS_FLOUR_MILL'							);		

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Building_CitizenYieldChanges
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	

INSERT INTO Building_CitizenYieldChanges

        (	BuildingType,      		        			YieldType,       						YieldChange	        )
VALUES  (	'BUILDING_CSC_BAKERS_BAKERY',       		'YIELD_FOOD',	        				3		        	),
		(	'BUILDING_CSC_BAKERS_BAKERY',       		'YIELD_GOLD',	        				1		        	);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Building_GreatPersonPoints
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	

INSERT INTO Building_GreatPersonPoints

        (	BuildingType,      		        			GreatPersonClassType,       			PointsPerTurn	    )
VALUES  (	'BUILDING_CSC_BAKERS_BAKERY',       		'GREAT_PERSON_CLASS_MERCHANT',	        1		        	);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Building_YieldChanges
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT INTO Building_YieldChanges

		(	BuildingType,								YieldType,								YieldChange			)
VALUES	(	'BUILDING_CSC_BAKERS_BAKERY',				'YIELD_PRODUCTION',						1					),
		(	'BUILDING_CSC_BAKERS_BAKERY',				'YIELD_FOOD',							1					);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BuildingModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT INTO BuildingModifiers

        (	BuildingType,		            			ModifierId			                                		)
VALUES  (	'BUILDING_CSC_BAKERS_FLOUR_MILL',       	'MOD_CSC_BAKERS_FLOUR_MILL_GOLD_TO_ADJACENT_RAW_IMPROV'      ),
		(	'BUILDING_CSC_BAKERS_FLOUR_MILL',			'MOD_CSC_BAKERS_FLOUR_MILL_FOOD_UPGRADE'					),

		(	'BUILDING_CSC_BAKERS_FLOUR_MILL',			'MOD_CSC_BAKERS_FLOUR_MILL_ATTACH_CITY_CENTER'				),
		(	'BUILDING_GRANARY',							'MOD_CSC_BAKERS_GRANARY_ATTACH_BAKERS_QUARTER'				),

-- Stage x --------------------------------------------------------------------------

		(	'BUILDING_CSC_BAKERS_BAKERY',				'MOD_CSC_BAKERS_BAKERY_GOLD_TO_FLOUR_MILL'					),

		(	'BUILDING_CSC_BAKERS_BAKERY',				'MOD_CSC_BAKERS_BAKERY_FOOD'								),
		(	'BUILDING_CSC_BAKERS_BAKERY',				'MOD_CSC_BAKERS_BAKERY_GOLD'								),

		(	'BUILDING_CSC_BAKERS_BAKERY',				'MOD_CSC_BAKERS_BAKERY_ATTACH_NEIGHBORHOOD'					),
		(	'BUILDING_FOOD_MARKET',						'MOD_CSC_BAKERS_FOOD_MARKET_ATTACH_BAKERS_QUARTER'			),

		(	'BUILDING_CSC_BAKERS_BAKERY',				'MOD_CSC_BAKERS_BAKERY_FOOD_UPGRADE'						),
		(	'BUILDING_CSC_BAKERS_BAKERY',				'MOD_CSC_BAKERS_BAKERY_GOLD_UPGRADE'						),

		(	'BUILDING_CSC_BAKERS_BAKERY',				'MOD_CSC_BAKERS_BAKERY_AMENITY'								);
	
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChangesBonusWithPower
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

--INSERT INTO Building_YieldChangesBonusWithPower

--		(	BuildingType,						YieldType,			YieldChange			)

--VALUES	(	'',			'',							),
--		(	'',			'',							);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Buildings_XP2
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

--INSERT INTO Buildings_XP2

--		(	BuildingType,						RequiredPower				)
--VALUES	(	'',										);



--===========================================================================================================================================================================--
/* MODIFIERS */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DynamicModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO DynamicModifiers 

        ( 	ModifierType,                                                   CollectionType,                         EffectType	                        	)
VALUES  ( 	'MODIFIER_CSC_PLAYER_DISTRICTS_ATTACH_MODIFIER',                'COLLECTION_PLAYER_DISTRICTS',          'EFFECT_ATTACH_MODIFIER'                ),
		( 	'MODIFIER_CSC_PLAYER_DISTRICTS_ADJUST_DISTRICT_AMENITY',        'COLLECTION_PLAYER_DISTRICTS',          'EFFECT_ADJUST_DISTRICT_AMENITY'     	);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Modifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT INTO Modifiers

		(	ModifierId,														ModifierType,												OwnerRequirementSetId,				SubjectRequirementSetId,								SubjectStackLimit	)
VALUES	(	'MOD_CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS',                    'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE', 		NULL,                            	'REQSET_CSC_PLOT_IS_HILLS',								NULL				),

        ( 	'MOD_CSC_ALL_QUARTERS_LOCAL_SALES_ATTACH_QUARTER',              'MODIFIER_CSC_PLAYER_DISTRICTS_ATTACH_MODIFIER',    		NULL,                             	'REQSET_CSC_ANY_QUARTER_ADJACENT',						NULL				),
        (  	'MOD_CSC_ALL_QUARTERS_GOLD_FROM_LOCAL_SALES',                   'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE',   		NULL,                             	NULL,													NULL				),

		(  	'MOD_CSC_BAKERS_RAW_IMPROVEMENT_ATTACH_QUARTER',            	'MODIFIER_CSC_PLAYER_DISTRICTS_ATTACH_MODIFIER',     		'REQSET_CSC_BAKERS_PLOT_HAS_RAW', 	'REQSET_CSC_ADJACENT_BAKERS_QUARTER',					NULL			    ),
        (  	'MOD_CSC_BAKERS_RAW_IMPROV_PROD_TO_ADJACENT_FLOUR_MILL',    	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',		NULL,                           	NULL,							                        NULL	            ),
		(	'MOD_CSC_BAKERS_FLOUR_MILL_GOLD_TO_ADJACENT_RAW_IMPROV',		'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',						NULL,								'REQSET_CSC_BAKERS_PLOT_HAS_RAW_IMPROV_ADJACENT',		NULL      			),

        (  	'MOD_CSC_BAKERS_FLOUR_MILL_IMPROVEMENT_FOOD_ATTACH_QUARTER',	'MODIFIER_CSC_PLAYER_DISTRICTS_ATTACH_MODIFIER',     		'REQSET_CSC_BAKERS_PLOT_HAS_RAW', 	'REQSET_CSC_ADJACENT_BAKERS_QUARTER',    				NULL				),
        (  	'MOD_CSC_BAKERS_FLOUR_MILL_FOOD_FROM_ADJACENT_RAW',    			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',  	NULL,                           	NULL,                                    				1					),
        (  	'MOD_CSC_BAKERS_FLOUR_MILL_IMPROVEMENT_GOLD_ATTACH_QUARTER',	'MODIFIER_CSC_PLAYER_DISTRICTS_ATTACH_MODIFIER',     		'REQSET_CSC_BAKERS_PLOT_HAS_RAW', 	'REQSET_CSC_ADJACENT_BAKERS_QUARTER',    				NULL				),
		(  	'MOD_CSC_BAKERS_FLOUR_MILL_GOLD_FROM_ADJACENT_RAW',    			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',  	NULL,                           	NULL,                                    				1					),

        (  	'MOD_CSC_BAKERS_FLOUR_MILL_ATTACH_CITY_CENTER',					'MODIFIER_CSC_PLAYER_DISTRICTS_ATTACH_MODIFIER',     		NULL, 								'REQSET_CSC_ADJACENT_CITY_CENTER',    					NULL				),
        (  	'MOD_CSC_BAKERS_FLOUR_MILL_FOOD_TO_ADJACENT_GRANARY',    		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',  	NULL,                           	NULL,                                    				NULL				),
        (  	'MOD_CSC_BAKERS_GRANARY_ATTACH_BAKERS_QUARTER',					'MODIFIER_CSC_PLAYER_DISTRICTS_ATTACH_MODIFIER',     		NULL,								'REQSET_CSC_ADJACENT_BAKERS_QUARTER',    				NULL				),
		(  	'MOD_CSC_BAKERS_GRANARY_GOLD_TO_ADJACENT_FLOUR_MILL',    		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',  	NULL,                           	NULL,                                    				NULL				),

		(	'MOD_CSC_BAKERS_FLOUR_MILL_FOOD_UPGRADE',						'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',		NULL,								'REQSET_CSC_BAKERS_FLOUR_MILL_UPGRADE',					NULL				),

----------------------------------------------------------------------------

		(	'MOD_CSC_BAKERS_BAKERY_GOLD_TO_FLOUR_MILL',						'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',		NULL,								NULL,													NULL				),

		(	'MOD_CSC_BAKERS_BAKERY_FOOD',									'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',	NULL,								NULL,													NULL				),
		(	'MOD_CSC_BAKERS_BAKERY_GOLD',									'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',	NULL,								NULL,													NULL				),

		(	'MOD_CSC_BAKERS_BAKERY_FOOD_UPGRADE',							'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',	NULL,								'REQSET_CSC_BAKERS_BAKERY_UPGRADE',						NULL				),
		(	'MOD_CSC_BAKERS_BAKERY_GOLD_UPGRADE',							'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',	NULL,								'REQSET_CSC_BAKERS_BAKERY_UPGRADE',						NULL				),

        (  	'MOD_CSC_BAKERS_BAKERY_ATTACH_NEIGHBORHOOD',					'MODIFIER_CSC_PLAYER_DISTRICTS_ATTACH_MODIFIER',     		NULL, 								'REQSET_CSC_ADJACENT_NEIGHBORHOOD',    					NULL				),
        (  	'MOD_CSC_BAKERS_BAKERY_FOOD_TO_ADJACENT_FOOD_MARKET',    		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',  	NULL,                           	NULL,                                    				NULL				),
        (  	'MOD_CSC_BAKERS_FOOD_MARKET_ATTACH_BAKERS_QUARTER',				'MODIFIER_CSC_PLAYER_DISTRICTS_ATTACH_MODIFIER',     		NULL,								'REQSET_CSC_ADJACENT_BAKERS_QUARTER',    				NULL				),
		(  	'MOD_CSC_BAKERS_FOOD_MARKET_GOLD_TO_ADJACENT_BAKERY',    		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',  	NULL,                           	NULL,                                    				NULL				),

		(	'MOD_CSC_BAKERS_BAKERY_AMENITY',								'MODIFIER_CSC_PLAYER_DISTRICTS_ADJUST_DISTRICT_AMENITY',	NULL,								'REQSET_CSC_DISTRICT_IS_BAKERS',						NULL				);


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ModifierArguments
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
INSERT INTO ModifierArguments
		
        (	ModifierId,			                      							Name,                       Value		                									)
VALUES  (	'MOD_CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS',                    	'YieldType',	      		'YIELD_PRODUCTION'                                              ),
        (	'MOD_CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS',                    	'Amount',		        	1		                                                		),

		(   'MOD_CSC_ALL_QUARTERS_LOCAL_SALES_ATTACH_QUARTER',              	'ModifierId',          		'MOD_CSC_ALL_QUARTERS_GOLD_FROM_LOCAL_SALES'					),
        (   'MOD_CSC_ALL_QUARTERS_GOLD_FROM_LOCAL_SALES',                   	'YieldType',          		'YIELD_GOLD'                                                    ),
        (   'MOD_CSC_ALL_QUARTERS_GOLD_FROM_LOCAL_SALES',                   	'Amount',              		1                                                            	),

		(  	'MOD_CSC_BAKERS_RAW_IMPROVEMENT_ATTACH_QUARTER',            		'ModifierId',         		'MOD_CSC_BAKERS_RAW_IMPROV_PROD_TO_ADJACENT_FLOUR_MILL'     	),    
        (  	'MOD_CSC_BAKERS_RAW_IMPROV_PROD_TO_ADJACENT_FLOUR_MILL',       		'BuildingType',           	'BUILDING_CSC_BAKERS_FLOUR_MILL'								),
        (  	'MOD_CSC_BAKERS_RAW_IMPROV_PROD_TO_ADJACENT_FLOUR_MILL',       		'YieldType',           		'YIELD_PRODUCTION'                                              ),
        ( 	'MOD_CSC_BAKERS_RAW_IMPROV_PROD_TO_ADJACENT_FLOUR_MILL',       		'Amount',             		1                                                               ),
		(	'MOD_CSC_BAKERS_FLOUR_MILL_GOLD_TO_ADJACENT_RAW_IMPROV',    		'YieldType',	            'YIELD_GOLD'                									),
        (	'MOD_CSC_BAKERS_FLOUR_MILL_GOLD_TO_ADJACENT_RAW_IMPROV',    		'Amount',		            1		                    									),

		(	'MOD_CSC_BAKERS_FLOUR_MILL_IMPROVEMENT_FOOD_ATTACH_QUARTER',		'ModifierId',				'MOD_CSC_BAKERS_FLOUR_MILL_FOOD_FROM_ADJACENT_RAW'				),
		(	'MOD_CSC_BAKERS_FLOUR_MILL_FOOD_FROM_ADJACENT_RAW',					'BuildingType',				'BUILDING_CSC_BAKERS_FLOUR_MILL'								),
		(	'MOD_CSC_BAKERS_FLOUR_MILL_FOOD_FROM_ADJACENT_RAW',					'YieldType',				'YIELD_FOOD'													),
		(	'MOD_CSC_BAKERS_FLOUR_MILL_FOOD_FROM_ADJACENT_RAW',					'Amount',					1																),
		(	'MOD_CSC_BAKERS_FLOUR_MILL_IMPROVEMENT_GOLD_ATTACH_QUARTER',		'ModifierId',				'MOD_CSC_BAKERS_FLOUR_MILL_GOLD_FROM_ADJACENT_RAW'				),
		(	'MOD_CSC_BAKERS_FLOUR_MILL_GOLD_FROM_ADJACENT_RAW',					'BuildingType',				'BUILDING_CSC_BAKERS_FLOUR_MILL'								),
		(	'MOD_CSC_BAKERS_FLOUR_MILL_GOLD_FROM_ADJACENT_RAW',					'YieldType',				'YIELD_GOLD'													),
		(	'MOD_CSC_BAKERS_FLOUR_MILL_GOLD_FROM_ADJACENT_RAW',					'Amount',					1																),

		(	'MOD_CSC_BAKERS_FLOUR_MILL_ATTACH_CITY_CENTER',						'ModifierId',				'MOD_CSC_BAKERS_FLOUR_MILL_FOOD_TO_ADJACENT_GRANARY'			),
		(	'MOD_CSC_BAKERS_FLOUR_MILL_FOOD_TO_ADJACENT_GRANARY',				'BuildingType',				'BUILDING_GRANARY'												),
		(	'MOD_CSC_BAKERS_FLOUR_MILL_FOOD_TO_ADJACENT_GRANARY',				'YieldType',				'YIELD_FOOD'													),
		(	'MOD_CSC_BAKERS_FLOUR_MILL_FOOD_TO_ADJACENT_GRANARY',				'Amount',					1																),
		(	'MOD_CSC_BAKERS_GRANARY_ATTACH_BAKERS_QUARTER',						'ModifierId',				'MOD_CSC_BAKERS_GRANARY_GOLD_TO_ADJACENT_FLOUR_MILL'			),
		(	'MOD_CSC_BAKERS_GRANARY_GOLD_TO_ADJACENT_FLOUR_MILL',				'BuildingType',				'BUILDING_CSC_BAKERS_FLOUR_MILL'								),
		(	'MOD_CSC_BAKERS_GRANARY_GOLD_TO_ADJACENT_FLOUR_MILL',				'YieldType',				'YIELD_GOLD'													),
		(	'MOD_CSC_BAKERS_GRANARY_GOLD_TO_ADJACENT_FLOUR_MILL',				'Amount',					1																),

		(	'MOD_CSC_BAKERS_FLOUR_MILL_FOOD_UPGRADE',							'BuildingType',				'BUILDING_CSC_BAKERS_FLOUR_MILL'								),
		(	'MOD_CSC_BAKERS_FLOUR_MILL_FOOD_UPGRADE',							'YieldType',				'YIELD_FOOD'													),
		(	'MOD_CSC_BAKERS_FLOUR_MILL_FOOD_UPGRADE',							'Amount',					1																),

----------------------------------------------------------------------------

		(	'MOD_CSC_BAKERS_BAKERY_GOLD_TO_FLOUR_MILL',							'BuildingType',				'BUILDING_CSC_BAKERS_FLOUR_MILL'								),
		(	'MOD_CSC_BAKERS_BAKERY_GOLD_TO_FLOUR_MILL',							'YieldType',				'YIELD_GOLD'													),
		(	'MOD_CSC_BAKERS_BAKERY_GOLD_TO_FLOUR_MILL',							'Amount',					1																),

		(	'MOD_CSC_BAKERS_BAKERY_FOOD',										'YieldType',				'YIELD_FOOD'													),
		(	'MOD_CSC_BAKERS_BAKERY_FOOD',										'Amount',					0.3																),
		(	'MOD_CSC_BAKERS_BAKERY_GOLD',										'YieldType',				'YIELD_GOLD'													),
		(	'MOD_CSC_BAKERS_BAKERY_GOLD',										'Amount',					0.2																),

		(	'MOD_CSC_BAKERS_BAKERY_ATTACH_NEIGHBORHOOD',						'ModifierId',				'MOD_CSC_BAKERS_BAKERY_FOOD_TO_ADJACENT_FOOD_MARKET'			),
		(	'MOD_CSC_BAKERS_BAKERY_FOOD_TO_ADJACENT_FOOD_MARKET',				'BuildingType',				'BUILDING_FOOD_MARKET'											),
		(	'MOD_CSC_BAKERS_BAKERY_FOOD_TO_ADJACENT_FOOD_MARKET',				'YieldType',				'YIELD_FOOD'													),
		(	'MOD_CSC_BAKERS_BAKERY_FOOD_TO_ADJACENT_FOOD_MARKET',				'Amount',					1																),
		(	'MOD_CSC_BAKERS_FOOD_MARKET_ATTACH_BAKERS_QUARTER',					'ModifierId',				'MOD_CSC_BAKERS_FOOD_MARKET_GOLD_TO_ADJACENT_BAKERY'			),
		(	'MOD_CSC_BAKERS_FOOD_MARKET_GOLD_TO_ADJACENT_BAKERY',				'BuildingType',				'BUILDING_CSC_BAKERS_BAKERY'									),
		(	'MOD_CSC_BAKERS_FOOD_MARKET_GOLD_TO_ADJACENT_BAKERY',				'YieldType',				'YIELD_GOLD'													),
		(	'MOD_CSC_BAKERS_FOOD_MARKET_GOLD_TO_ADJACENT_BAKERY',				'Amount',					1																),

		(	'MOD_CSC_BAKERS_BAKERY_FOOD_UPGRADE',								'YieldType',				'YIELD_FOOD'													),
		(	'MOD_CSC_BAKERS_BAKERY_FOOD_UPGRADE',								'Amount',					0.3																),
		(	'MOD_CSC_BAKERS_BAKERY_GOLD_UPGRADE',								'YieldType',				'YIELD_GOLD'													),
		(	'MOD_CSC_BAKERS_BAKERY_GOLD_UPGRADE',								'Amount',					0.2																),

		(	'MOD_CSC_BAKERS_BAKERY_AMENITY',									'Amount',					1																);


--===========================================================================================================================================================================--
/* REQUIREMENTS */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RequirementSets
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
INSERT INTO RequirementSets 
		
        (	RequirementSetId,                              			RequirementSetType              )
VALUES  (	'REQSET_CSC_PLOT_IS_HILLS',	                  			'REQUIREMENTSET_TEST_ALL'       ),
		(  	'REQSET_CSC_ANY_QUARTER',                     			'REQUIREMENTSET_TEST_ALL'       ),
		(	'REQSET_CSC_ANY_QUARTER_ADJACENT',						'REQUIREMENTSET_TEST_ALL'		),

		(	'REQSET_CSC_BAKERS_PLOT_HAS_RAW',						'REQUIREMENTSET_TEST_ALL'       ),
        (	'REQSET_CSC_BAKERS_PLOT_HAS_RAW_IMPROV',				'REQUIREMENTSET_TEST_ALL'       ),
        (	'REQSET_CSC_BAKERS_PLOT_HAS_RAW_IMPROV_ADJACENT',		'REQUIREMENTSET_TEST_ALL'       ),

		(	'REQSET_CSC_DISTRICT_IS_BAKERS',						'REQUIREMENTSET_TEST_ALL'		),
        (  	'REQSET_CSC_ADJACENT_BAKERS_QUARTER',          			'REQUIREMENTSET_TEST_ALL'       ),

		(	'REQSET_CSC_BAKERS_FLOUR_MILL_UPGRADE',					'REQUIREMENTSET_TEST_ALL'		),
		(	'REQSET_CSC_BAKERS_BAKERY_UPGRADE',						'REQUIREMENTSET_TEST_ALL'		),

		(	'REQSET_CSC_ADJACENT_CITY_CENTER',						'REQUIREMENTSET_TEST_ALL'		),
		(	'REQSET_CSC_ADJACENT_NEIGHBORHOOD',						'REQUIREMENTSET_TEST_ALL'		);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RequirementSetRequirements
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
				
INSERT INTO RequirementSetRequirements
		
        (	RequirementSetId,		                      			RequirementId	                               	)
VALUES  (	'REQSET_CSC_PLOT_IS_HILLS',								'REQ_CSC_PLOT_IS_HILLS'			                ),

		(  	'REQSET_CSC_ANY_QUARTER',                   			'REQ_CSC_DISTRICT_IS_ANY_QUARTER'             	),
		(	'REQSET_CSC_ANY_QUARTER_ADJACENT',						'REQ_CSC_DISTRICT_IS_ANY_QUARTER'				),
		(	'REQSET_CSC_ANY_QUARTER_ADJACENT',						'REQ_CSC_PLOT_ADJACENT_TO_OWNER'				),

		(	'REQSET_CSC_BAKERS_PLOT_HAS_RAW',						'REQ_CSC_PLOT_HAS_BAKERS_QUARTER_RAW'			),
        (	'REQSET_CSC_BAKERS_PLOT_HAS_RAW_IMPROV',				'REQ_CSC_PLOT_HAS_BAKERS_QUARTER_RAW'			),
        (	'REQSET_CSC_BAKERS_PLOT_HAS_RAW_IMPROV',				'REQ_CSC_PLOT_HAS_ANY_IMPROVEMENT'				),
        (	'REQSET_CSC_BAKERS_PLOT_HAS_RAW_IMPROV_ADJACENT',		'REQ_CSC_PLOT_HAS_BAKERS_RAW_IMPROVED_SET'		),
        (	'REQSET_CSC_BAKERS_PLOT_HAS_RAW_IMPROV_ADJACENT',		'REQ_CSC_PLOT_ADJACENT_TO_OWNER'				),

		(	'REQSET_CSC_DISTRICT_IS_BAKERS',						'REQ_CSC_DISTRICT_IS_BAKERS_QUARTER'			),

        ( 	'REQSET_CSC_ADJACENT_BAKERS_QUARTER',					'REQ_CSC_PLOT_ADJACENT_TO_OWNER'              	),
        (  	'REQSET_CSC_ADJACENT_BAKERS_QUARTER',					'REQ_CSC_DISTRICT_IS_BAKERS_QUARTER'           	),

		(	'REQSET_CSC_BAKERS_FLOUR_MILL_UPGRADE',					'REQ_CSC_BAKERS_FLOUR_MILL_UPGRADE'				),
		(	'REQSET_CSC_BAKERS_BAKERY_UPGRADE',						'REQ_CSC_BAKERS_BAKERY_UPGRADE'					),

		( 	'REQSET_CSC_ADJACENT_CITY_CENTER',						'REQ_CSC_PLOT_ADJACENT_TO_OWNER'              	),
        (  	'REQSET_CSC_ADJACENT_CITY_CENTER',						'REQ_CSC_DISTRICT_IS_CITY_CENTER'           	),
		( 	'REQSET_CSC_ADJACENT_NEIGHBORHOOD',						'REQ_CSC_PLOT_ADJACENT_TO_OWNER'              	),
        (  	'REQSET_CSC_ADJACENT_NEIGHBORHOOD',						'REQ_CSC_DISTRICT_IS_NEIGHBORHOOD'           	);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Requirements
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Requirements
        
        (	RequirementId,		                          			RequirementType,	                                Inverse         )
VALUES  (  	'REQ_CSC_DISTRICT_IS_ANY_QUARTER',						'REQUIREMENT_PLOT_DISTRICT_TAG_MATCHES',          	0               ),
		(	'REQ_CSC_PLOT_IS_HILLS',								'REQUIREMENT_PLOT_IS_HILLS',                      	0	        	),

		(	'REQ_CSC_PLOT_HAS_BAKERS_QUARTER_RAW',					'REQUIREMENT_PLOT_RESOURCE_TAG_MATCHES',			0				),
        (	'REQ_CSC_PLOT_HAS_ANY_IMPROVEMENT',            			'REQUIREMENT_PLOT_HAS_ANY_IMPROVEMENT',           	0               ),
        
        (	'REQ_CSC_PLOT_HAS_BAKERS_RAW_IMPROVED_SET',             'REQUIREMENT_REQUIREMENTSET_IS_MET',				0               ),

		(	'REQ_CSC_PLOT_ADJACENT_TO_OWNER',						'REQUIREMENT_PLOT_ADJACENT_TO_OWNER',              	0               ),
        (   'REQ_CSC_DISTRICT_IS_BAKERS_QUARTER',					'REQUIREMENT_PLOT_DISTRICT_TYPE_MATCHES',          	0               ),
		(	'REQ_CSC_BAKERS_FLOUR_MILL_UPGRADE',					'REQUIREMENT_PLAYER_HAS_CIVIC',						0				),
		(	'REQ_CSC_BAKERS_BAKERY_UPGRADE',						'REQUIREMENT_PLAYER_HAS_CIVIC',						0				),

		(	'REQ_CSC_DISTRICT_IS_CITY_CENTER',						'REQUIREMENT_PLOT_DISTRICT_TYPE_MATCHES',			0				),
		(	'REQ_CSC_DISTRICT_IS_NEIGHBORHOOD',						'REQUIREMENT_PLOT_DISTRICT_TYPE_MATCHES',			0				);


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RequirementArguments
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO RequirementArguments 

        (	RequirementId,				               				Name,                           Value		                    				)
VALUES 	( 	'REQ_CSC_DISTRICT_IS_ANY_QUARTER',						'Tag',                          'CLASS_CSC_QUARTERS'              				),

		(	'REQ_CSC_PLOT_HAS_BAKERS_QUARTER_RAW',					'Tag',							'CLASS_CSC_BAKERS_RAW'							),
        (	'REQ_CSC_PLOT_HAS_BAKERS_RAW_IMPROVED_SET',             'RequirementSetId',     		'REQSET_CSC_BAKERS_PLOT_HAS_RAW_IMPROV'       	),

		( 	'REQ_CSC_BAKERS_FLOUR_MILL_UPGRADE',					'CivicType',					'CIVIC_FEUDALISM'								),
		( 	'REQ_CSC_BAKERS_BAKERY_UPGRADE',						'CivicType',					'CIVIC_MERCANTILISM'							),

		( 	'REQ_CSC_DISTRICT_IS_BAKERS_QUARTER',					'DistrictType',                 'DISTRICT_CSC_BAKERS_QUARTER'     				),
		(	'REQ_CSC_DISTRICT_IS_CITY_CENTER',						'DistrictType',					'DISTRICT_CITY_CENTER'							),
		(	'REQ_CSC_DISTRICT_IS_NEIGHBORHOOD',						'DistrictType',					'DISTRICT_NEIGHBORHOOD'							);