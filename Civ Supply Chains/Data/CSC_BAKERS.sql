-- CSC_BAKERS
-- Author: Henno
-- DateCreated: 4/19/2025 10:53:23
--------------------------------------------------------------

--===========================================================================================================================================================================--
/*	TYPES */
--===========================================================================================================================================================================--

INSERT INTO Types

		(	Type,																Kind)
VALUES	( 	'DISTRICT_CSC_BAKERS_QUARTER',                              		'KIND_DISTRICT'         ),

		(	'BUILDING_CSC_BAKERS_FLOUR_MILL',									'KIND_BUILDING'			),
		(	'BUILDING_CSC_BAKERS_BAKERY',										'KIND_BUILDING'			),
		(	'BUILDING_CSC_BAKERS_PATISSERIE',									'KIND_BUILDING'			),

		(	'MODIFIER_CSC_SINGLE_DISTRICT_ADJUST_BUILDING_YIELD_CHANGE',		'KIND_MODIFIER'			);



--===========================================================================================================================================================================--
/*	RESOURCES */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Tags
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Tags

		(   Tag,							Vocabulary			)
VALUES	(	'CLASS_CSC_BAKERS_RAW',	    	'RESOURCE_CLASS'	),
		(	'CLASS_CSC_BAKERS_LUX',			'RESOURCE_CLASS'	);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	TypeTags
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--	Bakers' Quarter raw materials
INSERT OR IGNORE INTO TypeTags

	(	Type,					Tag			        )
SELECT	ResourceType,			'CLASS_CSC_BAKERS_RAW'
FROM	Resources
WHERE	ResourceType 			IN
	(	'RESOURCE_BANANAS',
		'RESOURCE_MAIZE',
		'RESOURCE_RICE',
		'RESOURCE_WHEAT'        );

--	Bakers' Quarter luxury materials
INSERT OR IGNORE INTO TypeTags

	(	Type,					Tag			        )
SELECT	ResourceType,			'CLASS_CSC_BAKERS_LUX'
FROM	Resources
WHERE	ResourceType 			IN
	(	'RESOURCE_COCOA',
		'RESOURCE_COFFEE',
		'RESOURCE_WINE',
		'RESOURCE_HONEY',
		'RESOURCE_OLIVES',
		'RESOURCE_SALT',
		'RESOURCE_SUGAR',
		'RESOURCE_SPICES'        );

--	Rename Wine to Grapes
UPDATE Resources SET	Name='LOC_RESOURCE_WINE'		WHERE ResourceType='RESOURCE_WINE';



--===========================================================================================================================================================================--
/*	STAGE 1 - MATERIALS IMPROVEMENTS */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Improvement_YieldChanges
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO Improvement_YieldChanges

        (	ImprovementType,                		YieldType,              YieldChange     )
VALUES  (	'IMPROVEMENT_FARM',             		'YIELD_GOLD',           0               );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	ImprovementModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	

INSERT INTO ImprovementModifiers

        (	ImprovementType,		        		ModifierId			                        								)	VALUES

--	Raw materials improvements		
		(	'IMPROVEMENT_FARM',                     'MOD_CSC_BAKERS_RAW_IMPROVEMENT_ATTACH_QUARTER'                 			),
        (	'IMPROVEMENT_PLANTATION',               'MOD_CSC_BAKERS_RAW_IMPROVEMENT_ATTACH_QUARTER'                 			),

--	Luxury materials improvements		
        (	'IMPROVEMENT_CAMP',               		'MOD_CSC_BAKERS_LUX_IMPROVEMENT_ATTACH_QUARTER'                 			),
		(	'IMPROVEMENT_MINE',               		'MOD_CSC_BAKERS_LUX_IMPROVEMENT_ATTACH_QUARTER'                 			),
        (	'IMPROVEMENT_PLANTATION',               'MOD_CSC_BAKERS_LUX_IMPROVEMENT_ATTACH_QUARTER'                 			);



--===============================================================================================================================================================================--
/*	QUARTERS */
--===============================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Districts
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
--	DistrictModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT INTO DistrictModifiers

        (	DistrictType,		               		ModifierId			                        			)	VALUES  

-- 	+1 Production if built on Hills terrain
		(	'DISTRICT_CSC_BAKERS_QUARTER',     		'MOD_CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS'	   			);



--===========================================================================================================================================================================--
/*	STAGES 2-4 - BUILDINGS */
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
									),
		(
		/*  BuildingType, */		'BUILDING_CSC_BAKERS_PATISSERIE',
		/*  Name, */				'LOC_BUILDING_CSC_BAKERS_PATISSERIE_NAME',
		/*  Description, */			'LOC_BUILDING_CSC_BAKERS_PATISSERIE_DESCRIPTION',
		/*  PrereqTech, */			NULL,
		/*  PrereqCivic, */			'CIVIC_HUMANISM',
		/*  Cost, */				250,
		/*  PrereqDistrict, */		'DISTRICT_CSC_BAKERS_QUARTER',
		/*  PurchaseYield, */		'YIELD_GOLD',
		/*	CitizenSlots */			1,
		/*  AdvisorType, */			'ADVISOR_GENERIC'
									);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	BuildingPrereqs
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	

INSERT INTO BuildingPrereqs

        (	Building,      		        				PrereqBuilding												)
VALUES  (	'BUILDING_CSC_BAKERS_BAKERY',				'BUILDING_CSC_BAKERS_FLOUR_MILL'							),
		(	'BUILDING_CSC_BAKERS_PATISSERIE',			'BUILDING_CSC_BAKERS_FLOUR_MILL'							);		

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Building_CitizenYieldChanges
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	

