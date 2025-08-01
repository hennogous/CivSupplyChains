-- CSC_BAKERS
-- Author: Henno
-- DateCreated: 4/19/2025 10:53:23
--------------------------------------------------------------

--===========================================================================================================================================================================--
/*	TYPES */
--===========================================================================================================================================================================--

INSERT INTO Types

		(	Type,																Kind					)
VALUES	( 	'DISTRICT_CSC_BAKERS_QUARTER',                              		'KIND_DISTRICT'         ),

		(	'BUILDING_CSC_BAKERS_FLOUR_MILL',									'KIND_BUILDING'			),
		(	'BUILDING_CSC_BAKERS_BAKERY',										'KIND_BUILDING'			),
		(	'BUILDING_CSC_BAKERS_PATISSERIE',									'KIND_BUILDING'			),

		(	'MODIFIER_CSC_OWNER_ADJUST_BUILDING_YIELD_CHANGE',					'KIND_MODIFIER'			),
		(	'MODIFIER_CSC_OWNER_EFFECT_ADJUST_DISTRICT_HOUSING',				'KIND_MODIFIER'			);


--===========================================================================================================================================================================--
/*	RESOURCES */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Tags
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO Tags

		(   Tag,							    Vocabulary			)
VALUES	(	'CLASS_CSC_BAKERS_BASE',	        'RESOURCE_CLASS'	),
        (	'CLASS_CSC_BAKERS_SPEC',	        'RESOURCE_CLASS'	);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	TypeTags
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--	Bakers' Quarter base materials
INSERT OR IGNORE INTO TypeTags

	(	Type,					Tag			        )
SELECT	ResourceType,			'CLASS_CSC_BAKERS_BASE'
FROM	Resources
WHERE	ResourceType 			IN
	(	'RESOURCE_BANANAS',
		'RESOURCE_MAIZE',
		'RESOURCE_RICE',
		'RESOURCE_WHEAT'        );

--	Bakers' Quarter specialty materials
INSERT OR IGNORE INTO TypeTags

	(	Type,					Tag			        )
SELECT	ResourceType,			'CLASS_CSC_BAKERS_SPEC'
FROM	Resources
WHERE	ResourceType 			IN
	(	'RESOURCE_COCOA',
		'RESOURCE_COFFEE',
		'RESOURCE_WINE',
		'RESOURCE_OLIVES',
		'RESOURCE_SALT',
		'RESOURCE_SPICES',
		'RESOURCE_SUGAR'        );



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

--	BASE materials improvements		
		(	'IMPROVEMENT_FARM',                     'MOD_CSC_BAKERS_BASE_IMPROVEMENT_ATTACH_QUARTER'                 			),
        (	'IMPROVEMENT_PLANTATION',               'MOD_CSC_BAKERS_BASE_IMPROVEMENT_ATTACH_QUARTER'                 			),

--	Specialty materials improvements		
        (	'IMPROVEMENT_CAMP',               		'MOD_CSC_BAKERS_SPEC_IMPROVEMENT_ATTACH_QUARTER'                 			),
		(	'IMPROVEMENT_MINE',               		'MOD_CSC_BAKERS_SPEC_IMPROVEMENT_ATTACH_QUARTER'                 			),
        (	'IMPROVEMENT_PLANTATION',               'MOD_CSC_BAKERS_SPEC_IMPROVEMENT_ATTACH_QUARTER'                 			);



--===============================================================================================================================================================================--
/*	BAKERS' QUARTER */
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

        (	DistrictType,		               		ModifierId			                        					)	VALUES  

-- 	+1 Production if built on Hills terrain
		(	'DISTRICT_CSC_BAKERS_QUARTER',     		'MOD_CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS'	   					),

-- +1 Housing to each adjacent Neighbourhood with minimum Charming appeal, and +1 Gold in return
		(	'DISTRICT_NEIGHBORHOOD',				'MOD_CSC_BAKERS_PATISSERIE_NBH_SALES_ATTACH_BAKERS_QUARTER'		),

-- 	TESTS -------------------------------------------------------------------------------

		(	'DISTRICT_CSC_BAKERS_QUARTER',			'MOD_CSC_BAKERS_COUNT_TEST'										);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Adjacency_YieldChanges
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT INTO Adjacency_YieldChanges

		(	ID,											Description,									YieldType,				YieldChange,	AdjacentFeature,	AdjacentImprovement,	AdjacentDistrict,						AdjacentResourceClass,		PrereqTech			)
VALUES	(	'CSC_CITY_CENTER_GOLD_TO_BAKERS',			'LOC_CSC_CITY_CENTER_GOLD_TO_BAKERS',			'YIELD_GOLD',			1,				NULL,				NULL,					'DISTRICT_CITY_CENTER',					'NO_RESOURCECLASS',			NULL				),
		(	'CSC_BAKERS_FOOD_TO_CITY_CENTER',			'LOC_CSC_BAKERS_FOOD_TO_CITY_CENTER',			'YIELD_FOOD',			1,				NULL,				NULL,					'DISTRICT_CSC_BAKERS_QUARTER',			'NO_RESOURCECLASS',			NULL				),

		(	'CSC_COMMERCIAL_HUB_GOLD_TO_BAKERS',		'LOC_CSC_COMMERCIAL_HUB_GOLD_TO_BAKERS',		'YIELD_GOLD',			1,				NULL,				NULL,					'DISTRICT_COMMERCIAL_HUB',				'NO_RESOURCECLASS',			NULL				),
		(	'CSC_BAKERS_FOOD_TO_COMMERCIAL_HUB',		'LOC_CSC_BAKERS_FOOD_TO_COMMERCIAL_HUB',		'YIELD_FOOD',			1,				NULL,				NULL,					'DISTRICT_CSC_BAKERS_QUARTER',			'NO_RESOURCECLASS',			NULL				);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	District_Adjacencies
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT INTO District_Adjacencies

		(	DistrictType,						YieldChangeId		)
VALUES	(	'DISTRICT_CSC_BAKERS_QUARTER',		'CSC_CITY_CENTER_GOLD_TO_BAKERS'		),
		(	'DISTRICT_CITY_CENTER',				'CSC_BAKERS_FOOD_TO_CITY_CENTER'		),

		(	'DISTRICT_CSC_BAKERS_QUARTER',		'CSC_COMMERCIAL_HUB_GOLD_TO_BAKERS'		),
		(	'DISTRICT_COMMERCIAL_HUB',			'CSC_BAKERS_FOOD_TO_COMMERCIAL_HUB'		);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Ruivo_New_Adjacency
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												
		
INSERT INTO Ruivo_New_Adjacency

    	(	ID,
			DistrictType,
    		ProvideType,
			YieldType,
			YieldChange,
    		AdjacencyType,
			CustomAdjacentObject,
			Rings,
    		DistrictModifiers			)
SELECT
			'CSC_BAKERS_PRODUCTION_FROM_BASE_' || Type,
			'DISTRICT_CSC_BAKERS_QUARTER',
			'SelfBonus',
			'YIELD_PRODUCTION',
			1,
			'FROM_RINGS_CAO_RESOURCE',
			Type,
			1,
			1
