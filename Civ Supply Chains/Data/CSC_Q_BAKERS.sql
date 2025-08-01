-- CSC_Q_BAKERS
-- Author: Henno
-- DateCreated: 2025-07-13 14:34:41
--------------------------------------------------------------

--===========================================================================================================================================================================--
/*	TYPES */
--===========================================================================================================================================================================--

INSERT OR IGNORE INTO Types

		(	Type,																Kind					)
VALUES	( 	'DISTRICT_CSC_BAKERS_QUARTER',                              		'KIND_DISTRICT'         ),

		(	'BUILDING_CSC_BAKERS_RIVER_ACCESS',									'KIND_BUILDING'			),
		(	'BUILDING_CSC_BAKERS_NO_RIVER_ACCESS',								'KIND_BUILDING'			),
		(	'BUILDING_CSC_BAKERS_WIND_MILL',									'KIND_BUILDING'			),
		(	'BUILDING_CSC_BAKERS_WATER_MILL',									'KIND_BUILDING'			),
		(	'BUILDING_CSC_BAKERS_BAKERY',										'KIND_BUILDING'			),
		(	'BUILDING_CSC_BAKERS_PATISSERIE',									'KIND_BUILDING'			),

		(	'MODIFIER_CSC_PLAYER_IMPROVEMENTS_ATTACH_MODIFIER',					'KIND_MODIFIER'			);



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
--	ImprovementModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	

INSERT INTO ImprovementModifiers

        (	ImprovementType,				ModifierId												)	VALUES

-- 	FLOUR MILL --------------------------------------------------------------------------

--  +1 Production to the Water Mill from improved base materials
		(	'IMPROVEMENT_FARM',				'MOD_CSC_BAKERS_BASE_IMPROVEMENT_ATTACH_QUARTER_WATER'	),
        (	'IMPROVEMENT_PLANTATION',		'MOD_CSC_BAKERS_BASE_IMPROVEMENT_ATTACH_QUARTER_WATER'	),
		(	'IMPROVEMENT_PASTURE',			'MOD_CSC_BAKERS_BASE_IMPROVEMENT_ATTACH_QUARTER_WATER'	),

--  +1 Production to the Wind Mill from improved base materials
		(	'IMPROVEMENT_FARM',				'MOD_CSC_BAKERS_BASE_IMPROVEMENT_ATTACH_QUARTER_WIND'	),
        (	'IMPROVEMENT_PLANTATION',		'MOD_CSC_BAKERS_BASE_IMPROVEMENT_ATTACH_QUARTER_WIND'	),
		(	'IMPROVEMENT_PASTURE',			'MOD_CSC_BAKERS_BASE_IMPROVEMENT_ATTACH_QUARTER_WIND'	);



--===============================================================================================================================================================================--
/*	BAKERS' QUARTER */
--===============================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Districts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO Districts

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
		/*  CostProgressionParam1, */				10,
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
		/*  Maintenance, */							1,
		/*  CityStrengthModifier */					2,
		/*  AdvisorType */							'ADVISOR_GENERIC'
													);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Adjacency_YieldChanges
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT OR IGNORE INTO Adjacency_YieldChanges

		(	ID,											Description,									YieldType,				YieldChange,	AdjacentDistrict						)
VALUES	(	'CSC_CITY_CENTER_GOLD_TO_BAKERS',			'LOC_CSC_CITY_CENTER_GOLD_TO_BAKERS',			'YIELD_GOLD',			1,				'DISTRICT_CITY_CENTER'					),
		(	'CSC_BAKERS_FOOD_TO_CITY_CENTER',			'LOC_CSC_BAKERS_FOOD_TO_CITY_CENTER',			'YIELD_FOOD',			1,				'DISTRICT_CSC_BAKERS_QUARTER'			),

		(	'CSC_COMMERCIAL_HUB_GOLD_TO_BAKERS',		'LOC_CSC_COMMERCIAL_HUB_GOLD_TO_BAKERS',		'YIELD_GOLD',			1,				'DISTRICT_COMMERCIAL_HUB'				),
		(	'CSC_BAKERS_FOOD_TO_COMMERCIAL_HUB',		'LOC_CSC_BAKERS_FOOD_TO_COMMERCIAL_HUB',		'YIELD_FOOD',			1,				'DISTRICT_CSC_BAKERS_QUARTER'			),

		(	'CSC_NEIGHBORHOOD_GOLD_TO_BAKERS',			'LOC_CSC_NEIGHBORHOOD_GOLD_TO_BAKERS',			'YIELD_GOLD',			1,				'DISTRICT_NEIGHBORHOOD'					),
		(	'CSC_BAKERS_FOOD_TO_NEIGHBORHOOD',			'LOC_CSC_BAKERS_FOOD_TO_NEIGHBORHOOD',			'YIELD_FOOD',			1,				'DISTRICT_CSC_BAKERS_QUARTER'			);

--  GOLD adjacency from Commercial Hub replacers
INSERT OR IGNORE INTO Adjacency_YieldChanges
		(	ID,
			Description,
			YieldType,
			YieldChange,
			AdjacentDistrict	)

SELECT		'CSC_' || DistrictType || '_GOLD_TO_BAKERS',
			'{LOC_CSC_REPLACER_GOLD_TO_BAKERS_FRONT} {' || Name || '} {LOC_CSC_REPLACER_GOLD_TO_BAKERS_BACK}',
			'YIELD_GOLD',
			1,
			DistrictType

FROM 		Districts
WHERE 		DistrictType IN (SELECT CivUniqueDistrictType FROM DistrictReplaces WHERE ReplacesDistrictType='DISTRICT_COMMERCIAL_HUB');

--  FOOD adjacency to Commercial Hub replacers
INSERT OR IGNORE INTO Adjacency_YieldChanges
		(	ID,
			Description,
			YieldType,
			YieldChange,
			AdjacentDistrict	)

SELECT		'CSC_BAKERS_FOOD_TO_' || CivUniqueDistrictType,
			'+{1_num} [ICON_Food] Food from the adjacent Bakers'' {1_num : plural 1?Quarter; other?Quarters;}.',
			'YIELD_FOOD',
			1,
			'DISTRICT_CSC_BAKERS_QUARTER'

FROM		DistrictReplaces
WHERE		ReplacesDistrictType IN ('DISTRICT_COMMERCIAL_HUB');

--  GOLD adjacency from Neighborhood replacers
INSERT OR IGNORE INTO Adjacency_YieldChanges
		(	ID,
			Description,
			YieldType,
			YieldChange,
			AdjacentDistrict	)

