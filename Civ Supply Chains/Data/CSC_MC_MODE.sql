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
		(	'IMPROVEMENT_CORPORATION',		'MOD_CSC_BAKERS_BASE_CORPORATION_ATTACH_QUARTER_WIND'	);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	BuildingModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT INTO BuildingModifiers

        (	BuildingType,		            			ModifierId											)	VALUES

--	WIND / WATER MILL --------------------------------------------------------------------------

--	+2 Gold to adjacent base materials Industries
		(	'BUILDING_CSC_BAKERS_WIND_MILL',       		'MOD_CSC_BAKERS_FLOUR_MILL_ATTACH_ADJ_IND_BASE'		),
		(	'BUILDING_CSC_BAKERS_WATER_MILL',			'MOD_CSC_BAKERS_FLOUR_MILL_ATTACH_ADJ_IND_BASE'		),

--	+3 Gold to adjacent base materials Corporations
		(	'BUILDING_CSC_BAKERS_WIND_MILL',       		'MOD_CSC_BAKERS_FLOUR_MILL_ATTACH_ADJ_CORP_BASE'	),
		(	'BUILDING_CSC_BAKERS_WATER_MILL',			'MOD_CSC_BAKERS_FLOUR_MILL_ATTACH_ADJ_CORP_BASE'	);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Modifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT OR IGNORE INTO Modifiers

		(	ModifierId,														ModifierType,										OwnerRequirementSetId,				SubjectRequirementSetId,					SubjectStackLimit	)	VALUES	

--	FLOUR MILL --------------------------------------------------------------------------

-- +2 Production to the Water Mill from a base materials Industry
		(	'MOD_CSC_BAKERS_BASE_INDUSTRY_ATTACH_QUARTER_WATER',			'MODIFIER_ALL_DISTRICTS_ATTACH_MODIFIER',			'REQSET_CSC_BAKERS_PLOT_HAS_BASE',	'REQSET_CSC_ADJ_BAKERS_QUARTER',			NULL				),
		(	'MOD_CSC_BAKERS_BASE_INDUSTRY_PROD_TO_ADJ_WATER_MILL',			'MODIFIER_BUILDING_YIELD_CHANGE',					NULL,								NULL,										NULL				),

-- +2 Production to the Wind Mill from a base materials Industry
		(	'MOD_CSC_BAKERS_BASE_INDUSTRY_ATTACH_QUARTER_WIND',				'MODIFIER_ALL_DISTRICTS_ATTACH_MODIFIER',			'REQSET_CSC_BAKERS_PLOT_HAS_BASE',	'REQSET_CSC_ADJ_BAKERS_QUARTER',			NULL				),
		(	'MOD_CSC_BAKERS_BASE_INDUSTRY_PROD_TO_ADJ_WIND_MILL',			'MODIFIER_BUILDING_YIELD_CHANGE',					NULL,								NULL,										NULL				),

-- +3 Production to the Water Mill from a base materials Industry
		(	'MOD_CSC_BAKERS_BASE_CORPORATION_ATTACH_QUARTER_WATER',			'MODIFIER_ALL_DISTRICTS_ATTACH_MODIFIER',			'REQSET_CSC_BAKERS_PLOT_HAS_BASE',	'REQSET_CSC_ADJ_BAKERS_QUARTER',			NULL				),
		(	'MOD_CSC_BAKERS_BASE_CORPORATION_PROD_TO_ADJ_WATER_MILL',		'MODIFIER_BUILDING_YIELD_CHANGE',					NULL,								NULL,										NULL				),

-- +3 Production to the Wind Mill from a base materials Industry
		(	'MOD_CSC_BAKERS_BASE_CORPORATION_ATTACH_QUARTER_WIND',			'MODIFIER_ALL_DISTRICTS_ATTACH_MODIFIER',			'REQSET_CSC_BAKERS_PLOT_HAS_BASE',	'REQSET_CSC_ADJ_BAKERS_QUARTER',			NULL				),
		(	'MOD_CSC_BAKERS_BASE_CORPORATION_PROD_TO_ADJ_WIND_MILL',		'MODIFIER_BUILDING_YIELD_CHANGE',					NULL,								NULL,										NULL				),

-- 	+2 Gold to adjacent base materials Industries
		(	'MOD_CSC_BAKERS_FLOUR_MILL_ATTACH_ADJ_IND_BASE',				'MODIFIER_CSC_PLAYER_IMPROVEMENTS_ATTACH_MODIFIER',	NULL,								'REQSET_CSC_BAKERS_ADJ_PLOT_HAS_IND_BASE',	NULL				),
		(	'MOD_CSC_BAKERS_FLOUR_MILL_GOLD_TO_ADJ_IND_BASE',				'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',			NULL,								NULL,										NULL      			),

