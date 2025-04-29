-- CSC_SupplyChains
-- Author: Shadow
-- DateCreated: 4/19/2025 10:53:08
--------------------------------------------------------------

-- Tags
--------------------------------------------------------------
INSERT OR IGNORE INTO Tags

		(	Tag,								    Vocabulary			)
VALUES	(	'CLASS_CSC_BAKERS_RAW',	            	'RESOURCE_CLASS'	);
--------------------------------------------------------------

-- TypeTags
--------------------------------------------------------------
INSERT OR IGNORE INTO TypeTags

		(	Type,				Tag							)
SELECT		ResourceType,		'CLASS_CSC_BAKERS_RAW'
FROM		Resources
WHERE		ResourceType IN
		(	'RESOURCE_BANANAS',
			'RESOURCE_MAIZE',
			'RESOURCE_RICE',
			'RESOURCE_WHEAT'
		);
--------------------------------------------------------------

Requirements
--------------------------------------------------------------
INSERT OR IGNORE INTO Requirements
		(RequirementId,								                RequirementType)
VALUES	('REQ_CSC_PLOT_HAS_ADJACENT_BAKERS_RAW_RESOURCE',		    'REQUIREMENT_PLOT_RESOURCE_TAG_MATCHES');
--------------------------------------------------------------

RequirementArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementArguments
		(RequirementId,								                Name,				Value)
VALUES	('REQ_CSC_PLOT_HAS_ADJACENT_BAKERS_RAW_RESOURCE',		    'Tag',				'CLASS_CSC_BAKERS_RAW');