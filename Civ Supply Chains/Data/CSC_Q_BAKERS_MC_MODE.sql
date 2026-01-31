-- CSC_MC_MODE
-- Author: Henno
-- DateCreated: 2025-06-15 11:57:14
--------------------------------------------------------------

--===========================================================================================================================================================================--
/*	INDUSTRIES & CORPORATIONS */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	ImprovementModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	

INSERT INTO ImprovementModifiers

        (	ImprovementType,				ModifierId												)	VALUES

-- 	FLOUR MILL --------------------------------------------------------------------------

-- +2 Production to the Water Mill from a base materials Industry
		(	'IMPROVEMENT_INDUSTRY',			'MOD_CSC_BAKERS_BASE_INDUSTRY_ATTACH_QUARTER_WATER'		),

-- +2 Production to the Wind Mill from a base materials Industry
		(	'IMPROVEMENT_INDUSTRY',			'MOD_CSC_BAKERS_BASE_INDUSTRY_ATTACH_QUARTER_WIND'		),

-- +3 Production to the Water Mill from a base materials Corporation
		(	'IMPROVEMENT_CORPORATION',		'MOD_CSC_BAKERS_BASE_CORPORATION_ATTACH_QUARTER_WATER'	),

-- +3 Production to the Wind Mill from a base materials Corporation
		(	'IMPROVEMENT_CORPORATION',		'MOD_CSC_BAKERS_BASE_CORPORATION_ATTACH_QUARTER_WIND'	),

-- 	CAFE --------------------------------------------------------------------------

-- +2 Production to the Cafe from a specialty materials Industry
		(	'IMPROVEMENT_INDUSTRY',			'MOD_CSC_BAKERS_SPEC_INDUSTRY_ATTACH_QUARTER'			),

-- +3 Production to the Cafe from a specialty materials Corporation
		(	'IMPROVEMENT_CORPORATION',		'MOD_CSC_BAKERS_SPEC_CORPORATION_ATTACH_QUARTER'		);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	BuildingModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT INTO BuildingModifiers

        (	BuildingType,		            			ModifierId											)	VALUES

--	WIND / WATER MILL -------------------------------------------------------------------

--	+2 Gold to adjacent base materials Industries
		(	'BUILDING_CSC_BAKERS_WIND_MILL',       		'MOD_CSC_BAKERS_FLOUR_MILL_ATTACH_ADJ_IND_BASE'		),
		(	'BUILDING_CSC_BAKERS_WATER_MILL',			'MOD_CSC_BAKERS_FLOUR_MILL_ATTACH_ADJ_IND_BASE'		),

--	+3 Gold to adjacent base materials Corporations
		(	'BUILDING_CSC_BAKERS_WIND_MILL',       		'MOD_CSC_BAKERS_FLOUR_MILL_ATTACH_ADJ_CORP_BASE'	),
		(	'BUILDING_CSC_BAKERS_WATER_MILL',			'MOD_CSC_BAKERS_FLOUR_MILL_ATTACH_ADJ_CORP_BASE'	),

-- 	CAFE --------------------------------------------------------------------------

--	+2 Gold to adjacent specialty materials Industries
		(	'BUILDING_CSC_BAKERS_CAFE',			'MOD_CSC_BAKERS_CAFE_ATTACH_ADJ_IND_SPEC'		),

--	+3 Gold to adjacent specialty materials Corporations
		(	'BUILDING_CSC_BAKERS_CAFE',			'MOD_CSC_BAKERS_CAFE_ATTACH_ADJ_CORP_SPEC'	);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Modifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT OR IGNORE INTO Modifiers

		(	ModifierId,														ModifierType,										OwnerRequirementSetId,				SubjectRequirementSetId,					SubjectStackLimit	)	VALUES	

--	FLOUR MILL --------------------------------------------------------------------------