INSERT INTO Building_CitizenYieldChanges

        (	BuildingType,      		        			YieldType,       						YieldChange	        )
VALUES  (	'BUILDING_CSC_BAKERS_BAKERY',       		'YIELD_FOOD',	        				3		        	),
		(	'BUILDING_CSC_BAKERS_BAKERY',       		'YIELD_GOLD',	        				1		        	),

		(	'BUILDING_CSC_BAKERS_PATISSERIE',       	'YIELD_FOOD',	        				1		        	),
		(	'BUILDING_CSC_BAKERS_PATISSERIE',       	'YIELD_GOLD',	        				3		        	);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Building_GreatPersonPoints
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	

INSERT INTO Building_GreatPersonPoints

        (	BuildingType,      		        			GreatPersonClassType,       			PointsPerTurn	    )
VALUES  (	'BUILDING_CSC_BAKERS_BAKERY',       		'GREAT_PERSON_CLASS_MERCHANT',	        1		        	),
		(	'BUILDING_CSC_BAKERS_PATISSERIE',       	'GREAT_PERSON_CLASS_MERCHANT',	        1		        	);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Building_YieldChanges
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT INTO Building_YieldChanges

		(	BuildingType,								YieldType,								YieldChange			)
VALUES	(	'BUILDING_CSC_BAKERS_FLOUR_MILL',			'YIELD_FOOD',							2					),

		(	'BUILDING_CSC_BAKERS_BAKERY',				'YIELD_PRODUCTION',						1					),
		(	'BUILDING_CSC_BAKERS_BAKERY',				'YIELD_FOOD',							1					),

		(	'BUILDING_CSC_BAKERS_PATISSERIE',			'YIELD_PRODUCTION',						1					);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	BuildingModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT INTO BuildingModifiers

        (	BuildingType,		            			ModifierId			                                		)	VALUES

--	FLOUR MILL --------------------------------------------------------------------------

--	+1 Gold to adjacent raw materials improvements
		(	'BUILDING_CSC_BAKERS_FLOUR_MILL',       	'MOD_CSC_BAKERS_FLOUR_MILL_GOLD_TO_ADJACENT_RAW_IMPROV'   	),

-- 	+1 Food at Feudalism
		(	'BUILDING_CSC_BAKERS_FLOUR_MILL',			'MOD_CSC_BAKERS_FLOUR_MILL_FOOD_UPGRADE'					),

-- 	+1 Food to an adjacent Granary, and +1 Gold in return
		(	'BUILDING_CSC_BAKERS_FLOUR_MILL',			'MOD_CSC_BAKERS_FLOUR_MILL_ATTACH_CITY_CENTER'				),
		(	'BUILDING_GRANARY',							'MOD_CSC_BAKERS_GRANARY_ATTACH_BAKERS_QUARTER'				),

--	BAKERY ------------------------------------------------------------------------------

-- 	+1 Gold to the Flour Mill in the Quarter
		(	'BUILDING_CSC_BAKERS_BAKERY',				'MOD_CSC_BAKERS_BAKERY_GOLD_TO_FLOUR_MILL'					),

-- 	+0.3 Food and +0.2 Gold per citizen in the city
		(	'BUILDING_CSC_BAKERS_BAKERY',				'MOD_CSC_BAKERS_BAKERY_FOOD'								),
		(	'BUILDING_CSC_BAKERS_BAKERY',				'MOD_CSC_BAKERS_BAKERY_GOLD'								),

-- 	+0.3 Food and +0.2 Gold per citizen in the city at Mercantilism
		(	'BUILDING_CSC_BAKERS_BAKERY',				'MOD_CSC_BAKERS_BAKERY_FOOD_UPGRADE'						),
		(	'BUILDING_CSC_BAKERS_BAKERY',				'MOD_CSC_BAKERS_BAKERY_GOLD_UPGRADE'						),

-- 	+1 Food to each adjacent Market and Food Market, and +1 Gold in return

		(	'BUILDING_CSC_BAKERS_BAKERY',				'MOD_CSC_BAKERS_BAKERY_ATTACH_COMMERCIAL_HUB'				),
		(	'BUILDING_MARKET',							'MOD_CSC_BAKERS_SALES_ATTACH_BAKERS_QUARTER'				),
		(	'BUILDING_CSC_BAKERS_BAKERY',				'MOD_CSC_BAKERS_BAKERY_ATTACH_NEIGHBORHOOD'					),
		(	'BUILDING_FOOD_MARKET',						'MOD_CSC_BAKERS_SALES_ATTACH_BAKERS_QUARTER'				),

--	PATISSERIE --------------------------------------------------------------------------

--	+1 Gold to nearby luxury materials improvements
		(	'BUILDING_CSC_BAKERS_PATISSERIE',       	'MOD_CSC_BAKERS_PATISSERIE_GOLD_TO_NEARBY_LUX_IMPROV'   	),

-- 	+1 Gold to the Flour Mill in the Quarter
		(	'BUILDING_CSC_BAKERS_PATISSERIE',			'MOD_CSC_BAKERS_BAKERY_GOLD_TO_FLOUR_MILL'					),

--	SHARED ------------------------------------------------------------------------------

--	+1 Amenity
		(	'BUILDING_CSC_BAKERS_BAKERY',				'MOD_CSC_BAKERS_BAKERY_AMENITY'								),
		(	'BUILDING_CSC_BAKERS_PATISSERIE',			'MOD_CSC_BAKERS_BAKERY_AMENITY'								),

