-- CSC_APOTHECARIES
-- Author: Henno
-- DateCreated: 2025-06-20 13:18:43
--------------------------------------------------------------

--===========================================================================================================================================================================--
/*	TYPES */
--===========================================================================================================================================================================--

INSERT INTO Types

		(	Type,																Kind					)
VALUES	( 	'DISTRICT_CSC_APOTHECARIES_QUARTER',                                'KIND_DISTRICT'         );



--===========================================================================================================================================================================--
/*	RESOURCES */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Tags
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO Tags

	(       Tag,                                    Vocabulary              )
VALUES	(	'CLASS_CSC_APOTHECARIES_BASE',          'RESOURCE_CLASS'	    ),
        (	'CLASS_CSC_APOTHECARIES_SPEC',          'RESOURCE_CLASS'	    );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	TypeTags
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Apothecaries' Quarter base materials
INSERT OR IGNORE INTO TypeTags

    (	Type,                           Tag			        )
SELECT	ResourceType,			        'CLASS_CSC_APOTHECARIES_BASE'
FROM	Resources
WHERE	ResourceType 			        IN
    (	'RESOURCE_COCOA',
        'RESOURCE_COFFEE',
        'RESOURCE_INCENSE',
        'RESOURCE_OLIVES',
        'RESOURCE_SPICES',
        'RESOURCE_TEA',
        'RESOURCE_TOBACCO'              );

-- ' Quarter specialty materials
INSERT OR IGNORE INTO TypeTags

    (	Type,                           Tag			        )
SELECT	ResourceType,			        'CLASS_CSC_APOTHECARIES_SPEC'
FROM    Resources
WHERE	ResourceType 			        IN
    (	'RESOURCE_COPPER',
        'RESOURCE_IRON',
        'RESOURCE_MERCURY',
        'RESOURCE_SILVER'               );



--===============================================================================================================================================================================--
/*	APOTHECARIES' QUARTER */
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
		/*  DistrictType, */						'DISTRICT_CSC_APOTHECARIES_QUARTER',
		/*  Name, */								'LOC_DISTRICT_CSC_APOTHECARIES_QUARTER_NAME',
		/*  Description, */							'LOC_DISTRICT_CSC_APOTHECARIES_QUARTER_DESCRIPTION',
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
--	Adjacency_YieldChanges
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT INTO Adjacency_YieldChanges

		(	ID,											    Description,									    YieldType,				YieldChange,	AdjacentFeature,	AdjacentImprovement,	AdjacentDistrict,						AdjacentResourceClass,		PrereqTech			)
VALUES	(	'CSC_COMMERCIAL_HUB_GOLD_TO_APOTHECARIES',		'LOC_CSC_COMMERCIAL_HUB_GOLD_TO_APOTHECARIES',		'YIELD_GOLD',			1,				NULL,				NULL,					'DISTRICT_COMMERCIAL_HUB',				'NO_RESOURCECLASS',			NULL				),
		(	'CSC_APOTHECARIES_SCIENCE_TO_COMMERCIAL_HUB',	'LOC_CSC_APOTHECARIES_SCIENCE_TO_COMMERCIAL_HUB',	'YIELD_SCIENCE',		1,				NULL,				NULL,					'DISTRICT_CSC_APOTHECARIES_QUARTER',    'NO_RESOURCECLASS',			NULL				);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	District_Adjacencies
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT INTO District_Adjacencies

		(	DistrictType,						        YieldChangeId		)
VALUES	(	'DISTRICT_CSC_APOTHECARIES_QUARTER',		'CSC_COMMERCIAL_HUB_GOLD_TO_APOTHECARIES'		    ),
		(	'DISTRICT_COMMERCIAL_HUB',			        'CSC_APOTHECARIES_SCIENCE_TO_COMMERCIAL_HUB'		);

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
			'CSC_APOTHECARIES_PRODUCTION_FROM_BASE_' || Type,
			'DISTRICT_CSC_APOTHECARIES_QUARTER',
			'SelfBonus',
			'YIELD_PRODUCTION',
			1,
			'FROM_RINGS_CAO_RESOURCE',
			Type,
			1,
			1
FROM	TypeTags
WHERE 	Tag='CLASS_CSC_APOTHECARIES_BASE' AND Type LIKE 'RESOURCE_%';

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
			'CSC_APOTHECARIES_PRODUCTION_FROM_BASE_' || Type,
			'DISTRICT_CSC_APOTHECARIES_QUARTER',
			'SelfBonus',
			'YIELD_PRODUCTION',
			1,
			'FROM_RINGS_CAO_FEATURE',
			Type,
			1,
			1
FROM	TypeTags
WHERE 	Tag='CLASS_CSC_APOTHECARIES_BASE' AND Type LIKE 'FEATURE_%';

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
			'CSC_APOTHECARIES_PRODUCTION_FROM_SPEC_' || Type,
			'DISTRICT_CSC_APOTHECARIES_QUARTER',
			'SelfBonus',
			'YIELD_PRODUCTION',
			1,
			'FROM_RINGS_CAO_RESOURCE',
			Type,
			1,
			1
FROM	TypeTags
WHERE 	Tag='CLASS_CSC_APOTHECARIES_SPEC';