-- +2 Production to the Water Mill from a base materials Industry
		(	'MOD_CSC_BAKERS_BASE_INDUSTRY_ATTACH_QUARTER_WATER',			'MODIFIER_CSC_PLAYER_DISTRICTS_ATTACH_MODIFIER',	'REQSET_CSC_BAKERS_PLOT_HAS_BASE',	'REQSET_CSC_ADJ_BAKERS_QUARTER',			NULL				),
		(	'MOD_CSC_BAKERS_BASE_INDUSTRY_PROD_TO_ADJ_WATER_MILL',			'MODIFIER_BUILDING_YIELD_CHANGE',					NULL,								NULL,										NULL				),

-- +2 Production to the Wind Mill from a base materials Industry
		(	'MOD_CSC_BAKERS_BASE_INDUSTRY_ATTACH_QUARTER_WIND',				'MODIFIER_CSC_PLAYER_DISTRICTS_ATTACH_MODIFIER',	'REQSET_CSC_BAKERS_PLOT_HAS_BASE',	'REQSET_CSC_ADJ_BAKERS_QUARTER',			NULL				),
		(	'MOD_CSC_BAKERS_BASE_INDUSTRY_PROD_TO_ADJ_WIND_MILL',			'MODIFIER_BUILDING_YIELD_CHANGE',					NULL,								NULL,										NULL				),

-- +3 Production to the Water Mill from a base materials Industry
		(	'MOD_CSC_BAKERS_BASE_CORPORATION_ATTACH_QUARTER_WATER',			'MODIFIER_CSC_PLAYER_DISTRICTS_ATTACH_MODIFIER',	'REQSET_CSC_BAKERS_PLOT_HAS_BASE',	'REQSET_CSC_ADJ_BAKERS_QUARTER',			NULL				),
		(	'MOD_CSC_BAKERS_BASE_CORPORATION_PROD_TO_ADJ_WATER_MILL',		'MODIFIER_BUILDING_YIELD_CHANGE',					NULL,								NULL,										NULL				),

-- +3 Production to the Wind Mill from a base materials Industry
		(	'MOD_CSC_BAKERS_BASE_CORPORATION_ATTACH_QUARTER_WIND',			'MODIFIER_CSC_PLAYER_DISTRICTS_ATTACH_MODIFIER',	'REQSET_CSC_BAKERS_PLOT_HAS_BASE',	'REQSET_CSC_ADJ_BAKERS_QUARTER',			NULL				),
		(	'MOD_CSC_BAKERS_BASE_CORPORATION_PROD_TO_ADJ_WIND_MILL',		'MODIFIER_BUILDING_YIELD_CHANGE',					NULL,								NULL,										NULL				),

-- 	+2 Gold to adjacent base materials Industries
		(	'MOD_CSC_BAKERS_FLOUR_MILL_ATTACH_ADJ_IND_BASE',				'MODIFIER_CSC_PLAYER_IMPROVEMENTS_ATTACH_MODIFIER',	NULL,								'REQSET_CSC_BAKERS_ADJ_PLOT_HAS_IND_BASE',	NULL				),
		(	'MOD_CSC_BAKERS_GOLD_TO_ADJ_IND',								'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',			NULL,								NULL,										NULL      			),

-- 	+3 Gold to adjacent base materials Corporations
		(	'MOD_CSC_BAKERS_FLOUR_MILL_ATTACH_ADJ_CORP_BASE',				'MODIFIER_CSC_PLAYER_IMPROVEMENTS_ATTACH_MODIFIER',	NULL,								'REQSET_CSC_BAKERS_ADJ_PLOT_HAS_CORP_BASE',	NULL				),
		(	'MOD_CSC_BAKERS_GOLD_TO_ADJ_CORP',								'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',			NULL,								NULL,										NULL      			),

-- 	CAFE --------------------------------------------------------------------------

