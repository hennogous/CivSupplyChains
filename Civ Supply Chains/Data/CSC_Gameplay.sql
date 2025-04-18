--=============================================================================================================
-- Civ Supply Chains
-- by Henno
--=============================================================================================================

--===============================================================================================================================================================================--
/* SECTION 0: TYPES */
--===============================================================================================================================================================================--

INSERT INTO Types
		(Type,										    Kind)
VALUES	('DISTRICT_BAKERS_QUARTER',					    'KIND_DISTRICT');

--===============================================================================================================================================================================--
/* SECTION 1: QUARTERS */
--===============================================================================================================================================================================--

INSERT INTO Districts
    (	DistrictType,				    Name,									Description,									PrereqCivic,				PlunderType,		PlunderAmount,	AdvisorType,		Cost,	CostProgressionModel,						CostProgressionParam1,	OnePerCity,	RequiresPlacement,	RequiresPopulation,		NoAdjacentCity,			CaptureRemovesBuildings,	CaptureRemovesCityDefenses,	MilitaryDomain,		Aqueduct,   InternalOnly,   Appeal, 	Housing,	Entertainment,		Maintenance,		CitizenSlots,			CityStrengthModifier,		CaptureRemovesDistrict,		MaxPerPlayer				)	VALUES

    (	'DISTRICT_BAKERS_QUARTER',		'LOC_DISTRICT_BAKERS_QUARTER_NAME',		'LOC_DISTRICT_BAKERS_QUARTER_DESCRIPTION',		NULL,					    'PLUNDER_HEAL', 	'50',			'ADVISOR_GENERIC',	'20',	'COST_PROGRESSION_PREVIOUS_COPIES',	        '200',					'0',		'1',				'0',					'0',					'0',						'0',						'NO_DOMAIN',		'0',        '0',            '-1',		'0',		'0',				'1',				'0',					'2',						'0',						'-1'						);

--===========================================================================================================================================================================--		
INSERT INTO Adjacency_YieldChanges
    (	ID,								    Description,									        YieldType,				YieldChange,	OtherDistrictAdjacent,			TilesRequired,	AdjacentNaturalWonder,	AdjacentSeaResource,	AdjacentImprovement,			AdjacentTerrain,            AdjacentFeature,				PrereqCivic,			PrereqTech,							AdjacentDistrict						)	VALUES

    (	'CSC_QUARTER_CITY_CENTER_GOLD',	    'LOC_CSC_QUARTER_CITY_CENTER_GOLD_DESCRIPTION',		    'YIELD_GOLD',			1,				0,								1,				0,						0,						NULL,							NULL,                       NULL,							NULL,					NULL,								'DISTRICT_CITY_CENTER'					),
    (	'CSC_QUARTER_COMMERCIAL_HUB_GOLD',	'LOC_CSC_QUARTER_COMMERCIAL_HUB_GOLD_DESCRIPTION',		'YIELD_GOLD',			1,				0,								1,				0,						0,						NULL,							NULL,                       NULL,							NULL,					NULL,								'DISTRICT_COMMERCIAL_HUB'				),
    (	'CSC_QUARTER_HARBOR_GOLD',	        'LOC_CSC_QUARTER_HARBOR_GOLD_DESCRIPTION',		        'YIELD_GOLD',			1,				0,								1,				0,						0,						NULL,							NULL,                       NULL,							NULL,					NULL,								'DISTRICT_HARBOR'				        ),
    (	'CSC_BAKERS_TERRAIN',	            'LOC_CSC_BAKERS_TERRAIN_DESCRIPTION',		            'YIELD_PRODUCTION',		1,				0,								2,				0,						0,						NULL,							'TERRAIN_GRASS',            NULL,							NULL,					NULL,								NULL            				        );


--===========================================================================================================================================================================--				
INSERT INTO District_Adjacencies
    (	DistrictType,					YieldChangeID					        )	VALUES

    (	'DISTRICT_BAKERS_QUARTER',		'CSC_QUARTER_CITY_CENTER_GOLD'			),
    (	'DISTRICT_BAKERS_QUARTER',		'CSC_QUARTER_COMMERCIAL_HUB_GOLD'		),
    (	'DISTRICT_BAKERS_QUARTER',		'CSC_QUARTER_HARBOR_GOLD'			    ),
    (	'DISTRICT_BAKERS_QUARTER',		'CSC_BAKERS_TERRAIN'			        );

--===========================================================================================================================================================================--			
INSERT INTO District_CitizenYieldChanges
    (	DistrictType,      				 YieldType,       			YieldChange			)	VALUES
        
    (	'DISTRICT_BAKERS_QUARTER',		'YIELD_FOOD',				'2'					);

--===========================================================================================================================================================================--			
-- INSERT INTO DistrictModifiers
--    (	DistrictType,				    ModifierId										)	VALUES

--    (	'DISTRICT_BAKERS_QUARTER',		'CSC_DISTRICT_MODIFIER'					        );