-- CSC_MC_MODE_TEXT
-- Author: Henno
-- DateCreated: 2025-08-09 18:24:19
--------------------------------------------------------------

--===========================================================================================================================================================================--
/*	ENGLISH */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Bakers' Quarter
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR REPLACE INTO LocalizedText

(   Language,   Tag,                                                    Text    )   VALUES

(   'en_US',    'LOC_CSC_BAKERS_PATISSERIE_DESCRIPTION_COMMISSION',             '[NEWLINE][NEWLINE]Unlocks the Commission Fine Pastries project in cities with a Patisserie. Fine Pastries can be placed in the private collection of an Aristocrat or traded with other players, and grant +2 [ICON_Housing] Housing.'),
(   'en_US',    'LOC_RESOURCE_CSC_BAKERS_SPECIALTY_NAME',                       'Fine Pastries Resource'     ),
(   'en_US',    'LOC_GREATWORK_PRODUCT_CSC_BAKERS_X_NAME',                      'Fine Pastries'    ),
(   'en_US',    'LOC_PROJECT_CSC_COMMISSION_BAKERS_SPECIALTY_NAME',             'Commission Fine Pastries'      ),
(   'en_US',    'LOC_PROJECT_CSC_COMMISSION_BAKERS_SPECIALTY_SHORT_NAME',       'Commission Fine Pastries Short Name'    ),
(   'en_US',    'LOC_PROJECT_CSC_COMMISSION_BAKERS_SPECIALTY_DESCRIPTION',      'Fine Pastries can be placed in the private collection of an Aristocrat or traded with other players.'   );

UPDATE LocalizedText
SET Text = '+1 [ICON_Production] Production from each adjacent base materials improvement, increased to +2 [ICON_Production] Production from an Industry, and +3 [ICON_Production] Production from a Corporation.[NEWLINE]+1 [ICON_Food] Food, with a -1 [ICON_Gold] Gold maintenance cost.[NEWLINE]+1 [ICON_Gold] Gold from the local Bakery and Patisserie.[NEWLINE]+1 [ICON_Food] Food bonus to [ICON_TradeRoute] trade routes to the city, and +1 [ICON_Gold] Gold in return from international routes.[NEWLINE]+1 [ICON_Food] Food to an adjacent Granary, and receive +1 [ICON_Gold] Gold in return'
WHERE Tag = 'LOC_BUILDING_CSC_BAKERS_FLOUR_MILL_DESCRIPTION';