SELECT		'CSC_' || DistrictType || '_GOLD_TO_BAKERS',
			'{LOC_CSC_REPLACER_GOLD_TO_BAKERS_FRONT} {' || Name || '} {LOC_CSC_REPLACER_GOLD_TO_BAKERS_BACK}',
			'YIELD_GOLD',
			1,
			DistrictType
			
FROM 		Districts
WHERE 		DistrictType IN (SELECT CivUniqueDistrictType FROM DistrictReplaces WHERE ReplacesDistrictType='DISTRICT_NEIGHBORHOOD');

--  FOOD adjacency to Neighborhood replacers
INSERT OR IGNORE INTO Adjacency_YieldChanges
		(	ID,
			Description,
			YieldType,
			YieldChange,
			AdjacentDistrict	)

SELECT		'CSC_BAKERS_FOOD_TO_' || CivUniqueDistrictType,
			'+{1_num} [ICON_Food] Food from the adjacent Bakers'' {1_num : plural 1?Quarter; other?Quarters;}.',
			'YIELD_FOOD',
			1,
			'DISTRICT_CSC_BAKERS_QUARTER'
			
FROM		DistrictReplaces
WHERE		ReplacesDistrictType IN ('DISTRICT_NEIGHBORHOOD');

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	District_Adjacencies
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT OR IGNORE INTO District_Adjacencies

		(	DistrictType,						YieldChangeId							)
VALUES	(	'DISTRICT_CSC_BAKERS_QUARTER',		'CSC_CITY_CENTER_GOLD_TO_BAKERS'		),
		(	'DISTRICT_CITY_CENTER',				'CSC_BAKERS_FOOD_TO_CITY_CENTER'		),

		(	'DISTRICT_CSC_BAKERS_QUARTER',		'CSC_COMMERCIAL_HUB_GOLD_TO_BAKERS'		),
		(	'DISTRICT_COMMERCIAL_HUB',			'CSC_BAKERS_FOOD_TO_COMMERCIAL_HUB'		),

		(	'DISTRICT_CSC_BAKERS_QUARTER',		'CSC_NEIGHBORHOOD_GOLD_TO_BAKERS'		),
		(	'DISTRICT_NEIGHBORHOOD',			'CSC_BAKERS_FOOD_TO_NEIGHBORHOOD'		);

-- Gold adjacency from Commercial Hub replacers
INSERT OR IGNORE INTO District_Adjacencies
		(	DistrictType,						YieldChangeId		)
SELECT		'DISTRICT_CSC_BAKERS_QUARTER',		'CSC_' || CivUniqueDistrictType || '_GOLD_TO_BAKERS'
FROM		DistrictReplaces
WHERE		ReplacesDistrictType IN ('DISTRICT_COMMERCIAL_HUB');

-- Food adjacency to Commercial Hub replacers
INSERT OR IGNORE INTO District_Adjacencies
		(	DistrictType,						YieldChangeId		)
SELECT		CivUniqueDistrictType,				'CSC_BAKERS_FOOD_TO_' || CivUniqueDistrictType
FROM		DistrictReplaces
WHERE		ReplacesDistrictType IN ('DISTRICT_COMMERCIAL_HUB');

-- Gold adjacency from Neighborhood replacers
INSERT OR IGNORE INTO District_Adjacencies
		(	DistrictType,						YieldChangeId		)
SELECT		'DISTRICT_CSC_BAKERS_QUARTER',		'CSC_' || CivUniqueDistrictType || '_GOLD_TO_BAKERS'
FROM		DistrictReplaces
WHERE		ReplacesDistrictType IN ('DISTRICT_NEIGHBORHOOD');

-- Food adjacency to Neighborhood replacers
INSERT OR IGNORE INTO District_Adjacencies
		(	DistrictType,						YieldChangeId		)
SELECT		CivUniqueDistrictType,				'CSC_BAKERS_FOOD_TO_' || CivUniqueDistrictType
FROM		DistrictReplaces
WHERE		ReplacesDistrictType IN ('DISTRICT_NEIGHBORHOOD');

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Ruivo_New_Adjacency
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

--  +1 Production from each adjacent base materials resource from this supply chain	
INSERT OR IGNORE INTO Ruivo_New_Adjacency

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

--  +1 Production from each adjacent specialty materials resource from this supply chain	
INSERT OR IGNORE INTO Ruivo_New_Adjacency

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

--  +1 Production from every 2 adjacent river segments
INSERT OR IGNORE INTO Ruivo_New_Adjacency

    	(	ID,
			DistrictType,
    		ProvideType,
			YieldType,
			YieldChange,
    		AdjacencyType,
			CustomAdjacentObject,
			Rings,
    		DistrictModifiers			)
VALUES	(	
			'CSC_BAKERS_PRODUCTION_FROM_RIVER',
			'DISTRICT_CSC_BAKERS_QUARTER',
			'SelfBonus',
			'YIELD_PRODUCTION',
			0.5,
			'FROM_RIVER_CROSSING',
			'NONE',
			1,
			1							);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	DistrictModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT OR IGNORE INTO DistrictModifiers

        (	DistrictType,		               		ModifierId			                        					)	VALUES  

--  Set flags for river access, used by Water Mill and Wind Mill variants
		(	'DISTRICT_CSC_BAKERS_QUARTER',			'MOD_CSC_BAKERS_RIVER_ACCESS_FLAG'								),
		(	'DISTRICT_CSC_BAKERS_QUARTER',			'MOD_CSC_BAKERS_NO_RIVER_ACCESS_FLAG'							),

-- 	+1 Production if the Quarter is built on Hills terrain
--		(	'DISTRICT_CSC_BAKERS_QUARTER',     		'MOD_CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS'	   					),

--  +1 Gold to each adjacent base or specialty materials resource from this supply chain
		(	'DISTRICT_CSC_BAKERS_QUARTER',			'MOD_CSC_BAKERS_GOLD_TO_ADJ_BASE_MATERIAL'						);




--===========================================================================================================================================================================--
/*	STAGES 2-4 - BUILDINGS */
--===========================================================================================================================================================================--

INSERT OR IGNORE INTO Buildings

		(	BuildingType,
			Name,
			Description,
			PrereqTech,
			PrereqCivic,
			Cost,
			PrereqDistrict,
			PurchaseYield,
			Maintenance,
			CitizenSlots,
			AdvisorType	)
