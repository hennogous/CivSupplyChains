-- CSC_ANIMALS
-- Author: Henno
-- DateCreated: 2025-06-20 07:58:11
--------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Tags
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO Tags

	(       Tag,                                    Vocabulary              )
VALUES	(	'CLASS_CSC_BAKERS_BASE',	        'RESOURCE_CLASS'	),
        (	'CLASS_CSC_BAKERS_SPEC',	        'RESOURCE_CLASS'	),
        (	'CLASS_CSC_WEAVERS_BASE',	        'RESOURCE_CLASS'	),
        (	'CLASS_CSC_WEAVERS_SPEC',	        'RESOURCE_CLASS'	),
        (	'CLASS_CSC_APOTHECARIES_BASE',          'RESOURCE_CLASS'	),
        (	'CLASS_CSC_CARPENTERS_SPEC',            'RESOURCE_CLASS'	),
        (	'CLASS_CSC_BREWERS_SPEC',               'RESOURCE_CLASS'	);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	TypeTags
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Bakers' Quarter base materials
INSERT OR IGNORE INTO TypeTags

    (	Type,                           Tag			        )
SELECT	ResourceType,			        'CLASS_CSC_BAKERS_BASE'
FROM	Resources
WHERE	ResourceType 			        IN
    (	'RESOURCE_CATTLE'               );

-- Bakers' Quarter specialty materials
INSERT OR IGNORE INTO TypeTags

    (	Type,                           Tag			        )
SELECT	ResourceType,			        'CLASS_CSC_BAKERS_SPEC'
FROM	Resources
WHERE	ResourceType 			        IN
    (	'RESOURCE_HONEY'                );

-------------------------------------------------------------------------------------

-- Weavers' Quarter base materials
INSERT OR IGNORE INTO TypeTags

    (	Type,                           Tag			        )
SELECT	ResourceType,			        'CLASS_CSC_WEAVERS_BASE'
FROM	Resources
WHERE	ResourceType 			        IN
    (	'RESOURCE_SHEEP'                );

-- Weavers' Quarter specialty materials
INSERT OR IGNORE INTO TypeTags

    (	Type,                           Tag			        )
SELECT	ResourceType,			        'CLASS_CSC_WEAVERS_SPEC'
FROM	Resources
WHERE	ResourceType 			        IN
    (	'RESOURCE_SILK'                 );

-------------------------------------------------------------------------------------

-- Apothecaries' Quarter base materials
INSERT OR IGNORE INTO TypeTags

    (	Type,                           Tag			        )
SELECT	ResourceType,			        'CLASS_CSC_APOTHECARIES_BASE'
FROM	Resources
WHERE	ResourceType 			        IN
    (	'RESOURCE_HONEY'                );

-------------------------------------------------------------------------------------

-- Carpenters' Quarter specialty materials
INSERT OR IGNORE INTO TypeTags

    (	Type,                           Tag			        )
SELECT	ResourceType,			        'CLASS_CSC_CARPENTERS_SPEC'
FROM	Resources
WHERE	ResourceType 			        IN
    (	'RESOURCE_SILK'                 );

-------------------------------------------------------------------------------------

-- Goldsmiths' Quarter specialty materials
INSERT OR IGNORE INTO TypeTags

    (	Type,                           Tag			        )
SELECT	ResourceType,			        'CLASS_CSC_GOLDSMITHS_SPEC'
FROM	Resources
WHERE	ResourceType 			        IN
    (	'RESOURCE_PEARLS'               );

-------------------------------------------------------------------------------------

-- Brewers' Quarter specialty materials
INSERT OR IGNORE INTO TypeTags

    (	Type,                           Tag			        )
SELECT	ResourceType,			        'CLASS_CSC_BREWERS_SPEC'
FROM	Resources
WHERE	ResourceType 			        IN
    (	'RESOURCE_HONEY'                );