-- 	+3 Gold to adjacent base materials Corporations
		(	'MOD_CSC_BAKERS_FLOUR_MILL_ATTACH_ADJ_CORP_BASE',				'MODIFIER_CSC_PLAYER_IMPROVEMENTS_ATTACH_MODIFIER',	NULL,								'REQSET_CSC_BAKERS_ADJ_PLOT_HAS_CORP_BASE',	NULL				),
		(	'MOD_CSC_BAKERS_FLOUR_MILL_GOLD_TO_ADJ_CORP_BASE',				'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',			NULL,								NULL,										NULL      			);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	ModifierArguments
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
INSERT OR IGNORE INTO ModifierArguments
		
        (	ModifierId,			                      							Name,                       Value		                									)	VALUES

-- 	FLOUR MILL --------------------------------------------------------------------------

-- +2 Production to the Water Mill from a base materials Industry
		(  	'MOD_CSC_BAKERS_BASE_INDUSTRY_ATTACH_QUARTER_WATER',				'ModifierId',         		'MOD_CSC_BAKERS_BASE_INDUSTRY_PROD_TO_ADJ_WATER_MILL'     	),    
        (  	'MOD_CSC_BAKERS_BASE_INDUSTRY_PROD_TO_ADJ_WATER_MILL',				'BuildingType',           	'BUILDING_CSC_BAKERS_WATER_MILL'								),
        (  	'MOD_CSC_BAKERS_BASE_INDUSTRY_PROD_TO_ADJ_WATER_MILL',				'YieldType',           		'YIELD_PRODUCTION'                                              ),
        ( 	'MOD_CSC_BAKERS_BASE_INDUSTRY_PROD_TO_ADJ_WATER_MILL',				'Amount',             		2                                                               ),

-- +2 Production to the Wind Mill from a base materials Industry
		(  	'MOD_CSC_BAKERS_BASE_INDUSTRY_ATTACH_QUARTER_WIND',					'ModifierId',         		'MOD_CSC_BAKERS_BASE_INDUSTRY_PROD_TO_ADJ_WIND_MILL'     	),    
        (  	'MOD_CSC_BAKERS_BASE_INDUSTRY_PROD_TO_ADJ_WIND_MILL',				'BuildingType',           	'BUILDING_CSC_BAKERS_WIND_MILL'									),
        (  	'MOD_CSC_BAKERS_BASE_INDUSTRY_PROD_TO_ADJ_WIND_MILL',				'YieldType',           		'YIELD_PRODUCTION'                                              ),
        ( 	'MOD_CSC_BAKERS_BASE_INDUSTRY_PROD_TO_ADJ_WIND_MILL',				'Amount',             		2                                                               ),

-- 	+2 Gold to adjacent base materials Industries (already at +1)
		(	'MOD_CSC_BAKERS_FLOUR_MILL_ATTACH_ADJ_IND_BASE',					'ModifierId',				'MOD_CSC_BAKERS_FLOUR_MILL_GOLD_TO_ADJ_IND_BASE'				),
		(	'MOD_CSC_BAKERS_FLOUR_MILL_GOLD_TO_ADJ_IND_BASE',    				'YieldType',	            'YIELD_GOLD'                									),
        (	'MOD_CSC_BAKERS_FLOUR_MILL_GOLD_TO_ADJ_IND_BASE',    				'Amount',		            1		                    									),

-- +3 Production to the Water Mill from a base materials Industry
		(  	'MOD_CSC_BAKERS_BASE_CORPORATION_ATTACH_QUARTER_WATER',				'ModifierId',         		'MOD_CSC_BAKERS_BASE_CORPORATION_PROD_TO_ADJ_WATER_MILL'	),    
        (  	'MOD_CSC_BAKERS_BASE_CORPORATION_PROD_TO_ADJ_WATER_MILL',			'BuildingType',           	'BUILDING_CSC_BAKERS_WATER_MILL'								),
        (  	'MOD_CSC_BAKERS_BASE_CORPORATION_PROD_TO_ADJ_WATER_MILL',			'YieldType',           		'YIELD_PRODUCTION'                                              ),
        ( 	'MOD_CSC_BAKERS_BASE_CORPORATION_PROD_TO_ADJ_WATER_MILL',			'Amount',             		3                                                               ),

