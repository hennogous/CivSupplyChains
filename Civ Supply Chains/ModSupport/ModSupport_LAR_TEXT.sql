-- ModSupport_LAR_TEXT
-- Author: Shadow
-- DateCreated: 2025-09-14 16:49:01
--------------------------------------------------------------

UPDATE LocalizedText
SET Text = Text || '[NEWLINE][ICON_BULLET][ICON_RESOURCE_LEU_P0K_QUINOA] Quinoa'
WHERE Tag='LOC_PEDIA_DISTRICTS_PAGE_DISTRICT_CSC_BAKERS_QUARTER_CHAPTER_CSCBASE_PARA_1';

INSERT OR REPLACE INTO LocalizedText
(   Language,   Tag,    Text    )   VALUES
(   'en_US', 'LOC_PEDIA_RESOURCES_PAGE_RESOURCE_LEU_P0K_QUINOA_CHAPTER_CSCQUAR_TITLE', 'Supply Chains'  ),
(   'en_US', 'LOC_PEDIA_RESOURCES_PAGE_RESOURCE_LEU_P0K_QUINOA_CHAPTER_CSCQUAR_PARA_1', 'Base material: [ICON_BAKERS] Bakers'' Quarter'  );