-- +2 Production to the Cafe from a specialty materials Industry
		(	'MOD_CSC_BAKERS_SPEC_INDUSTRY_ATTACH_QUARTER',					'MODIFIER_CSC_PLAYER_DISTRICTS_ATTACH_MODIFIER',	'REQSET_CSC_BAKERS_PLOT_HAS_SPEC',	'REQSET_CSC_ADJ_BAKERS_QUARTER',			NULL				),
		(	'MOD_CSC_BAKERS_SPEC_INDUSTRY_PROD_TO_ADJ_CAFE',			'MODIFIER_BUILDING_YIELD_CHANGE',					NULL,								NULL,										NULL				),

--	+2 Gold to adjacent specialty materials Industries
		(	'MOD_CSC_BAKERS_CAFE_ATTACH_ADJ_IND_SPEC',				'MODIFIER_CSC_PLAYER_IMPROVEMENTS_ATTACH_MODIFIER',	NULL,								'REQSET_CSC_BAKERS_ADJ_PLOT_HAS_IND_SPEC',	NULL				),
--		(	'MOD_CSC_BAKERS_CAFE_GOLD_TO_ADJ_IND_SPEC',				'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',			NULL,								NULL,										NULL				),

-- +3 Production to the Cafe from a specialty materials Corporation
		(	'MOD_CSC_BAKERS_SPEC_CORPORATION_ATTACH_QUARTER',				'MODIFIER_CSC_PLAYER_DISTRICTS_ATTACH_MODIFIER',	'REQSET_CSC_BAKERS_PLOT_HAS_SPEC',	'REQSET_CSC_ADJ_BAKERS_QUARTER',			NULL				),
		(	'MOD_CSC_BAKERS_SPEC_CORPORATION_PROD_TO_ADJ_CAFE',		'MODIFIER_BUILDING_YIELD_CHANGE',					NULL,								NULL,										NULL				),

--	+3 Gold to adjacent specialty materials Corporations
		(	'MOD_CSC_BAKERS_CAFE_ATTACH_ADJ_CORP_SPEC',				'MODIFIER_CSC_PLAYER_IMPROVEMENTS_ATTACH_MODIFIER',	NULL,								'REQSET_CSC_BAKERS_ADJ_PLOT_HAS_CORP_SPEC',	NULL				);
--		(	'MOD_CSC_BAKERS_CAFE_GOLD_TO_ADJ_CORP_SPEC',				'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',			NULL,								NULL,										NULL				);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	ModifierArguments
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
INSERT OR IGNORE INTO ModifierArguments
		
        (	ModifierId,			                      							Name,                       Value		                									)	VALUES

-- 	FLOUR MILL --------------------------------------------------------------------------

-- +2 Production to the Water Mill from a base materials Industry
		(  	'MOD_CSC_BAKERS_BASE_INDUSTRY_ATTACH_QUARTER_WATER',				'ModifierId',         		'MOD_CSC_BAKERS_BASE_INDUSTRY_PROD_TO_ADJ_WATER_MILL'     		),    
        (  	'MOD_CSC_BAKERS_BASE_INDUSTRY_PROD_TO_ADJ_WATER_MILL',				'BuildingType',           	'BUILDING_CSC_BAKERS_WATER_MILL'								),
        (  	'MOD_CSC_BAKERS_BASE_INDUSTRY_PROD_TO_ADJ_WATER_MILL',				'YieldType',           		'YIELD_PRODUCTION'                                              ),
        ( 	'MOD_CSC_BAKERS_BASE_INDUSTRY_PROD_TO_ADJ_WATER_MILL',				'Amount',             		2                                                               ),

-- +2 Production to the Wind Mill from a base materials Industry
		(  	'MOD_CSC_BAKERS_BASE_INDUSTRY_ATTACH_QUARTER_WIND',					'ModifierId',         		'MOD_CSC_BAKERS_BASE_INDUSTRY_PROD_TO_ADJ_WIND_MILL'     		),    
        (  	'MOD_CSC_BAKERS_BASE_INDUSTRY_PROD_TO_ADJ_WIND_MILL',				'BuildingType',           	'BUILDING_CSC_BAKERS_WIND_MILL'									),
        (  	'MOD_CSC_BAKERS_BASE_INDUSTRY_PROD_TO_ADJ_WIND_MILL',				'YieldType',           		'YIELD_PRODUCTION'                                              ),
        ( 	'MOD_CSC_BAKERS_BASE_INDUSTRY_PROD_TO_ADJ_WIND_MILL',				'Amount',             		2                                                               ),