-- +3 Production to the Wind Mill from a base materials Industry
		(  	'MOD_CSC_BAKERS_BASE_CORPORATION_ATTACH_QUARTER_WIND',				'ModifierId',         		'MOD_CSC_BAKERS_BASE_CORPORATION_PROD_TO_ADJ_WIND_MILL'	),    
        (  	'MOD_CSC_BAKERS_BASE_CORPORATION_PROD_TO_ADJ_WIND_MILL',			'BuildingType',           	'BUILDING_CSC_BAKERS_WIND_MILL'									),
        (  	'MOD_CSC_BAKERS_BASE_CORPORATION_PROD_TO_ADJ_WIND_MILL',			'YieldType',           		'YIELD_PRODUCTION'                                              ),
        ( 	'MOD_CSC_BAKERS_BASE_CORPORATION_PROD_TO_ADJ_WIND_MILL',			'Amount',             		3                                                               ),

-- 	+3 Gold to adjacent base materials Corporations (already at +1)
		(	'MOD_CSC_BAKERS_FLOUR_MILL_ATTACH_ADJ_CORP_BASE',					'ModifierId',				'MOD_CSC_BAKERS_FLOUR_MILL_GOLD_TO_ADJ_CORP_BASE'				),
		(	'MOD_CSC_BAKERS_FLOUR_MILL_GOLD_TO_ADJ_CORP_BASE',					'YieldType',	            'YIELD_GOLD'                									),
        (	'MOD_CSC_BAKERS_FLOUR_MILL_GOLD_TO_ADJ_CORP_BASE',					'Amount',		            2		                    									);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	RequirementSets
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
INSERT OR IGNORE INTO RequirementSets 
		
        (	RequirementSetId,								RequirementSetType              )	VALUES

-- 	FLOUR MILL --------------------------------------------------------------------------

-- 	+2 Gold to adjacent base materials Industries
        (	'REQSET_CSC_BAKERS_ADJ_PLOT_HAS_IND_BASE',		'REQUIREMENTSET_TEST_ALL'       ),

-- 	+3 Gold to adjacent base materials Corporations
        (	'REQSET_CSC_BAKERS_ADJ_PLOT_HAS_CORP_BASE',		'REQUIREMENTSET_TEST_ALL'       );

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
        (	'REQSET_CSC_BAKERS_ADJ_PLOT_HAS_CORP_BASE',		'REQ_CSC_PLOT_HAS_CORPORATION'					);

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

INSERT INTO Types

		(	Type,																Kind					)
VALUES	(	'PROJECT_CREATE_CSC_BAKERS_SPECIALTY',								'KIND_PROJECT'			),
		(	'RESOURCE_CSC_BAKERS_SPECIALTY',									'KIND_RESOURCE'			),
		(	'BUILDING_CSC_BAKERS_SPECIALIST_DUMMY',								'KIND_BUILDING'			);

---

INSERT OR IGNORE INTO Types

		(	Type,											Kind				)
SELECT		'GREATWORK_PRODUCT_CSC_BAKERS_' || Copy,		'KIND_GREATWORK'
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

		(	GreatWorkType,	GreatWorkObjectType,				Name										)
SELECT	Type,				'GREATWORKOBJECT_PRODUCT',		    'LOC_GREATWORK_PRODUCT_CSC_BAKERS_X_NAME'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_CSC_BAKERS_%';

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	GreatWorks_ImprovementType
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO GreatWorks_ImprovementType

		(	GreatWorkType,	ResourceType						)
SELECT	Type,				'RESOURCE_CSC_BAKERS_SPECIALTY'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_CSC_BAKERS_%';

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	GreatWork_YieldChanges
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO GreatWork_YieldChanges

		(	GreatWorkType,	YieldType,			YieldChange		)
SELECT	Type,				'YIELD_FOOD',		3
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_CSC_BAKERS_%';

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	GreatWorkModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO GreatWorkModifiers

		(GreatWorkType,	ModifierId								)
SELECT	Type,			'MOD_CSC_BAKERS_SPECIALTY_HOUSING'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_CSC_BAKERS_%';

----

INSERT OR IGNORE INTO GreatWorkModifiers

		(GreatWorkType,	ModifierId								)
SELECT	Type,			'MOD_CSC_BAKERS_SPECIALTY_SLOT_ATTACH'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_CSC_BAKERS_%';

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Modifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO Modifiers

		(	ModifierId,									ModifierType,												SubjectRequirementSetId,					SubjectStackLimit	)