FROM	TypeTags
WHERE 	Tag='CLASS_CSC_BAKERS_BASE';

INSERT INTO Ruivo_New_Adjacency

    	(	ID,
			DistrictType,
    		ProvideType,
			YieldType,
			YieldChange,
    		AdjacencyType,
			CustomAdjacentObject,
			Rings,
    		DistrictModifiers			)
SELECT
			'CSC_BAKERS_PRODUCTION_FROM_SPEC_' || Type,
			'DISTRICT_CSC_BAKERS_QUARTER',
			'SelfBonus',
			'YIELD_PRODUCTION',
			1,
			'FROM_RINGS_CAO_RESOURCE',
			Type,
			1,
			1
FROM	TypeTags
WHERE 	Tag='CLASS_CSC_BAKERS_SPEC';



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
		/*  AdvisorType */			'ADVISOR_GENERIC'
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
		/*  AdvisorType */			'ADVISOR_GENERIC'
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
		/*  AdvisorType */			'ADVISOR_GENERIC'
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

--	+1 Gold to adjacent BASE materials improvements
		(	'BUILDING_CSC_BAKERS_FLOUR_MILL',       	'MOD_CSC_BAKERS_FLOUR_MILL_GOLD_TO_ADJACENT_BASE_IMPROV'   	),

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
		(	'BUILDING_CSC_BAKERS_BAKERY',				'MOD_CSC_BAKERS_ATTACH_COMMERCIAL_HUB'						),
		(	'BUILDING_MARKET',							'MOD_CSC_BAKERS_BAKERY_SALES_ATTACH_BAKERS_QUARTER'			),
		(	'BUILDING_CSC_BAKERS_BAKERY',				'MOD_CSC_BAKERS_BAKERY_ATTACH_NEIGHBORHOOD'					),
		(	'BUILDING_FOOD_MARKET',						'MOD_CSC_BAKERS_BAKERY_SALES_ATTACH_BAKERS_QUARTER'			),

--	PATISSERIE --------------------------------------------------------------------------

--	+1 Gold to nearby specialty materials improvements
		(	'BUILDING_CSC_BAKERS_PATISSERIE',       	'MOD_CSC_BAKERS_PATISSERIE_GOLD_TO_NEARBY_SPEC_IMPROV'   	),

-- 	+1 Gold to the Flour Mill in the Quarter
		(	'BUILDING_CSC_BAKERS_PATISSERIE',			'MOD_CSC_BAKERS_BAKERY_GOLD_TO_FLOUR_MILL'					),

-- 	+1 Food to each adjacent Market, and +1 Gold in return
		(	'BUILDING_CSC_BAKERS_PATISSERIE',			'MOD_CSC_BAKERS_ATTACH_COMMERCIAL_HUB'						),
		(	'BUILDING_MARKET',							'MOD_CSC_BAKERS_PATISSERIE_MKT_SALES_ATTACH_BAKERS_QUARTER'	),

-- +1 Housing to each adjacent Neighbourhood with minimum Charming appeal, and +1 Gold in return
		(	'BUILDING_CSC_BAKERS_PATISSERIE',			'MOD_CSC_BAKERS_PATISSERIE_ATTACH_NEIGHBORHOOD'				),

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
		(	'BUILDING_CSC_BAKERS_PATISSERIE',			'MOD_CSC_BAKERS_TRADE_ROUTES_GOLD_EXTRA'					);

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
/*	TRAITS */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	TraitModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO TraitModifiers

		(	TraitType,								ModifierId												)	VALUES

-- 	PATISSERIE --------------------------------------------------------------------------

--	+1 Food and +1 Gold for every 5 citizens in the city		
		(	'TRAIT_LEADER_MAJOR_CIV', 				'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_5'		),
		(	'TRAIT_LEADER_MAJOR_CIV', 				'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_5'		),
		(	'TRAIT_LEADER_MAJOR_CIV', 				'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_10'		),
		(	'TRAIT_LEADER_MAJOR_CIV', 				'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_10'		),
		(	'TRAIT_LEADER_MAJOR_CIV', 				'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_15'		),
		(	'TRAIT_LEADER_MAJOR_CIV', 				'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_15'		),
		(	'TRAIT_LEADER_MAJOR_CIV', 				'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_20'		),
		(	'TRAIT_LEADER_MAJOR_CIV', 				'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_20'		),
		(	'TRAIT_LEADER_MAJOR_CIV', 				'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_25'		),
		(	'TRAIT_LEADER_MAJOR_CIV', 				'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_25'		),
		(	'TRAIT_LEADER_MAJOR_CIV', 				'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_30'		),
		(	'TRAIT_LEADER_MAJOR_CIV', 				'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_30'		),
		(	'TRAIT_LEADER_MAJOR_CIV', 				'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_35'		),
		(	'TRAIT_LEADER_MAJOR_CIV', 				'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_35'		),
		(	'TRAIT_LEADER_MAJOR_CIV', 				'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_40'		),
		(	'TRAIT_LEADER_MAJOR_CIV', 				'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_40'		),
		(	'TRAIT_LEADER_MAJOR_CIV', 				'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_45'		),
		(	'TRAIT_LEADER_MAJOR_CIV', 				'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_45'		),
		(	'TRAIT_LEADER_MAJOR_CIV', 				'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_50'		),
		(	'TRAIT_LEADER_MAJOR_CIV', 				'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_50'		),

-- 	TESTS -------------------------------------------------------------------------------

		(	'TRAIT_LEADER_MAJOR_CIV',				'MOD_CSC_HIGH_ADJACENCY_TEST'							);



--===========================================================================================================================================================================--
/*	MODIFIERS */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	DynamicModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO DynamicModifiers 

        ( 	ModifierType,                                                   	CollectionType,                         EffectType	                        			)	VALUES
		( 	'MODIFIER_CSC_OWNER_ADJUST_BUILDING_YIELD_CHANGE',   				'COLLECTION_OWNER',         			'EFFECT_ADJUST_BUILDING_YIELD_CHANGE'   		),
		(	'MODIFIER_CSC_OWNER_EFFECT_ADJUST_DISTRICT_HOUSING',				'COLLECTION_OWNER',						'EFFECT_ADJUST_DISTRICT_HOUSING'				);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Modifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT INTO Modifiers

		(	ModifierId,															ModifierType,													OwnerRequirementSetId,				SubjectRequirementSetId,								SubjectStackLimit	)	VALUES	

-- 	BAKERS QUARTER ----------------------------------------------------------------------

-- 	+1 Production if built on Hills terrain
		(	'MOD_CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS',                    	'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE', 			NULL,                            	'REQSET_CSC_PLOT_IS_HILLS',								NULL				),

-- 	FLOUR MILL --------------------------------------------------------------------------