-- 	+2 Gold to adjacent base materials Industries (already at +1)
		(	'MOD_CSC_BAKERS_FLOUR_MILL_ATTACH_ADJ_IND_BASE',					'ModifierId',				'MOD_CSC_BAKERS_GOLD_TO_ADJ_IND'								),
		(	'MOD_CSC_BAKERS_GOLD_TO_ADJ_IND',    								'YieldType',	            'YIELD_GOLD'                									),
        (	'MOD_CSC_BAKERS_GOLD_TO_ADJ_IND',    								'Amount',		            1		                    									),

-- +3 Production to the Water Mill from a base materials Industry
		(  	'MOD_CSC_BAKERS_BASE_CORPORATION_ATTACH_QUARTER_WATER',				'ModifierId',         		'MOD_CSC_BAKERS_BASE_CORPORATION_PROD_TO_ADJ_WATER_MILL'		),    
        (  	'MOD_CSC_BAKERS_BASE_CORPORATION_PROD_TO_ADJ_WATER_MILL',			'BuildingType',           	'BUILDING_CSC_BAKERS_WATER_MILL'								),
        (  	'MOD_CSC_BAKERS_BASE_CORPORATION_PROD_TO_ADJ_WATER_MILL',			'YieldType',           		'YIELD_PRODUCTION'                                              ),
        ( 	'MOD_CSC_BAKERS_BASE_CORPORATION_PROD_TO_ADJ_WATER_MILL',			'Amount',             		3                                                               ),

-- +3 Production to the Wind Mill from a base materials Industry
		(  	'MOD_CSC_BAKERS_BASE_CORPORATION_ATTACH_QUARTER_WIND',				'ModifierId',         		'MOD_CSC_BAKERS_BASE_CORPORATION_PROD_TO_ADJ_WIND_MILL'			),    
        (  	'MOD_CSC_BAKERS_BASE_CORPORATION_PROD_TO_ADJ_WIND_MILL',			'BuildingType',           	'BUILDING_CSC_BAKERS_WIND_MILL'									),
        (  	'MOD_CSC_BAKERS_BASE_CORPORATION_PROD_TO_ADJ_WIND_MILL',			'YieldType',           		'YIELD_PRODUCTION'                                              ),
        ( 	'MOD_CSC_BAKERS_BASE_CORPORATION_PROD_TO_ADJ_WIND_MILL',			'Amount',             		3                                                               ),

-- 	+3 Gold to adjacent base materials Corporations (already at +1)
		(	'MOD_CSC_BAKERS_FLOUR_MILL_ATTACH_ADJ_CORP_BASE',					'ModifierId',				'MOD_CSC_BAKERS_GOLD_TO_ADJ_CORP'								),
		(	'MOD_CSC_BAKERS_GOLD_TO_ADJ_CORP',									'YieldType',	            'YIELD_GOLD'                									),
        (	'MOD_CSC_BAKERS_GOLD_TO_ADJ_CORP',									'Amount',		            2		                    									),

-- 	CAFE --------------------------------------------------------------------------

-- +2 Production to the Cafe from a specialty materials Industry
		(  	'MOD_CSC_BAKERS_SPEC_INDUSTRY_ATTACH_QUARTER',						'ModifierId',         		'MOD_CSC_BAKERS_SPEC_INDUSTRY_PROD_TO_ADJ_CAFE'     		),    
        (  	'MOD_CSC_BAKERS_SPEC_INDUSTRY_PROD_TO_ADJ_CAFE',				'BuildingType',           	'BUILDING_CSC_BAKERS_CAFE'								),
        (  	'MOD_CSC_BAKERS_SPEC_INDUSTRY_PROD_TO_ADJ_CAFE',				'YieldType',           		'YIELD_PRODUCTION'                                              ),
        ( 	'MOD_CSC_BAKERS_SPEC_INDUSTRY_PROD_TO_ADJ_CAFE',				'Amount',             		2                                                               ),