VALUES	(	'MOD_CSC_BAKERS_SPECIALTY_HOUSING',			'MODIFIER_CITY_DISTRICTS_ADJUST_DISTRICT_HOUSING',			NULL,										NULL				),
		(	'MOD_CSC_BAKERS_SPECIALTY_SLOT_ATTACH',		'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',					NULL,										NULL				),
		(	'MOD_CSC_BAKERS_SPECIALTY_SLOT_GRANT',		'MODIFIER_SINGLE_CITY_GRANT_BUILDING_IN_CITY_IGNORE',		NULL,										NULL				);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	ModifierArguments
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO ModifierArguments

		(	ModifierId,									Name,				Value										)
VALUES	(	'MOD_CSC_BAKERS_SPECIALTY_HOUSING',			'Amount',			2											),
		(	'MOD_CSC_BAKERS_SPECIALTY_SLOT_ATTACH',		'ModifierId',		'MOD_CSC_BAKERS_SPECIALTY_SLOT_GRANT'		),
		(	'MOD_CSC_BAKERS_SPECIALTY_SLOT_GRANT',		'BuildingType',		'BUILDING_CSC_BAKERS_SPECIALIST_DUMMY'		);

---

INSERT INTO Buildings

		(	BuildingType,
			Name,
			Cost,
			PrereqDistrict,
			CitizenSlots,
			PurchaseYield,
			MustPurchase			)
VALUES	(
		/*  BuildingType, */		'BUILDING_CSC_BAKERS_SPECIALIST_DUMMY',
		/*	Name  */				'HIDE ME',
		/*	Cost  */				0,
		/*  PrereqDistrict, */		'DISTRICT_COMMERCIAL_HUB',
		/*	CitizenSlots */			1,
		/*  PurchaseYield */		NULL,
		/*	MustPurchase */			1
									);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Projects
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO Projects

		(	ProjectType,								PrereqDistrict,						RequiredBuilding,						PrereqTech,				PrereqCivic,				Cost,	AdvisorType,		Name,												ShortName,													Description)
VALUES	(	'PROJECT_CREATE_CSC_BAKERS_SPECIALTY',		'DISTRICT_CSC_BAKERS_QUARTER',		'BUILDING_CSC_BAKERS_PATISSERIE',		NULL,					'CIVIC_URBANIZATION',		500,	'ADVISOR_GENERIC',	'LOC_PROJECT_CREATE_CSC_BAKERS_SPECIALTY_NAME',		'LOC_PROJECT_CREATE_CSC_BAKERS_SPECIALTY_SHORT_NAME',		'LOC_PROJECT_CREATE_CSC_BAKERS_SPECIALTY_DESCRIPTION');

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
--	ProjectCompletionModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO ProjectCompletionModifiers

		(	ProjectType,								ModifierId																)
VALUES	(	'PROJECT_CREATE_CSC_BAKERS_SPECIALTY',		'MOD_CSC_PROJECT_COMPLETION_CREATE_BAKERS_SPECIALTY'					);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	ModifierStrings
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO ModifierStrings

		(	ModifierId,										Context,				'Text'													)
VALUES	(	'MOD_CSC_BAKERS_SPECIALTY_HOUSING',				'Suk_MCUIS',			'LOC_MOD_CSC_BAKERS_SPECIALTY_HOUSING_DESCRIPTION'		),
		(	'MOD_CSC_BAKERS_SPECIALTY_HOUSING',				'Suk_MCUIS_Icon',		'ICON_CIVILIZATION_MAYA'								),
		(	'MOD_CSC_BAKERS_SPECIALTY_HOUSING',				'Suk_MCUIS_SortOrder',	0														),
		(	'MOD_CSC_BAKERS_SPECIALTY_HOUSING',				'Suk_MCUIS_Advanced',	0														),

		(	'MOD_CSC_BAKERS_SPECIALTY_SLOT_GRANT',			'Suk_MCUIS',			'LOC_MOD_CSC_BAKERS_SPECIALTY_SLOT_GRANT_DESCRIPTION'	),
		(	'MOD_CSC_BAKERS_SPECIALTY_SLOT_GRANT',			'Suk_MCUIS_Icon',		'ICON_CIVILIZATION_AZTEC'								),
		(	'MOD_CSC_BAKERS_SPECIALTY_SLOT_GRANT',			'Suk_MCUIS_SortOrder',	0														),
		(	'MOD_CSC_BAKERS_SPECIALTY_SLOT_GRANT',			'Suk_MCUIS_Advanced',	0														);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	CSC_ProductReference
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE CSC_ProductReference;