-- 	+1 Food bonus to trade routes to the city, and +1 Gold in return (not working for domestic)
		(	'BUILDING_CSC_BAKERS_FLOUR_MILL',			'MOD_CSC_BAKERS_TRADE_ROUTES_FOOD'							),
		(	'BUILDING_CSC_BAKERS_FLOUR_MILL',			'MOD_CSC_BAKERS_TRADE_ROUTES_GOLD'							),

		(	'BUILDING_CSC_BAKERS_BAKERY',				'MOD_CSC_BAKERS_TRADE_ROUTES_FOOD'							),
		(	'BUILDING_CSC_BAKERS_BAKERY',				'MOD_CSC_BAKERS_TRADE_ROUTES_GOLD'							),

		(	'BUILDING_CSC_BAKERS_PATISSERIE',			'MOD_CSC_BAKERS_TRADE_ROUTES_FOOD'							),
		(	'BUILDING_CSC_BAKERS_PATISSERIE',			'MOD_CSC_BAKERS_TRADE_ROUTES_GOLD'							);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Building_YieldChangesBonusWithPower
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

--INSERT INTO Building_YieldChangesBonusWithPower

--		(	BuildingType,						YieldType,			YieldChange			)

--VALUES	(	'',			'',							),
--		(	'',			'',							);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Buildings_XP2
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

--INSERT INTO Buildings_XP2

--		(	BuildingType,						RequiredPower				)
--VALUES	(	'',										);



--===========================================================================================================================================================================--
/*	MODIFIERS */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	DynamicModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO DynamicModifiers 

        ( 	ModifierType,                                                   	CollectionType,                         EffectType	                        			)
VALUES  ( 	'MODIFIER_CSC_SINGLE_DISTRICT_ADJUST_BUILDING_YIELD_CHANGE',   		'COLLECTION_OWNER',         			'EFFECT_ADJUST_BUILDING_YIELD_CHANGE'   		);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Modifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT INTO Modifiers

		(	ModifierId,															ModifierType,													OwnerRequirementSetId,				SubjectRequirementSetId,								SubjectStackLimit	)	VALUES	

-- 	BAKERS QUARTER ----------------------------------------------------------------------

-- 	+1 Production if built on Hills terrain
		(	'MOD_CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS',                    	'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE', 			NULL,                            	'REQSET_CSC_PLOT_IS_HILLS',								NULL				),

-- 	FLOUR MILL --------------------------------------------------------------------------

-- 	+1 Production from each adjacent raw materials improvement
		(  	'MOD_CSC_BAKERS_RAW_IMPROVEMENT_ATTACH_QUARTER',            		'MODIFIER_ALL_DISTRICTS_ATTACH_MODIFIER',     					'REQSET_CSC_BAKERS_PLOT_HAS_RAW', 	'REQSET_CSC_ADJACENT_BAKERS_QUARTER',					NULL			    ),
        (  	'MOD_CSC_BAKERS_RAW_IMPROV_PROD_TO_ADJACENT_FLOUR_MILL',    		'MODIFIER_CSC_SINGLE_DISTRICT_ADJUST_BUILDING_YIELD_CHANGE',	NULL,                           	NULL,							                        NULL	            ),

-- 	+1 Gold to adjacent raw materials improvements
		(	'MOD_CSC_BAKERS_FLOUR_MILL_GOLD_TO_ADJACENT_RAW_IMPROV',			'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',							NULL,								'REQSET_CSC_BAKERS_PLOT_HAS_RAW_IMPROV_ADJACENT',		NULL      			),

-- 	+1 Food at Feudalism
		(	'MOD_CSC_BAKERS_FLOUR_MILL_FOOD_UPGRADE',							'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',			NULL,								'REQSET_CSC_BAKERS_FLOUR_MILL_UPGRADE',					NULL				),

-- 	+1 Food to an adjacent Granary, and +1 Gold in return
        (  	'MOD_CSC_BAKERS_FLOUR_MILL_ATTACH_CITY_CENTER',						'MODIFIER_ALL_DISTRICTS_ATTACH_MODIFIER',     					NULL, 								'REQSET_CSC_ADJACENT_CITY_CENTER',    					NULL				),
        (  	'MOD_CSC_BAKERS_FLOUR_MILL_FOOD_TO_ADJACENT_GRANARY',    			'MODIFIER_CSC_SINGLE_DISTRICT_ADJUST_BUILDING_YIELD_CHANGE',  	NULL,                           	NULL,                                    				NULL				),
        (  	'MOD_CSC_BAKERS_GRANARY_ATTACH_BAKERS_QUARTER',						'MODIFIER_ALL_DISTRICTS_ATTACH_MODIFIER',     					NULL,								'REQSET_CSC_ADJACENT_BAKERS_QUARTER',    				NULL				),
		(  	'MOD_CSC_BAKERS_GRANARY_GOLD_TO_ADJACENT_FLOUR_MILL',    			'MODIFIER_CSC_SINGLE_DISTRICT_ADJUST_BUILDING_YIELD_CHANGE',  	NULL,                           	NULL,                                    				NULL				),

-- 	BAKERY ------------------------------------------------------------------------------

-- 	+1 Gold to the Flour Mill in the Quarter
		(	'MOD_CSC_BAKERS_BAKERY_GOLD_TO_FLOUR_MILL',							'MODIFIER_CSC_SINGLE_DISTRICT_ADJUST_BUILDING_YIELD_CHANGE',	NULL,								NULL,													NULL				),