VALUES	(
		/*  BuildingType, */		'BUILDING_CSC_BAKERS_RIVER_ACCESS',
		/*  Name, */				'LOC_BUILDING_CSC_BAKERS_RIVER_ACCESS_NAME',
		/*  Description, */			'LOC_BUILDING_CSC_BAKERS_RIVER_ACCESS_DESCRIPTION',
		/*  PrereqTech, */			NULL,
		/*  PrereqCivic, */			NULL,
		/*  Cost, */				0,
		/*  PrereqDistrict, */		'DISTRICT_CSC_BAKERS_QUARTER',
		/*  PurchaseYield, */		NULL,
		/*  Maintenance, */			0,
		/*	CitizenSlots */			0,
		/*  AdvisorType */			'ADVISOR_GENERIC'
									),
		(
		/*  BuildingType, */		'BUILDING_CSC_BAKERS_NO_RIVER_ACCESS',
		/*  Name, */				'LOC_BUILDING_CSC_BAKERS_NO_RIVER_ACCESS_NAME',
		/*  Description, */			'LOC_BUILDING_CSC_BAKERS_NO_RIVER_ACCESS_DESCRIPTION',
		/*  PrereqTech, */			NULL,
		/*  PrereqCivic, */			NULL,
		/*  Cost, */				0,
		/*  PrereqDistrict, */		'DISTRICT_CSC_BAKERS_QUARTER',
		/*  PurchaseYield, */		NULL,
		/*  Maintenance, */			0,
		/*	CitizenSlots */			0,
		/*  AdvisorType */			'ADVISOR_GENERIC'
									),
		(
		/*  BuildingType, */		'BUILDING_CSC_BAKERS_WIND_MILL',
		/*  Name, */				'LOC_BUILDING_CSC_BAKERS_WIND_MILL_NAME',
		/*  Description, */			'LOC_BUILDING_CSC_BAKERS_WIND_MILL_DESCRIPTION',
		/*  PrereqTech, */			'TECH_THE_WHEEL',
		/*  PrereqCivic, */			NULL,
		/*  Cost, */				80,
		/*  PrereqDistrict, */		'DISTRICT_CSC_BAKERS_QUARTER',
		/*  PurchaseYield, */		'YIELD_GOLD',
		/*  Maintenance, */			1,
		/*	CitizenSlots */			0,
		/*  AdvisorType */			'ADVISOR_GENERIC'
									),
		(
		/*  BuildingType, */		'BUILDING_CSC_BAKERS_WATER_MILL',
		/*  Name, */				'LOC_BUILDING_CSC_BAKERS_WATER_MILL_NAME',
		/*  Description, */			'LOC_BUILDING_CSC_BAKERS_WATER_MILL_DESCRIPTION',
		/*  PrereqTech, */			'TECH_THE_WHEEL',
		/*  PrereqCivic, */			NULL,
		/*  Cost, */				80,
		/*  PrereqDistrict, */		'DISTRICT_CSC_BAKERS_QUARTER',
		/*  PurchaseYield, */		'YIELD_GOLD',
		/*  Maintenance, */			1,
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
		/*  Maintenance, */			2,
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
		/*  Maintenance, */			3,
		/*	CitizenSlots */			1,
		/*  AdvisorType */			'ADVISOR_GENERIC'
									);

UPDATE Buildings SET MustPurchase=1 WHERE BuildingType='BUILDING_CSC_BAKERS_RIVER_ACCESS';
UPDATE Buildings SET MustPurchase=1 WHERE BuildingType='BUILDING_CSC_BAKERS_NO_RIVER_ACCESS';


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Buildings_XP2
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	

INSERT OR IGNORE INTO Buildings_XP2

		(	BuildingType,									Pillage		)
VALUES	(	'BUILDING_CSC_BAKERS_RIVER_ACCESS',				0			),
		(	'BUILDING_CSC_BAKERS_NO_RIVER_ACCESS',			0			);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	BuildingPrereqs
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	

INSERT OR IGNORE INTO BuildingPrereqs

        (	Building,      		        				PrereqBuilding										)
VALUES  --(	'BUILDING_CSC_BAKERS_WIND_MILL',			'BUILDING_CSC_BAKERS_NO_RIVER_ACCESS'				),
		(	'BUILDING_CSC_BAKERS_WATER_MILL',			'BUILDING_CSC_BAKERS_RIVER_ACCESS'					),
		
		(	'BUILDING_CSC_BAKERS_BAKERY',				'BUILDING_CSC_BAKERS_WIND_MILL'						),
		(	'BUILDING_CSC_BAKERS_BAKERY',				'BUILDING_CSC_BAKERS_WATER_MILL'					),

		(	'BUILDING_CSC_BAKERS_PATISSERIE',			'BUILDING_CSC_BAKERS_WIND_MILL'						),
		(	'BUILDING_CSC_BAKERS_PATISSERIE',			'BUILDING_CSC_BAKERS_WATER_MILL'					);		

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	MutuallyExclusiveBuildings
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	

INSERT OR IGNORE INTO MutuallyExclusiveBuildings

        (	Building,      		        				MutuallyExclusiveBuilding							)
VALUES  --(	'BUILDING_CSC_BAKERS_WIND_MILL',			'BUILDING_CSC_BAKERS_RIVER_ACCESS'					),
		(	'BUILDING_CSC_BAKERS_WATER_MILL',			'BUILDING_CSC_BAKERS_NO_RIVER_ACCESS'				),
		(	'BUILDING_CSC_BAKERS_WATER_MILL',			'BUILDING_CSC_BAKERS_WIND_MILL'						),
		(	'BUILDING_CSC_BAKERS_WIND_MILL',			'BUILDING_CSC_BAKERS_WATER_MILL'					);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Building_YieldChanges
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT OR IGNORE INTO Building_YieldChanges

		(	BuildingType,								YieldType,				YieldChange			)
VALUES	(	'BUILDING_CSC_BAKERS_WIND_MILL',			'YIELD_FOOD',			1					),
		(	'BUILDING_CSC_BAKERS_WATER_MILL',			'YIELD_FOOD',			1					),
		(	'BUILDING_CSC_BAKERS_BAKERY',				'YIELD_PRODUCTION',		1					),
		(	'BUILDING_CSC_BAKERS_BAKERY',				'YIELD_FOOD',			2					),
		(	'BUILDING_CSC_BAKERS_PATISSERIE',			'YIELD_PRODUCTION',		1					),
		(	'BUILDING_CSC_BAKERS_PATISSERIE',			'YIELD_FOOD',			3					);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	BuildingModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT INTO BuildingModifiers

        (	BuildingType,		            			ModifierId											)	VALUES

