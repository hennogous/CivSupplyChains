-- CSC_MC_MODE
-- Author: Henno
-- DateCreated: 2025-06-15 11:57:14
--------------------------------------------------------------

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
		(	'MOD_CSC_BAKERS_SPECIALTY_HOUSING',				'Suk_MCUIS_Advanced',	0														);

		(	'MOD_CSC_BAKERS_SPECIALTY_SLOT_GRANT',			'Suk_MCUIS',			'LOC_MOD_CSC_BAKERS_SPECIALTY_SLOT_GRANT_DESCRIPTION'	),
		(	'MOD_CSC_BAKERS_SPECIALTY_SLOT_GRANT',			'Suk_MCUIS_Icon',		'ICON_CIVILIZATION_AZTEC'								),
		(	'MOD_CSC_BAKERS_SPECIALTY_SLOT_GRANT',			'Suk_MCUIS_SortOrder',	0														),
		(	'MOD_CSC_BAKERS_SPECIALTY_SLOT_GRANT',			'Suk_MCUIS_Advanced',	0														);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	CSC_ProductReference
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE CSC_ProductReference;


/*
INSERT INTO Types(Type, Kind) VALUES
('SLTH_BUILDING_DUMMY_HALL_OF_KINGS_CAMPUS', 'KIND_BUILDING');

INSERT OR IGNORE INTO CivilopediaPageExcludes(SectionId, PageId) VALUES
('BUILDINGS', 'SLTH_BUILDING_DUMMY_HALL_OF_KINGS_CAMPUS');

INSERT OR IGNORE INTO Buildings_XP2(BuildingType, Pillage)VALUES
('SLTH_BUILDING_DUMMY_HALL_OF_KINGS_CAMPUS', '0');

INSERT INTO Buildings(BuildingType, Name,  Cost, PrereqDistrict, Description,  AdvisorType, PurchaseYield, MustPurchase) VALUES
('SLTH_BUILDING_DUMMY_HALL_OF_KINGS_CAMPUS', 'LOC_SLTH_BUILDING_DUMMY_NAME', '500', 'DISTRICT_CAMPUS', 'LOC_SLTH_BUILDING_DUMMY_DESCRIPTION', 'ADVISOR_RELIGIOUS', NULL, '1');

-- mine was for +2 culture on specialists on campus, but you could do extra specialists I think

INSERT INTO Building_CitizenYieldChanges(BuildingType, YieldType, YieldChange) VALUES
('SLTH_BUILDING_DUMMY_HALL_OF_KINGS_CAMPUS', 'YIELD_CULTURE', '2');

INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES
('BUILDING_ST_BASILS_CATHEDRAL','GRANT_DUMMY_FOR_SPECIALISTS_HALL_OF_KINGS_CAMPUS_ATTACH');

INSERT INTO Modifiers(ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId) VALUES
('GRANT_DUMMY_FOR_SPECIALISTS_HALL_OF_KINGS_CAMPUS_ATTACH', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', '0', '0', NULL),
('GRANT_DUMMY_FOR_SPECIALISTS_HALL_OF_KINGS_CAMPUS', 'MODIFIER_SINGLE_CITY_GRANT_BUILDING_IN_CITY_IGNORE', '0', '0', 'CITY_HAS_CAMPUS_MACEDON');

INSERT INTO ModifierArguments(ModifierId, Name, Type, Value) VALUES
('GRANT_DUMMY_FOR_SPECIALISTS_HALL_OF_KINGS_CAMPUS_ATTACH', 'ModifierId', 'ARGTYPE_IDENTITY', 'GRANT_DUMMY_FOR_SPECIALISTS_HALL_OF_KINGS_CAMPUS'),
('GRANT_DUMMY_FOR_SPECIALISTS_HALL_OF_KINGS_CAMPUS', 'BuildingType', 'ARGTYPE_IDENTITY', 'SLTH_BUILDING_DUMMY_HALL_OF_KINGS_CAMPUS');

*/