-- 	+0.3 Food and +0.2 Gold per citizen in the city
		(	'MOD_CSC_BAKERS_BAKERY_FOOD',										'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',		NULL,								NULL,													NULL				),
		(	'MOD_CSC_BAKERS_BAKERY_GOLD',										'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',		NULL,								NULL,													NULL				),

-- 	+0.3 Food and +0.2 Gold per citizen in the city at Mercantilism
		(	'MOD_CSC_BAKERS_BAKERY_FOOD_UPGRADE',								'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',		NULL,								'REQSET_CSC_BAKERS_BAKERY_UPGRADE',						NULL				),
		(	'MOD_CSC_BAKERS_BAKERY_GOLD_UPGRADE',								'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',		NULL,								'REQSET_CSC_BAKERS_BAKERY_UPGRADE',						NULL				),

-- 	+1 Food to each adjacent Market and Food Market, and +1 Gold in return
        (  	'MOD_CSC_BAKERS_BAKERY_ATTACH_COMMERCIAL_HUB',						'MODIFIER_ALL_DISTRICTS_ATTACH_MODIFIER',     					NULL, 								'REQSET_CSC_ADJACENT_COMMERCIAL_HUB',    				NULL				),
        (  	'MOD_CSC_BAKERS_BAKERY_FOOD_TO_ADJACENT_MARKET',    				'MODIFIER_CSC_SINGLE_DISTRICT_ADJUST_BUILDING_YIELD_CHANGE',  	NULL,                           	NULL,                                    				NULL				),

        (  	'MOD_CSC_BAKERS_BAKERY_ATTACH_NEIGHBORHOOD',						'MODIFIER_ALL_DISTRICTS_ATTACH_MODIFIER',     					NULL, 								'REQSET_CSC_ADJACENT_NEIGHBORHOOD',    					NULL				),
        (  	'MOD_CSC_BAKERS_BAKERY_FOOD_TO_ADJACENT_FOOD_MARKET',    			'MODIFIER_CSC_SINGLE_DISTRICT_ADJUST_BUILDING_YIELD_CHANGE',  	NULL,                           	NULL,                                    				NULL				),

       	(  	'MOD_CSC_BAKERS_SALES_ATTACH_BAKERS_QUARTER',						'MODIFIER_ALL_DISTRICTS_ATTACH_MODIFIER',     					NULL,								'REQSET_CSC_ADJACENT_BAKERS_QUARTER',    				NULL				),
		(  	'MOD_CSC_BAKERS_SALES_GOLD_TO_ADJACENT_BAKERY',    					'MODIFIER_CSC_SINGLE_DISTRICT_ADJUST_BUILDING_YIELD_CHANGE',  	NULL,                           	NULL,                                    				NULL				),

-- 	+1 Amenity
		(	'MOD_CSC_BAKERS_BAKERY_AMENITY',									'MODIFIER_CITY_DISTRICTS_ADJUST_DISTRICT_AMENITY',				NULL,								'REQSET_CSC_DISTRICT_IS_BAKERS',						NULL				),

-- 	PATISSERIE --------------------------------------------------------------------------

-- 	+1 Production from each nearby luxury materials improvement
		(  	'MOD_CSC_BAKERS_LUX_IMPROVEMENT_ATTACH_QUARTER',            		'MODIFIER_ALL_DISTRICTS_ATTACH_MODIFIER',     					'REQSET_CSC_BAKERS_PLOT_HAS_LUX', 	'REQSET_CSC_NEARBY_BAKERS_QUARTER',						NULL			    ),
        (  	'MOD_CSC_BAKERS_LUX_IMPROV_PROD_TO_NEARBY_PATISSERIE',    			'MODIFIER_CSC_SINGLE_DISTRICT_ADJUST_BUILDING_YIELD_CHANGE',	NULL,                           	NULL,							                        NULL	            ),

-- 	+1 Gold to nearby luxury materials improvements
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_TO_NEARBY_LUX_IMPROV',				'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',							NULL,								'REQSET_CSC_BAKERS_PLOT_HAS_LUX_IMPROV_NEARBY',			NULL      			),

-- 	SHARED ------------------------------------------------------------------------------

-- 	+1 Food bonus to trade routes to the city, and +1 Gold in return (not working for domestic)
		(	'MOD_CSC_BAKERS_TRADE_ROUTES_FOOD',									'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_TO_OTHERS',		NULL,								NULL,													NULL				),
		(	'MOD_CSC_BAKERS_TRADE_ROUTES_GOLD',									'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FROM_OTHERS',	NULL,								NULL,													NULL				);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	ModifierArguments
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
INSERT INTO ModifierArguments
		
        (	ModifierId,			                      							Name,                       Value		                									)	VALUES

-- 	BAKERS QUARTER ----------------------------------------------------------------------

-- 	+1 Production if built on Hills terrain
		(	'MOD_CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS',                    	'YieldType',	      		'YIELD_PRODUCTION'                                              ),
        (	'MOD_CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS',                    	'Amount',		        	1		                                                		),

-- 	FLOUR MILL --------------------------------------------------------------------------

-- 	+1 Production from each adjacent raw materials improvement
		(  	'MOD_CSC_BAKERS_RAW_IMPROVEMENT_ATTACH_QUARTER',            		'ModifierId',         		'MOD_CSC_BAKERS_RAW_IMPROV_PROD_TO_ADJACENT_FLOUR_MILL'     	),    
        (  	'MOD_CSC_BAKERS_RAW_IMPROV_PROD_TO_ADJACENT_FLOUR_MILL',       		'BuildingType',           	'BUILDING_CSC_BAKERS_FLOUR_MILL'								),
        (  	'MOD_CSC_BAKERS_RAW_IMPROV_PROD_TO_ADJACENT_FLOUR_MILL',       		'YieldType',           		'YIELD_PRODUCTION'                                              ),
        ( 	'MOD_CSC_BAKERS_RAW_IMPROV_PROD_TO_ADJACENT_FLOUR_MILL',       		'Amount',             		1                                                               ),