-- 	+1 Production from each adjacent BASE materials improvement
		(  	'MOD_CSC_BAKERS_BASE_IMPROVEMENT_ATTACH_QUARTER',            		'MODIFIER_ALL_DISTRICTS_ATTACH_MODIFIER',     					'REQSET_CSC_BAKERS_PLOT_HAS_BASE', 	'REQSET_CSC_ADJACENT_BAKERS_QUARTER',					NULL			    ),
        (  	'MOD_CSC_BAKERS_BASE_IMPROV_PROD_TO_ADJACENT_FLOUR_MILL',    		'MODIFIER_CSC_OWNER_ADJUST_BUILDING_YIELD_CHANGE',				NULL,                           	NULL,							                        NULL	            ),

-- 	+1 Gold to adjacent BASE materials improvements
		(	'MOD_CSC_BAKERS_FLOUR_MILL_GOLD_TO_ADJACENT_BASE_IMPROV',			'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',							NULL,								'REQSET_CSC_BAKERS_PLOT_HAS_BASE_IMPROV_ADJACENT',		NULL      			),

-- 	+1 Food at Feudalism
		(	'MOD_CSC_BAKERS_FLOUR_MILL_FOOD_UPGRADE',							'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',			NULL,								'REQSET_CSC_BAKERS_FLOUR_MILL_UPGRADE',					NULL				),

-- 	+1 Food to an adjacent Granary, and +1 Gold in return
        (  	'MOD_CSC_BAKERS_FLOUR_MILL_ATTACH_CITY_CENTER',						'MODIFIER_ALL_DISTRICTS_ATTACH_MODIFIER',     					NULL, 								'REQSET_CSC_ADJACENT_CITY_CENTER',    					NULL				),
        (  	'MOD_CSC_BAKERS_FLOUR_MILL_FOOD_TO_ADJACENT_GRANARY',    			'MODIFIER_CSC_OWNER_ADJUST_BUILDING_YIELD_CHANGE',  			NULL,                           	NULL,                                    				NULL				),
        (  	'MOD_CSC_BAKERS_GRANARY_ATTACH_BAKERS_QUARTER',						'MODIFIER_ALL_DISTRICTS_ATTACH_MODIFIER',     					NULL,								'REQSET_CSC_ADJACENT_BAKERS_QUARTER',    				NULL				),
		(  	'MOD_CSC_BAKERS_GRANARY_GOLD_TO_ADJACENT_FLOUR_MILL',    			'MODIFIER_CSC_OWNER_ADJUST_BUILDING_YIELD_CHANGE',  			NULL,                           	NULL,                                    				NULL				),

-- 	BAKERY ------------------------------------------------------------------------------

-- 	+1 Gold to the Flour Mill in the Quarter
		(	'MOD_CSC_BAKERS_BAKERY_GOLD_TO_FLOUR_MILL',							'MODIFIER_CSC_OWNER_ADJUST_BUILDING_YIELD_CHANGE',				NULL,								NULL,													NULL				),

-- 	+0.3 Food and +0.2 Gold per citizen in the city
		(	'MOD_CSC_BAKERS_BAKERY_FOOD',										'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',		NULL,								NULL,													NULL				),
		(	'MOD_CSC_BAKERS_BAKERY_GOLD',										'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',		NULL,								NULL,													NULL				),

-- 	+0.3 Food and +0.2 Gold per citizen in the city at Mercantilism
		(	'MOD_CSC_BAKERS_BAKERY_FOOD_UPGRADE',								'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',		NULL,								'REQSET_CSC_BAKERS_BAKERY_UPGRADE',						NULL				),
		(	'MOD_CSC_BAKERS_BAKERY_GOLD_UPGRADE',								'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',		NULL,								'REQSET_CSC_BAKERS_BAKERY_UPGRADE',						NULL				),

-- 	+1 Food to each adjacent Market and Food Market, and +1 Gold in return
        (  	'MOD_CSC_BAKERS_ATTACH_COMMERCIAL_HUB',								'MODIFIER_ALL_DISTRICTS_ATTACH_MODIFIER',     					NULL, 								'REQSET_CSC_ADJACENT_COMMERCIAL_HUB',    				NULL				),
        (  	'MOD_CSC_BAKERS_FOOD_TO_ADJACENT_MARKET',    						'MODIFIER_CSC_OWNER_ADJUST_BUILDING_YIELD_CHANGE',  			NULL,                           	NULL,                                    				NULL				),

        (  	'MOD_CSC_BAKERS_BAKERY_ATTACH_NEIGHBORHOOD',						'MODIFIER_ALL_DISTRICTS_ATTACH_MODIFIER',     					NULL, 								'REQSET_CSC_ADJACENT_NEIGHBORHOOD',    					NULL				),
        (  	'MOD_CSC_BAKERS_BAKERY_FOOD_TO_ADJACENT_FOOD_MARKET',    			'MODIFIER_CSC_OWNER_ADJUST_BUILDING_YIELD_CHANGE',  			NULL,                           	NULL,                                    				NULL				),

       	(  	'MOD_CSC_BAKERS_BAKERY_SALES_ATTACH_BAKERS_QUARTER',				'MODIFIER_ALL_DISTRICTS_ATTACH_MODIFIER',     					NULL,								'REQSET_CSC_ADJACENT_BAKERS_QUARTER',    				NULL				),
		(  	'MOD_CSC_BAKERS_BAKERY_SALES_GOLD_TO_ADJACENT_BAKERY',    			'MODIFIER_CSC_OWNER_ADJUST_BUILDING_YIELD_CHANGE',  			NULL,                           	NULL,                                    				NULL				),

-- 	+1 Amenity
		(	'MOD_CSC_BAKERS_BAKERY_AMENITY',									'MODIFIER_CITY_DISTRICTS_ADJUST_DISTRICT_AMENITY',				NULL,								'REQSET_CSC_DISTRICT_IS_BAKERS',						NULL				),

-- 	PATISSERIE --------------------------------------------------------------------------

-- 	+1 Production from each nearby specialty materials improvement
		(  	'MOD_CSC_BAKERS_SPEC_IMPROVEMENT_ATTACH_QUARTER',            		'MODIFIER_ALL_DISTRICTS_ATTACH_MODIFIER',     					'REQSET_CSC_BAKERS_PLOT_HAS_SPEC', 	'REQSET_CSC_NEARBY_BAKERS_QUARTER',						NULL			    ),
        (  	'MOD_CSC_BAKERS_SPEC_IMPROV_PROD_TO_NEARBY_PATISSERIE',    			'MODIFIER_CSC_OWNER_ADJUST_BUILDING_YIELD_CHANGE',				NULL,                           	NULL,							                        NULL	            ),

-- 	+1 Gold to nearby specialty materials improvements
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_TO_NEARBY_SPEC_IMPROV',				'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',							NULL,								'REQSET_CSC_BAKERS_PLOT_HAS_SPEC_IMPROV_NEARBY',			NULL      			),

