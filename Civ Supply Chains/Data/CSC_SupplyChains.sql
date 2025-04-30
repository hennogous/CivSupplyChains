-- CSC_SupplyChains
-- Author: Henno
-- DateCreated: 4/19/2025 10:53:08
--------------------------------------------------------------

--===========================================================================================================================================================================--
/* SUPPLY CHAINS */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tags
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Tags

	(	Tag,					Vocabulary		)
VALUES	(	'CLASS_CSC_BAKERS_RAW',	            	'RESOURCE_CLASS'	);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TypeTags
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO TypeTags

	(	Type,					Tag			        )
SELECT	        ResourceType,				'CLASS_CSC_BAKERS_RAW'
FROM	        Resources
WHERE		ResourceType IN
	(	'RESOURCE_BANANAS',
		'RESOURCE_MAIZE',
		'RESOURCE_RICE',
		'RESOURCE_WHEAT'        );



--===========================================================================================================================================================================--
/* REQUIREMENTS */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RequirementSets
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
INSERT INTO RequirementSets 
		
        (	RequirementSetId,                                               RequirementSetType              )
VALUES	(       'REQSET_CSC_PLOT_HAS_BAKERS_RAW',                               'REQUIREMENTSET_TEST_ALL'       ),
        (       'REQSET_CSC_PLOT_HAS_BAKERS_RAW_IMPROVED',                      'REQUIREMENTSET_TEST_ALL'       ),
        (       'REQSET_CSC_PLOT_HAS_BAKERS_RAW_IMPROVED_ADJACENT',             'REQUIREMENTSET_TEST_ALL'       );



--        (       'REQSET_CSC_ADJACENT_BAKERS_QUARTER',                   'REQUIREMENTSET_TEST_ALL'       ),
--        (       'REQSET_CSC_ADJACENT_BAKERS_QUARTER_RAW_MATERIALS',     'REQUIREMENTSET_TEST_ALL'       ),
--        (       'REQSET_CSC_PLOT_ATTACH_REQUIREMENTS',                  'REQUIREMENTSET_TEST_ALL'       );


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RequirementSetRequirements
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
				
INSERT INTO RequirementSetRequirements
		
        (	RequirementSetId,		                                RequirementId	                                        )
VALUES  (       'REQSET_CSC_PLOT_HAS_BAKERS_RAW',                               'REQ_CSC_PLOT_HAS_BAKERS_QUARTER_RAW'                   ),

        (	'REQSET_CSC_PLOT_HAS_BAKERS_RAW_IMPROVED',                      'REQ_CSC_PLOT_HAS_BAKERS_QUARTER_RAW'                   ),
        (       'REQSET_CSC_PLOT_HAS_BAKERS_RAW_IMPROVED',                      'REQ_CSC_PLOT_HAS_ANY_IMPROVEMENT'                      ),

        (       'REQSET_CSC_PLOT_HAS_BAKERS_RAW_IMPROVED_ADJACENT',             'REQ_CSC_PLOT_ADJACENT_TO_OWNER'                        ),
        (       'REQSET_CSC_PLOT_HAS_BAKERS_RAW_IMPROVED_ADJACENT',             'REQ_CSC_PLOT_HAS_BAKERS_RAW_IMPROVED_SET'              );


--        (       'REQSET_CSC_PLOT_HAS_BAKERS_RAW_MATERIALS',             'REQ_CSC_PLOT_HAS_WHEAT'                                ),
--        (       'REQSET_CSC_PLOT_HAS_BAKERS_RAW_MATERIALS',             'REQ_CSC_PLOT_HAS_RICE'                                 ),
--        (       'REQSET_CSC_PLOT_HAS_BAKERS_RAW_MATERIALS',             'REQ_CSC_PLOT_HAS_MAIZE'                                ),
--        (       'REQSET_CSC_PLOT_HAS_BAKERS_RAW_MATERIALS',             'REQ_CSC_PLOT_HAS_BANANAS'                              ),

--        (       'REQSET_CSC_ADJACENT_BAKERS_QUARTER',                   'REQ_CSC_ADJACENT_PLOT'                                 ),
--        (       'REQSET_CSC_ADJACENT_BAKERS_QUARTER',                   'REQ_CSC_DISTRICT_IS_BAKERS_QUARTER'                    ),

--        (       'REQSET_CSC_ADJACENT_BAKERS_QUARTER_RAW_MATERIALS',     'REQ_CSC_ADJACENT_PLOT'                                 ),
--        (       'REQSET_CSC_ADJACENT_BAKERS_QUARTER_RAW_MATERIALS',     'REQ_CSC_BAKERS_QUARTER_RAW_MATERIALS_CHECK'            ),

--        (       'REQSET_CSC_PLOT_ATTACH_REQUIREMENTS',                  'REQ_CSC_ADJACENT_PLOT'                                 ),
--        (       'REQSET_CSC_ADJACENT_BAKERS_QUARTER_RAW_MATERIALS',     'REQ_CSC_PLOT_HAS_ANY_IMPROVEMENT'                      );

  
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Requirements
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Requirements
        
        (	RequirementId,		                                RequirementType,	                                Inverse         )
VALUES  (	'REQ_CSC_PLOT_HAS_BAKERS_QUARTER_RAW',			'REQUIREMENT_PLOT_RESOURCE_TAG_MATCHES',		0		),
        (	'REQ_CSC_PLOT_HAS_ANY_IMPROVEMENT',            		'REQUIREMENT_PLOT_HAS_ANY_IMPROVEMENT',           	0               ),
        
        (       'REQ_CSC_PLOT_ADJACENT_TO_OWNER',                       'REQUIREMENT_PLOT_ADJACENT_TO_OWNER',                   0               ),
        (       'REQ_CSC_PLOT_HAS_BAKERS_RAW_IMPROVED_SET',             'REQUIREMENT_REQUIREMENTSET_IS_MET',                    0               );



--        (	'REQ_CSC_ADJACENT_PLOT',                                'REQUIREMENT_PLOT_ADJACENT_TO_OWNER',                   0               ),
--        (	'REQ_CSC_DISTRICT_IS_BAKERS_QUARTER',                   'REQUIREMENT_PLOT_DISTRICT_TYPE_MATCHES',               0               ),
--        (	'REQ_CSC_BAKERS_QUARTER_RAW_MATERIALS_CHECK',           'REQUIREMENT_REQUIREMENTSET_IS_MET',                    0               ),
        

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RequirementArguments
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO RequirementArguments

        (	RequirementId,				                Name,                   Value		                                )
VALUES  (	'REQ_CSC_PLOT_HAS_BAKERS_QUARTER_RAW',			'Tag',			'CLASS_CSC_BAKERS_RAW'				),
        (       'REQ_CSC_PLOT_HAS_BAKERS_RAW_IMPROVED_SET',             'RequirementSetId',     'REQSET_CSC_PLOT_HAS_BAKERS_RAW_IMPROVED'       );


--	(       'REQ_CSC_DISTRICT_IS_BAKERS_QUARTER',                   'DistrictType',                 'DISTRICT_CSC_BAKERS_QUARTER'                       ),
--      (       'REQ_CSC_BAKERS_QUARTER_RAW_MATERIALS_CHECK',           'RequirementSetId',             'REQSET_CSC_PLOT_HAS_BAKERS_RAW_MATERIALS'      ),     