-- 	+1 Gold to adjacent raw materials improvements
		(	'MOD_CSC_BAKERS_FLOUR_MILL_GOLD_TO_ADJACENT_RAW_IMPROV',    		'YieldType',	            'YIELD_GOLD'                									),
        (	'MOD_CSC_BAKERS_FLOUR_MILL_GOLD_TO_ADJACENT_RAW_IMPROV',    		'Amount',		            1		                    									),

-- 	+1 Food at Feudalism
		(	'MOD_CSC_BAKERS_FLOUR_MILL_FOOD_UPGRADE',							'BuildingType',				'BUILDING_CSC_BAKERS_FLOUR_MILL'								),
		(	'MOD_CSC_BAKERS_FLOUR_MILL_FOOD_UPGRADE',							'YieldType',				'YIELD_FOOD'													),
		(	'MOD_CSC_BAKERS_FLOUR_MILL_FOOD_UPGRADE',							'Amount',					1																),

-- 	+1 Food to an adjacent Granary, and +1 Gold in return
		(	'MOD_CSC_BAKERS_FLOUR_MILL_ATTACH_CITY_CENTER',						'ModifierId',				'MOD_CSC_BAKERS_FLOUR_MILL_FOOD_TO_ADJACENT_GRANARY'			),
		(	'MOD_CSC_BAKERS_FLOUR_MILL_FOOD_TO_ADJACENT_GRANARY',				'BuildingType',				'BUILDING_GRANARY'												),
		(	'MOD_CSC_BAKERS_FLOUR_MILL_FOOD_TO_ADJACENT_GRANARY',				'YieldType',				'YIELD_FOOD'													),
		(	'MOD_CSC_BAKERS_FLOUR_MILL_FOOD_TO_ADJACENT_GRANARY',				'Amount',					1																),
		(	'MOD_CSC_BAKERS_GRANARY_ATTACH_BAKERS_QUARTER',						'ModifierId',				'MOD_CSC_BAKERS_GRANARY_GOLD_TO_ADJACENT_FLOUR_MILL'			),
		(	'MOD_CSC_BAKERS_GRANARY_GOLD_TO_ADJACENT_FLOUR_MILL',				'BuildingType',				'BUILDING_CSC_BAKERS_FLOUR_MILL'								),
		(	'MOD_CSC_BAKERS_GRANARY_GOLD_TO_ADJACENT_FLOUR_MILL',				'YieldType',				'YIELD_GOLD'													),
		(	'MOD_CSC_BAKERS_GRANARY_GOLD_TO_ADJACENT_FLOUR_MILL',				'Amount',					1																),

-- 	BAKERY ------------------------------------------------------------------------------

-- 	+1 Gold to the Flour Mill in the Quarter
		(	'MOD_CSC_BAKERS_BAKERY_GOLD_TO_FLOUR_MILL',							'BuildingType',				'BUILDING_CSC_BAKERS_FLOUR_MILL'								),
		(	'MOD_CSC_BAKERS_BAKERY_GOLD_TO_FLOUR_MILL',							'YieldType',				'YIELD_GOLD'													),
		(	'MOD_CSC_BAKERS_BAKERY_GOLD_TO_FLOUR_MILL',							'Amount',					1																),

-- 	+0.3 Food and +0.2 Gold per citizen in the city
		(	'MOD_CSC_BAKERS_BAKERY_FOOD',										'YieldType',				'YIELD_FOOD'													),
		(	'MOD_CSC_BAKERS_BAKERY_FOOD',										'Amount',					0.3																),
		(	'MOD_CSC_BAKERS_BAKERY_GOLD',										'YieldType',				'YIELD_GOLD'													),
		(	'MOD_CSC_BAKERS_BAKERY_GOLD',										'Amount',					0.2																),

-- 	+0.3 Food and +0.2 Gold per citizen in the city at Mercantilism
		(	'MOD_CSC_BAKERS_BAKERY_FOOD_UPGRADE',								'YieldType',				'YIELD_FOOD'													),
		(	'MOD_CSC_BAKERS_BAKERY_FOOD_UPGRADE',								'Amount',					0.3																),
		(	'MOD_CSC_BAKERS_BAKERY_GOLD_UPGRADE',								'YieldType',				'YIELD_GOLD'													),
		(	'MOD_CSC_BAKERS_BAKERY_GOLD_UPGRADE',								'Amount',					0.2																),

