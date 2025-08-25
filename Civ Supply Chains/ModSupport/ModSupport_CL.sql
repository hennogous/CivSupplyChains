-- ModSupport_CL
-- Author: Shadow
-- DateCreated: 2025-08-09 09:41:06
--------------------------------------------------------------


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	ImprovementModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	

INSERT INTO ImprovementModifiers

        (	ImprovementType,				ModifierId												)	VALUES

-- 	FLOUR MILL --------------------------------------------------------------------------

--  +1 Production to the Water Mill from improved base materials
		(	'IMP_CL_TRADING_POST',			'MOD_CSC_BAKERS_BASE_IMPROVEMENT_ATTACH_QUARTER_WATER'	),

--  +1 Production to the Wind Mill from improved base materials
		(	'IMP_CL_TRADING_POST',			'MOD_CSC_BAKERS_BASE_IMPROVEMENT_ATTACH_QUARTER_WIND'	),

-- 	PATISSERIE --------------------------------------------------------------------------

--  +1 Production to the Patisserie from improved specialty materials
        (	'IMP_CL_TRADING_POST',          'MOD_CSC_BAKERS_SPEC_IMPROVEMENT_ATTACH_QUARTER'		);


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Adjacency_YieldChanges
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

--  Bakers' Quarter

INSERT OR IGNORE INTO Adjacency_YieldChanges

		(	ID,											    Description,									    YieldType,				YieldChange,	AdjacentDistrict                    )
VALUES	(	'CSC_FARMING_TOWN_PRODUCTION_TO_QUARTER',       'LOC_CSC_FARMING_TOWN_PRODUCTION_TO_QUARTER',       'YIELD_PRODUCTION',     1,				'DISTRICT_RURALCOMMUNITYA'          ),
        (	'CSC_FRONTIER_TOWN_PRODUCTION_TO_QUARTER',      'LOC_CSC_FRONTIER_TOWN_PRODUCTION_TO_QUARTER',      'YIELD_PRODUCTION',     1,				'DISTRICT_COREX_FRONTIER_TOWN'      ),

        (	'CSC_MINING_COLONY_PRODUCTION_TO_QUARTER',      'LOC_CSC_MINING_COLONY_PRODUCTION_TO_QUARTER',      'YIELD_PRODUCTION',     1,				'DISTRICT_RURALCOMMUNITYB'          ),
        (	'CSC_TROYU_PRODUCTION_TO_QUARTER',              'LOC_CSC_TROYU_PRODUCTION_TO_QUARTER',              'YIELD_PRODUCTION',     1,				'DISTRICT_COREX_TROYU'              ),
        (	'CSC_TSIKHE_PRODUCTION_TO_QUARTER',             'LOC_CSC_TSIKHE_PRODUCTION_TO_QUARTER',             'YIELD_PRODUCTION',     1,				'DISTRICT_COREX_TSIKHE'             ),

        (	'CSC_FISHING_VILLAGE_PRODUCTION_TO_QUARTER',    'LOC_CSC_FISHING_VILLAGE_PRODUCTION_TO_QUARTER',    'YIELD_PRODUCTION',     1,				'DISTRICT_RURALCOMMUNITYC'          ),
        (	'CSC_GYOSON_PRODUCTION_TO_QUARTER',             'LOC_CSC_GYOSON_PRODUCTION_TO_QUARTER',             'YIELD_PRODUCTION',     1,				'DISTRICT_COREX_GYOSON'             ),

        (	'CSC_CLASSICAL_BOROUGH_GOLD_TO_QUARTER',        'LOC_CSC_CLASSICAL_BOROUGH_GOLD_TO_QUARTER',        'YIELD_GOLD',           1,				'DISTRICT_COREEXPANSIONA'           ),
        (	'CSC_XIAN_GOLD_TO_QUARTER',                     'LOC_CSC_XIAN_GOLD_TO_QUARTER',                     'YIELD_GOLD',           1,				'DISTRICT_COREX_XIAN'               ),
        (	'CSC_UPAPITHA_GOLD_TO_QUARTER',                 'LOC_CSC_UPAPITHA_GOLD_TO_QUARTER',                 'YIELD_GOLD',           1,				'DISTRICT_COREX_UPAPITHA'           ),
        (	'CSC_CLASSICAL_SESTIERE_GOLD_TO_QUARTER',       'LOC_CSC_CLASSICAL_SESTIERE_GOLD_TO_QUARTER',       'YIELD_GOLD',           1,				'DISTRICT_COREX_VENICE_01'          ),

        (	'CSC_RENAISSANCE_BOROUGH_GOLD_TO_QUARTER',      'LOC_CSC_RENAISSANCE_BOROUGH_GOLD_TO_QUARTER',      'YIELD_GOLD',           1,				'DISTRICT_COREEXPANSIONB'           ),
        (	'CSC_RENAISSANCE_SESTIERE_GOLD_TO_QUARTER',     'LOC_CSC_RENAISSANCE_SESTIERE_GOLD_TO_QUARTER',     'YIELD_GOLD',           1,				'DISTRICT_COREX_VENICE_02'          ),
        (	'CSC_FUERTE_GOLD_TO_QUARTER',                   'LOC_CSC_FUERTE_GOLD_TO_QUARTER',                   'YIELD_GOLD',           1,				'DISTRICT_COREX_FUERTE'             ),

        (	'CSC_MODERN_BOROUGH_GOLD_TO_QUARTER',           'LOC_CSC_MODERN_BOROUGH_GOLD_TO_QUARTER',           'YIELD_GOLD',           1,				'DISTRICT_COREEXPANSIONC'           ),
        (	'CSC_ELYSEE_GOLD_TO_QUARTER',                   'LOC_CSC_ELYSEE_GOLD_TO_QUARTER',                   'YIELD_GOLD',           1,				'DISTRICT_COREX_ELYSEE'             );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	District_Adjacencies
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