--	WIND / WATER MILL --------------------------------------------------------------------------

--	+1 Gold to adjacent base materials improvements
		(	'BUILDING_CSC_BAKERS_WATER_MILL',			'MOD_CSC_BAKERS_FLOUR_MILL_ATTACH_ADJ_IMP_BASE'		),
		(	'BUILDING_CSC_BAKERS_WIND_MILL',			'MOD_CSC_BAKERS_FLOUR_MILL_ATTACH_ADJ_IMP_BASE'		),

-- 	+1 Food to an adjacent Granary, and +1 Gold in return
		(	'BUILDING_CSC_BAKERS_WATER_MILL',			'MOD_CSC_BAKERS_FLOUR_MILL_ATTACH_CITY_CENTER'		),
		(	'BUILDING_GRANARY',							'MOD_CSC_BAKERS_GRANARY_ATTACH_BAKERS_WATER'		),
		(	'BUILDING_CSC_BAKERS_WIND_MILL',			'MOD_CSC_BAKERS_FLOUR_MILL_ATTACH_CITY_CENTER'		),
		(	'BUILDING_GRANARY',							'MOD_CSC_BAKERS_GRANARY_ATTACH_BAKERS_WIND'			),

--  With Feudalism, a Granary adjacent to a Flour Mill provides +10% growth in the city
		(	'BUILDING_CSC_BAKERS_WATER_MILL',			'MOD_CSC_BAKERS_STAGE_2_EFFECT_ATTACH_CITY_CENTER'	),
		(	'BUILDING_CSC_BAKERS_WIND_MILL',			'MOD_CSC_BAKERS_STAGE_2_EFFECT_ATTACH_CITY_CENTER'	),

--	BAKERY ------------------------------------------------------------------------------

-- 	+1 Gold to the Flour Mill in the Quarter
		(	'BUILDING_CSC_BAKERS_BAKERY',				'MOD_CSC_BAKERS_INTERNAL_GOLD_TO_WATER_MILL'		),
		(	'BUILDING_CSC_BAKERS_BAKERY',				'MOD_CSC_BAKERS_INTERNAL_GOLD_TO_WIND_MILL'			),

--	PATISSERIE --------------------------------------------------------------------------

-- 	+1 Gold to the Flour Mill in the Quarter
		(	'BUILDING_CSC_BAKERS_PATISSERIE',			'MOD_CSC_BAKERS_INTERNAL_GOLD_TO_WATER_MILL'		),
		(	'BUILDING_CSC_BAKERS_PATISSERIE',			'MOD_CSC_BAKERS_INTERNAL_GOLD_TO_WIND_MILL'			),

--	SHARED ------------------------------------------------------------------------------

-- 	+1 Food bonus to trade routes to the city, and +1 Gold in return (not working for domestic)
		(	'BUILDING_CSC_BAKERS_WATER_MILL',			'MOD_CSC_BAKERS_TRADE_ROUTES_FOOD'					),
		(	'BUILDING_CSC_BAKERS_WATER_MILL',			'MOD_CSC_BAKERS_TRADE_ROUTES_GOLD'					),
		(	'BUILDING_CSC_BAKERS_WIND_MILL',			'MOD_CSC_BAKERS_TRADE_ROUTES_FOOD'					),
		(	'BUILDING_CSC_BAKERS_WIND_MILL',			'MOD_CSC_BAKERS_TRADE_ROUTES_GOLD'					);



--===========================================================================================================================================================================--
/*	MODIFIERS */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	DynamicModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO DynamicModifiers 

        ( 	ModifierType,                                                   	CollectionType,                         EffectType	                        			)	VALUES
		(	'MODIFIER_CSC_PLAYER_IMPROVEMENTS_ATTACH_MODIFIER',					'COLLECTION_PLAYER_IMPROVEMENTS',		'EFFECT_ATTACH_MODIFIER'						);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Modifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT OR IGNORE INTO Modifiers

		(	ModifierId,															ModifierType,													OwnerRequirementSetId,				SubjectRequirementSetId,								SubjectStackLimit	)	VALUES	

-- 	BAKERS QUARTER ----------------------------------------------------------------------

-- 	+1 Production if the Quarter is built on Hills terrain
--		(	'MOD_CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS',                    	'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE', 			NULL,                            	'REQSET_CSC_PLOT_IS_HILLS',								NULL				),

--  +1 Gold to each adjacent base or specialty materials resource from this supply chain
		(	'MOD_CSC_BAKERS_GOLD_TO_ADJ_BASE_MATERIAL',							'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',							NULL,								'REQSET_CSC_BAKERS_ADJ_PLOT_HAS_MATERIAL_ANY',			NULL				),

--	FLOUR MILL --------------------------------------------------------------------------

--  Set flags for river access, used by Water Mill and Wind Mill variants
		(	'MOD_CSC_BAKERS_RIVER_ACCESS_FLAG',									'MODIFIER_SINGLE_CITY_GRANT_BUILDING_IN_CITY_IGNORE',			NULL,								'REQSET_CSC_PLOT_ADJ_TO_RIVER',							NULL				),
		(	'MOD_CSC_BAKERS_NO_RIVER_ACCESS_FLAG',								'MODIFIER_SINGLE_CITY_GRANT_BUILDING_IN_CITY_IGNORE',			NULL,								'REQSET_CSC_PLOT_NOT_ADJ_TO_RIVER',						NULL				),

--  +1 Production to the Water Mill from improved base materials
		(  	'MOD_CSC_BAKERS_BASE_IMPROVEMENT_ATTACH_QUARTER_WATER',				'MODIFIER_ALL_DISTRICTS_ATTACH_MODIFIER',     					'REQSET_CSC_BAKERS_PLOT_HAS_BASE', 	'REQSET_CSC_ADJ_BAKERS_QUARTER',						NULL			    ),
        (  	'MOD_CSC_BAKERS_BASE_IMPROV_PROD_TO_ADJ_WATER_MILL',    			'MODIFIER_BUILDING_YIELD_CHANGE',								NULL,                           	NULL,							                        NULL	            ),

