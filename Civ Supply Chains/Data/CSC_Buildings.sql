-- CSC_Buildings
-- Author: Henno
-- DateCreated: 4/19/2025 10:53:23
--------------------------------------------------------------

--===========================================================================================================================================================================--
/* TYPES */
--===========================================================================================================================================================================--

INSERT INTO Types

		(	Type,							Kind)
VALUES	(	'BUILDING_CSC_FLOUR_MILL',		'KIND_BUILDING');



--===========================================================================================================================================================================--
/* BUILDINGS */
--===========================================================================================================================================================================--

INSERT INTO Buildings

		(BuildingType,
		Name,
		Description,
		PrereqTech,
		Cost,
		PrereqDistrict,
		PurchaseYield,
		AdvisorType)
VALUES	(
		/*BuildingType,*/		'BUILDING_CSC_FLOUR_MILL',
		/*Name,*/				'LOC_CSC_BAKERS_QUARTER_FLOUR_MILL_NAME',
		/*Description,*/		'LOC_CSC_BAKERS_QUARTER_FLOUR_MILL_DESCRIPTION',
		/*PrereqTech,*/			'TECH_THE_WHEEL',
		/*Cost,*/				80,
		/*PrereqDistrict,*/		'DISTRICT_CSC_BAKERS_QUARTER',
		/*PurchaseYield,*/		'YIELD_GOLD',
		/*AdvisorType*/			'ADVISOR_GENERIC'
		);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BuildingModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT INTO BuildingModifiers

        (	BuildingType,		            				ModifierId			                                )
VALUES  (	'BUILDING_CSC_FLOUR_MILL',       				'CSC_BAKERS_FLOUR_MILL_GOLD_TO_ADJACENT_RAW'      	),
		(	'BUILDING_CSC_FLOUR_MILL',						'CSC_BAKERS_FLOUR_MILL_FOOD_UPGRADE'				);



--===========================================================================================================================================================================--
/* IMPROVEMENTS */
--===========================================================================================================================================================================--

INSERT INTO ImprovementModifiers

        (	ImprovementType,		        		ModifierId			                        								)
VALUES  (	'IMPROVEMENT_FARM',                     'CSC_BAKERS_FLOUR_MILL_IMPROVEMENT_FOOD_ATTACH_QUARTER'             		),
		(	'IMPROVEMENT_FARM',                     'CSC_BAKERS_FLOUR_MILL_IMPROVEMENT_GOLD_ATTACH_QUARTER'             		),
		
        (	'IMPROVEMENT_PLANTATION',               'CSC_BAKERS_FLOUR_MILL_IMPROVEMENT_FOOD_ATTACH_QUARTER'                		),
		(	'IMPROVEMENT_PLANTATION',               'CSC_BAKERS_FLOUR_MILL_IMPROVEMENT_GOLD_ATTACH_QUARTER'                		);



--===========================================================================================================================================================================--
/* MODIFIERS */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Modifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT INTO Modifiers

		(	ModifierId,													ModifierType,												OwnerRequirementSetId,				SubjectRequirementSetId,								SubjectStackLimit	)