INSERT OR IGNORE INTO District_Adjacencies

		(	DistrictType,							YieldChangeId								    )
VALUES

--  +1 Production from each adjacent Rural Community, and +1 Food in return
		(	'DISTRICT_CSC_BAKERS_QUARTER',			'CSC_FARMING_TOWN_PRODUCTION_TO_QUARTER'        ),
		(	'DISTRICT_CSC_BAKERS_QUARTER',			'CSC_FRONTIER_TOWN_PRODUCTION_TO_QUARTER'       ),

		(	'DISTRICT_CSC_BAKERS_QUARTER',			'CSC_MINING_COLONY_PRODUCTION_TO_QUARTER'       ),
		(	'DISTRICT_CSC_BAKERS_QUARTER',			'CSC_TROYU_PRODUCTION_TO_QUARTER'               ),
		(	'DISTRICT_CSC_BAKERS_QUARTER',			'CSC_TSIKHE_PRODUCTION_TO_QUARTER'              ),

		(	'DISTRICT_CSC_BAKERS_QUARTER',			'CSC_FISHING_VILLAGE_PRODUCTION_TO_QUARTER'     ),
		(	'DISTRICT_CSC_BAKERS_QUARTER',			'CSC_GYOSON_PRODUCTION_TO_QUARTER'              ),

        (	'DISTRICT_RURALCOMMUNITYA',				'CSC_BAKERS_FOOD_TO_ADJACENT_DISTRICT'		    ),
        (	'DISTRICT_COREX_FRONTIER_TOWN',         'CSC_BAKERS_FOOD_TO_ADJACENT_DISTRICT'		    ),

        (	'DISTRICT_RURALCOMMUNITYB',				'CSC_BAKERS_FOOD_TO_ADJACENT_DISTRICT'		    ),
        (	'DISTRICT_COREX_TROYU',				    'CSC_BAKERS_FOOD_TO_ADJACENT_DISTRICT'		    ),
        (	'DISTRICT_COREX_TSIKHE',				'CSC_BAKERS_FOOD_TO_ADJACENT_DISTRICT'		    ),

        (	'DISTRICT_RURALCOMMUNITYC',				'CSC_BAKERS_FOOD_TO_ADJACENT_DISTRICT'		    ),
        (	'DISTRICT_COREX_GYOSON',				'CSC_BAKERS_FOOD_TO_ADJACENT_DISTRICT'		    ),

--  +1 Gold from each adjacent Urban Borough, and +1 Food in return
		(	'DISTRICT_CSC_BAKERS_QUARTER',			'CSC_CLASSICAL_BOROUGH_GOLD_TO_QUARTER'         ),
		(	'DISTRICT_CSC_BAKERS_QUARTER',			'CSC_XIAN_GOLD_TO_QUARTER'                      ),
		(	'DISTRICT_CSC_BAKERS_QUARTER',			'CSC_UPAPITHA_GOLD_TO_QUARTER'                  ),
		(	'DISTRICT_CSC_BAKERS_QUARTER',			'CSC_CLASSICAL_SESTIERE_GOLD_TO_QUARTER'        ),

		(	'DISTRICT_CSC_BAKERS_QUARTER',			'CSC_RENAISSANCE_BOROUGH_GOLD_TO_QUARTER'       ),
		(	'DISTRICT_CSC_BAKERS_QUARTER',			'CSC_RENAISSANCE_SESTIERE_GOLD_TO_QUARTER'      ),
        (	'DISTRICT_CSC_BAKERS_QUARTER',			'CSC_FUERTE_GOLD_TO_QUARTER'                    ),

		(	'DISTRICT_CSC_BAKERS_QUARTER',			'CSC_MODERN_BOROUGH_GOLD_TO_QUARTER'            ),
		(	'DISTRICT_CSC_BAKERS_QUARTER',			'CSC_ELYSEE_GOLD_TO_QUARTER'                    ),
        
        (	'DISTRICT_COREEXPANSIONA',				'CSC_BAKERS_FOOD_TO_ADJACENT_DISTRICT'		    ),
        (	'DISTRICT_COREX_XIAN',				    'CSC_BAKERS_FOOD_TO_ADJACENT_DISTRICT'		    ),
        (	'DISTRICT_COREX_UPAPITHA',				'CSC_BAKERS_FOOD_TO_ADJACENT_DISTRICT'		    ),
        (	'DISTRICT_COREX_VENICE_01',				'CSC_BAKERS_FOOD_TO_ADJACENT_DISTRICT'		    ),

        (	'DISTRICT_COREEXPANSIONB',				'CSC_BAKERS_FOOD_TO_ADJACENT_DISTRICT'		    ),
        (	'DISTRICT_COREX_VENICE_02',				'CSC_BAKERS_FOOD_TO_ADJACENT_DISTRICT'		    ),
        (	'DISTRICT_COREX_FUERTE',				'CSC_BAKERS_FOOD_TO_ADJACENT_DISTRICT'		    ),

        (	'DISTRICT_COREEXPANSIONC',				'CSC_BAKERS_FOOD_TO_ADJACENT_DISTRICT'          ),
        (	'DISTRICT_COREX_ELYSEE',				'CSC_BAKERS_FOOD_TO_ADJACENT_DISTRICT'          );