--  +1 Production to the Wind Mill from improved base materials
		(  	'MOD_CSC_BAKERS_BASE_IMPROVEMENT_ATTACH_QUARTER_WIND',				'MODIFIER_ALL_DISTRICTS_ATTACH_MODIFIER',     					'REQSET_CSC_BAKERS_PLOT_HAS_BASE', 	'REQSET_CSC_ADJ_BAKERS_QUARTER',						NULL			    ),
        (  	'MOD_CSC_BAKERS_BASE_IMPROV_PROD_TO_ADJ_WIND_MILL',    				'MODIFIER_BUILDING_YIELD_CHANGE',								NULL,                           	NULL,							                        NULL	            ),

-- 	+1 Gold to adjacent base materials improvements
		(	'MOD_CSC_BAKERS_FLOUR_MILL_ATTACH_ADJ_IMP_BASE',					'MODIFIER_CSC_PLAYER_IMPROVEMENTS_ATTACH_MODIFIER',				NULL,								'REQSET_CSC_BAKERS_ADJ_PLOT_HAS_BASE',					NULL				),
		(	'MOD_CSC_BAKERS_FLOUR_MILL_GOLD_TO_ADJ_IMP_BASE',					'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',						NULL,								NULL,													NULL      			),

-- 	+1 Food to an adjacent Granary, and +1 Gold in return
        (  	'MOD_CSC_BAKERS_FLOUR_MILL_ATTACH_CITY_CENTER',						'MODIFIER_ALL_DISTRICTS_ATTACH_MODIFIER',     					NULL, 								'REQSET_CSC_ADJ_CITY_CENTER_GRANARY',					NULL				),
        (  	'MOD_CSC_BAKERS_FLOUR_MILL_FOOD_TO_ADJ_GRANARY',    				'MODIFIER_BUILDING_YIELD_CHANGE',  								NULL,                           	NULL,                                    				NULL				),
        (  	'MOD_CSC_BAKERS_GRANARY_ATTACH_BAKERS_WATER',						'MODIFIER_ALL_DISTRICTS_ATTACH_MODIFIER',     					NULL,								'REQSET_CSC_ADJ_BAKERS_QUARTER',    					NULL				),
		(  	'MOD_CSC_BAKERS_GRANARY_GOLD_TO_ADJ_WATER_MILL',    				'MODIFIER_BUILDING_YIELD_CHANGE',  								NULL,                           	NULL,                                    				NULL				),
        (  	'MOD_CSC_BAKERS_GRANARY_ATTACH_BAKERS_WIND',						'MODIFIER_ALL_DISTRICTS_ATTACH_MODIFIER',     					NULL,								'REQSET_CSC_ADJ_BAKERS_QUARTER',    					NULL				),
		(  	'MOD_CSC_BAKERS_GRANARY_GOLD_TO_ADJ_WIND_MILL',    					'MODIFIER_BUILDING_YIELD_CHANGE',  								NULL,                           	NULL,                                    				NULL				),

--  With Feudalism, a Granary adjacent to a Flour Mill provides +10% growth in the city
		(	'MOD_CSC_BAKERS_STAGE_2_EFFECT_ATTACH_CITY_CENTER',					'MODIFIER_ALL_DISTRICTS_ATTACH_MODIFIER',						'REQSET_CSC_PLAYER_HAS_FEUDALISM',	'REQSET_CSC_ADJ_CITY_CENTER_GRANARY',					NULL				),
		(	'MOD_CSC_BAKERS_STAGE_2_EFFECT_GROWTH',								'MODIFIER_SINGLE_CITY_ADJUST_CITY_GROWTH',						NULL,								NULL,													NULL				),

-- 	SHARED ------------------------------------------------------------------------------

-- 	+1 Gold to the Flour Mill in the Quarter
		(	'MOD_CSC_BAKERS_INTERNAL_GOLD_TO_WATER_MILL',						'MODIFIER_BUILDING_YIELD_CHANGE',								NULL,								NULL,													NULL				),
		(	'MOD_CSC_BAKERS_INTERNAL_GOLD_TO_WIND_MILL',						'MODIFIER_BUILDING_YIELD_CHANGE',								NULL,								NULL,													NULL				),

-- 	+1 Food bonus to trade routes to the city, and +1 Gold in return (not working for domestic)
		(	'MOD_CSC_BAKERS_TRADE_ROUTES_FOOD',									'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_TO_OTHERS',		NULL,								NULL,													NULL				),
		(	'MOD_CSC_BAKERS_TRADE_ROUTES_GOLD',									'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FROM_OTHERS',	NULL,								NULL,													NULL				);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	ModifierArguments
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
INSERT OR IGNORE INTO ModifierArguments
		
        (	ModifierId,			                      							Name,                       Value		                									)	VALUES

-- 	BAKERS QUARTER ----------------------------------------------------------------------

-- 	+1 Production if the Quarter is built on Hills terrain
--		(	'MOD_CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS',                    	'YieldType',	      		'YIELD_PRODUCTION'                                              ),
--        (	'MOD_CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS',                    	'Amount',		        	1		                                                		),

--  +1 Gold to each adjacent base or specialty materials resource from this supply chain
		(	'MOD_CSC_BAKERS_GOLD_TO_ADJ_BASE_MATERIAL',							'YieldType',				'YIELD_GOLD'													),
		(	'MOD_CSC_BAKERS_GOLD_TO_ADJ_BASE_MATERIAL',							'Amount',					1																),

-- 	FLOUR MILL --------------------------------------------------------------------------

--  Set flags for river access, used by Water Mill and Wind Mill variants
		(	'MOD_CSC_BAKERS_RIVER_ACCESS_FLAG',									'BuildingType',				'BUILDING_CSC_BAKERS_RIVER_ACCESS'								),
		(	'MOD_CSC_BAKERS_NO_RIVER_ACCESS_FLAG',								'BuildingType',				'BUILDING_CSC_BAKERS_NO_RIVER_ACCESS'							),

--  +1 Production to the Water Mill from improved base materials
		(  	'MOD_CSC_BAKERS_BASE_IMPROVEMENT_ATTACH_QUARTER_WATER',				'ModifierId',         		'MOD_CSC_BAKERS_BASE_IMPROV_PROD_TO_ADJ_WATER_MILL'     		),    
        (  	'MOD_CSC_BAKERS_BASE_IMPROV_PROD_TO_ADJ_WATER_MILL',				'BuildingType',           	'BUILDING_CSC_BAKERS_WATER_MILL'								),
        (  	'MOD_CSC_BAKERS_BASE_IMPROV_PROD_TO_ADJ_WATER_MILL',				'YieldType',           		'YIELD_PRODUCTION'                                              ),
        ( 	'MOD_CSC_BAKERS_BASE_IMPROV_PROD_TO_ADJ_WATER_MILL',				'Amount',             		1                                                               ),

