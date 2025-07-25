-- CSC_Q_BAKERS
-- Author: Henno
-- DateCreated: 2025-07-13 14:34:41
--------------------------------------------------------------

--===========================================================================================================================================================================--
/*	TYPES */
--===========================================================================================================================================================================--

INSERT INTO Types

		(	Type,																Kind					)
VALUES	( 	'DISTRICT_CSC_BAKERS_QUARTER',                              		'KIND_DISTRICT'         ),

		(	'BUILDING_CSC_BAKERS_FLOUR_MILL',									'KIND_BUILDING'			),
		(	'BUILDING_CSC_BAKERS_BAKERY',										'KIND_BUILDING'			),
		(	'BUILDING_CSC_BAKERS_PATISSERIE',									'KIND_BUILDING'			);



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
		/*  Maintenance, */							0,
		/*  CityStrengthModifier */					2,
		/*  AdvisorType */							'ADVISOR_GENERIC'
													);

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

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	DistrictModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT INTO DistrictModifiers

        (	DistrictType,		               		ModifierId			                        					)	VALUES  

-- 	+1 Production if the Quarter is built on Hills terrain
		(	'DISTRICT_CSC_BAKERS_QUARTER',     		'MOD_CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS'	   					),

		(	'DISTRICT_CSC_BAKERS_QUARTER',			'MOD_CSC_BAKERS_GOLD_TO_ADJACENT_BASE_MATERIAL'					);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Adjacency_YieldChanges
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT INTO Adjacency_YieldChanges

		(	ID,											Description,									YieldType,				YieldChange,	AdjacentFeature,	AdjacentImprovement,	AdjacentDistrict,						AdjacentResourceClass,		PrereqTech			)
VALUES	(	'CSC_CITY_CENTER_GOLD_TO_BAKERS',			'LOC_CSC_CITY_CENTER_GOLD_TO_BAKERS',			'YIELD_GOLD',			1,				NULL,				NULL,					'DISTRICT_CITY_CENTER',					'NO_RESOURCECLASS',			NULL				),
		(	'CSC_BAKERS_FOOD_TO_CITY_CENTER',			'LOC_CSC_BAKERS_FOOD_TO_CITY_CENTER',			'YIELD_FOOD',			1,				NULL,				NULL,					'DISTRICT_CSC_BAKERS_QUARTER',			'NO_RESOURCECLASS',			NULL				),

		(	'CSC_COMMERCIAL_HUB_GOLD_TO_BAKERS',		'LOC_CSC_COMMERCIAL_HUB_GOLD_TO_BAKERS',		'YIELD_GOLD',			1,				NULL,				NULL,					'DISTRICT_COMMERCIAL_HUB',				'NO_RESOURCECLASS',			NULL				),
		(	'CSC_BAKERS_FOOD_TO_COMMERCIAL_HUB',		'LOC_CSC_BAKERS_FOOD_TO_COMMERCIAL_HUB',		'YIELD_FOOD',			1,				NULL,				NULL,					'DISTRICT_CSC_BAKERS_QUARTER',			'NO_RESOURCECLASS',			NULL				),

		(	'CSC_NEIGHBORHOOD_GOLD_TO_BAKERS',			'LOC_CSC_NEIGHBORHOOD_GOLD_TO_BAKERS',			'YIELD_GOLD',			1,				NULL,				NULL,					'DISTRICT_NEIGHBORHOOD',				'NO_RESOURCECLASS',			NULL				),
		(	'CSC_BAKERS_FOOD_TO_NEIGHBORHOOD',			'LOC_CSC_BAKERS_FOOD_TO_NEIGHBORHOOD',			'YIELD_FOOD',			1,				NULL,				NULL,					'DISTRICT_CSC_BAKERS_QUARTER',			'NO_RESOURCECLASS',			NULL				);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	District_Adjacencies
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT INTO District_Adjacencies

		(	DistrictType,						YieldChangeId							)
VALUES	(	'DISTRICT_CSC_BAKERS_QUARTER',		'CSC_CITY_CENTER_GOLD_TO_BAKERS'		),
		(	'DISTRICT_CITY_CENTER',				'CSC_BAKERS_FOOD_TO_CITY_CENTER'		),

		(	'DISTRICT_CSC_BAKERS_QUARTER',		'CSC_COMMERCIAL_HUB_GOLD_TO_BAKERS'		),
		(	'DISTRICT_COMMERCIAL_HUB',			'CSC_BAKERS_FOOD_TO_COMMERCIAL_HUB'		),

		(	'DISTRICT_CSC_BAKERS_QUARTER',		'CSC_NEIGHBORHOOD_GOLD_TO_BAKERS'		),
		(	'DISTRICT_NEIGHBORHOOD',			'CSC_BAKERS_FOOD_TO_NEIGHBORHOOD'		);



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
			Maintenance,
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

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	BuildingPrereqs
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	

INSERT INTO BuildingPrereqs

        (	Building,      		        				PrereqBuilding												)
VALUES  (	'BUILDING_CSC_BAKERS_BAKERY',				'BUILDING_CSC_BAKERS_FLOUR_MILL'							),
		(	'BUILDING_CSC_BAKERS_PATISSERIE',			'BUILDING_CSC_BAKERS_FLOUR_MILL'							);		

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Building_YieldChanges
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT INTO Building_YieldChanges

		(	BuildingType,								YieldType,								YieldChange			)
VALUES	(	'BUILDING_CSC_BAKERS_FLOUR_MILL',			'YIELD_FOOD',							1					),
		(	'BUILDING_CSC_BAKERS_BAKERY',				'YIELD_FOOD',							2					),
		(	'BUILDING_CSC_BAKERS_PATISSERIE',			'YIELD_FOOD',							3					);