--	+1 Food and +1 Gold for every 5 citizens in the city
		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_5',					'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',			NULL,								'REQSET_CSC_CITY_HAS_POPULATION_5',						NULL				),	
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_5',					'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',			NULL,								'REQSET_CSC_CITY_HAS_POPULATION_5',						NULL				),	

		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_10',					'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',			NULL,								'REQSET_CSC_CITY_HAS_POPULATION_10',					NULL				),	
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_10',					'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',			NULL,								'REQSET_CSC_CITY_HAS_POPULATION_10',					NULL				),	

		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_15',					'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',			NULL,								'REQSET_CSC_CITY_HAS_POPULATION_15',					NULL				),	
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_15',					'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',			NULL,								'REQSET_CSC_CITY_HAS_POPULATION_15',					NULL				),	

		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_20',					'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',			NULL,								'REQSET_CSC_CITY_HAS_POPULATION_20',					NULL				),	
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_20',					'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',			NULL,								'REQSET_CSC_CITY_HAS_POPULATION_20',					NULL				),	

		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_25',					'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',			NULL,								'REQSET_CSC_CITY_HAS_POPULATION_25',					NULL				),	
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_25',					'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',			NULL,								'REQSET_CSC_CITY_HAS_POPULATION_25',					NULL				),	

		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_30',					'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',			NULL,								'REQSET_CSC_CITY_HAS_POPULATION_30',					NULL				),	
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_30',					'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',			NULL,								'REQSET_CSC_CITY_HAS_POPULATION_30',					NULL				),	

		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_35',					'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',			NULL,								'REQSET_CSC_CITY_HAS_POPULATION_35',					NULL				),	
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_35',					'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',			NULL,								'REQSET_CSC_CITY_HAS_POPULATION_35',					NULL				),	

		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_40',					'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',			NULL,								'REQSET_CSC_CITY_HAS_POPULATION_40',					NULL				),	
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_40',					'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',			NULL,								'REQSET_CSC_CITY_HAS_POPULATION_40',					NULL				),	

		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_45',					'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',			NULL,								'REQSET_CSC_CITY_HAS_POPULATION_45',					NULL				),	
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_45',					'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',			NULL,								'REQSET_CSC_CITY_HAS_POPULATION_45',					NULL				),	

		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_50',					'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',			NULL,								'REQSET_CSC_CITY_HAS_POPULATION_50',					NULL				),	
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_50',					'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',			NULL,								'REQSET_CSC_CITY_HAS_POPULATION_50',					NULL				),	

-- 	+1 Food to each adjacent Market, and +1 Gold in return
		(	'MOD_CSC_BAKERS_PATISSERIE_MKT_SALES_ATTACH_BAKERS_QUARTER',		'MODIFIER_ALL_DISTRICTS_ATTACH_MODIFIER',						NULL,								'REQSET_CSC_ADJACENT_BAKERS_QUARTER',					NULL				),

-- +1 Housing to each adjacent Neighbourhood with minimum Charming appeal, and +1 Gold in return
		(	'MOD_CSC_BAKERS_PATISSERIE_ATTACH_NEIGHBORHOOD',					'MODIFIER_ALL_DISTRICTS_ATTACH_MODIFIER',						NULL,								'REQSET_CSC_ADJACENT_NEIGHBORHOOD_MIN_CHARMING',		NULL				),
		(	'MOD_CSC_BAKERS_PATISSERIE_HOUSING_TO_NEIGHBORHOOD',				'MODIFIER_CSC_OWNER_EFFECT_ADJUST_DISTRICT_HOUSING',			NULL,								NULL,													NULL				),

       	(  	'MOD_CSC_BAKERS_PATISSERIE_NBH_SALES_ATTACH_BAKERS_QUARTER',		'MODIFIER_ALL_DISTRICTS_ATTACH_MODIFIER',     					'REQSET_CSC_NEIGHBORHOOD_MIN_CHARMING',		'REQSET_CSC_ADJACENT_BAKERS_QUARTER',    		NULL				),
		(  	'MOD_CSC_BAKERS_PATISSERIE_SALES_GOLD_TO_ADJACENT_PATISSERIE',    	'MODIFIER_CSC_OWNER_ADJUST_BUILDING_YIELD_CHANGE',  			NULL,                           	NULL,                                    				NULL				),

-- 	SHARED ------------------------------------------------------------------------------

-- 	+1 Food bonus to trade routes to the city, and +1 Gold in return (not working for domestic)
		(	'MOD_CSC_BAKERS_TRADE_ROUTES_FOOD',									'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_TO_OTHERS',		NULL,								NULL,													NULL				),
		(	'MOD_CSC_BAKERS_TRADE_ROUTES_GOLD',									'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FROM_OTHERS',	NULL,								NULL,													NULL				),
		(	'MOD_CSC_BAKERS_TRADE_ROUTES_GOLD_EXTRA',							'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FROM_OTHERS',	NULL,								NULL,													NULL				),

-- 	TESTS -------------------------------------------------------------------------------

		(	'MOD_CSC_HIGH_ADJACENCY_TEST',										'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',			NULL,								'REQSET_CSC_HIGH_ADJACENCY_QUARTER',					NULL				),
		(	'MOD_CSC_BAKERS_COUNT_TEST',										'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE',			'REQSET_CSC_COUNT_TEST',			NULL,													NULL				);


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

-- 	+1 Production from each adjacent BASE materials improvement
		(  	'MOD_CSC_BAKERS_BASE_IMPROVEMENT_ATTACH_QUARTER',            		'ModifierId',         		'MOD_CSC_BAKERS_BASE_IMPROV_PROD_TO_ADJACENT_FLOUR_MILL'     	),    
        (  	'MOD_CSC_BAKERS_BASE_IMPROV_PROD_TO_ADJACENT_FLOUR_MILL',			'BuildingType',           	'BUILDING_CSC_BAKERS_FLOUR_MILL'								),
        (  	'MOD_CSC_BAKERS_BASE_IMPROV_PROD_TO_ADJACENT_FLOUR_MILL',			'YieldType',           		'YIELD_PRODUCTION'                                              ),
        ( 	'MOD_CSC_BAKERS_BASE_IMPROV_PROD_TO_ADJACENT_FLOUR_MILL',			'Amount',             		1                                                               ),

