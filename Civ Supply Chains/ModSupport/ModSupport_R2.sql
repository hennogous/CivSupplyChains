-- ModSupport_R2
-- Author: Henno
-- DateCreated: 2025-06-17 09:24:58
--------------------------------------------------------------

--===========================================================================================================================================================================--
/*	BAKERS' QUARTER */
--===========================================================================================================================================================================--

--	Bakers' Quarter raw materials
INSERT OR IGNORE INTO TypeTags

	(	Type,					Tag			        )
SELECT	ResourceType,			'CLASS_CSC_BAKERS_RAW'
FROM	Resources
WHERE	ResourceType 			IN
	(	'RESOURCE_BARLEY',
        'RESOURCE_SORGHUM'       );

--	Bakers' Quarter luxury materials
INSERT OR IGNORE INTO TypeTags

	(	Type,					Tag			        )
SELECT	ResourceType,			'CLASS_CSC_BAKERS_LUX'
FROM	Resources
WHERE	ResourceType 			IN
	(	'RESOURCE_BERRIES',
		'RESOURCE_DATES',
		'RESOURCE_POPPIES',
		'RESOURCE_SAFFRON',
		'RESOURCE_STRAWBERRY',
		'RESOURCE_MAPLE',
		'RESOURCE_TOMATO'        );