--  +1 Production to the Wind Mill from improved base materials
		(  	'MOD_CSC_BAKERS_BASE_IMPROVEMENT_ATTACH_QUARTER_WIND',				'ModifierId',         		'MOD_CSC_BAKERS_BASE_IMPROV_PROD_TO_ADJ_WIND_MILL'     			),    
        (  	'MOD_CSC_BAKERS_BASE_IMPROV_PROD_TO_ADJ_WIND_MILL',					'BuildingType',           	'BUILDING_CSC_BAKERS_WIND_MILL'									),
        (  	'MOD_CSC_BAKERS_BASE_IMPROV_PROD_TO_ADJ_WIND_MILL',					'YieldType',           		'YIELD_PRODUCTION'                                              ),
        ( 	'MOD_CSC_BAKERS_BASE_IMPROV_PROD_TO_ADJ_WIND_MILL',					'Amount',             		1                                                               ),

-- 	+1 Gold to adjacent base materials improvements
		(	'MOD_CSC_BAKERS_FLOUR_MILL_ATTACH_ADJ_IMP_BASE',					'ModifierId',				'MOD_CSC_BAKERS_FLOUR_MILL_GOLD_TO_ADJ_IMP_BASE'				),
		(	'MOD_CSC_BAKERS_FLOUR_MILL_GOLD_TO_ADJ_IMP_BASE',    				'YieldType',	            'YIELD_GOLD'                									),
        (	'MOD_CSC_BAKERS_FLOUR_MILL_GOLD_TO_ADJ_IMP_BASE',    				'Amount',		            1		                    									),

-- 	+1 Food to an adjacent Granary, and +1 Gold in return
		(	'MOD_CSC_BAKERS_FLOUR_MILL_ATTACH_CITY_CENTER',						'ModifierId',				'MOD_CSC_BAKERS_FLOUR_MILL_FOOD_TO_ADJ_GRANARY'					),
		(	'MOD_CSC_BAKERS_FLOUR_MILL_FOOD_TO_ADJ_GRANARY',					'BuildingType',				'BUILDING_GRANARY'												),
		(	'MOD_CSC_BAKERS_FLOUR_MILL_FOOD_TO_ADJ_GRANARY',					'YieldType',				'YIELD_FOOD'													),
		(	'MOD_CSC_BAKERS_FLOUR_MILL_FOOD_TO_ADJ_GRANARY',					'Amount',					1																),
		(	'MOD_CSC_BAKERS_GRANARY_ATTACH_BAKERS_WATER',						'ModifierId',				'MOD_CSC_BAKERS_GRANARY_GOLD_TO_ADJ_WATER_MILL'					),
		(	'MOD_CSC_BAKERS_GRANARY_GOLD_TO_ADJ_WATER_MILL',					'BuildingType',				'BUILDING_CSC_BAKERS_WATER_MILL'								),
		(	'MOD_CSC_BAKERS_GRANARY_GOLD_TO_ADJ_WATER_MILL',					'YieldType',				'YIELD_GOLD'													),
		(	'MOD_CSC_BAKERS_GRANARY_GOLD_TO_ADJ_WATER_MILL',					'Amount',					1																),
		(	'MOD_CSC_BAKERS_GRANARY_ATTACH_BAKERS_WIND',						'ModifierId',				'MOD_CSC_BAKERS_GRANARY_GOLD_TO_ADJ_WIND_MILL'					),
		(	'MOD_CSC_BAKERS_GRANARY_GOLD_TO_ADJ_WIND_MILL',						'BuildingType',				'BUILDING_CSC_BAKERS_WIND_MILL'									),
		(	'MOD_CSC_BAKERS_GRANARY_GOLD_TO_ADJ_WIND_MILL',						'YieldType',				'YIELD_GOLD'													),
		(	'MOD_CSC_BAKERS_GRANARY_GOLD_TO_ADJ_WIND_MILL',						'Amount',					1																),

--  With Feudalism, a Granary adjacent to a Flour Mill provides +10% growth in the city
		(	'MOD_CSC_BAKERS_STAGE_2_EFFECT_ATTACH_CITY_CENTER',					'ModifierId',				'MOD_CSC_BAKERS_STAGE_2_EFFECT_GROWTH'							),
		(	'MOD_CSC_BAKERS_STAGE_2_EFFECT_GROWTH',								'Amount',					12																),

-- 	SHARED ------------------------------------------------------------------------------

-- 	+1 Gold to the Flour Mill in the Quarter
		(	'MOD_CSC_BAKERS_INTERNAL_GOLD_TO_WATER_MILL',						'BuildingType',				'BUILDING_CSC_BAKERS_WATER_MILL'								),
		(	'MOD_CSC_BAKERS_INTERNAL_GOLD_TO_WATER_MILL',						'YieldType',				'YIELD_GOLD'													),
		(	'MOD_CSC_BAKERS_INTERNAL_GOLD_TO_WATER_MILL',						'Amount',					1																),
		(	'MOD_CSC_BAKERS_INTERNAL_GOLD_TO_WIND_MILL',						'BuildingType',				'BUILDING_CSC_BAKERS_WIND_MILL'									),
		(	'MOD_CSC_BAKERS_INTERNAL_GOLD_TO_WIND_MILL',						'YieldType',				'YIELD_GOLD'													),
		(	'MOD_CSC_BAKERS_INTERNAL_GOLD_TO_WIND_MILL',						'Amount',					1																),

-- 	+1 Food bonus to trade routes to the city, and +1 Gold in return (not working for domestic)
		(	'MOD_CSC_BAKERS_TRADE_ROUTES_FOOD',									'YieldType',				'YIELD_FOOD'													),
		(	'MOD_CSC_BAKERS_TRADE_ROUTES_FOOD',									'Amount',					1																),
		(	'MOD_CSC_BAKERS_TRADE_ROUTES_FOOD',									'Domestic',					1																),

		(	'MOD_CSC_BAKERS_TRADE_ROUTES_GOLD',									'YieldType',				'YIELD_GOLD'													),
		(	'MOD_CSC_BAKERS_TRADE_ROUTES_GOLD',									'Amount',					1																),
		(	'MOD_CSC_BAKERS_TRADE_ROUTES_GOLD',									'Domestic',					1																);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	ModifierStrings
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO ModifierStrings

		(	ModifierId,										Context,						Text													)
