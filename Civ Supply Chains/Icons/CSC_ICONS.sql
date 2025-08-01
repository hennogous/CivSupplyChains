-- CSC_ICONS
-- Author: Shadow
-- DateCreated: 2025-07-06 10:07:55
--------------------------------------------------------------

--===========================================================================================================================================================================--
/*	QUARTERS */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	IconTextureAtlases
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO IconTextureAtlases

		(   Name,                                   IconSize,	IconsPerRow,	IconsPerColumn,		Filename                )
VALUES  (   'ICON_ATLAS_CSC_QUARTERS',				256,	 	4,				4,					'CSC_Quarters_256'      ),
		(   'ICON_ATLAS_CSC_QUARTERS',				128,	 	4,				4,					'CSC_Quarters_128'      ),
		(   'ICON_ATLAS_CSC_QUARTERS',				80,	 		4,				4,					'CSC_Quarters_80'       ),
		(   'ICON_ATLAS_CSC_QUARTERS',				50,	 		4,				4,					'CSC_Quarters_50'       ),
		(   'ICON_ATLAS_CSC_QUARTERS',				38,	 		4,				4,					'CSC_Quarters_38'       ),
		(   'ICON_ATLAS_CSC_QUARTERS',				32,	 		4,				4,					'CSC_Quarters_32'       ),
		(   'ICON_ATLAS_CSC_QUARTERS_FOW',			256,		4,				4,					'CSC_Quarters_256_FOW'  );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	IconDefinitions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR REPLACE INTO IconDefinitions

		(   Name,												Atlas, 									'Index'		)
VALUES  (   'ICON_DISTRICT_CSC_BAKERS_QUARTER',					'ICON_ATLAS_CSC_QUARTERS',				0			),
		(   'ICON_DISTRICT_CSC_BAKERS_QUARTER_FOW',				'ICON_ATLAS_CSC_QUARTERS_FOW',			0			),

		(   'ICON_DISTRICT_CSC_TAILORS_QUARTER',				'ICON_ATLAS_CSC_QUARTERS',				1			),
		(   'ICON_DISTRICT_CSC_TAILORS_QUARTER_FOW',			'ICON_ATLAS_CSC_QUARTERS_FOW',			1			),

		(   'ICON_DISTRICT_CSC_APOTHECARIES_QUARTER',			'ICON_ATLAS_CSC_QUARTERS',				2			),
		(   'ICON_DISTRICT_CSC_APOTHECARIES_QUARTER_FOW',		'ICON_ATLAS_CSC_QUARTERS_FOW',			2			),

		(   'ICON_DISTRICT_CSC_STONEMASONS_QUARTER',			'ICON_ATLAS_CSC_QUARTERS',				3			),
		(   'ICON_DISTRICT_CSC_STONEMASONS_QUARTER_FOW',		'ICON_ATLAS_CSC_QUARTERS_FOW',			3			),

		(   'ICON_DISTRICT_CSC_CARPENTERS_QUARTER',				'ICON_ATLAS_CSC_QUARTERS',				4			),
		(   'ICON_DISTRICT_CSC_CARPENTERS_QUARTER_FOW',			'ICON_ATLAS_CSC_QUARTERS_FOW',			4			),

		(   'ICON_DISTRICT_CSC_BLACKSMITHS_QUARTER',			'ICON_ATLAS_CSC_QUARTERS',				5			),
		(   'ICON_DISTRICT_CSC_BLACKSMITHS_QUARTER_FOW',		'ICON_ATLAS_CSC_QUARTERS_FOW',			5			),

		(   'ICON_DISTRICT_CSC_GOLDSMITHS_QUARTER',				'ICON_ATLAS_CSC_QUARTERS',				6			),
		(   'ICON_DISTRICT_CSC_GOLDSMITHS_QUARTER_FOW',			'ICON_ATLAS_CSC_QUARTERS_FOW',			6			),

		(   'ICON_DISTRICT_CSC_BREWERS_QUARTER',				'ICON_ATLAS_CSC_QUARTERS',				7			),
		(   'ICON_DISTRICT_CSC_BREWERS_QUARTER_FOW',			'ICON_ATLAS_CSC_QUARTERS_FOW',			7			);



--===========================================================================================================================================================================--
/*	RESOURCES */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	IconTextureAtlases
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO IconTextureAtlases

		(	Name,									IconSize,	IconsPerRow,	IconsPerColumn,		Filename				)
VALUES  (	'ICON_ATLAS_CSC_RESOURCES',				256,	 	2,				2,					'CSC_Resources_256'		),
		(	'ICON_ATLAS_CSC_RESOURCES',				64,	 		2,				2,					'CSC_Resources_64'		),
		(	'ICON_ATLAS_CSC_RESOURCES',				50,	 		2,				2,					'CSC_Resources_50'		),
		(	'ICON_ATLAS_CSC_RESOURCES',				38,	 		2,				2,					'CSC_Resources_38'		),
		(	'ICON_ATLAS_CSC_RESOURCES',				32,	 		2,				2,					'CSC_Resources_32'		),
		(	'ICON_ATLAS_CSC_RESOURCES_FOW',			256,	 	2,				2,					'CSC_Resources_256_FOW'	),
		(	'ICON_ATLAS_CSC_RESOURCES_FOW',			64,	 		2,				2,					'CSC_Resources_64_FOW'	);

INSERT INTO IconTextureAtlases
		(	Name,									Baseline,	IconSize,	IconsPerRow,	IconsPerColumn,		Filename			)
VALUES  (	'ICON_ATLAS_CSC_RESOURCES',				6,			22,	 		2,				2,					'CSC_Resources_22'	);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	IconDefinitions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR REPLACE INTO IconDefinitions

		(	Name,									Atlas, 									'Index'		)
VALUES  (	'ICON_RESOURCE_CSC_FLAX',				'ICON_ATLAS_CSC_RESOURCES',				0			),
		(	'RESOURCE_CSC_FLAX',					'ICON_ATLAS_CSC_RESOURCES',				0			),
		(	'ICON_RESOURCE_CSC_FLAX_FOW',			'ICON_ATLAS_CSC_RESOURCES_FOW',			0			);