--===========================================================================================================================================================================--
/*	MODIFIERS */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Modifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT INTO Modifiers

		(	ModifierId,															ModifierType,													OwnerRequirementSetId,				SubjectRequirementSetId,								SubjectStackLimit	)	VALUES	

-- 	BAKERS QUARTER ----------------------------------------------------------------------

-- 	+1 Production if the Quarter is built on Hills terrain
		(	'MOD_CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS',                    	'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE', 			NULL,                            	'REQSET_CSC_PLOT_IS_HILLS',								NULL				),

		(	'MOD_CSC_BAKERS_GOLD_TO_ADJACENT_BASE_MATERIAL',					'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',							NULL,								'REQSET_CSC_BAKERS_ADJACENT_PLOT_HAS_MATERIAL_ANY',		NULL				);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	ModifierArguments
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
INSERT INTO ModifierArguments
		
        (	ModifierId,			                      							Name,                       Value		                									)	VALUES

-- 	BAKERS QUARTER ----------------------------------------------------------------------

-- 	+1 Production if the Quarter is built on Hills terrain
		(	'MOD_CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS',                    	'YieldType',	      		'YIELD_PRODUCTION'                                              ),
        (	'MOD_CSC_BAKERS_QUARTER_PLOT_TERRAIN_BONUS',                    	'Amount',		        	1		                                                		),

		(	'MOD_CSC_BAKERS_GOLD_TO_ADJACENT_BASE_MATERIAL',					'YieldType',				'YIELD_GOLD'													),
		(	'MOD_CSC_BAKERS_GOLD_TO_ADJACENT_BASE_MATERIAL',					'Amount',					1																);

--===========================================================================================================================================================================--
/*	REQUIREMENTS */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	RequirementSets
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
INSERT INTO RequirementSets 
		
        (	RequirementSetId,                              			RequirementSetType              )	VALUES

-- 	BAKERS QUARTER ----------------------------------------------------------------------

-- 	+1 Production if the Quarter is built on Hills terrain		
		(	'REQSET_CSC_PLOT_IS_HILLS',	                  			'REQUIREMENTSET_TEST_ALL'       ),

		(	'REQSET_CSC_BAKERS_ADJACENT_PLOT_HAS_MATERIAL_ANY',		'REQUIREMENTSET_TEST_ALL'		),
		(	'REQSET_CSC_BAKERS_PLOT_HAS_MATERIAL_ANY',				'REQUIREMENTSET_TEST_ANY'		);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	RequirementSetRequirements
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
				
INSERT INTO RequirementSetRequirements
		
        (	RequirementSetId,		                      			RequirementId	                               	)	VALUES

-- 	BAKERS QUARTER ----------------------------------------------------------------------

-- 	+1 Production if the Quarter is built on Hills terrain
		(	'REQSET_CSC_PLOT_IS_HILLS',								'REQ_CSC_PLOT_IS_HILLS'			                ),

		(	'REQSET_CSC_BAKERS_ADJACENT_PLOT_HAS_MATERIAL_ANY',		'REQ_CSC_PLOT_ADJACENT_TO_OWNER'				),
		(	'REQSET_CSC_BAKERS_ADJACENT_PLOT_HAS_MATERIAL_ANY',		'REQ_CSC_BAKERS_PLOT_HAS_MATERIAL_ANY'			),
		(	'REQSET_CSC_BAKERS_PLOT_HAS_MATERIAL_ANY',				'REQ_CSC_BAKERS_PLOT_HAS_MATERIAL_BASE'			),
		(	'REQSET_CSC_BAKERS_PLOT_HAS_MATERIAL_ANY',				'REQ_CSC_BAKERS_PLOT_HAS_MATERIAL_SPEC'			);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Requirements
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Requirements
        
        (	RequirementId,		                          			RequirementType,	                                Inverse         )	VALUES

-- 	BAKERS QUARTER ----------------------------------------------------------------------

-- 	+1 Production if the Quarter is built on Hills terrain
		(	'REQ_CSC_PLOT_IS_HILLS',								'REQUIREMENT_PLOT_IS_HILLS',                      	0	        	),

		(	'REQ_CSC_PLOT_ADJACENT_TO_OWNER',						'REQUIREMENT_PLOT_ADJACENT_TO_OWNER',              	0               ),
		(	'REQ_CSC_BAKERS_PLOT_HAS_MATERIAL_ANY',					'REQUIREMENT_REQUIREMENTSET_IS_MET',				0				),
		(	'REQ_CSC_BAKERS_PLOT_HAS_MATERIAL_BASE',				'REQUIREMENT_PLOT_RESOURCE_TAG_MATCHES',			0				),
		(	'REQ_CSC_BAKERS_PLOT_HAS_MATERIAL_SPEC',				'REQUIREMENT_PLOT_RESOURCE_TAG_MATCHES',			0				);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	RequirementArguments
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO RequirementArguments 

        (	RequirementId,				               				Name,                           Value		                    				)	VALUES

		(	'REQ_CSC_BAKERS_PLOT_HAS_MATERIAL_ANY',					'RequirementSetId',				'REQSET_CSC_BAKERS_PLOT_HAS_MATERIAL_ANY'		),
		(	'REQ_CSC_BAKERS_PLOT_HAS_MATERIAL_BASE',				'Tag',							'CLASS_CSC_BAKERS_BASE'							),
		(	'REQ_CSC_BAKERS_PLOT_HAS_MATERIAL_SPEC',				'Tag',							'CLASS_CSC_BAKERS_SPEC'							);