VALUES	(	'MOD_CSC_BAKERS_STAGE_2_EFFECT_GROWTH',			'Suk_MCUIS',					'LOC_MOD_CSC_BAKERS_STAGE_2_EFFECT_GROWTH'				),
		(	'MOD_CSC_BAKERS_STAGE_2_EFFECT_GROWTH',			'Suk_MCUIS_Icon',				'ICON_CIVILIZATION_MAYA'								),
		(	'MOD_CSC_BAKERS_STAGE_2_EFFECT_GROWTH',			'Suk_MCUIS_SortOrder',			0														),
		(	'MOD_CSC_BAKERS_STAGE_2_EFFECT_GROWTH',			'Suk_MCUIS_Advanced',			0														);



--===========================================================================================================================================================================--
/*	REQUIREMENTS */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	RequirementSets
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
INSERT OR IGNORE INTO RequirementSets 
		
        (	RequirementSetId,                              			RequirementSetType              )	VALUES

-- 	BAKERS QUARTER ----------------------------------------------------------------------

-- 	+1 Production if the Quarter is built on Hills terrain		
--		(	'REQSET_CSC_PLOT_IS_HILLS',	                  			'REQUIREMENTSET_TEST_ALL'       ),

--  +1 Gold to each adjacent base or specialty materials resource from this supply chain
		(	'REQSET_CSC_BAKERS_ADJ_PLOT_HAS_MATERIAL_ANY',			'REQUIREMENTSET_TEST_ALL'		),
		(	'REQSET_CSC_BAKERS_PLOT_HAS_MATERIAL_ANY',				'REQUIREMENTSET_TEST_ANY'		),

-- 	FLOUR MILL --------------------------------------------------------------------------

--  Set flags for river access, used by Water Mill and Wind Mill variants
		(	'REQSET_CSC_PLOT_ADJ_TO_RIVER',							'REQUIREMENTSET_TEST_ALL'		),
		(	'REQSET_CSC_PLOT_NOT_ADJ_TO_RIVER',						'REQUIREMENTSET_TEST_ALL'		),

-- 	+1 Production from each adjacent base materials improvement
		(	'REQSET_CSC_BAKERS_PLOT_HAS_BASE',						'REQUIREMENTSET_TEST_ALL'       ),

-- 	+1 Gold to adjacent base materials improvements
        (	'REQSET_CSC_BAKERS_ADJ_PLOT_HAS_BASE',					'REQUIREMENTSET_TEST_ALL'       ),

-- 	+1 Food to an adjacent Granary, and +1 Gold in return
		(	'REQSET_CSC_ADJ_CITY_CENTER_GRANARY',					'REQUIREMENTSET_TEST_ALL'		),

--  With Feudalism, a Granary adjacent to a Flour Mill provides +10% growth in the city
		(	'REQSET_CSC_PLAYER_HAS_FEUDALISM',						'REQUIREMENTSET_TEST_ALL'		),

-- 	SHARED ------------------------------------------------------------------------------

        (  	'REQSET_CSC_ADJ_BAKERS_QUARTER',          				'REQUIREMENTSET_TEST_ALL'       );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	RequirementSetRequirements
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
				
INSERT OR IGNORE INTO RequirementSetRequirements
		
        (	RequirementSetId,		                      			RequirementId	                               	)	VALUES

-- 	BAKERS QUARTER ----------------------------------------------------------------------

-- 	+1 Production if the Quarter is built on Hills terrain
--		(	'REQSET_CSC_PLOT_IS_HILLS',								'REQ_CSC_PLOT_IS_HILLS'			                ),

-- 	FLOUR MILL --------------------------------------------------------------------------

--  Set flags for river access, used by Water Mill and Wind Mill variants
		(	'REQSET_CSC_PLOT_ADJ_TO_RIVER',							'REQ_CSC_PLOT_ADJ_TO_RIVER'						),
		(	'REQSET_CSC_PLOT_NOT_ADJ_TO_RIVER',						'REQ_CSC_PLOT_NOT_ADJ_TO_RIVER'					),

-- 	+1 Production from each adjacent base materials improvement
		(	'REQSET_CSC_BAKERS_PLOT_HAS_BASE',						'REQ_CSC_BAKERS_PLOT_HAS_MATERIAL_BASE'			),

-- 	+1 Gold to adjacent base materials improvements
        (	'REQSET_CSC_BAKERS_ADJ_PLOT_HAS_BASE',					'REQ_CSC_PLOT_ADJ_TO_OWNER'						),
        (	'REQSET_CSC_BAKERS_ADJ_PLOT_HAS_BASE',					'REQ_CSC_BAKERS_PLOT_HAS_MATERIAL_BASE'			),

-- 	+1 Food to an adjacent Granary, and +1 Gold in return
		( 	'REQSET_CSC_ADJ_CITY_CENTER_GRANARY',					'REQ_CSC_PLOT_ADJ_TO_OWNER'              		),
        (  	'REQSET_CSC_ADJ_CITY_CENTER_GRANARY',					'REQ_CSC_DISTRICT_IS_CITY_CENTER'           	),
		(	'REQSET_CSC_ADJ_CITY_CENTER_GRANARY',					'REQ_CSC_CITY_HAS_GRANARY'						),

--  With Feudalism, a Granary adjacent to a Flour Mill provides +10% growth in the city
		(	'REQSET_CSC_PLAYER_HAS_FEUDALISM',						'REQ_CSC_PLAYER_HAS_FEUDALISM'					),
--		(	'REQSET_CSC_FEUDALISM_ADJ_MILL',						'REQ_CSC_ADJ_MILL'								),
--		(	'REQSET_CSC_ADJ_MILL',									'REQ_CSC_ADJ_WATER_MILL'						),
--		(	'REQSET_CSC_ADJ_MILL',									'REQ_CSC_ADJ_WIND_MILL'							),

