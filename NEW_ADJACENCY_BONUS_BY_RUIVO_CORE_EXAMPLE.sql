--模块化相邻加成示例
    INSERT INTO Ruivo_New_Adjacency 
    (ID, DistrictType,                              -->ID和区域（注意，一定要以区域为主体，ID是主键，不要重复）
    ProvideType, YieldType, YieldChange,            -->提供的产出分类、产出类型、产出量（产出类型一定要严格对应产出分类，比如商路对应商路大类）
    AdjacencyType, CustomAdjacentObject, Rings,     -->相邻类型、自定义指定相邻目标（指定相邻目标依赖于相邻类型）
    DistrictModifiers)                                    
    VALUES 


--堤坝：每相邻一段河流+1粮+1锤
    ('RUIVO_DISTRICT_DAM_YIELD_FOOD_FROM_RIVER_CROSSING', 'DISTRICT_DAM', 
    'SelfBonus', 'YIELD_FOOD', 1.0, 
    'FROM_RIVER_CROSSING', 'NONE', 1,
    1),
    ('RUIVO_DISTRICT_DAM_YIELD_PRODUCTION_FROM_RIVER_CROSSING', 'DISTRICT_DAM', 
    'SelfBonus', 'YIELD_PRODUCTION', 1.0, 
    'FROM_RIVER_CROSSING', 'NONE', 1,
    1),
    

--运河：每个相邻在岗公民+2金币
    ('RUIVO_DISTRICT_CANAL_YIELD_GOLD_FROM_ADJACENT_WORKER', 'DISTRICT_CANAL', 
    'SelfBonus', 'YIELD_GOLD', 2, 
    'FROM_ADJACENT_WORKER', 'NONE', 1,
    1),


--水渠：每个相邻湖泊+1粮，根据所在单元格的淡水等级获得生产力，获得相邻单元格淡水等级总和10%的住房（无水0，咸水1，淡水3）
    ('RUIVO_DISTRICT_AQUEDUCT_YIELD_FOOD_FROM_ADJACENT_LAKE', 'DISTRICT_AQUEDUCT', 
    'SelfBonus', 'YIELD_FOOD', 1, 
    'FROM_ADJACENT_LAKE', 'NONE', 1,
    1),
    ('RUIVO_DISTRICT_AQUEDUCT_YIELD_PRODUCTION_FROM_SELF_WATER_LEVEL', 'DISTRICT_AQUEDUCT', 
    'SelfBonus', 'YIELD_PRODUCTION', 1, 
    'FROM_SELF_WATER_LEVEL', 'NONE', 1,
    1),
    ('RUIVO_DISTRICT_AQUEDUCT_YIELD_HOUSING_FROM_ADJACENT_WATER_LEVEL', 'DISTRICT_AQUEDUCT', 
    'SelfHousing', 'YIELD_HOUSING', 0.1, 
    'FROM_ADJACENT_WATER_LEVEL', 'NONE', 1,
    1),


--工业区：获得相邻道路等级之和34%的生产力（6条铁路+10生产力），所在单元格每个等级的道路+10%生产力系数（有铁路时+50%生产力系数）
    ('RUIVO_DISTRICT_INDUSTRIAL_ZONE_YIELD_PRODUCTION_FROM_ADJACENT_ROUTE', 'DISTRICT_INDUSTRIAL_ZONE', 
    'SelfBonus', 'YIELD_PRODUCTION', 0.34, 
    'FROM_ADJACENT_ROUTE', 'NONE', 1,
    1),
    ('RUIVO_DISTRICT_INDUSTRIAL_ZONE_MODIFIER_PRODUCTION_FROM_SELF_ROUTE', 'DISTRICT_INDUSTRIAL_ZONE', 
    'SelfMultiplier', 'YIELD_PRODUCTION', 10, 
    'FROM_SELF_ROUTE', 'NONE', 1,
    1),

    
--军营：获得城市防御10%的生产力，相邻单位+1忠诚度
    ('RUIVO_DISTRICT_ENCAMPMENT_YIELD_PRODUCTION_FROM_CITY_DEFENSE_STRENGTH', 'DISTRICT_ENCAMPMENT', 
    'SelfBonus', 'YIELD_PRODUCTION', 0.1, 
    'FROM_CITY_DEFENSE_STRENGTH', 'NONE', 1,
    1),
    ('RUIVO_DISTRICT_ENCAMPMENT_YIELD_LOYALTY_FROM_ADJACENT_UNIT', 'DISTRICT_ENCAMPMENT', 
    'SelfLoyalty', 'YIELD_LOYALTY', 1, 
    'FROM_ADJACENT_UNIT', 'NONE', 1,
    1);


--社区：
    INSERT INTO Ruivo_New_Adjacency 
    (ID,                                                                         DistrictType,                   YieldType,               AdjacencyType,                YieldChange,        DistrictModifiers,  TraitType,  FreeCompose) VALUES 
