-- ModSupport_R2
-- Author: Henno
-- DateCreated: 2025-06-17 09:24:58
--------------------------------------------------------------

--===========================================================================================================================================================================--
/*	BAKERS' QUARTER */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Tags
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO Tags

		(   Tag,							    Vocabulary			)
VALUES	(	'CLASS_CSC_BAKERS_BASE',	        'RESOURCE_CLASS'	),
        (	'CLASS_CSC_BAKERS_SPEC',	        'RESOURCE_CLASS'	),
        (	'CLASS_CSC_WEAVERS_BASE',	        'RESOURCE_CLASS'	),
        (	'CLASS_CSC_WEAVERS_SPEC',	        'RESOURCE_CLASS'	),
        (	'CLASS_CSC_APOTHECARIES_BASE',      'RESOURCE_CLASS'	),
        (	'CLASS_CSC_APOTHECARIES_SPEC',      'RESOURCE_CLASS'	),
        (	'CLASS_CSC_STONEMASONS_BASE',       'RESOURCE_CLASS'	),
        (	'CLASS_CSC_STONEMASONS_SPEC',       'RESOURCE_CLASS'	),
        (	'CLASS_CSC_CARPENTERS_BASE',        'RESOURCE_CLASS'	),
        (	'CLASS_CSC_CARPENTERS_SPEC',	    'RESOURCE_CLASS'	),
        (	'CLASS_CSC_BLACKSMITHS_BASE',	    'RESOURCE_CLASS'	),
        (	'CLASS_CSC_BLACKSMITHS_SPEC',	    'RESOURCE_CLASS'	),
        (	'CLASS_CSC_GOLDSMITHS_BASE',	    'RESOURCE_CLASS'	),
        (	'CLASS_CSC_GOLDSMITHS_SPEC',	    'RESOURCE_CLASS'	),
        (	'CLASS_CSC_BREWERS_BASE',           'RESOURCE_CLASS'	),
        (	'CLASS_CSC_BREWERS_SPEC',           'RESOURCE_CLASS'	);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	TypeTags
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--	Bakers' Quarter raw materials
INSERT OR IGNORE INTO TypeTags

	(	Type,					Tag			        )
SELECT	ResourceType,			'CLASS_CSC_BAKERS_BASE'
FROM	Resources
WHERE	ResourceType 			IN
	(	'RESOURCE_BARLEY',
        'RESOURCE_SORGHUM'       );

--	Bakers' Quarter luxury materials
INSERT OR IGNORE INTO TypeTags

	(	Type,					Tag			        )
SELECT	ResourceType,			'CLASS_CSC_BAKERS_SPEC'
FROM	Resources
WHERE	ResourceType 			IN
	(	'RESOURCE_BERRIES',
		'RESOURCE_DATES',
		'RESOURCE_POPPIES',
		'RESOURCE_SAFFRON',
		'RESOURCE_STRAWBERRY',
		'RESOURCE_MAPLE',
		'RESOURCE_TOMATO'        );