-- 	+1 Food to each adjacent Market and Food Market, and +1 Gold in return
		(	'MOD_CSC_BAKERS_BAKERY_ATTACH_COMMERCIAL_HUB',						'ModifierId',				'MOD_CSC_BAKERS_BAKERY_FOOD_TO_ADJACENT_MARKET'					),
		(	'MOD_CSC_BAKERS_BAKERY_FOOD_TO_ADJACENT_MARKET',					'BuildingType',				'BUILDING_MARKET'												),
		(	'MOD_CSC_BAKERS_BAKERY_FOOD_TO_ADJACENT_MARKET',					'YieldType',				'YIELD_FOOD'													),
		(	'MOD_CSC_BAKERS_BAKERY_FOOD_TO_ADJACENT_MARKET',					'Amount',					1																),

		(	'MOD_CSC_BAKERS_BAKERY_ATTACH_NEIGHBORHOOD',						'ModifierId',				'MOD_CSC_BAKERS_BAKERY_FOOD_TO_ADJACENT_FOOD_MARKET'			),
		(	'MOD_CSC_BAKERS_BAKERY_FOOD_TO_ADJACENT_FOOD_MARKET',				'BuildingType',				'BUILDING_FOOD_MARKET'											),
		(	'MOD_CSC_BAKERS_BAKERY_FOOD_TO_ADJACENT_FOOD_MARKET',				'YieldType',				'YIELD_FOOD'													),
		(	'MOD_CSC_BAKERS_BAKERY_FOOD_TO_ADJACENT_FOOD_MARKET',				'Amount',					1																),

		(	'MOD_CSC_BAKERS_SALES_ATTACH_BAKERS_QUARTER',						'ModifierId',				'MOD_CSC_BAKERS_SALES_GOLD_TO_ADJACENT_BAKERY'					),
		(	'MOD_CSC_BAKERS_SALES_GOLD_TO_ADJACENT_BAKERY',						'BuildingType',				'BUILDING_CSC_BAKERS_BAKERY'									),
		(	'MOD_CSC_BAKERS_SALES_GOLD_TO_ADJACENT_BAKERY',						'YieldType',				'YIELD_GOLD'													),
		(	'MOD_CSC_BAKERS_SALES_GOLD_TO_ADJACENT_BAKERY',						'Amount',					1																),

-- 	+1 Amenity
		(	'MOD_CSC_BAKERS_BAKERY_AMENITY',									'Amount',					1																),

-- 	PATISSERIE --------------------------------------------------------------------------

-- 	+1 Production from each adjacent raw materials improvement
		(  	'MOD_CSC_BAKERS_LUX_IMPROVEMENT_ATTACH_QUARTER',            		'ModifierId',         		'MOD_CSC_BAKERS_LUX_IMPROV_PROD_TO_NEARBY_PATISSERIE'     		),    
        (  	'MOD_CSC_BAKERS_LUX_IMPROV_PROD_TO_NEARBY_PATISSERIE',       		'BuildingType',           	'BUILDING_CSC_BAKERS_PATISSERIE'								),
        (  	'MOD_CSC_BAKERS_LUX_IMPROV_PROD_TO_NEARBY_PATISSERIE',       		'YieldType',           		'YIELD_PRODUCTION'                                              ),
        ( 	'MOD_CSC_BAKERS_LUX_IMPROV_PROD_TO_NEARBY_PATISSERIE',       		'Amount',             		1                                                               ),

-- 	+1 Gold to adjacent raw materials improvements
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_TO_NEARBY_LUX_IMPROV',    			'YieldType',	            'YIELD_GOLD'                									),
        (	'MOD_CSC_BAKERS_PATISSERIE_GOLD_TO_NEARBY_LUX_IMPROV',    			'Amount',		            1		                    									),

-- 	SHARED ------------------------------------------------------------------------------

-- 	+1 Food bonus to trade routes to the city, and +1 Gold in return (not working for domestic)
		(	'MOD_CSC_BAKERS_TRADE_ROUTES_FOOD',									'YieldType',				'YIELD_FOOD'													),
		(	'MOD_CSC_BAKERS_TRADE_ROUTES_FOOD',									'Amount',					1																),
		(	'MOD_CSC_BAKERS_TRADE_ROUTES_FOOD',									'Domestic',					1																),

		(	'MOD_CSC_BAKERS_TRADE_ROUTES_GOLD',									'YieldType',				'YIELD_GOLD'													),
		(	'MOD_CSC_BAKERS_TRADE_ROUTES_GOLD',									'Amount',					1																),
		(	'MOD_CSC_BAKERS_TRADE_ROUTES_GOLD',									'Domestic',					1																);



--===========================================================================================================================================================================--
/*	REQUIREMENTS */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	RequirementSets
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
INSERT INTO RequirementSets 
		
        (	RequirementSetId,                              			RequirementSetType              )	VALUES

-- 	BAKERS QUARTER ----------------------------------------------------------------------

-- 	+1 Production if built on Hills terrain		
		(	'REQSET_CSC_PLOT_IS_HILLS',	                  			'REQUIREMENTSET_TEST_ALL'       ),

-- 	FLOUR MILL --------------------------------------------------------------------------

-- 	+1 Production from each adjacent raw materials improvement
		(	'REQSET_CSC_BAKERS_PLOT_HAS_RAW',						'REQUIREMENTSET_TEST_ALL'       ),

-- 	+1 Gold to adjacent raw materials improvements
        (	'REQSET_CSC_BAKERS_PLOT_HAS_RAW_IMPROV_ADJACENT',		'REQUIREMENTSET_TEST_ALL'       ),

-- 	+1 Food at Feudalism
		(	'REQSET_CSC_BAKERS_FLOUR_MILL_UPGRADE',					'REQUIREMENTSET_TEST_ALL'		),

-- 	+1 Food to an adjacent Granary, and +1 Gold in return
		(	'REQSET_CSC_ADJACENT_CITY_CENTER',						'REQUIREMENTSET_TEST_ALL'		),

-- 	BAKERY ------------------------------------------------------------------------------

-- 	+0.3 Food and +0.2 Gold per citizen in the city at Mercantilism
		(	'REQSET_CSC_BAKERS_BAKERY_UPGRADE',						'REQUIREMENTSET_TEST_ALL'		),