-- 	+1 Gold to adjacent BASE materials improvements
		(	'MOD_CSC_BAKERS_FLOUR_MILL_GOLD_TO_ADJACENT_BASE_IMPROV',    		'YieldType',	            'YIELD_GOLD'                									),
        (	'MOD_CSC_BAKERS_FLOUR_MILL_GOLD_TO_ADJACENT_BASE_IMPROV',    		'Amount',		            1		                    									),

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
		(	'MOD_CSC_BAKERS_ATTACH_COMMERCIAL_HUB',								'ModifierId',				'MOD_CSC_BAKERS_FOOD_TO_ADJACENT_MARKET'						),
		(	'MOD_CSC_BAKERS_FOOD_TO_ADJACENT_MARKET',							'BuildingType',				'BUILDING_MARKET'												),
		(	'MOD_CSC_BAKERS_FOOD_TO_ADJACENT_MARKET',							'YieldType',				'YIELD_FOOD'													),
		(	'MOD_CSC_BAKERS_FOOD_TO_ADJACENT_MARKET',							'Amount',					1																),

		(	'MOD_CSC_BAKERS_BAKERY_ATTACH_NEIGHBORHOOD',						'ModifierId',				'MOD_CSC_BAKERS_BAKERY_FOOD_TO_ADJACENT_FOOD_MARKET'			),
		(	'MOD_CSC_BAKERS_BAKERY_FOOD_TO_ADJACENT_FOOD_MARKET',				'BuildingType',				'BUILDING_FOOD_MARKET'											),
		(	'MOD_CSC_BAKERS_BAKERY_FOOD_TO_ADJACENT_FOOD_MARKET',				'YieldType',				'YIELD_FOOD'													),
		(	'MOD_CSC_BAKERS_BAKERY_FOOD_TO_ADJACENT_FOOD_MARKET',				'Amount',					1																),

		(	'MOD_CSC_BAKERS_BAKERY_SALES_ATTACH_BAKERS_QUARTER',				'ModifierId',				'MOD_CSC_BAKERS_BAKERY_SALES_GOLD_TO_ADJACENT_BAKERY'			),
		(	'MOD_CSC_BAKERS_BAKERY_SALES_GOLD_TO_ADJACENT_BAKERY',				'BuildingType',				'BUILDING_CSC_BAKERS_BAKERY'									),
		(	'MOD_CSC_BAKERS_BAKERY_SALES_GOLD_TO_ADJACENT_BAKERY',				'YieldType',				'YIELD_GOLD'													),
		(	'MOD_CSC_BAKERS_BAKERY_SALES_GOLD_TO_ADJACENT_BAKERY',				'Amount',					1																),

-- 	+1 Amenity
		(	'MOD_CSC_BAKERS_BAKERY_AMENITY',									'Amount',					1																),

-- 	PATISSERIE --------------------------------------------------------------------------

-- 	+1 Production from each adjacent BASE materials improvement
		(  	'MOD_CSC_BAKERS_SPEC_IMPROVEMENT_ATTACH_QUARTER',            		'ModifierId',         		'MOD_CSC_BAKERS_SPEC_IMPROV_PROD_TO_NEARBY_PATISSERIE'     		),    
        (  	'MOD_CSC_BAKERS_SPEC_IMPROV_PROD_TO_NEARBY_PATISSERIE',       		'BuildingType',           	'BUILDING_CSC_BAKERS_PATISSERIE'								),
        (  	'MOD_CSC_BAKERS_SPEC_IMPROV_PROD_TO_NEARBY_PATISSERIE',       		'YieldType',           		'YIELD_PRODUCTION'                                              ),
        ( 	'MOD_CSC_BAKERS_SPEC_IMPROV_PROD_TO_NEARBY_PATISSERIE',       		'Amount',             		1                                                               ),

-- 	+1 Gold to adjacent BASE materials improvements
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_TO_NEARBY_SPEC_IMPROV',    			'YieldType',	            'YIELD_GOLD'                									),
        (	'MOD_CSC_BAKERS_PATISSERIE_GOLD_TO_NEARBY_SPEC_IMPROV',    			'Amount',		            1		                    									),

--	+1 Food and +1 Gold for every 5 citizens in the city
		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_5',					'BuildingType',				'BUILDING_CSC_BAKERS_PATISSERIE'								),
		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_5',					'YieldType',				'YIELD_FOOD'													),
		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_5',					'Amount',					1																),
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_5',					'BuildingType',				'BUILDING_CSC_BAKERS_PATISSERIE'								),
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_5',					'YieldType',				'YIELD_GOLD'													),
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_5',					'Amount',					1																),

		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_10',					'BuildingType',				'BUILDING_CSC_BAKERS_PATISSERIE'								),
		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_10',					'YieldType',				'YIELD_FOOD'													),
		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_10',					'Amount',					1																),
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_10',					'BuildingType',				'BUILDING_CSC_BAKERS_PATISSERIE'								),
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_10',					'YieldType',				'YIELD_GOLD'													),
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_10',					'Amount',					1																),

		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_15',					'BuildingType',				'BUILDING_CSC_BAKERS_PATISSERIE'								),
		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_15',					'YieldType',				'YIELD_FOOD'													),
		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_15',					'Amount',					1																),
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_15',					'BuildingType',				'BUILDING_CSC_BAKERS_PATISSERIE'								),
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_15',					'YieldType',				'YIELD_GOLD'													),
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_15',					'Amount',					1																),

		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_20',					'BuildingType',				'BUILDING_CSC_BAKERS_PATISSERIE'								),
		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_20',					'YieldType',				'YIELD_FOOD'													),
		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_20',					'Amount',					1																),
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_20',					'BuildingType',				'BUILDING_CSC_BAKERS_PATISSERIE'								),
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_20',					'YieldType',				'YIELD_GOLD'													),
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_20',					'Amount',					1																),

		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_25',					'BuildingType',				'BUILDING_CSC_BAKERS_PATISSERIE'								),
		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_25',					'YieldType',				'YIELD_FOOD'													),
		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_25',					'Amount',					1																),
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_25',					'BuildingType',				'BUILDING_CSC_BAKERS_PATISSERIE'								),
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_25',					'YieldType',				'YIELD_GOLD'													),
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_25',					'Amount',					1																),

		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_30',					'BuildingType',				'BUILDING_CSC_BAKERS_PATISSERIE'								),
		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_30',					'YieldType',				'YIELD_FOOD'													),
		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_30',					'Amount',					1																),
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_30',					'BuildingType',				'BUILDING_CSC_BAKERS_PATISSERIE'								),
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_30',					'YieldType',				'YIELD_GOLD'													),
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_30',					'Amount',					1																),

		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_35',					'BuildingType',				'BUILDING_CSC_BAKERS_PATISSERIE'								),
		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_35',					'YieldType',				'YIELD_FOOD'													),
		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_35',					'Amount',					1																),
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_35',					'BuildingType',				'BUILDING_CSC_BAKERS_PATISSERIE'								),
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_35',					'YieldType',				'YIELD_GOLD'													),
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_35',					'Amount',					1																),

		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_40',					'BuildingType',				'BUILDING_CSC_BAKERS_PATISSERIE'								),
		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_40',					'YieldType',				'YIELD_FOOD'													),
		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_40',					'Amount',					1																),
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_40',					'BuildingType',				'BUILDING_CSC_BAKERS_PATISSERIE'								),
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_40',					'YieldType',				'YIELD_GOLD'													),
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_40',					'Amount',					1																),

		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_45',					'BuildingType',				'BUILDING_CSC_BAKERS_PATISSERIE'								),
		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_45',					'YieldType',				'YIELD_FOOD'													),
		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_45',					'Amount',					1																),
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_45',					'BuildingType',				'BUILDING_CSC_BAKERS_PATISSERIE'								),
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_45',					'YieldType',				'YIELD_GOLD'													),
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_45',					'Amount',					1																),

		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_50',					'BuildingType',				'BUILDING_CSC_BAKERS_PATISSERIE'								),
		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_50',					'YieldType',				'YIELD_FOOD'													),
		(	'MOD_CSC_BAKERS_PATISSERIE_FOOD_AT_POPULATION_50',					'Amount',					1																),
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_50',					'BuildingType',				'BUILDING_CSC_BAKERS_PATISSERIE'								),
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_50',					'YieldType',				'YIELD_GOLD'													),
		(	'MOD_CSC_BAKERS_PATISSERIE_GOLD_AT_POPULATION_50',					'Amount',					1																),