-- 	+2 Gold to adjacent specialty materials Industries (already at +1)
		(	'MOD_CSC_BAKERS_CAFE_ATTACH_ADJ_IND_SPEC',					'ModifierId',				'MOD_CSC_BAKERS_GOLD_TO_ADJ_IND'								),

-- +3 Production to the Cafe from a specialty materials Corporation
		(  	'MOD_CSC_BAKERS_SPEC_CORPORATION_ATTACH_QUARTER',					'ModifierId',         		'MOD_CSC_BAKERS_SPEC_CORPORATION_PROD_TO_ADJ_CAFE'		),    
        (  	'MOD_CSC_BAKERS_SPEC_CORPORATION_PROD_TO_ADJ_CAFE',			'BuildingType',           	'BUILDING_CSC_BAKERS_CAFE'								),
        (  	'MOD_CSC_BAKERS_SPEC_CORPORATION_PROD_TO_ADJ_CAFE',			'YieldType',           		'YIELD_PRODUCTION'                                              ),
        ( 	'MOD_CSC_BAKERS_SPEC_CORPORATION_PROD_TO_ADJ_CAFE',			'Amount',             		3                                                               ),

-- 	+3 Gold to adjacent base materials Corporations (already at +1)
		(	'MOD_CSC_BAKERS_CAFE_ATTACH_ADJ_CORP_SPEC',					'ModifierId',				'MOD_CSC_BAKERS_GOLD_TO_ADJ_CORP'								);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	RequirementSets
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
INSERT OR IGNORE INTO RequirementSets 
		
        (	RequirementSetId,								RequirementSetType              )	VALUES

-- 	FLOUR MILL --------------------------------------------------------------------------

-- 	+2 Gold to adjacent base materials Industries
        (	'REQSET_CSC_BAKERS_ADJ_PLOT_HAS_IND_BASE',		'REQUIREMENTSET_TEST_ALL'       ),

-- 	+3 Gold to adjacent base materials Corporations
        (	'REQSET_CSC_BAKERS_ADJ_PLOT_HAS_CORP_BASE',		'REQUIREMENTSET_TEST_ALL'       ),

-- 	+2 Gold to adjacent specialty materials Industries
        (	'REQSET_CSC_BAKERS_ADJ_PLOT_HAS_IND_SPEC',		'REQUIREMENTSET_TEST_ALL'       ),

-- 	+3 Gold to adjacent specialty materials Corporations
        (	'REQSET_CSC_BAKERS_ADJ_PLOT_HAS_CORP_SPEC',		'REQUIREMENTSET_TEST_ALL'       );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	RequirementSetRequirements
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
				
INSERT OR IGNORE INTO RequirementSetRequirements
		
        (	RequirementSetId,								RequirementId	                               	)	VALUES

-- 	FLOUR MILL --------------------------------------------------------------------------

-- 	+2 Gold to adjacent base materials Industries
        (	'REQSET_CSC_BAKERS_ADJ_PLOT_HAS_IND_BASE',		'REQ_CSC_PLOT_ADJ_TO_OWNER'						),
        (	'REQSET_CSC_BAKERS_ADJ_PLOT_HAS_IND_BASE',		'REQ_CSC_BAKERS_PLOT_HAS_MATERIAL_BASE'			),
        (	'REQSET_CSC_BAKERS_ADJ_PLOT_HAS_IND_BASE',		'REQ_CSC_PLOT_HAS_INDUSTRY'						),

-- 	+3 Gold to adjacent base materials Corporations
        (	'REQSET_CSC_BAKERS_ADJ_PLOT_HAS_CORP_BASE',		'REQ_CSC_PLOT_ADJ_TO_OWNER'						),
        (	'REQSET_CSC_BAKERS_ADJ_PLOT_HAS_CORP_BASE',		'REQ_CSC_BAKERS_PLOT_HAS_MATERIAL_BASE'			),
        (	'REQSET_CSC_BAKERS_ADJ_PLOT_HAS_CORP_BASE',		'REQ_CSC_PLOT_HAS_CORPORATION'					),