-- 	+1 Food to each adjacent Market and Food Market, and +1 Gold in return
		(	'REQSET_CSC_ADJACENT_COMMERCIAL_HUB',					'REQUIREMENTSET_TEST_ALL'		),
		(	'REQSET_CSC_ADJACENT_NEIGHBORHOOD',						'REQUIREMENTSET_TEST_ALL'		),

-- 	PATISSERIE --------------------------------------------------------------------------

-- 	+1 Production from each nearby luxury materials improvement
		(	'REQSET_CSC_BAKERS_PLOT_HAS_LUX',						'REQUIREMENTSET_TEST_ALL'       ),
		(	'REQSET_CSC_NEARBY_BAKERS_QUARTER',						'REQUIREMENTSET_TEST_ALL'		),

-- 	+1 Gold to nearby luxury materials improvements
        (	'REQSET_CSC_BAKERS_PLOT_HAS_LUX_IMPROV_NEARBY',			'REQUIREMENTSET_TEST_ALL'       ),

-- 	SHARED ------------------------------------------------------------------------------

		(	'REQSET_CSC_DISTRICT_IS_BAKERS',						'REQUIREMENTSET_TEST_ALL'		),
        (  	'REQSET_CSC_ADJACENT_BAKERS_QUARTER',          			'REQUIREMENTSET_TEST_ALL'       );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	RequirementSetRequirements
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
				
INSERT INTO RequirementSetRequirements
		
        (	RequirementSetId,		                      			RequirementId	                               	)	VALUES

-- 	BAKERS QUARTER ----------------------------------------------------------------------

-- 	+1 Production if built on Hills terrain
		(	'REQSET_CSC_PLOT_IS_HILLS',								'REQ_CSC_PLOT_IS_HILLS'			                ),

-- 	FLOUR MILL --------------------------------------------------------------------------

-- 	+1 Production from each adjacent raw materials improvement
		(	'REQSET_CSC_BAKERS_PLOT_HAS_RAW',						'REQ_CSC_PLOT_HAS_BAKERS_QUARTER_RAW'			),

-- 	+1 Gold to adjacent raw materials improvements
        (	'REQSET_CSC_BAKERS_PLOT_HAS_RAW_IMPROV_ADJACENT',		'REQ_CSC_PLOT_HAS_BAKERS_QUARTER_RAW'			),
        (	'REQSET_CSC_BAKERS_PLOT_HAS_RAW_IMPROV_ADJACENT',		'REQ_CSC_PLOT_HAS_ANY_IMPROVEMENT'				),
        (	'REQSET_CSC_BAKERS_PLOT_HAS_RAW_IMPROV_ADJACENT',		'REQ_CSC_PLOT_ADJACENT_TO_OWNER'				),

-- 	+1 Food at Feudalism
		(	'REQSET_CSC_BAKERS_FLOUR_MILL_UPGRADE',					'REQ_CSC_BAKERS_FLOUR_MILL_UPGRADE'				),

-- 	+1 Food to an adjacent Granary, and +1 Gold in return
		( 	'REQSET_CSC_ADJACENT_CITY_CENTER',						'REQ_CSC_PLOT_ADJACENT_TO_OWNER'              	),
        (  	'REQSET_CSC_ADJACENT_CITY_CENTER',						'REQ_CSC_DISTRICT_IS_CITY_CENTER'           	),

-- 	BAKERY ------------------------------------------------------------------------------

-- 	+0.3 Food and +0.2 Gold per citizen in the city at Mercantilism
		(	'REQSET_CSC_BAKERS_BAKERY_UPGRADE',						'REQ_CSC_BAKERS_BAKERY_UPGRADE'					),

-- 	+1 Food to each adjacent Market and Food Market, and +1 Gold in return
		( 	'REQSET_CSC_ADJACENT_COMMERCIAL_HUB',					'REQ_CSC_PLOT_ADJACENT_TO_OWNER'              	),
        (  	'REQSET_CSC_ADJACENT_COMMERCIAL_HUB',					'REQ_CSC_DISTRICT_IS_COMMERCIAL_HUB'           	),
		( 	'REQSET_CSC_ADJACENT_NEIGHBORHOOD',						'REQ_CSC_PLOT_ADJACENT_TO_OWNER'              	),
        (  	'REQSET_CSC_ADJACENT_NEIGHBORHOOD',						'REQ_CSC_DISTRICT_IS_NEIGHBORHOOD'           	),

-- 	PATISSERIE --------------------------------------------------------------------------

-- 	+1 Production from each nearby luxury materials improvement
		(	'REQSET_CSC_BAKERS_PLOT_HAS_LUX',						'REQ_CSC_PLOT_HAS_BAKERS_QUARTER_LUX'			),
        ( 	'REQSET_CSC_NEARBY_BAKERS_QUARTER',						'REQ_CSC_PLOT_NEARBY_OWNER'              		),
        (  	'REQSET_CSC_NEARBY_BAKERS_QUARTER',						'REQ_CSC_DISTRICT_IS_BAKERS_QUARTER'           	),

-- 	+1 Gold to nearby luxury materials improvements
        (	'REQSET_CSC_BAKERS_PLOT_HAS_LUX_IMPROV_NEARBY',			'REQ_CSC_PLOT_HAS_BAKERS_QUARTER_LUX'			),
        (	'REQSET_CSC_BAKERS_PLOT_HAS_LUX_IMPROV_NEARBY',			'REQ_CSC_PLOT_HAS_ANY_IMPROVEMENT'				),
        (	'REQSET_CSC_BAKERS_PLOT_HAS_LUX_IMPROV_NEARBY',			'REQ_CSC_PLOT_NEARBY_OWNER'						),
		