-- 	+1 Food to each adjacent Market, and +1 Gold in return
		(	'MOD_CSC_BAKERS_PATISSERIE_MKT_SALES_ATTACH_BAKERS_QUARTER',		'ModifierId',				'MOD_CSC_BAKERS_PATISSERIE_SALES_GOLD_TO_ADJACENT_PATISSERIE'	),
		(	'MOD_CSC_BAKERS_PATISSERIE_SALES_GOLD_TO_ADJACENT_PATISSERIE',		'BuildingType',				'BUILDING_CSC_BAKERS_PATISSERIE'								),
		(	'MOD_CSC_BAKERS_PATISSERIE_SALES_GOLD_TO_ADJACENT_PATISSERIE',		'YieldType',				'YIELD_GOLD'													),
		(	'MOD_CSC_BAKERS_PATISSERIE_SALES_GOLD_TO_ADJACENT_PATISSERIE',		'Amount',					2																),


-- +1 Housing to each adjacent Neighbourhood with minimum Charming appeal, and +1 Gold in return
		(	'MOD_CSC_BAKERS_PATISSERIE_ATTACH_NEIGHBORHOOD',					'ModifierId',				'MOD_CSC_BAKERS_PATISSERIE_HOUSING_TO_NEIGHBORHOOD'				),
		(	'MOD_CSC_BAKERS_PATISSERIE_HOUSING_TO_NEIGHBORHOOD',				'Amount',					1																),

		(	'MOD_CSC_BAKERS_PATISSERIE_NBH_SALES_ATTACH_BAKERS_QUARTER',		'ModifierId',				'MOD_CSC_BAKERS_PATISSERIE_SALES_GOLD_TO_ADJACENT_PATISSERIE'	),

-- 	SHARED ------------------------------------------------------------------------------

-- 	+1 Food bonus to trade routes to the city, and +1 Gold in return (not working for domestic)
		(	'MOD_CSC_BAKERS_TRADE_ROUTES_FOOD',									'YieldType',				'YIELD_FOOD'													),
		(	'MOD_CSC_BAKERS_TRADE_ROUTES_FOOD',									'Amount',					1																),
		(	'MOD_CSC_BAKERS_TRADE_ROUTES_FOOD',									'Domestic',					1																),

		(	'MOD_CSC_BAKERS_TRADE_ROUTES_GOLD',									'YieldType',				'YIELD_GOLD'													),
		(	'MOD_CSC_BAKERS_TRADE_ROUTES_GOLD',									'Amount',					1																),
		(	'MOD_CSC_BAKERS_TRADE_ROUTES_GOLD',									'Domestic',					1																),

		(	'MOD_CSC_BAKERS_TRADE_ROUTES_GOLD_EXTRA',							'YieldType',				'YIELD_GOLD'													),
		(	'MOD_CSC_BAKERS_TRADE_ROUTES_GOLD_EXTRA',							'Amount',					2																),
		(	'MOD_CSC_BAKERS_TRADE_ROUTES_GOLD_EXTRA',							'Domestic',					1																),

-- 	TESTS -------------------------------------------------------------------------------

		(	'MOD_CSC_HIGH_ADJACENCY_TEST',										'BuildingType',				'BUILDING_CSC_BAKERS_FLOUR_MILL'								),
		(	'MOD_CSC_HIGH_ADJACENCY_TEST',										'YieldType',				'YIELD_FOOD'													),
		(	'MOD_CSC_HIGH_ADJACENCY_TEST',										'Amount',					100																),

		(	'MOD_CSC_BAKERS_COUNT_TEST',										'YieldType',				'YIELD_FOOD'													),
		(	'MOD_CSC_BAKERS_COUNT_TEST',										'Amount',					100																);

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

-- 	+1 Production from each adjacent BASE materials improvement
		(	'REQSET_CSC_BAKERS_PLOT_HAS_BASE',						'REQUIREMENTSET_TEST_ALL'       ),

-- 	+1 Gold to adjacent BASE materials improvements
        (	'REQSET_CSC_BAKERS_PLOT_HAS_BASE_IMPROV_ADJACENT',		'REQUIREMENTSET_TEST_ALL'       ),

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

-- 	+1 Production from each nearby specialty materials improvement
		(	'REQSET_CSC_BAKERS_PLOT_HAS_SPEC',						'REQUIREMENTSET_TEST_ALL'       ),
		(	'REQSET_CSC_NEARBY_BAKERS_QUARTER',						'REQUIREMENTSET_TEST_ALL'		),

-- 	+1 Gold to nearby specialty materials improvements
        (	'REQSET_CSC_BAKERS_PLOT_HAS_SPEC_IMPROV_NEARBY',		'REQUIREMENTSET_TEST_ALL'       ),

--	+1 Food and +1 Gold for every 5 citizens in the city
		(	'REQSET_CSC_CITY_HAS_POPULATION_5',						'REQUIREMENTSET_TEST_ALL'		),
		(	'REQSET_CSC_CITY_HAS_POPULATION_10',					'REQUIREMENTSET_TEST_ALL'		),
		(	'REQSET_CSC_CITY_HAS_POPULATION_15',					'REQUIREMENTSET_TEST_ALL'		),
		(	'REQSET_CSC_CITY_HAS_POPULATION_20',					'REQUIREMENTSET_TEST_ALL'		),
		(	'REQSET_CSC_CITY_HAS_POPULATION_25',					'REQUIREMENTSET_TEST_ALL'		),
		(	'REQSET_CSC_CITY_HAS_POPULATION_30',					'REQUIREMENTSET_TEST_ALL'		),
		(	'REQSET_CSC_CITY_HAS_POPULATION_35',					'REQUIREMENTSET_TEST_ALL'		),
		(	'REQSET_CSC_CITY_HAS_POPULATION_40',					'REQUIREMENTSET_TEST_ALL'		),
		(	'REQSET_CSC_CITY_HAS_POPULATION_45',					'REQUIREMENTSET_TEST_ALL'		),
		(	'REQSET_CSC_CITY_HAS_POPULATION_50',					'REQUIREMENTSET_TEST_ALL'		),

-- +1 Housing to each adjacent Neighbourhood with minimum Charming appeal, and +1 Gold in return
		(	'REQSET_CSC_ADJACENT_NEIGHBORHOOD_MIN_CHARMING',		'REQUIREMENTSET_TEST_ALL'		),
		(	'REQSET_CSC_NEIGHBORHOOD_MIN_CHARMING',					'REQUIREMENTSET_TEST_ALL'		),