-- 	+2 Gold to adjacent specialty materials Industries
        (	'REQSET_CSC_BAKERS_ADJ_PLOT_HAS_IND_SPEC',		'REQ_CSC_PLOT_ADJ_TO_OWNER'						),
        (	'REQSET_CSC_BAKERS_ADJ_PLOT_HAS_IND_SPEC',		'REQ_CSC_BAKERS_PLOT_HAS_MATERIAL_SPEC'			),
        (	'REQSET_CSC_BAKERS_ADJ_PLOT_HAS_IND_SPEC',		'REQ_CSC_PLOT_HAS_INDUSTRY'						),

-- 	+3 Gold to adjacent specialty materials Corporations
        (	'REQSET_CSC_BAKERS_ADJ_PLOT_HAS_CORP_SPEC',		'REQ_CSC_PLOT_ADJ_TO_OWNER'						),
        (	'REQSET_CSC_BAKERS_ADJ_PLOT_HAS_CORP_SPEC',		'REQ_CSC_BAKERS_PLOT_HAS_MATERIAL_SPEC'			),
        (	'REQSET_CSC_BAKERS_ADJ_PLOT_HAS_CORP_SPEC',		'REQ_CSC_PLOT_HAS_CORPORATION'					);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Requirements
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO Requirements
        
        (	RequirementId,							RequirementType,	                                Inverse         )	VALUES

-- 	FLOUR MILL --------------------------------------------------------------------------

-- 	+2 Gold to adjacent base materials Industries
        (	'REQ_CSC_PLOT_HAS_INDUSTRY',			'REQUIREMENT_PLOT_IMPROVEMENT_TYPE_MATCHES',		0               ),
		(	'REQ_CSC_PLOT_HAS_CORPORATION',			'REQUIREMENT_PLOT_IMPROVEMENT_TYPE_MATCHES',		0               );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	RequirementArguments
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO RequirementArguments 

        (	RequirementId,							Name,					Value						)	VALUES

-- 	FLOUR MILL --------------------------------------------------------------------------

-- 	+2 Gold to adjacent base materials Industries
		(	'REQ_CSC_PLOT_HAS_INDUSTRY',			'ImprovementType',		'IMPROVEMENT_INDUSTRY'		),
		(	'REQ_CSC_PLOT_HAS_CORPORATION',			'ImprovementType',		'IMPROVEMENT_CORPORATION'	);



--===========================================================================================================================================================================--
/*	SPECIALTY PRODUCTS */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Civics
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

UPDATE Civics SET Description = '{LOC_CSC_BAKERS_STAGE_4_CIVIC}' || '{LOC_CSC_BAKERS_CAFE_DESCRIPTION_COMMISSION}' WHERE CivicType = 'CIVIC_URBANIZATION';

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	CSC_ProductReference
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CSC_ProductReference
    (
    Copy TEXT
    );

INSERT OR IGNORE INTO CSC_ProductReference
		(Copy)
VALUES	('0'), ('1'), ('2'), ('3'), ('4'), ('5'), ('6'), ('7'), ('8'), ('9');

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Types
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO Types

		(	Type,																Kind					)
VALUES	(	'RESOURCE_CSC_BAKERS_SPECIALTY',									'KIND_RESOURCE'			),
		(	'PROJECT_CREATE_PRODUCT_CSC_BAKERS_SPECIALTY',						'KIND_PROJECT'			);
		
---

INSERT OR IGNORE INTO Types

		(	Type,											Kind				)
SELECT		'GREATWORK_PRODUCT_CSC_BAKERS_SPECIALTY_' || Copy,		'KIND_GREATWORK'
FROM	CSC_ProductReference WHERE Copy > 0;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Resources
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO Resources

		(	ResourceType,							ResourceClassType,			Happiness,	Frequency,	Name										)