-- 	SHARED ------------------------------------------------------------------------------

		(	'REQSET_CSC_DISTRICT_IS_BAKERS',						'REQ_CSC_DISTRICT_IS_BAKERS_QUARTER'			),

        ( 	'REQSET_CSC_ADJACENT_BAKERS_QUARTER',					'REQ_CSC_PLOT_ADJACENT_TO_OWNER'              	),
        (  	'REQSET_CSC_ADJACENT_BAKERS_QUARTER',					'REQ_CSC_DISTRICT_IS_BAKERS_QUARTER'           	);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Requirements
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Requirements
        
        (	RequirementId,		                          			RequirementType,	                                Inverse         )	VALUES

-- 	BAKERS QUARTER ----------------------------------------------------------------------

-- 	+1 Production if built on Hills terrain
		(	'REQ_CSC_PLOT_IS_HILLS',								'REQUIREMENT_PLOT_IS_HILLS',                      	0	        	),

-- 	FLOUR MILL --------------------------------------------------------------------------

-- 	+1 Gold to adjacent raw materials improvements
        (	'REQ_CSC_PLOT_HAS_ANY_IMPROVEMENT',            			'REQUIREMENT_PLOT_HAS_ANY_IMPROVEMENT',           	0               ),

-- 	+1 Food at Feudalism
		(	'REQ_CSC_BAKERS_FLOUR_MILL_UPGRADE',					'REQUIREMENT_PLAYER_HAS_CIVIC',						0				),

-- 	+1 Food to an adjacent Granary, and +1 Gold in return
		(	'REQ_CSC_DISTRICT_IS_CITY_CENTER',						'REQUIREMENT_PLOT_DISTRICT_TYPE_MATCHES',			0				),

-- 	BAKERY ------------------------------------------------------------------------------

-- 	+0.3 Food and +0.2 Gold per citizen in the city at Mercantilism
		(	'REQ_CSC_BAKERS_BAKERY_UPGRADE',						'REQUIREMENT_PLAYER_HAS_CIVIC',						0				),

-- 	+1 Food to each adjacent Market and Food Market, and +1 Gold in return
		(	'REQ_CSC_DISTRICT_IS_COMMERCIAL_HUB',					'REQUIREMENT_PLOT_DISTRICT_TYPE_MATCHES',			0				),
		(	'REQ_CSC_DISTRICT_IS_NEIGHBORHOOD',						'REQUIREMENT_PLOT_DISTRICT_TYPE_MATCHES',			0				),

-- 	SHARED ------------------------------------------------------------------------------

		(	'REQ_CSC_PLOT_HAS_BAKERS_QUARTER_RAW',					'REQUIREMENT_PLOT_RESOURCE_TAG_MATCHES',			0				),
		(	'REQ_CSC_PLOT_HAS_BAKERS_QUARTER_LUX',					'REQUIREMENT_PLOT_RESOURCE_TAG_MATCHES',			0				),
		(	'REQ_CSC_PLOT_ADJACENT_TO_OWNER',						'REQUIREMENT_PLOT_ADJACENT_TO_OWNER',              	0               ),
        (	'REQ_CSC_PLOT_NEARBY_OWNER',							'REQUIREMENT_PLOT_ADJACENT_TO_OWNER',				0				),
		(   'REQ_CSC_DISTRICT_IS_BAKERS_QUARTER',					'REQUIREMENT_PLOT_DISTRICT_TYPE_MATCHES',          	0               );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	RequirementArguments
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO RequirementArguments 

        (	RequirementId,				               				Name,                           Value		                    				)	VALUES
		
-- 	FLOUR MILL --------------------------------------------------------------------------
		
-- 	+1 Food at Feudalism
		( 	'REQ_CSC_BAKERS_FLOUR_MILL_UPGRADE',					'CivicType',					'CIVIC_FEUDALISM'								),

-- 	+1 Food to an adjacent Granary, and +1 Gold in return
		(	'REQ_CSC_DISTRICT_IS_CITY_CENTER',						'DistrictType',					'DISTRICT_CITY_CENTER'							),

-- 	BAKERY ------------------------------------------------------------------------------

-- 	+0.3 Food and +0.2 Gold per citizen in the city at Mercantilism
		( 	'REQ_CSC_BAKERS_BAKERY_UPGRADE',						'CivicType',					'CIVIC_MERCANTILISM'							),

-- 	+1 Food to each adjacent Market and Food Market, and +1 Gold in return
		(	'REQ_CSC_DISTRICT_IS_COMMERCIAL_HUB',					'DistrictType',					'DISTRICT_COMMERCIAL_HUB'						),
		(	'REQ_CSC_DISTRICT_IS_NEIGHBORHOOD',						'DistrictType',					'DISTRICT_NEIGHBORHOOD'							),

-- 	SHARED ------------------------------------------------------------------------------

		( 	'REQ_CSC_DISTRICT_IS_BAKERS_QUARTER',					'DistrictType',                 'DISTRICT_CSC_BAKERS_QUARTER'     				),
		(	'REQ_CSC_PLOT_HAS_BAKERS_QUARTER_RAW',					'Tag',							'CLASS_CSC_BAKERS_RAW'							),
		(	'REQ_CSC_PLOT_HAS_BAKERS_QUARTER_LUX',					'Tag',							'CLASS_CSC_BAKERS_LUX'							),
		(	'REQ_CSC_PLOT_NEARBY_OWNER',							'MaxDistance',					2												);	