-- 	SHARED ------------------------------------------------------------------------------

		(	'REQSET_CSC_DISTRICT_IS_BAKERS',						'REQUIREMENTSET_TEST_ALL'		),
        (  	'REQSET_CSC_ADJACENT_BAKERS_QUARTER',          			'REQUIREMENTSET_TEST_ALL'       ),

-- 	TESTS -------------------------------------------------------------------------------

		(	'REQSET_CSC_HIGH_ADJACENCY_QUARTER',					'REQUIREMENTSET_TEST_ALL'		),

		(	'REQSET_CSC_COUNT_TEST',								'REQUIREMENTSET_TEST_ALL'		),
		(	'REQSET_CSC_COUNT_TEST_INTERNAL_REQSET',				'REQUIREMENTSET_TEST_ALL'		);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	RequirementSetRequirements
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
				
INSERT INTO RequirementSetRequirements
		
        (	RequirementSetId,		                      			RequirementId	                               	)	VALUES

-- 	BAKERS QUARTER ----------------------------------------------------------------------

-- 	+1 Production if built on Hills terrain
		(	'REQSET_CSC_PLOT_IS_HILLS',								'REQ_CSC_PLOT_IS_HILLS'			                ),

-- 	FLOUR MILL --------------------------------------------------------------------------

-- 	+1 Production from each adjacent BASE materials improvement
		(	'REQSET_CSC_BAKERS_PLOT_HAS_BASE',						'REQ_CSC_PLOT_HAS_BAKERS_QUARTER_BASE'			),

-- 	+1 Gold to adjacent BASE materials improvements
        (	'REQSET_CSC_BAKERS_PLOT_HAS_BASE_IMPROV_ADJACENT',		'REQ_CSC_PLOT_HAS_BAKERS_QUARTER_BASE'			),
        (	'REQSET_CSC_BAKERS_PLOT_HAS_BASE_IMPROV_ADJACENT',		'REQ_CSC_PLOT_HAS_ANY_IMPROVEMENT'				),
        (	'REQSET_CSC_BAKERS_PLOT_HAS_BASE_IMPROV_ADJACENT',		'REQ_CSC_PLOT_ADJACENT_TO_OWNER'				),

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

-- 	+1 Production from each nearby specialty materials improvement
		(	'REQSET_CSC_BAKERS_PLOT_HAS_SPEC',						'REQ_CSC_PLOT_HAS_BAKERS_QUARTER_SPEC'			),
        ( 	'REQSET_CSC_NEARBY_BAKERS_QUARTER',						'REQ_CSC_PLOT_NEARBY_OWNER'              		),
        (  	'REQSET_CSC_NEARBY_BAKERS_QUARTER',						'REQ_CSC_DISTRICT_IS_BAKERS_QUARTER'           	),

-- 	+1 Gold to nearby specialty materials improvements
        (	'REQSET_CSC_BAKERS_PLOT_HAS_SPEC_IMPROV_NEARBY',			'REQ_CSC_PLOT_HAS_BAKERS_QUARTER_SPEC'			),
        (	'REQSET_CSC_BAKERS_PLOT_HAS_SPEC_IMPROV_NEARBY',			'REQ_CSC_PLOT_HAS_ANY_IMPROVEMENT'				),
        (	'REQSET_CSC_BAKERS_PLOT_HAS_SPEC_IMPROV_NEARBY',			'REQ_CSC_PLOT_NEARBY_OWNER'						),

--	+1 Food and +1 Gold for every 5 citizens in the city
		(	'REQSET_CSC_CITY_HAS_POPULATION_5',						'REQ_CSC_CITY_HAS_POPULATION_5'					),
		(	'REQSET_CSC_CITY_HAS_POPULATION_10',					'REQ_CSC_CITY_HAS_POPULATION_10'				),
		(	'REQSET_CSC_CITY_HAS_POPULATION_15',					'REQ_CSC_CITY_HAS_POPULATION_15'				),
		(	'REQSET_CSC_CITY_HAS_POPULATION_20',					'REQ_CSC_CITY_HAS_POPULATION_20'				),
		(	'REQSET_CSC_CITY_HAS_POPULATION_25',					'REQ_CSC_CITY_HAS_POPULATION_25'				),
		(	'REQSET_CSC_CITY_HAS_POPULATION_30',					'REQ_CSC_CITY_HAS_POPULATION_30'				),
		(	'REQSET_CSC_CITY_HAS_POPULATION_35',					'REQ_CSC_CITY_HAS_POPULATION_35'				),
		(	'REQSET_CSC_CITY_HAS_POPULATION_40',					'REQ_CSC_CITY_HAS_POPULATION_40'				),
		(	'REQSET_CSC_CITY_HAS_POPULATION_45',					'REQ_CSC_CITY_HAS_POPULATION_45'				),
		(	'REQSET_CSC_CITY_HAS_POPULATION_50',					'REQ_CSC_CITY_HAS_POPULATION_50'				),

-- +1 Housing to each adjacent Neighbourhood with minimum Charming appeal, and +1 Gold in return
		(	'REQSET_CSC_ADJACENT_NEIGHBORHOOD_MIN_CHARMING',		'REQ_CSC_PLOT_ADJACENT_TO_OWNER'				),
		(	'REQSET_CSC_ADJACENT_NEIGHBORHOOD_MIN_CHARMING',		'REQ_CSC_DISTRICT_IS_NEIGHBORHOOD'				),
		(	'REQSET_CSC_ADJACENT_NEIGHBORHOOD_MIN_CHARMING',		'REQ_CSC_TILE_HAS_MIN_CHARMING_APPEAL'			),

		(	'REQSET_CSC_NEIGHBORHOOD_MIN_CHARMING',					'REQ_CSC_DISTRICT_IS_NEIGHBORHOOD'				),
		(	'REQSET_CSC_NEIGHBORHOOD_MIN_CHARMING',					'REQ_CSC_TILE_HAS_MIN_CHARMING_APPEAL'			),

-- 	SHARED ------------------------------------------------------------------------------

		(	'REQSET_CSC_DISTRICT_IS_BAKERS',						'REQ_CSC_DISTRICT_IS_BAKERS_QUARTER'			),

        ( 	'REQSET_CSC_ADJACENT_BAKERS_QUARTER',					'REQ_CSC_PLOT_ADJACENT_TO_OWNER'              	),
        (  	'REQSET_CSC_ADJACENT_BAKERS_QUARTER',					'REQ_CSC_DISTRICT_IS_BAKERS_QUARTER'           	),