--本城每个人口为社区+0.5生产力
    ('RUIVO_DISTRICT_NEIGHBORHOOD_YIELD_PRODUCTION_FROM_CITY_POPULATION',       'DISTRICT_NEIGHBORHOOD',        'YIELD_PRODUCTION',      'FROM_CITY_POPULATION',        0.5,                1,                  NULL,       0),
--本城每个住房为社区+0.25粮食
    ('RUIVO_DISTRICT_NEIGHBORHOOD_YIELD_FOOD_FROM_CITY_TOTAL_HOUSING',          'DISTRICT_NEIGHBORHOOD',        'YIELD_FOOD',            'FROM_CITY_TOTAL_HOUSING',     0.25,               1,                  NULL,       0),
--本城剩余住房为社区+1金币
    ('RUIVO_DISTRICT_NEIGHBORHOOD_YIELD_GOLD_FROM_CITY_SURPLUS_HOUSING',        'DISTRICT_NEIGHBORHOOD',        'YIELD_GOLD',            'FROM_CITY_SURPLUS_HOUSING',   1,                  1,                  NULL,       0);


--商业中心、娱乐中心、水上乐园
    INSERT INTO Ruivo_New_Adjacency
    (ID,                                                                                   DistrictType,                           YieldType,   YieldChange, AdjacencyType,                DistrictModifiers, ProvideType)  VALUES 
--商业中心：每经营一条贸易路线，+2金币
    ('RUIVO_DISTRICT_COMMERCIAL_HUB_YIELD_GOLD_FROM_OUTGOING_ROUTES',                     'DISTRICT_COMMERCIAL_HUB',              'YIELD_GOLD', 2,          'FROM_OUTGOING_ROUTES',        1,                 'SelfBonus'),
--娱乐中心：本城每点溢出宜居度，+2金币
    ('RUIVO_DISTRICT_ENTERTAINMENT_COMPLEX_YIELD_GOLD_FROM_CITY_SURPLUS_AMENITIES',       'DISTRICT_ENTERTAINMENT_COMPLEX',       'YIELD_GOLD', 2,          'FROM_CITY_SURPLUS_AMENITIES', 1,                 'SelfBonus'),