VALUES	(	'RESOURCE_CSC_BAKERS_SPECIALTY',		'RESOURCECLASS_LUXURY',		4,			0,			'LOC_RESOURCE_CSC_BAKERS_SPECIALTY_NAME'	);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	GreatWorks
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO GreatWorks

	(	GreatWorkType,	GreatWorkObjectType,				Name	)
SELECT	Type,			'GREATWORKOBJECT_PRODUCT',		    'LOC_GREATWORK_PRODUCT_CSC_BAKERS_SPECIALTY_X_NAME'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_CSC_BAKERS_SPECIALTY_%';

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	GreatWorks_ImprovementType
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO GreatWorks_ImprovementType

		(	GreatWorkType,	ResourceType						)
SELECT	Type,				'RESOURCE_CSC_BAKERS_SPECIALTY'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_CSC_BAKERS_SPECIALTY_%';

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	GreatWork_YieldChanges
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO GreatWork_YieldChanges

		(	GreatWorkType,	YieldType,				YieldChange		)
SELECT	Type,				'YIELD_CULTURE',		'3'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_CSC_BAKERS_SPECIALTY_%';

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	GreatWorkModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
INSERT OR IGNORE INTO GreatWorkModifiers

		(GreatWorkType,	ModifierId								)
SELECT	Type,			'MOD_CSC_BAKERS_SPECIALTY_HOUSING'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_CSC_BAKERS_SPECIALTY_%';

----

INSERT OR IGNORE INTO GreatWorkModifiers

		(GreatWorkType,	ModifierId								)
SELECT	Type,			'MOD_CSC_BAKERS_SPECIALTY_SLOT_ATTACH'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_CSC_BAKERS_SPECIALTY_%';
*/

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Projects
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO Projects

		(	ProjectType,										PrereqDistrict,						RequiredBuilding,				PrereqTech,				PrereqCivic,				Cost,	AdvisorType,		Name,														ShortName,															Description		)
VALUES	(	'PROJECT_CREATE_PRODUCT_CSC_BAKERS_SPECIALTY',		'DISTRICT_CSC_BAKERS_QUARTER',		'BUILDING_CSC_BAKERS_CAFE',		NULL,					'CIVIC_URBANIZATION',		500,	'ADVISOR_GENERIC',	'LOC_PROJECT_CREATE_PRODUCT_CSC_BAKERS_SPECIALTY_NAME',		'LOC_PROJECT_CREATE_PRODUCT_CSC_BAKERS_SPECIALTY_SHORT_NAME',		'LOC_PROJECT_CREATE_PRODUCT_CSC_BAKERS_SPECIALTY_DESCRIPTION'	);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	ProjectCompletionModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO ProjectCompletionModifiers

		(	ProjectType,										ModifierId																)
VALUES	(	'PROJECT_CREATE_PRODUCT_CSC_BAKERS_SPECIALTY',		'MOD_CSC_PROJECT_COMPLETION_CREATE_BAKERS_SPECIALTY'					);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Modifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO Modifiers

		(	ModifierId,													ModifierType											)
VALUES	(	'MOD_CSC_PROJECT_COMPLETION_CREATE_BAKERS_SPECIALTY',		'MODIFIER_PLAYER_GRANT_RANDOM_RESOURCE_PRODUCT'			);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	ModifierArguments
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO ModifierArguments

		(	ModifierId,													Name,				Value								)
VALUES	(	'MOD_CSC_PROJECT_COMPLETION_CREATE_BAKERS_SPECIALTY',		'ResourceType',		'RESOURCE_CSC_BAKERS_SPECIALTY'		);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	CSC_ProductReference
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE CSC_ProductReference;

INSERT INTO CivilopediaPageExcludes
		(	SectionId,			PageId	) VALUES	
		(	'RESOURCES',		'RESOURCE_CSC_BAKERS_SPECIALTY');