-- 	TESTS -------------------------------------------------------------------------------

		(	'REQSET_CSC_HIGH_ADJACENCY_QUARTER',					'REQ_CSC_HIGH_ADJACENCY_QUARTER'				),

		(	'REQSET_CSC_COUNT_TEST',								'REQ_CSC_COUNT_TEST'							),
		(	'REQSET_CSC_COUNT_TEST_INTERNAL_REQSET',				'REQ_CSC_PLOT_ADJACENT_TO_OWNER'				),
		(	'REQSET_CSC_COUNT_TEST_INTERNAL_REQSET',				'REQ_CSC_BAKERS_PLOT_HAS_MATERIAL_BASE'			);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Requirements
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Requirements
        
        (	RequirementId,		                          			RequirementType,	                                Inverse         )	VALUES

-- 	BAKERS QUARTER ----------------------------------------------------------------------

-- 	+1 Production if built on Hills terrain
		(	'REQ_CSC_PLOT_IS_HILLS',								'REQUIREMENT_PLOT_IS_HILLS',                      	0	        	),

-- 	FLOUR MILL --------------------------------------------------------------------------

-- 	+1 Gold to adjacent BASE materials improvements
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

-- +1 Housing to each adjacent Neighbourhood with minimum Charming appeal, and +1 Gold in return
		(	'REQ_CSC_TILE_HAS_MIN_CHARMING_APPEAL',					'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN',				0				),

-- 	PATISSERIE --------------------------------------------------------------------------

--	+1 Food and +1 Gold for every 5 citizens in the city
		(	'REQ_CSC_CITY_HAS_POPULATION_5',						'REQUIREMENT_CITY_HAS_X_POPULATION',				0				),
		(	'REQ_CSC_CITY_HAS_POPULATION_10',						'REQUIREMENT_CITY_HAS_X_POPULATION',				0				),
		(	'REQ_CSC_CITY_HAS_POPULATION_15',						'REQUIREMENT_CITY_HAS_X_POPULATION',				0				),
		(	'REQ_CSC_CITY_HAS_POPULATION_20',						'REQUIREMENT_CITY_HAS_X_POPULATION',				0				),
		(	'REQ_CSC_CITY_HAS_POPULATION_25',						'REQUIREMENT_CITY_HAS_X_POPULATION',				0				),
		(	'REQ_CSC_CITY_HAS_POPULATION_30',						'REQUIREMENT_CITY_HAS_X_POPULATION',				0				),
		(	'REQ_CSC_CITY_HAS_POPULATION_35',						'REQUIREMENT_CITY_HAS_X_POPULATION',				0				),
		(	'REQ_CSC_CITY_HAS_POPULATION_40',						'REQUIREMENT_CITY_HAS_X_POPULATION',				0				),
		(	'REQ_CSC_CITY_HAS_POPULATION_45',						'REQUIREMENT_CITY_HAS_X_POPULATION',				0				),
		(	'REQ_CSC_CITY_HAS_POPULATION_50',						'REQUIREMENT_CITY_HAS_X_POPULATION',				0				),

-- 	SHARED ------------------------------------------------------------------------------

		(	'REQ_CSC_PLOT_HAS_BAKERS_QUARTER_BASE',					'REQUIREMENT_PLOT_RESOURCE_TAG_MATCHES',			0				),
		(	'REQ_CSC_PLOT_HAS_BAKERS_QUARTER_SPEC',					'REQUIREMENT_PLOT_RESOURCE_TAG_MATCHES',			0				),
		(	'REQ_CSC_PLOT_ADJACENT_TO_OWNER',						'REQUIREMENT_PLOT_ADJACENT_TO_OWNER',              	0               ),
        (	'REQ_CSC_PLOT_NEARBY_OWNER',							'REQUIREMENT_PLOT_ADJACENT_TO_OWNER',				0				),
		(   'REQ_CSC_DISTRICT_IS_BAKERS_QUARTER',					'REQUIREMENT_PLOT_DISTRICT_TYPE_MATCHES',          	0               ),

-- 	TESTS -------------------------------------------------------------------------------

		(	'REQ_CSC_HIGH_ADJACENCY_QUARTER',						'REQUIREMENT_CITY_HAS_HIGH_ADJACENCY_DISTRICT',		0				),

		(	'REQ_CSC_COUNT_TEST',									'REQUIREMENT_COLLECTION_COUNT_ATLEAST',				0				);


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

-- 	PATISSERIE --------------------------------------------------------------------------

--	+1 Food and +1 Gold for every 5 citizens in the city
		(	'REQ_CSC_CITY_HAS_POPULATION_5',						'Amount',						5												),
		(	'REQ_CSC_CITY_HAS_POPULATION_10',						'Amount',						10												),
		(	'REQ_CSC_CITY_HAS_POPULATION_15',						'Amount',						15												),
		(	'REQ_CSC_CITY_HAS_POPULATION_20',						'Amount',						20												),
		(	'REQ_CSC_CITY_HAS_POPULATION_25',						'Amount',						25												),
		(	'REQ_CSC_CITY_HAS_POPULATION_30',						'Amount',						30												),
		(	'REQ_CSC_CITY_HAS_POPULATION_35',						'Amount',						35												),
		(	'REQ_CSC_CITY_HAS_POPULATION_40',						'Amount',						40												),
		(	'REQ_CSC_CITY_HAS_POPULATION_45',						'Amount',						45												),
		(	'REQ_CSC_CITY_HAS_POPULATION_50',						'Amount',						50												),

-- +1 Housing to each adjacent Neighbourhood with minimum Charming appeal, and +1 Gold in return
		(	'REQ_CSC_TILE_HAS_MIN_CHARMING_APPEAL',					'MinimumAppeal',				2												),

-- 	SHARED ------------------------------------------------------------------------------

		( 	'REQ_CSC_DISTRICT_IS_BAKERS_QUARTER',					'DistrictType',                 'DISTRICT_CSC_BAKERS_QUARTER'     				),
		(	'REQ_CSC_PLOT_HAS_BAKERS_QUARTER_BASE',					'Tag',							'CLASS_CSC_BAKERS_BASE'							),
		(	'REQ_CSC_PLOT_HAS_BAKERS_QUARTER_SPEC',					'Tag',							'CLASS_CSC_BAKERS_SPEC'							),
		(	'REQ_CSC_PLOT_NEARBY_OWNER',							'MaxDistance',					2												),

-- 	TESTS -------------------------------------------------------------------------------

		(	'REQ_CSC_HIGH_ADJACENCY_QUARTER',						'DistrictType',					'DISTRICT_CSC_BAKERS_QUARTER'					),
		(	'REQ_CSC_HIGH_ADJACENCY_QUARTER',						'YieldType',					'YIELD_PRODUCTION'								),
		(	'REQ_CSC_HIGH_ADJACENCY_QUARTER',						'Amount',						1												),

		(	'REQ_CSC_COUNT_TEST',									'CollectionType',				'COLLECTION_ALL_PLOT_YIELDS'					),
		(	'REQ_CSC_COUNT_TEST',									'Count',						3												),
		(	'REQ_CSC_COUNT_TEST',									'RequirementSetId',				'REQSET_CSC_BAKERS_ADJACENT_PLOT_HAS_MATERIAL_ANY'			);