--水上乐园：本城每点溢出宜居度，+4金币
    ('RUIVO_DISTRICT_WATER_ENTERTAINMENT_COMPLEX_YIELD_GOLD_FROM_CITY_SURPLUS_AMENITIES', 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX', 'YIELD_GOLD', 4,          'FROM_CITY_SURPLUS_AMENITIES', 1,                 'SelfBonus');


--剧院广场/学院：本区域内每有一个在岗公民，相邻加成提高25%
    INSERT INTO Ruivo_New_Adjacency
    (ID,                                                          DistrictType,       YieldType,      YieldChange,  AdjacencyType,     DistrictModifiers, ProvideType) 
    VALUES 
    ('RUIVO_DISTRICT_THEATER_YIELD_CULTURE_FROM_SELF_WORKER',    'DISTRICT_THEATER', 'YIELD_CULTURE', 25,          'FROM_SELF_WORKER', 1,                'SelfMultiplier'),
    ('RUIVO_DISTRICT_CAMPUS_YIELD_SCIENCE_FROM_SELF_WORKER',     'DISTRICT_CAMPUS',  'YIELD_SCIENCE', 25,          'FROM_SELF_WORKER', 1,                'SelfMultiplier');


--外交区每相邻一个区域+1影响力+1外交支持
--航空港每相邻一个区域+1旅游业绩+1贸易路线
    INSERT INTO Ruivo_New_Adjacency   (ID, DistrictType, YieldType, YieldChange, AdjacencyType, DistrictModifiers, TraitType,  ProvideType) VALUES 
    ('RUIVO_DISTRICT_DIPLOMATIC_QUARTER_YIELD_INFLUENCE_FROM_ADJACENT_DISTRICT', 'DISTRICT_DIPLOMATIC_QUARTER', 'YIELD_INFLUENCE', 1.0, 'FROM_ADJACENT_DISTRICT', 1,NULL, 'SelfInfluence'),
    ('RUIVO_DISTRICT_DIPLOMATIC_QUARTER_YIELD_FAVOR_FROM_ADJACENT_DISTRICT', 'DISTRICT_DIPLOMATIC_QUARTER', 'YIELD_FAVOR', 1.0, 'FROM_ADJACENT_DISTRICT', 1,NULL, 'SelfFavor'),
    ('RUIVO_DISTRICT_AERODROME_YIELD_TOURISM_FROM_ADJACENT_DISTRICT', 'DISTRICT_AERODROME', 'YIELD_TOURISM', 1.0, 'FROM_ADJACENT_DISTRICT', 1,NULL, 'SelfTourism'),
    ('RUIVO_DISTRICT_AERODROME_YIELD_TRADE_ROUTE_FROM_ADJACENT_DISTRICT', 'DISTRICT_AERODROME', 'YIELD_TRADE_ROUTE', 1.0, 'FROM_ADJACENT_DISTRICT', 1,NULL, 'SelfTradeRoute');


--============================================================================================================================
--运河在岗人数为6时金币相邻加成翻倍
--我还提供了统计总数和乘了系数后的总数的property
--相邻某个对象数量：ID || '_TOTAL'
--得到的相邻加成总数：ID || '_ACTUAL_AMOUNT'
        --插入部分
        INSERT INTO DistrictModifiers (DistrictType, ModifierId)
        SELECT "DISTRICT_CANAL", "DISTRICT_CANAL_ADJUST_YIELD_MODIFIER_FROM_ADJACENT_WORKER_6"
        WHERE EXISTS (SELECT 1 FROM Districts WHERE DistrictType = "DISTRICT_CANAL");

        --modifier组装部分
        INSERT INTO Modifiers (ModifierId, ModifierType, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
        ("DISTRICT_CANAL_ADJUST_YIELD_MODIFIER_FROM_ADJACENT_WORKER_6", "RUIVO_MODIFIER_PLAYER_DISTRICT_ADJUST_YIELD_MODIFIER", 'REQUIREMENT_RUIVO_DISTRICT_CANAL_YIELD_GOLD_FROM_ADJACENT_WORKER', NULL);
        INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
        ("DISTRICT_CANAL_ADJUST_YIELD_MODIFIER_FROM_ADJACENT_WORKER_6", "Amount", 100), 
        ("DISTRICT_CANAL_ADJUST_YIELD_MODIFIER_FROM_ADJACENT_WORKER_6", "YieldType", "YIELD_GOLD");

        --req组装部分：6相邻在岗公民
        INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
        ('REQUIREMENT_RUIVO_DISTRICT_CANAL_YIELD_GOLD_FROM_ADJACENT_WORKER', 'REQUIREMENTSET_TEST_ALL');
        INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
        ('REQUIREMENT_RUIVO_DISTRICT_CANAL_YIELD_GOLD_FROM_ADJACENT_WORKER', 'REQUIRES_RUIVO_DISTRICT_CANAL_YIELD_GOLD_FROM_ADJACENT_WORKER');
        INSERT INTO Requirements (RequirementId, RequirementType) VALUES
        ('REQUIRES_RUIVO_DISTRICT_CANAL_YIELD_GOLD_FROM_ADJACENT_WORKER', 'REQUIREMENT_PLOT_PROPERTY_MATCHES');
        INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES
        ('REQUIRES_RUIVO_DISTRICT_CANAL_YIELD_GOLD_FROM_ADJACENT_WORKER', 'PropertyName', 'RUIVO_DISTRICT_CANAL_YIELD_GOLD_FROM_ADJACENT_WORKER'||'_TOTAL'),
        ('REQUIRES_RUIVO_DISTRICT_CANAL_YIELD_GOLD_FROM_ADJACENT_WORKER', 'PropertyMinimum', 6);
--============================================================================================================================


--============================================================================================================================
--港口：本城每有一个区域，捕捞范围+1环，捕捞范围内的浅海和深海单元格+1金币，随着环数递增（比如1环+1金，3环+3金）
    -- 最高10环
    CREATE TABLE Ruivo_RingList (Num INTEGER PRIMARY KEY);
    INSERT INTO Ruivo_RingList (Num) VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

    --自由组装模式
    INSERT INTO Ruivo_New_Adjacency
    (ID,                                                          DistrictType,      YieldType,   YieldChange, AdjacencyType,            DistrictModifiers, FreeCompose)  VALUES 
    ('RUIVO_DISTRICT_HARBOR_YIELD_GOLD_FROM_CITY_DISTRICTS_NUM', 'DISTRICT_HARBOR', 'YIELD_GOLD', 1,          'FROM_CITY_DISTRICTS_NUM', 1,                 1);

    -- 区域贴给玩家单元格
    INSERT INTO DistrictModifiers (DistrictType, ModifierId) 
    SELECT "DISTRICT_HARBOR", 'LONG_RANGE_FISHING_DISTRICT_HARBOR' || '_' || ListB.Num FROM Ruivo_RingList ListB;

        -- 区域满足本城区域总数，单元格满足相邻区域
            INSERT INTO Modifiers (ModifierId, ModifierType, OwnerRequirementSetId, SubjectRequirementSetId) 
            SELECT 'LONG_RANGE_FISHING_DISTRICT_HARBOR' || '_' || ListB.Num, 
                "MODIFIER_PLAYER_ADJUST_PLOT_YIELD", 
                'REQUIREMENT_' || 'LONG_RANGE_FISHING_DISTRICT_HARBOR' || '_' || ListB.Num,
                'REQUIREMENT_' || 'RUIVO_ADJACENT_TO_OWNER' || '_' || ListB.Num
            FROM Ruivo_RingList ListB;

            INSERT INTO ModifierArguments (ModifierId, Name, Value)
            SELECT 'LONG_RANGE_FISHING_DISTRICT_HARBOR' || '_' || ListB.Num, 
                "Amount", 
                ListB.Num
            FROM Ruivo_RingList ListB
            UNION
            SELECT 'LONG_RANGE_FISHING_DISTRICT_HARBOR' || '_' || ListB.Num, 
                "YieldType", 
                "YIELD_GOLD"
            FROM Ruivo_RingList ListB;

        --REQ部分：本城区域总数--只能用十进制
            INSERT INTO RequirementSets (RequirementSetId,                      RequirementSetType)
            SELECT          'REQUIREMENT_' || 'LONG_RANGE_FISHING_DISTRICT_HARBOR' || '_' || ListB.Num,    'REQUIREMENTSET_TEST_ALL'                         	FROM Ruivo_RingList ListB;

            INSERT INTO RequirementSetRequirements (RequirementSetId,           RequirementId)
            SELECT          'REQUIREMENT_' || 'LONG_RANGE_FISHING_DISTRICT_HARBOR' || '_' || ListB.Num,    'REQUIRES_' || 'LONG_RANGE_FISHING_DISTRICT_HARBOR' || '_' || ListB.Num     		FROM Ruivo_RingList ListB;

            INSERT INTO Requirements (RequirementId,                            RequirementType)
            SELECT          'REQUIRES_' || 'LONG_RANGE_FISHING_DISTRICT_HARBOR' || '_' || ListB.Num,       'REQUIREMENT_PLOT_PROPERTY_MATCHES'                  FROM Ruivo_RingList ListB;

            INSERT INTO RequirementArguments (RequirementId,                    Name,                 Value)
            SELECT          'REQUIRES_' || 'LONG_RANGE_FISHING_DISTRICT_HARBOR' || '_' || ListB.Num,       'PropertyName',       'RUIVO_DISTRICT_HARBOR_YIELD_GOLD_FROM_CITY_DISTRICTS_NUM'||'_TOTAL'   FROM Ruivo_RingList ListB
            UNION SELECT    'REQUIRES_' || 'LONG_RANGE_FISHING_DISTRICT_HARBOR' || '_' || ListB.Num,       'PropertyMinimum',    ListB.Num                          	FROM Ruivo_RingList ListB;

        --通用的req：
        --REQ部分：对应环数
            INSERT INTO RequirementSets (RequirementSetId,                      RequirementSetType)
            SELECT          'REQUIREMENT_' || 'RUIVO_ADJACENT_TO_OWNER' || '_' || ListB.Num,    'REQUIREMENTSET_TEST_ALL'                         	FROM Ruivo_RingList ListB;

            INSERT INTO RequirementSetRequirements (RequirementSetId,           RequirementId)
            SELECT          'REQUIREMENT_' || 'RUIVO_ADJACENT_TO_OWNER' || '_' || ListB.Num,    'REQUIRES_' || 'RUIVO_ADJACENT_TO_OWNER' || '_' || ListB.Num     		FROM Ruivo_RingList ListB
            UNION SELECT    'REQUIREMENT_' || 'RUIVO_ADJACENT_TO_OWNER' || '_' || ListB.Num,    'REQUIRES_PLOT_IS_COAST_OR_OCEAN_RUIVO'                          	    FROM Ruivo_RingList ListB;

            INSERT INTO Requirements (RequirementId,                            RequirementType)
            SELECT          'REQUIRES_' || 'RUIVO_ADJACENT_TO_OWNER' || '_' || ListB.Num,       'REQUIREMENT_PLOT_ADJACENT_TO_OWNER'                  FROM Ruivo_RingList ListB;

            INSERT INTO RequirementArguments (RequirementId,                    Name,                 Value)
            SELECT          'REQUIRES_' || 'RUIVO_ADJACENT_TO_OWNER' || '_' || ListB.Num,       'MaxDistance',      ListB.Num   FROM Ruivo_RingList ListB
            UNION SELECT    'REQUIRES_' || 'RUIVO_ADJACENT_TO_OWNER' || '_' || ListB.Num,       'MinDistance',      ListB.Num   FROM Ruivo_RingList ListB;
        --REQ部分：湖泊海岸或者海洋单元格
            insert or ignore into RequirementSets (RequirementSetId,		RequirementSetType) values
                ('REQUIREMENTS_PLOT_IS_COAST_OR_OCEAN_RUIVO',				'REQUIREMENTSET_TEST_ANY');

            insert or ignore into RequirementSetRequirements
                (RequirementSetId,											RequirementId)
            values
                ('REQUIREMENTS_PLOT_IS_COAST_OR_OCEAN_RUIVO',				'REQUIRES_TERRAIN_COAST'),
                ('REQUIREMENTS_PLOT_IS_COAST_OR_OCEAN_RUIVO',				'REQUIRES_TERRAIN_OCEAN');

            insert or ignore into Requirements (RequirementId,		        RequirementType) values
                ('REQUIRES_PLOT_IS_COAST_OR_OCEAN_RUIVO',			        'REQUIREMENT_REQUIREMENTSET_IS_MET');

            insert or ignore into RequirementArguments (RequirementId,		Name,		Value) values
                ('REQUIRES_PLOT_IS_COAST_OR_OCEAN_RUIVO',			        'RequirementSetId',	'REQUIREMENTS_PLOT_IS_COAST_OR_OCEAN_RUIVO');
--============================================================================================================================


--============================================================================================================================
--宇航中心：以地图南北纬度-50°和+50°为宇航标准线，根据接近赤道程度获得等量的科技值加成
--获得赤道接近程度等量的宇航项目生产力加成，获得两极接近程度等量的宇航项目生产力减益，在宇航标准线上的宇航中心获得0加成和0减益
    INSERT INTO Ruivo_New_Adjacency 
    (ID,                                                         DistrictType,             YieldType,           YieldChange,    AdjacencyType,      DistrictModifiers,  TraitType,  FreeCompose) VALUES 
    ('RUIVO_DISTRICT_SPACEPORT_YIELD_SCIENCE_FROM_LATITUDE',    'DISTRICT_SPACEPORT',     'YIELD_SCIENCE',      1,             'FROM_LATITUDE',     1,                  NULL,       0),
    ('RUIVO_DISTRICT_SPACEPORT_YIELD_PRODUCTION_FROM_POLE',     'DISTRICT_SPACEPORT',     'YIELD_PRODUCTION',   1,             'FROM_POLE',         1,                  NULL,       1);
--============================================================================================================================
--modifier绑给区域部分
    INSERT INTO DistrictModifiers (DistrictType,                        ModifierId)
    SELECT 'DISTRICT_SPACEPORT', 'RUIVO_DISTRICT_SPACEPORT_SPACE_RACE_FROM_LATITUDE' || '_' || ListB.Num    FROM Ruivo_BinaryList ListB;
    INSERT INTO DistrictModifiers (DistrictType,                        ModifierId)
    SELECT 'DISTRICT_SPACEPORT', 'RUIVO_DISTRICT_SPACEPORT_SPACE_RACE_FROM_POLE' || '_' || ListB.Num    FROM Ruivo_BinaryList ListB;
--============================================================================================================================
--自定义 ModifierType
    INSERT INTO Types (Type, Kind)
    VALUES
    ('RUIVO_MODIFIER_OWNER_CITY_ADJUST_SPACE_RACE_PROJECTS_PRODUCTION', 'KIND_MODIFIER');
    INSERT INTO DynamicModifiers (ModifierType, EffectType, CollectionType)
    VALUES
    ('RUIVO_MODIFIER_OWNER_CITY_ADJUST_SPACE_RACE_PROJECTS_PRODUCTION', 'EFFECT_ADJUST_SPACE_RACE_PROJECTS_PRODUCTION', 'COLLECTION_OWNER_CITY');
--============================================================================================================================
--Modifier组装部分
    INSERT INTO Modifiers (ModifierId,              ModifierType,                    OwnerRequirementSetId,                                             SubjectRequirementSetId)
    SELECT 'RUIVO_DISTRICT_SPACEPORT_SPACE_RACE_FROM_LATITUDE' || '_' || ListB.Num, 'RUIVO_MODIFIER_OWNER_CITY_ADJUST_SPACE_RACE_PROJECTS_PRODUCTION', 'REQUIREMENT_' || 'RUIVO_DISTRICT_SPACEPORT_YIELD_SCIENCE_FROM_LATITUDE' || '_' || ListB.Num, NULL     FROM Ruivo_BinaryList ListB;
    INSERT INTO ModifierArguments (ModifierId,                          Name,               Value)
    SELECT 'RUIVO_DISTRICT_SPACEPORT_SPACE_RACE_FROM_LATITUDE' || '_' || ListB.Num, 'Amount', ListB.Num     FROM Ruivo_BinaryList ListB;
    INSERT INTO Modifiers (ModifierId,              ModifierType,                    OwnerRequirementSetId,                                             SubjectRequirementSetId)
    SELECT 'RUIVO_DISTRICT_SPACEPORT_SPACE_RACE_FROM_POLE' || '_' || ListB.Num, 'RUIVO_MODIFIER_OWNER_CITY_ADJUST_SPACE_RACE_PROJECTS_PRODUCTION', 'REQUIREMENT_' || 'RUIVO_DISTRICT_SPACEPORT_YIELD_PRODUCTION_FROM_POLE' || '_' || ListB.Num, NULL     FROM Ruivo_BinaryList ListB;
    INSERT INTO ModifierArguments (ModifierId,                          Name,               Value)
    SELECT 'RUIVO_DISTRICT_SPACEPORT_SPACE_RACE_FROM_POLE' || '_' || ListB.Num, 'Amount', -1 * ListB.Num     FROM Ruivo_BinaryList ListB;
--============================================================================================================================


--============================================================================================================================
--市政广场
    INSERT INTO Ruivo_New_Adjacency 
    (ID,                                                                     DistrictType,          YieldType,  YieldChange, AdjacencyType,   DistrictModifiers, TraitType,  ProvideType,          ModifierOwner, WhoIsTheOwner,  FreeCompose) VALUES 
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_TRADE_ROUTE_FROM_SLOT_ECONOMIC',      'DISTRICT_GOVERNMENT', 'YIELD_TRADE_ROUTE',1.0, 'FROM_SLOT_ECONOMIC', 1,                  NULL, 'SelfTradeRoute',     'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_AMENITY_FROM_SLOT_ECONOMIC',          'DISTRICT_GOVERNMENT', 'YIELD_AMENITY',    1.0, 'FROM_SLOT_ECONOMIC', 1,                  NULL, 'SelfAmenity',        'DistrictModifiers', NULL,      0),

    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_HOUSING_FROM_SLOT_MILITARY',          'DISTRICT_GOVERNMENT', 'YIELD_HOUSING',    1.0, 'FROM_SLOT_MILITARY', 1,                  NULL, 'SelfHousing',        'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_DISTRICT_SLOT_FROM_SLOT_MILITARY',   'DISTRICT_GOVERNMENT','YIELD_DISTRICT_SLOT',1.0, 'FROM_SLOT_MILITARY', 1,                  NULL, 'SelfLoyalty',        'DistrictModifiers', NULL,      0),

    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_INFLUENCE_FROM_SLOT_DIPLOMATIC',      'DISTRICT_GOVERNMENT', 'YIELD_INFLUENCE',  1.0, 'FROM_SLOT_DIPLOMATIC', 1,                NULL, 'SelfInfluence',      'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_FAVOR_FROM_SLOT_DIPLOMATIC',          'DISTRICT_GOVERNMENT', 'YIELD_FAVOR',      1.0, 'FROM_SLOT_DIPLOMATIC', 1,                NULL, 'SelfFavor',          'DistrictModifiers', NULL,      0),

    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_FOOD_FROM_SLOT_WILDCARD',             'DISTRICT_GOVERNMENT', 'YIELD_FOOD',       1.0, 'FROM_SLOT_WILDCARD', 1,                  NULL, 'SelfBonus',          'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_PRODUCTION_FROM_SLOT_WILDCARD',       'DISTRICT_GOVERNMENT', 'YIELD_PRODUCTION', 1.0, 'FROM_SLOT_WILDCARD', 1,                  NULL, 'SelfBonus',          'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_GOLD_FROM_SLOT_WILDCARD',             'DISTRICT_GOVERNMENT', 'YIELD_GOLD',       1.0, 'FROM_SLOT_WILDCARD', 1,                  NULL, 'SelfBonus',          'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_SCIENCE_FROM_SLOT_WILDCARD',          'DISTRICT_GOVERNMENT', 'YIELD_SCIENCE',    1.0, 'FROM_SLOT_WILDCARD', 1,                  NULL, 'SelfBonus',          'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_CULTURE_FROM_SLOT_WILDCARD',          'DISTRICT_GOVERNMENT', 'YIELD_CULTURE',    1.0, 'FROM_SLOT_WILDCARD', 1,                  NULL, 'SelfBonus',          'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_FAITH_FROM_SLOT_WILDCARD',            'DISTRICT_GOVERNMENT', 'YIELD_FAITH',      1.0, 'FROM_SLOT_WILDCARD', 1,                  NULL, 'SelfBonus',          'DistrictModifiers', NULL,      0);
--伟人点部分
    INSERT INTO Ruivo_New_Adjacency (ID, DistrictType, YieldType, YieldChange, AdjacencyType, DistrictModifiers, TraitType, ProvideType, ModifierOwner, WhoIsTheOwner, FreeCompose) 
    SELECT 'RUIVO_DISTRICT_GOVERNMENT_' || GreatPersonClassType || '_FROM_SLOT_GREAT_PERSON', 'DISTRICT_GOVERNMENT', GreatPersonClassType, 1, 'FROM_SLOT_GREAT_PERSON', 1, NULL, 'GreatPersonPoints', 'DistrictModifiers', NULL, 0 FROM GreatPersonClasses WHERE GreatPersonClassType != 'GREAT_PERSON_CLASS_COMANDANTE_GENERAL';
--============================================================================================================================




--新增部分：环数统计
    INSERT INTO Ruivo_New_Adjacency 
    (ID, DistrictType,                              -->ID和区域（注意，一定要以区域为主体，ID是主键，不要重复）
    ProvideType, YieldType, YieldChange,            -->提供的产出分类、产出类型、产出量（产出类型一定要严格对应产出分类，比如商路对应商路大类）
    AdjacencyType, CustomAdjacentObject, Rings,     -->相邻类型、自定义指定相邻目标（指定相邻目标依赖于相邻类型）
    DistrictModifiers)                                    
    VALUES 

--学院：二环内每座山脉为自身+0.5大科点
    ('RUIVO_DISTRICT_CAMPUS_GREAT_PERSON_CLASS_SCIENTIST_FROM_IsMountain', 'DISTRICT_CAMPUS', 
    'GreatPersonPoints', 'GREAT_PERSON_CLASS_SCIENTIST', 0.5, 
    'FROM_RINGS_CAO_TERRAIN_SETS', 'IsMountain', 2,
    1),
--剧院：四环内每个市中心为自己+1大作家点
    ('RUIVO_DISTRICT_THEATER_GREAT_PERSON_CLASS_WRITER_FROM_DISTRICT_CITY_CENTER', 'DISTRICT_THEATER', 
    'GreatPersonPoints', 'GREAT_PERSON_CLASS_WRITER', 1, 
    'FROM_RINGS_CAO_DISTRICT', 'DISTRICT_CITY_CENTER', 4,
    1),
--保护区：三环内每个树林为自己+0.3食物
    ('RUIVO_DISTRICT_PRESERVE_YIELD_FOOD_FROM_FEATURE_FOREST', 'DISTRICT_PRESERVE', 
    'SelfBonus', 'YIELD_FOOD', 0.3, 
    'FROM_RINGS_CAO_FEATURE', 'FEATURE_FOREST', 3,
    1);



--以下为兼容部分
--============================================================================================================================
--示例：为某种区域的取代特色区域补充
--给特色工业区也补上全新相邻加成（应该会select到高卢和德国的特色工业区）
    INSERT INTO Ruivo_New_Adjacency
    (ID,                                                                                                          DistrictType,       YieldType,       YieldChange,       AdjacencyType,     TraitType,       FreeCompose,       ProvideType,       CustomAdjacentObject,       Rings) SELECT 
    'RUIVO_' || DR.CivUniqueDistrictType || '_' || Ruivo.YieldType || '_' || Ruivo.AdjacencyType,     DR.CivUniqueDistrictType, Ruivo.YieldType, Ruivo.YieldChange, Ruivo.AdjacencyType, Dis.TraitType, Ruivo.FreeCompose, Ruivo.ProvideType, Ruivo.CustomAdjacentObject, Ruivo.Rings
    FROM DistrictReplaces DR                                    -- 区域取代表
    JOIN Ruivo_New_Adjacency Ruivo                              -- 全新系列加成表，里面是普通区域的插入
    JOIN Districts Dis                                          -- 区域定义表
    WHERE 'DISTRICT_INDUSTRIAL_ZONE' = DR.ReplacesDistrictType  -- 取代区域为对应区域
    AND 'DISTRICT_INDUSTRIAL_ZONE' = Ruivo.DistrictType         -- 将全新系列加成表映射给取代的特色区域
    AND DR.CivUniqueDistrictType = Dis.DistrictType             -- 特色区域一定是绑定给了某个特质trait，从区域定义表里取出来即可
    AND Ruivo.TraitType IS NULL                                 -- 排除需要由特质发起的行
    ;
--全部补充部分：
    INSERT OR IGNORE INTO Ruivo_New_Adjacency
    (ID,                                                                                                          DistrictType,       YieldType,       YieldChange,       AdjacencyType,     TraitType,       FreeCompose,       ProvideType,       CustomAdjacentObject,       Rings) SELECT 
    'RUIVO_' || DR.CivUniqueDistrictType || '_' || Ruivo.YieldType || '_' || Ruivo.AdjacencyType,     DR.CivUniqueDistrictType, Ruivo.YieldType, Ruivo.YieldChange, Ruivo.AdjacencyType, Dis.TraitType, Ruivo.FreeCompose, Ruivo.ProvideType, Ruivo.CustomAdjacentObject, Ruivo.Rings
    FROM Districts AS d                                                     --遍历区域表   
    JOIN DistrictReplaces DR ON d.DistrictType = DR.ReplacesDistrictType    --取代区域为对应区域
    JOIN Ruivo_New_Adjacency Ruivo ON d.DistrictType = Ruivo.DistrictType   --将全新系列加成表映射给取代的特色区域
    JOIN Districts Dis ON DR.CivUniqueDistrictType = Dis.DistrictType       --再次回到区域表，取出数值
    WHERE Ruivo.TraitType IS NULL                                           --排除需要由特质发起的行
    ;
--============================================================================================================================

--============================================================================================================================
--港口：远洋捕捞，特色区域兼容
    -- 区域贴给玩家单元格
    INSERT INTO DistrictModifiers (DistrictType, ModifierId) 
    SELECT DR.CivUniqueDistrictType, 'LONG_RANGE_FISHING_' || DR.CivUniqueDistrictType || '_' || ListB.Num FROM Ruivo_RingList ListB JOIN DistrictReplaces DR ON DR.ReplacesDistrictType = 'DISTRICT_HARBOR';

        -- 区域满足本城区域总数，单元格满足相邻区域
            INSERT INTO Modifiers (ModifierId, ModifierType, OwnerRequirementSetId, SubjectRequirementSetId) 
            SELECT 'LONG_RANGE_FISHING_' || DR.CivUniqueDistrictType || '_' || ListB.Num, 
                "MODIFIER_PLAYER_ADJUST_PLOT_YIELD", 
                'REQUIREMENT_' || 'LONG_RANGE_FISHING_' || DR.CivUniqueDistrictType || '_' || ListB.Num,
                'REQUIREMENT_' || 'RUIVO_ADJACENT_TO_OWNER' || '_' || ListB.Num
            FROM Ruivo_RingList ListB JOIN DistrictReplaces DR ON DR.ReplacesDistrictType = 'DISTRICT_HARBOR';

            INSERT INTO ModifierArguments (ModifierId, Name, Value)
            SELECT 'LONG_RANGE_FISHING_' || DR.CivUniqueDistrictType || '_' || ListB.Num, 
                "Amount", 
                ListB.Num
            FROM Ruivo_RingList ListB JOIN DistrictReplaces DR ON DR.ReplacesDistrictType = 'DISTRICT_HARBOR'
            UNION
            SELECT 'LONG_RANGE_FISHING_' || DR.CivUniqueDistrictType || '_' || ListB.Num, 
                "YieldType", 
                "YIELD_GOLD"
            FROM Ruivo_RingList ListB JOIN DistrictReplaces DR ON DR.ReplacesDistrictType = 'DISTRICT_HARBOR';

        --REQ部分：本城区域总数--只能用十进制
            INSERT INTO RequirementSets (RequirementSetId,                      RequirementSetType)
            SELECT          'REQUIREMENT_' || 'LONG_RANGE_FISHING_' || DR.CivUniqueDistrictType || '_' || ListB.Num,    'REQUIREMENTSET_TEST_ALL'                         	FROM Ruivo_RingList ListB JOIN DistrictReplaces DR ON DR.ReplacesDistrictType = 'DISTRICT_HARBOR';

            INSERT INTO RequirementSetRequirements (RequirementSetId,           RequirementId)
            SELECT          'REQUIREMENT_' || 'LONG_RANGE_FISHING_' || DR.CivUniqueDistrictType || '_' || ListB.Num,    'REQUIRES_' || 'LONG_RANGE_FISHING_' || DR.CivUniqueDistrictType || '_' || ListB.Num     		FROM Ruivo_RingList ListB JOIN DistrictReplaces DR ON DR.ReplacesDistrictType = 'DISTRICT_HARBOR';

            INSERT INTO Requirements (RequirementId,                            RequirementType)
            SELECT          'REQUIRES_' || 'LONG_RANGE_FISHING_' || DR.CivUniqueDistrictType || '_' || ListB.Num,       'REQUIREMENT_PLOT_PROPERTY_MATCHES'                  FROM Ruivo_RingList ListB JOIN DistrictReplaces DR ON DR.ReplacesDistrictType = 'DISTRICT_HARBOR';

            INSERT INTO RequirementArguments (RequirementId,                    Name,                 Value)
            SELECT          'REQUIRES_' || 'LONG_RANGE_FISHING_' || DR.CivUniqueDistrictType || '_' || ListB.Num,       'PropertyName',       'RUIVO_'||DR.CivUniqueDistrictType||'_YIELD_GOLD_FROM_CITY_DISTRICTS_NUM'||'_TOTAL'   FROM Ruivo_RingList ListB JOIN DistrictReplaces DR ON DR.ReplacesDistrictType = 'DISTRICT_HARBOR'
            UNION SELECT    'REQUIRES_' || 'LONG_RANGE_FISHING_' || DR.CivUniqueDistrictType || '_' || ListB.Num,       'PropertyMinimum',    ListB.Num                          	FROM Ruivo_RingList ListB JOIN DistrictReplaces DR ON DR.ReplacesDistrictType = 'DISTRICT_HARBOR';
--============================================================================================================================