VALUES	(	'CSC_BAKERS_FLOUR_MILL_GOLD_TO_ADJACENT_RAW',				'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',						NULL,								'REQSET_CSC_PLOT_HAS_BAKERS_RAW_IMPROVED_ADJACENT',		NULL      			),

        (  	'CSC_BAKERS_FLOUR_MILL_IMPROVEMENT_FOOD_ATTACH_QUARTER',	'MODIFIER_CSC_PLAYER_DISTRICTS_ATTACH_MODIFIER',     		'REQSET_CSC_PLOT_HAS_BAKERS_RAW', 	'REQSET_CSC_ADJACENT_BAKERS_QUARTER',    				NULL				),
        (  	'CSC_BAKERS_FLOUR_MILL_FOOD_FROM_ADJACENT_RAW',    			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',  	NULL,                           	NULL,                                    				1					),

        (  	'CSC_BAKERS_FLOUR_MILL_IMPROVEMENT_GOLD_ATTACH_QUARTER',	'MODIFIER_CSC_PLAYER_DISTRICTS_ATTACH_MODIFIER',     		'REQSET_CSC_PLOT_HAS_BAKERS_RAW', 	'REQSET_CSC_ADJACENT_BAKERS_QUARTER',    				NULL				),
		(  	'CSC_BAKERS_FLOUR_MILL_GOLD_FROM_ADJACENT_RAW',    			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',  	NULL,                           	NULL,                                    				1					),

		(	'CSC_BAKERS_FLOUR_MILL_FOOD_UPGRADE',						'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',		NULL,								'REQSET_CSC_BAKERS_FLOUR_MILL_UPGRADE',					NULL				);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ModifierArguments
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
INSERT INTO ModifierArguments
		
        (	ModifierId,			                      					Name,                       Value		                						)
VALUES  (	'CSC_BAKERS_FLOUR_MILL_GOLD_TO_ADJACENT_RAW',    			'YieldType',	            'YIELD_GOLD'                						),
        (	'CSC_BAKERS_FLOUR_MILL_GOLD_TO_ADJACENT_RAW',    			'Amount',		            1		                    						),

		(	'CSC_BAKERS_FLOUR_MILL_IMPROVEMENT_FOOD_ATTACH_QUARTER',	'ModifierId',				'CSC_BAKERS_FLOUR_MILL_FOOD_FROM_ADJACENT_RAW'		),
		(	'CSC_BAKERS_FLOUR_MILL_FOOD_FROM_ADJACENT_RAW',				'BuildingType',				'BUILDING_CSC_FLOUR_MILL'							),
		(	'CSC_BAKERS_FLOUR_MILL_FOOD_FROM_ADJACENT_RAW',				'YieldType',				'YIELD_FOOD'										),
		(	'CSC_BAKERS_FLOUR_MILL_FOOD_FROM_ADJACENT_RAW',				'Amount',					1													),

		(	'CSC_BAKERS_FLOUR_MILL_IMPROVEMENT_GOLD_ATTACH_QUARTER',	'ModifierId',				'CSC_BAKERS_FLOUR_MILL_GOLD_FROM_ADJACENT_RAW'		),
		(	'CSC_BAKERS_FLOUR_MILL_GOLD_FROM_ADJACENT_RAW',				'BuildingType',				'BUILDING_CSC_FLOUR_MILL'							),
		(	'CSC_BAKERS_FLOUR_MILL_GOLD_FROM_ADJACENT_RAW',				'YieldType',				'YIELD_GOLD'										),
		(	'CSC_BAKERS_FLOUR_MILL_GOLD_FROM_ADJACENT_RAW',				'Amount',					1													),

		(	'CSC_BAKERS_FLOUR_MILL_FOOD_UPGRADE',						'BuildingType',				'BUILDING_CSC_FLOUR_MILL'							),
		(	'CSC_BAKERS_FLOUR_MILL_FOOD_UPGRADE',						'YieldType',				'YIELD_FOOD'										),
		(	'CSC_BAKERS_FLOUR_MILL_FOOD_UPGRADE',						'Amount',					1													);

--===========================================================================================================================================================================--
/* REQUIREMENTS */
--===========================================================================================================================================================================--

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RequirementSets
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
INSERT INTO RequirementSets 
		
        (	RequirementSetId,                              	RequirementSetType              )
VALUES  (	'REQSET_CSC_BAKERS_FLOUR_MILL_UPGRADE',			'REQUIREMENTSET_TEST_ALL'		);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RequirementSetRequirements
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
				
INSERT INTO RequirementSetRequirements
		
        (	RequirementSetId,		                      	RequirementId	                               	)
VALUES  (	'REQSET_CSC_BAKERS_FLOUR_MILL_UPGRADE',			'REQ_CSC_BAKERS_FLOUR_MILL_UPGRADE'				);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Requirements
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Requirements
        
        (	RequirementId,		                          	RequirementType,	                                Inverse         )
VALUES  (	'REQ_CSC_BAKERS_FLOUR_MILL_UPGRADE',			'REQUIREMENT_PLAYER_HAS_CIVIC',						0				);


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RequirementArguments
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO RequirementArguments 

        (	RequirementId,				               		Name,                           Value		                    	)
VALUES  ( 	'REQ_CSC_BAKERS_FLOUR_MILL_UPGRADE',			'CivicType',					'CIVIC_FEUDALISM'					);