-- 	SHARED ------------------------------------------------------------------------------

		(	'REQSET_CSC_BAKERS_ADJ_PLOT_HAS_MATERIAL_ANY',			'REQ_CSC_PLOT_ADJ_TO_OWNER'						),
		(	'REQSET_CSC_BAKERS_ADJ_PLOT_HAS_MATERIAL_ANY',			'REQ_CSC_BAKERS_PLOT_HAS_MATERIAL_ANY'			),
		(	'REQSET_CSC_BAKERS_PLOT_HAS_MATERIAL_ANY',				'REQ_CSC_BAKERS_PLOT_HAS_MATERIAL_BASE'			),
		(	'REQSET_CSC_BAKERS_PLOT_HAS_MATERIAL_ANY',				'REQ_CSC_BAKERS_PLOT_HAS_MATERIAL_SPEC'			),
        ( 	'REQSET_CSC_ADJ_BAKERS_QUARTER',						'REQ_CSC_PLOT_ADJ_TO_OWNER'              		),
        (  	'REQSET_CSC_ADJ_BAKERS_QUARTER',						'REQ_CSC_DISTRICT_IS_BAKERS_QUARTER'           	);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Requirements
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO Requirements
        
        (	RequirementId,		                          			RequirementType,	                                Inverse         )	VALUES

-- 	BAKERS QUARTER ----------------------------------------------------------------------

-- 	+1 Production if the Quarter is built on Hills terrain
--		(	'REQ_CSC_PLOT_IS_HILLS',								'REQUIREMENT_PLOT_IS_HILLS',                      	0	        	),

-- 	FLOUR MILL --------------------------------------------------------------------------

--  Set flags for river access, used by Water Mill and Wind Mill variants
		(	'REQ_CSC_PLOT_ADJ_TO_RIVER',							'REQUIREMENT_PLOT_ADJACENT_TO_RIVER',				0				),
		(	'REQ_CSC_PLOT_NOT_ADJ_TO_RIVER',						'REQUIREMENT_PLOT_ADJACENT_TO_RIVER',				1				),

-- 	+1 Gold to adjacent base materials improvements
        (	'REQ_CSC_PLOT_HAS_ANY_IMPROVEMENT',            			'REQUIREMENT_PLOT_HAS_ANY_IMPROVEMENT',           	0               ),

-- 	+1 Food to an adjacent Granary, and +1 Gold in return
		(	'REQ_CSC_DISTRICT_IS_CITY_CENTER',						'REQUIREMENT_PLOT_DISTRICT_TYPE_MATCHES',			0				),
		(	'REQ_CSC_CITY_HAS_GRANARY',								'REQUIREMENT_CITY_HAS_BUILDING',					0				),

--  With Feudalism, a Granary adjacent to a Flour Mill provides +10% growth in the city
		(	'REQ_CSC_PLAYER_HAS_FEUDALISM',							'REQUIREMENT_PLAYER_HAS_CIVIC',						0				),
--		(	'REQ_CSC_ADJ_MILL',										'REQUIREMENT_REQUIREMENTSET_IS_MET',				0				),
--		(	'REQ_CSC_ADJ_WATER_MILL',								'REQUIREMENT_PLOT_ADJACENT_BUILDING_TYPE_MATCHES',	0				),
--		(	'REQ_CSC_ADJ_WIND_MILL',								'REQUIREMENT_PLOT_ADJACENT_BUILDING_TYPE_MATCHES',	0				),

-- 	SHARED ------------------------------------------------------------------------------

		(	'REQ_CSC_PLOT_ADJ_TO_OWNER',							'REQUIREMENT_PLOT_ADJACENT_TO_OWNER',              	0               ),
		(	'REQ_CSC_BAKERS_PLOT_HAS_MATERIAL_ANY',					'REQUIREMENT_REQUIREMENTSET_IS_MET',				0				),
		(	'REQ_CSC_BAKERS_PLOT_HAS_MATERIAL_BASE',				'REQUIREMENT_PLOT_RESOURCE_TAG_MATCHES',			0				),
		(	'REQ_CSC_BAKERS_PLOT_HAS_MATERIAL_SPEC',				'REQUIREMENT_PLOT_RESOURCE_TAG_MATCHES',			0				),
		(	'REQ_CSC_PLOT_HAS_ANY_IMPROVEMENT',            			'REQUIREMENT_PLOT_HAS_ANY_IMPROVEMENT',           	0               ),
		(   'REQ_CSC_DISTRICT_IS_BAKERS_QUARTER',					'REQUIREMENT_PLOT_DISTRICT_TYPE_MATCHES',          	0               );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	RequirementArguments
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO RequirementArguments 

        (	RequirementId,				               				Name,                           Value		                    				)	VALUES

-- 	FLOUR MILL --------------------------------------------------------------------------

-- 	+1 Food to an adjacent Granary, and +1 Gold in return
		(	'REQ_CSC_DISTRICT_IS_CITY_CENTER',						'DistrictType',					'DISTRICT_CITY_CENTER'							),
		(	'REQ_CSC_CITY_HAS_GRANARY',								'BuildingType',					'BUILDING_GRANARY'								),
		(	'REQ_CSC_CITY_HAS_GRANARY',								'MustBeFunctioning',			1												),

--  With Feudalism, a Granary adjacent to a Flour Mill provides +10% growth in the city
		(	'REQ_CSC_PLAYER_HAS_FEUDALISM',							'CivicType',					'CIVIC_FEUDALISM'								),
--		(	'REQ_CSC_ADJ_MILL',										'RequirementSetId',				'REQSET_CSC_ADJ_MILL'							),
--		(	'REQ_CSC_ADJ_WATER_MILL',								'BuildingType',					'BUILDING_CSC_BAKERS_WATER_MILL'				),
--		(	'REQ_CSC_ADJ_WIND_MILL',								'BuildingType',					'BUILDING_CSC_BAKERS_WIND_MILL'					),

-- 	SHARED ------------------------------------------------------------------------------

		(	'REQ_CSC_BAKERS_PLOT_HAS_MATERIAL_ANY',					'RequirementSetId',				'REQSET_CSC_BAKERS_PLOT_HAS_MATERIAL_ANY'		),
		(	'REQ_CSC_BAKERS_PLOT_HAS_MATERIAL_BASE',				'Tag',							'CLASS_CSC_BAKERS_BASE'							),
		(	'REQ_CSC_BAKERS_PLOT_HAS_MATERIAL_SPEC',				'Tag',							'CLASS_CSC_BAKERS_SPEC'							),
		( 	'REQ_CSC_DISTRICT_IS_BAKERS_QUARTER',					'DistrictType',                 'DISTRICT_CSC_BAKERS_QUARTER'     				);



--===========================================================================================================================================================================--
/*	WATER MILL & PALGUM */
--===========================================================================================================================================================================--

-- Remove the standard game Water Mill
DELETE FROM Buildings WHERE BuildingType='BUILDING_WATER_MILL';

-- Palgum no longer replaces the Water Mill
DELETE FROM BuildingReplaces WHERE CivUniqueBuildingType='BUILDING_PALGUM';