--============================================================================================================================
--农业道德：每有一级信条，圣地相邻信仰值产出的50%转化为粮食产出（最多200%）
    INSERT INTO Ruivo_New_Adjacency 
    (ID,                                                                    DistrictType,           YieldType,           YieldChange,    AdjacencyType,                      DistrictModifiers,  TraitType,  FreeCompose) VALUES 
    ('RUIVO_DISTRICT_HOLY_SITE_YIELD_FOOD_FROM_SELF_YIELD_FAITH_1',          'DISTRICT_HOLY_SITE',   'YIELD_FOOD',         0.5,             'FROM_SELF_YIELD_FAITH',             1,                  NULL,       0),
    ('RUIVO_DISTRICT_HOLY_SITE_YIELD_FOOD_FROM_SELF_YIELD_FAITH_2',          'DISTRICT_HOLY_SITE',   'YIELD_FOOD',         0.5,             'FROM_SELF_YIELD_FAITH',             1,                  NULL,       0),
    ('RUIVO_DISTRICT_HOLY_SITE_YIELD_FOOD_FROM_SELF_YIELD_FAITH_3',          'DISTRICT_HOLY_SITE',   'YIELD_FOOD',         0.5,             'FROM_SELF_YIELD_FAITH',             1,                  NULL,       0),
    ('RUIVO_DISTRICT_HOLY_SITE_YIELD_FOOD_FROM_SELF_YIELD_FAITH_4',          'DISTRICT_HOLY_SITE',   'YIELD_FOOD',         0.5,             'FROM_SELF_YIELD_FAITH',             1,                  NULL,       0);

    INSERT INTO Ruivo_New_Adjacency 
    (ID,                                                DistrictType,             YieldType,          YieldChange,  AdjacencyType,                    DistrictModifiers,  TraitType,  FreeCompose) VALUES 
    ('RUIVO_ONLY_REQ_FROM_RELIGION_BELIEFS_COUNT',     'DISTRICT_HOLY_SITE',      'YIELD_NONE',        1,           'FROM_RELIGION_BELIEFS_COUNT',     1,                  NULL,       1);


    -- 为每个信条等级生成 RequirementSetRequirements 条目
    INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
    SELECT       'REQUIREMENT_' || 'RUIVO_DISTRICT_HOLY_SITE_YIELD_FOOD_FROM_SELF_YIELD_FAITH_1' || '_' || ListB.Num, 'REQ_FROM_RELIGION_BELIEFS_COUNT_1' FROM Ruivo_BinaryList ListB
    UNION SELECT 'REQUIREMENT_' || 'RUIVO_DISTRICT_HOLY_SITE_YIELD_FOOD_FROM_SELF_YIELD_FAITH_2' || '_' || ListB.Num, 'REQ_FROM_RELIGION_BELIEFS_COUNT_2' FROM Ruivo_BinaryList ListB
    UNION SELECT 'REQUIREMENT_' || 'RUIVO_DISTRICT_HOLY_SITE_YIELD_FOOD_FROM_SELF_YIELD_FAITH_3' || '_' || ListB.Num, 'REQ_FROM_RELIGION_BELIEFS_COUNT_3' FROM Ruivo_BinaryList ListB
    UNION SELECT 'REQUIREMENT_' || 'RUIVO_DISTRICT_HOLY_SITE_YIELD_FOOD_FROM_SELF_YIELD_FAITH_4' || '_' || ListB.Num, 'REQ_FROM_RELIGION_BELIEFS_COUNT_4' FROM Ruivo_BinaryList ListB;


    INSERT INTO Requirements (RequirementId, RequirementType) VALUES
    ('REQ_FROM_RELIGION_BELIEFS_COUNT_1', 'REQUIREMENT_PLOT_PROPERTY_MATCHES'),
    ('REQ_FROM_RELIGION_BELIEFS_COUNT_2', 'REQUIREMENT_PLOT_PROPERTY_MATCHES'),
    ('REQ_FROM_RELIGION_BELIEFS_COUNT_3', 'REQUIREMENT_PLOT_PROPERTY_MATCHES'),
    ('REQ_FROM_RELIGION_BELIEFS_COUNT_4', 'REQUIREMENT_PLOT_PROPERTY_MATCHES');


    INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES
    ('REQ_FROM_RELIGION_BELIEFS_COUNT_1', 'PropertyName', 'RUIVO_ONLY_REQ_FROM_RELIGION_BELIEFS_COUNT_TOTAL'),
    ('REQ_FROM_RELIGION_BELIEFS_COUNT_1', 'PropertyMinimum', 1),
    ('REQ_FROM_RELIGION_BELIEFS_COUNT_2', 'PropertyName', 'RUIVO_ONLY_REQ_FROM_RELIGION_BELIEFS_COUNT_TOTAL'),
    ('REQ_FROM_RELIGION_BELIEFS_COUNT_2', 'PropertyMinimum', 2),
    ('REQ_FROM_RELIGION_BELIEFS_COUNT_3', 'PropertyName', 'RUIVO_ONLY_REQ_FROM_RELIGION_BELIEFS_COUNT_TOTAL'),
    ('REQ_FROM_RELIGION_BELIEFS_COUNT_3', 'PropertyMinimum', 3),
    ('REQ_FROM_RELIGION_BELIEFS_COUNT_4', 'PropertyName', 'RUIVO_ONLY_REQ_FROM_RELIGION_BELIEFS_COUNT_TOTAL'),
    ('REQ_FROM_RELIGION_BELIEFS_COUNT_4', 'PropertyMinimum', 4);
--============================================================================================================================
--每级信条部分只留req部分
    INSERT INTO Ruivo_New_Adjacency 
    (ID,                                                                    DistrictType,           YieldType,           YieldChange,    AdjacencyType,              DistrictModifiers,  TraitType,  FreeCompose) VALUES 
    ('RUIVO_DISTRICT_HOLY_SITE_PER_1_PRODUCTION_FROM_SELF_YIELD_FAITH',     'DISTRICT_HOLY_SITE',   'YIELD_NONE',        1,             'FROM_SELF_YIELD_FAITH',     1,                  NULL,       1);
--============================================================================================================================
--Modifier绑给区域部分
    INSERT INTO DistrictModifiers (DistrictType,                        ModifierId)
    SELECT           'DISTRICT_HOLY_SITE',                                'RUIVO_DISTRICT_HOLY_SITE_PER_1_PRODUCTION_FROM_SELF_YIELD_FAITH' || '_' || ListB.Num 	                   FROM Ruivo_BinaryList ListB;
--============================================================================================================================
--Modifier组装部分
    INSERT INTO Modifiers (ModifierId,                                                                           ModifierType,                                        OwnerRequirementSetId,                         SubjectRequirementSetId)
    SELECT         'RUIVO_DISTRICT_HOLY_SITE_PER_1_PRODUCTION_FROM_SELF_YIELD_FAITH' || '_' || ListB.Num, 'MODIFIER_OWNER_CITY_ADJUST_CITY_YIELD_MODIFIER_RUIVO', 'REQUIREMENT_' || 'RUIVO_DISTRICT_HOLY_SITE_PER_1_PRODUCTION_FROM_SELF_YIELD_FAITH' || '_' || ListB.Num, NULL                        FROM Ruivo_BinaryList ListB;

    INSERT INTO ModifierArguments (ModifierId,                          Name,               Value)
    SELECT         'RUIVO_DISTRICT_HOLY_SITE_PER_1_PRODUCTION_FROM_SELF_YIELD_FAITH' || '_' || ListB.Num,                     'Amount',              5 * ListB.Num                     FROM Ruivo_BinaryList ListB
    UNION SELECT   'RUIVO_DISTRICT_HOLY_SITE_PER_1_PRODUCTION_FROM_SELF_YIELD_FAITH' || '_' || ListB.Num,                     'YieldType',          'YIELD_PRODUCTION'                    FROM Ruivo_BinaryList ListB;
--============================================================================================================================

--============================================================================================================================
--农业道德UD版：圣地50%信仰加成转化为食物，每级信条使食物加成+80%
    INSERT INTO Ruivo_New_Adjacency
    (ID,                                                                            DistrictType,              YieldType,   YieldChange,    AdjacencyType,                DistrictModifiers, ProvideType) 
    SELECT 
    'RUIVO_'||DR.CivUniqueDistrictType||'_YIELD_FOOD_FROM_RELIGION_BELIEFS_COUNT',  DR.CivUniqueDistrictType, 'YIELD_FOOD', 80,           'FROM_RELIGION_BELIEFS_COUNT', 1,                'SelfMultiplier'
    FROM DistrictReplaces DR WHERE DR.ReplacesDistrictType = 'DISTRICT_HOLY_SITE';
--============================================================================================================================

--============================================================================================================================
--市中心：
    INSERT INTO Ruivo_New_Adjacency 
    (ID,                                                                                 DistrictType,               YieldType,           YieldChange,      AdjacencyType,                      DistrictModifiers,  TraitType,  FreeCompose) VALUES 
--此宗教每有4个信徒，所有市中心+1信仰
    ('RUIVO_DISTRICT_CITY_CENTER_YIELD_FAITH_FROM_RELIGION_TOTAL_FOLLOWERS',            'DISTRICT_CITY_CENTER',     'YIELD_FAITH',        0.25,             'FROM_RELIGION_TOTAL_FOLLOWERS',    1,                  NULL,       0),
--此宗教每有3个国内信徒，所有市中心+1锤
    ('RUIVO_DISTRICT_CITY_CENTER_YIELD_PRODUCTION_FROM_RELIGION_DOMESTIC_FOLLOWERS',    'DISTRICT_CITY_CENTER',     'YIELD_PRODUCTION',   0.34,             'FROM_RELIGION_DOMESTIC_FOLLOWERS', 1,                  NULL,       0),
--信仰此宗教的每座国外城市为您的所有市中心+1粮
    ('RUIVO_DISTRICT_CITY_CENTER_YIELD_FOOD_FROM_RELIGION_FOREIGN_CITIES',              'DISTRICT_CITY_CENTER',     'YIELD_FOOD',         1,                'FROM_RELIGION_FOREIGN_CITIES',     1,                  NULL,       0),
--玩家信仰值总产出的10%作为市中心的金币加成
    ('RUIVO_DISTRICT_CITY_CENTER_YIELD_GOLD_FROM_RELIGION_FAITH_YIELD',                 'DISTRICT_CITY_CENTER',     'YIELD_GOLD',         0.1,              'FROM_RELIGION_FAITH_YIELD',        1,                  NULL,       0);
--============================================================================================================================

--============================================================================================================================
--玛雅DLC的全产modifier，因为要dlc，所以干脆自己组装一个
    INSERT INTO Types (Type, Kind) VALUES
    ('MODIFIER_OWNER_CITY_ADJUST_CITY_YIELD_MODIFIER_RUIVO', 'KIND_MODIFIER');
    INSERT INTO DynamicModifiers (ModifierType, EffectType, CollectionType) VALUES
    ('MODIFIER_OWNER_CITY_ADJUST_CITY_YIELD_MODIFIER_RUIVO', 'EFFECT_ADJUST_CITY_YIELD_MODIFIER', 'COLLECTION_OWNER_CITY');
--每个信仰此宗教且拥有奇观的城市，使有圣地的城市+3%文化
    INSERT INTO Ruivo_New_Adjacency 
    (ID,                                                                            DistrictType,           YieldType,           YieldChange,       AdjacencyType,                             DistrictModifiers,  TraitType,  FreeCompose) VALUES     
    ('RUIVO_DISTRICT_HOLY_SITE_YIELD_CULTURE_FROM_RELIGION_CITIES_WITH_WONDER',    'DISTRICT_HOLY_SITE',   'YIELD_CULTURE',      1,                'FROM_RELIGION_CITIES_WITH_WONDER',         1,                  NULL,       1);
--============================================================================================================================
--圣地巡礼：每个信仰此宗教且拥有奇观的城市，使有圣地的城市+3%文化
    --============================================================================================================================
    --modifier绑给区域部分
        INSERT INTO DistrictModifiers (DistrictType,                        ModifierId)
        SELECT           'DISTRICT_HOLY_SITE',                                'RUIVO_DISTRICT_HOLY_SITE_YIELD_CULTURE_FROM_RELIGION_CITIES_WITH_WONDER' || '_' || ListB.Num 	                   FROM Ruivo_BinaryList ListB;
    --============================================================================================================================

    --============================================================================================================================
    --Modifier组装部分
        INSERT INTO Modifiers (ModifierId,                                                                           ModifierType,                                        OwnerRequirementSetId,                         SubjectRequirementSetId)
        SELECT         'RUIVO_DISTRICT_HOLY_SITE_YIELD_CULTURE_FROM_RELIGION_CITIES_WITH_WONDER' || '_' || ListB.Num, 'MODIFIER_OWNER_CITY_ADJUST_CITY_YIELD_MODIFIER_RUIVO', 'REQUIREMENT_' || 'RUIVO_DISTRICT_HOLY_SITE_YIELD_CULTURE_FROM_RELIGION_CITIES_WITH_WONDER' || '_' || ListB.Num, NULL                        FROM Ruivo_BinaryList ListB;

        INSERT INTO ModifierArguments (ModifierId,                          Name,               Value)
        SELECT         'RUIVO_DISTRICT_HOLY_SITE_YIELD_CULTURE_FROM_RELIGION_CITIES_WITH_WONDER' || '_' || ListB.Num,                     'Amount',              3 * ListB.Num                     FROM Ruivo_BinaryList ListB
        UNION SELECT   'RUIVO_DISTRICT_HOLY_SITE_YIELD_CULTURE_FROM_RELIGION_CITIES_WITH_WONDER' || '_' || ListB.Num,                     'YieldType',          'YIELD_CULTURE'                    FROM Ruivo_BinaryList ListB;
--============================================================================================================================
--============================================================================================================================
--圣地巡礼：每个信仰此宗教且拥有奇观的城市，使有圣地的城市+3%文化
    --============================================================================================================================
    --modifier绑给区域部分
        INSERT INTO DistrictModifiers (DistrictType,                        ModifierId)
        SELECT           DR.CivUniqueDistrictType,                                'RUIVO_'||DR.CivUniqueDistrictType||'_YIELD_CULTURE_FROM_RELIGION_CITIES_WITH_WONDER' || '_' || ListB.Num 	                   FROM Ruivo_BinaryList ListB JOIN DistrictReplaces DR ON DR.ReplacesDistrictType = 'DISTRICT_HOLY_SITE';
    --============================================================================================================================

    --============================================================================================================================
    --Modifier组装部分
        INSERT INTO Modifiers (ModifierId,                                                                           ModifierType,                                        OwnerRequirementSetId,                         SubjectRequirementSetId)
        SELECT         'RUIVO_'||DR.CivUniqueDistrictType||'_YIELD_CULTURE_FROM_RELIGION_CITIES_WITH_WONDER' || '_' || ListB.Num, 'MODIFIER_OWNER_CITY_ADJUST_CITY_YIELD_MODIFIER_RUIVO', 'REQUIREMENT_' || 'RUIVO_'||DR.CivUniqueDistrictType||'_YIELD_CULTURE_FROM_RELIGION_CITIES_WITH_WONDER' || '_' || ListB.Num, NULL                        FROM Ruivo_BinaryList ListB JOIN DistrictReplaces DR ON DR.ReplacesDistrictType = 'DISTRICT_HOLY_SITE';

        INSERT INTO ModifierArguments (ModifierId,                          Name,               Value)
        SELECT         'RUIVO_'||DR.CivUniqueDistrictType||'_YIELD_CULTURE_FROM_RELIGION_CITIES_WITH_WONDER' || '_' || ListB.Num,                     'Amount',              3 * ListB.Num                     FROM Ruivo_BinaryList ListB JOIN DistrictReplaces DR ON DR.ReplacesDistrictType = 'DISTRICT_HOLY_SITE'
        UNION SELECT   'RUIVO_'||DR.CivUniqueDistrictType||'_YIELD_CULTURE_FROM_RELIGION_CITIES_WITH_WONDER' || '_' || ListB.Num,                     'YieldType',          'YIELD_CULTURE'                    FROM Ruivo_BinaryList ListB JOIN DistrictReplaces DR ON DR.ReplacesDistrictType = 'DISTRICT_HOLY_SITE';
--============================================================================================================================

--============================================================================================================================
--超出宜居度为圣地提供文化
    INSERT INTO Ruivo_New_Adjacency (ID,                              DistrictType,         YieldType,      YieldChange, AdjacencyType,          DistrictModifiers, ProvideType) VALUES
    ('RUIVO_DISTRICT_HOLY_SITE_YIELD_CULTURE_FROM_CITY_SURPLUS_AMENITIES_OVER_HIGHEST_LEVEL_HAPPINESS', 'DISTRICT_HOLY_SITE', 'YIELD_CULTURE', 1.0,        'FROM_CITY_SURPLUS_AMENITIES_OVER_HIGHEST_LEVEL_HAPPINESS', 1,                'SelfBonus');
--============================================================================================================================

--============================================================================================================================
--清洁电力转旅游业绩
    INSERT INTO DistrictModifiers (DistrictType, ModifierId) VALUES
    ('DISTRICT_HOLY_SITE', 'MODIFIER_MDCCVF');
    INSERT INTO Modifiers(ModifierId, ModifierType) VALUES
    ('MODIFIER_MDCCVF', 'MODIFIER_PLAYER_CITIES_ADJUST_GREEN_ENERGY_TOURISM_MODIFIER');
    INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('MODIFIER_MDCCVF', 'Amount', '100');
--============================================================================================================================

--============================================================================================================================
--特色区域罗马浴场：还提供余粮50%的文化--TraitType甚至可以填别的，填文明领袖trait或者特色单位的trait都行
    INSERT INTO Ruivo_New_Adjacency
    (ID,                                                                                           DistrictType,    YieldType,      YieldChange,  AdjacencyType,            TraitType,                         DistrictModifiers, FreeCompose) VALUES 
    ('RUIVO_TRAIT_CIVILIZATION_DISTRICT_BATH_DISTRICT_BATH_YIELD_CULTURE_FROM_CITY_SURPLUS_FOOD', 'DISTRICT_BATH', 'YIELD_CULTURE', 0.5,         'FROM_CITY_SURPLUS_FOOD', 'TRAIT_CIVILIZATION_DISTRICT_BATH', 0,                 0);
--============================================================================================================================

--============================================================================================================================
--建筑效果测试
    INSERT INTO Ruivo_New_Adjacency (ID, DistrictType, YieldType, YieldChange, AdjacencyType, DistrictModifiers, TraitType, ProvideType, ModifierOwner, WhoIsTheOwner, CollectionType, FreeCompose) VALUES 
    ('RUIVO_DISTRICT_CITY_CENTER_YIELD_POWER_FROM_ADJACENT_WORKER', 
    'DISTRICT_CITY_CENTER', 
    'YIELD_POWER', 1, 
    'FROM_ADJACENT_WORKER', 
    1, NULL, 
    'SelfPower', 
    'BuildingModifiers', 'BUILDING_FACTORY', 'COLLECTION_CITY_DISTRICTS', 
    0);
    INSERT INTO Ruivo_New_Adjacency (ID, DistrictType, YieldType, YieldChange, AdjacencyType, DistrictModifiers, TraitType, ProvideType, ModifierOwner, WhoIsTheOwner, CollectionType, FreeCompose) VALUES 
    ('RUIVO_DISTRICT_CITY_CENTER_MODIFIER_POWER_FROM_RIVER_CROSSING', 
    'DISTRICT_CITY_CENTER', 
    'YIELD_POWER', 5, 
    'FROM_RIVER_CROSSING', 
    1, NULL, 
    'SelfPowerModifier', 
    'BuildingModifiers', 'BUILDING_HYDROELECTRIC_DAM', 'COLLECTION_CITY_DISTRICTS', 
    0);
    INSERT INTO Ruivo_New_Adjacency (ID, DistrictType, YieldType, YieldChange, AdjacencyType, DistrictModifiers, TraitType, ProvideType, ModifierOwner, WhoIsTheOwner, CollectionType, FreeCompose) VALUES 
    ('RUIVO_DISTRICT_CITY_CENTER_YIELD_HOUSING_FROM_ADJACENT_DISTRICT', 
    'DISTRICT_CITY_CENTER', 
    'YIELD_HOUSING', 1, 
    'FROM_ADJACENT_DISTRICT', 
    1, NULL, 
    'SelfHousing', 
    'BuildingModifiers', 'BUILDING_SEWER', 'COLLECTION_CITY_DISTRICTS', 
    0);

    INSERT INTO Ruivo_New_Adjacency (ID, DistrictType, YieldType, YieldChange, AdjacencyType, DistrictModifiers, TraitType, ProvideType, ModifierOwner, WhoIsTheOwner, CollectionType, FreeCompose) VALUES 
    ('RUIVO_DISTRICT_HOLY_SITE_YIELD_SCIENCE_FROM_RIVER_CROSSING', 
    'DISTRICT_HOLY_SITE', 
    'YIELD_SCIENCE', 10, 
    'FROM_RIVER_CROSSING', 
    1, NULL, 
    'SelfBonus', 
    'BuildingModifiers', 
    'BUILDING_MONUMENT', 
    'COLLECTION_CITY_DISTRICTS', 0);
    INSERT INTO Ruivo_New_Adjacency (ID, DistrictType, YieldType, YieldChange, AdjacencyType, DistrictModifiers, TraitType, ProvideType, ModifierOwner, WhoIsTheOwner, CollectionType, FreeCompose) VALUES 
    ('RUIVO_DISTRICT_HOLY_SITE_YIELD_CULTURE_FROM_RIVER_CROSSING', 
    'DISTRICT_HOLY_SITE', 
    'YIELD_CULTURE', 10, 
    'FROM_RIVER_CROSSING', 
    1, NULL, 
    'SelfBonus', 
    'BuildingModifiers', 
    'BUILDING_MONUMENT', 
    'COLLECTION_PLAYER_DISTRICTS', 0);
--============================================================================================================================

--============================================================================================================================
--政策卡效果测试
    -- 插入 Types 表
    INSERT INTO Types (Type, Kind)
    VALUES ('POLICY_RUIVO_TEST', 'KIND_POLICY');
    -- 插入 Policies 表
    INSERT INTO Policies (PolicyType, Name, Description, PrereqCivic, GovernmentSlotType)
    VALUES ('POLICY_RUIVO_TEST', 'LOC_POLICY_RUIVO_TEST_NAME', 'LOC_POLICY_RUIVO_TEST_DESCRIPTION', NULL, 'SLOT_WILDCARD');

    INSERT INTO Ruivo_New_Adjacency 
    (ID,                                                                 DistrictType,               YieldType,          ProvideType,     AdjacencyType,    YieldChange,DistrictModifiers,   ModifierOwner,     WhoIsTheOwner,       CollectionType) VALUES 
    ('RUIVO_DISTRICT_CITY_CENTER_YIELD_LOYALTY_FROM_SLOT_MILITARY',     'DISTRICT_CITY_CENTER',     'YIELD_LOYALTY',    'SelfLoyalty'   ,'FROM_SLOT_MILITARY',       4,  1,                 'PolicyModifiers', 'POLICY_RUIVO_TEST', 'COLLECTION_PLAYER_DISTRICTS'),

    ('RUIVO_DISTRICT_CITY_CENTER_YIELD_HOUSING_FROM_SLOT_ECONOMIC',     'DISTRICT_CITY_CENTER',     'YIELD_HOUSING',    'SelfHousing'   ,'FROM_SLOT_ECONOMIC',       1,  1,                 'PolicyModifiers', 'POLICY_RUIVO_TEST', 'COLLECTION_PLAYER_DISTRICTS'),
    ('RUIVO_DISTRICT_CITY_CENTER_YIELD_AMENITY_FROM_SLOT_ECONOMIC',     'DISTRICT_CITY_CENTER',     'YIELD_AMENITY',    'SelfAmenity'   ,'FROM_SLOT_ECONOMIC',       1,  1,                 'PolicyModifiers', 'POLICY_RUIVO_TEST', 'COLLECTION_PLAYER_DISTRICTS'),

    ('RUIVO_DISTRICT_CITY_CENTER_YIELD_INFLUENCE_FROM_SLOT_DIPLOMATIC', 'DISTRICT_CITY_CENTER',     'YIELD_INFLUENCE',  'SelfInfluence' ,'FROM_SLOT_DIPLOMATIC',     1,  1,                 'PolicyModifiers', 'POLICY_RUIVO_TEST', 'COLLECTION_PLAYER_DISTRICTS'),
    ('RUIVO_DISTRICT_CITY_CENTER_YIELD_FAVOR_FROM_SLOT_DIPLOMATIC',     'DISTRICT_CITY_CENTER',     'YIELD_FAVOR',      'SelfFavor'     ,'FROM_SLOT_DIPLOMATIC',     1,  1,                 'PolicyModifiers', 'POLICY_RUIVO_TEST', 'COLLECTION_PLAYER_DISTRICTS'),

    ('RUIVO_DISTRICT_CITY_CENTER_MODIFIER_FOOD_FROM_SLOT_GREAT_PERSON',       'DISTRICT_CITY_CENTER', 'YIELD_FOOD',       'SelfMultiplier', 'FROM_SLOT_GREAT_PERSON', 20, 1, 'PolicyModifiers', 'POLICY_RUIVO_TEST', 'COLLECTION_PLAYER_DISTRICTS'),
    ('RUIVO_DISTRICT_CITY_CENTER_MODIFIER_PRODUCTION_FROM_SLOT_GREAT_PERSON', 'DISTRICT_CITY_CENTER', 'YIELD_PRODUCTION', 'SelfMultiplier', 'FROM_SLOT_GREAT_PERSON', 20, 1, 'PolicyModifiers', 'POLICY_RUIVO_TEST', 'COLLECTION_PLAYER_DISTRICTS'),
    ('RUIVO_DISTRICT_CITY_CENTER_MODIFIER_GOLD_FROM_SLOT_GREAT_PERSON',       'DISTRICT_CITY_CENTER', 'YIELD_GOLD',       'SelfMultiplier', 'FROM_SLOT_GREAT_PERSON', 20, 1, 'PolicyModifiers', 'POLICY_RUIVO_TEST', 'COLLECTION_PLAYER_DISTRICTS'),
    ('RUIVO_DISTRICT_CITY_CENTER_MODIFIER_SCIENCE_FROM_SLOT_GREAT_PERSON',    'DISTRICT_CITY_CENTER', 'YIELD_SCIENCE',    'SelfMultiplier', 'FROM_SLOT_GREAT_PERSON', 20, 1, 'PolicyModifiers', 'POLICY_RUIVO_TEST', 'COLLECTION_PLAYER_DISTRICTS'),
    ('RUIVO_DISTRICT_CITY_CENTER_MODIFIER_CULTURE_FROM_SLOT_GREAT_PERSON',    'DISTRICT_CITY_CENTER', 'YIELD_CULTURE',    'SelfMultiplier', 'FROM_SLOT_GREAT_PERSON', 20, 1, 'PolicyModifiers', 'POLICY_RUIVO_TEST', 'COLLECTION_PLAYER_DISTRICTS'),
    ('RUIVO_DISTRICT_CITY_CENTER_MODIFIER_FAITH_FROM_SLOT_GREAT_PERSON',      'DISTRICT_CITY_CENTER', 'YIELD_FAITH',      'SelfMultiplier', 'FROM_SLOT_GREAT_PERSON', 20, 1, 'PolicyModifiers', 'POLICY_RUIVO_TEST', 'COLLECTION_PLAYER_DISTRICTS'),

    ('RUIVO_DISTRICT_CITY_CENTER_YIELD_FOOD_FROM_SLOT_WILDCARD',       'DISTRICT_CITY_CENTER', 'YIELD_FOOD',       'SelfBonus', 'FROM_SLOT_WILDCARD', 1, 1, 'PolicyModifiers', 'POLICY_RUIVO_TEST', 'COLLECTION_PLAYER_DISTRICTS'),
    ('RUIVO_DISTRICT_CITY_CENTER_YIELD_PRODUCTION_FROM_SLOT_WILDCARD', 'DISTRICT_CITY_CENTER', 'YIELD_PRODUCTION', 'SelfBonus', 'FROM_SLOT_WILDCARD', 1, 1, 'PolicyModifiers', 'POLICY_RUIVO_TEST', 'COLLECTION_PLAYER_DISTRICTS'),
    ('RUIVO_DISTRICT_CITY_CENTER_YIELD_GOLD_FROM_SLOT_WILDCARD',       'DISTRICT_CITY_CENTER', 'YIELD_GOLD',       'SelfBonus', 'FROM_SLOT_WILDCARD', 1, 1, 'PolicyModifiers', 'POLICY_RUIVO_TEST', 'COLLECTION_PLAYER_DISTRICTS'),
    ('RUIVO_DISTRICT_CITY_CENTER_YIELD_SCIENCE_FROM_SLOT_WILDCARD',    'DISTRICT_CITY_CENTER', 'YIELD_SCIENCE',    'SelfBonus', 'FROM_SLOT_WILDCARD', 1, 1, 'PolicyModifiers', 'POLICY_RUIVO_TEST', 'COLLECTION_PLAYER_DISTRICTS'),
    ('RUIVO_DISTRICT_CITY_CENTER_YIELD_CULTURE_FROM_SLOT_WILDCARD',    'DISTRICT_CITY_CENTER', 'YIELD_CULTURE',    'SelfBonus', 'FROM_SLOT_WILDCARD', 1, 1, 'PolicyModifiers', 'POLICY_RUIVO_TEST', 'COLLECTION_PLAYER_DISTRICTS'),
    ('RUIVO_DISTRICT_CITY_CENTER_YIELD_FAITH_FROM_SLOT_WILDCARD',      'DISTRICT_CITY_CENTER', 'YIELD_FAITH',      'SelfBonus', 'FROM_SLOT_WILDCARD', 1, 1, 'PolicyModifiers', 'POLICY_RUIVO_TEST', 'COLLECTION_PLAYER_DISTRICTS');
--============================================================================================================================

--============================================================================================================================
--市政广场测试区
    INSERT INTO Ruivo_New_Adjacency 
    (ID,                                                                     DistrictType,          YieldType,  YieldChange, AdjacencyType,   DistrictModifiers, TraitType,  ProvideType,          ModifierOwner, WhoIsTheOwner,  FreeCompose)
    VALUES 
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_NONE_FROM_LATITUDE',                  'DISTRICT_GOVERNMENT', 'YIELD_NONE',       1.0, 'FROM_LATITUDE',          1,              NULL, 'SelfBonus',          'DistrictModifiers', NULL,      1),

    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_TRADE_ROUTE_FROM_ADJACENT_DISTRICT',  'DISTRICT_GOVERNMENT', 'YIELD_TRADE_ROUTE',1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfTradeRoute',     'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_HOUSING_FROM_ADJACENT_DISTRICT',      'DISTRICT_GOVERNMENT', 'YIELD_HOUSING',    1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfHousing',        'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_AMENITY_FROM_ADJACENT_DISTRICT',      'DISTRICT_GOVERNMENT', 'YIELD_AMENITY',    1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfAmenity',        'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_LOYALTY_FROM_ADJACENT_DISTRICT',      'DISTRICT_GOVERNMENT', 'YIELD_LOYALTY',    1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfLoyalty',        'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_INFLUENCE_FROM_ADJACENT_DISTRICT',    'DISTRICT_GOVERNMENT', 'YIELD_INFLUENCE',  1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfInfluence',      'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_FAVOR_FROM_ADJACENT_DISTRICT',        'DISTRICT_GOVERNMENT', 'YIELD_FAVOR',      1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfFavor',          'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_TOURISM_FROM_ADJACENT_DISTRICT',      'DISTRICT_GOVERNMENT', 'YIELD_TOURISM',    1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfTourism',        'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_POWER_FROM_ADJACENT_DISTRICT',        'DISTRICT_GOVERNMENT', 'YIELD_POWER',      1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfPower',          'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_MODIFIER_POWER_FROM_ADJACENT_DISTRICT',     'DISTRICT_GOVERNMENT', 'YIELD_POWER',      10,  'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfPowerModifier',  'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_FOOD_FROM_ADJACENT_DISTRICT',         'DISTRICT_GOVERNMENT', 'YIELD_FOOD',       1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfBonus',          'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_PRODUCTION_FROM_ADJACENT_DISTRICT',   'DISTRICT_GOVERNMENT', 'YIELD_PRODUCTION', 1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfBonus',          'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_GOLD_FROM_ADJACENT_DISTRICT',         'DISTRICT_GOVERNMENT', 'YIELD_GOLD',       1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfBonus',          'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_SCIENCE_FROM_ADJACENT_DISTRICT',      'DISTRICT_GOVERNMENT', 'YIELD_SCIENCE',    1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfBonus',          'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_CULTURE_FROM_ADJACENT_DISTRICT',      'DISTRICT_GOVERNMENT', 'YIELD_CULTURE',    1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfBonus',          'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_FAITH_FROM_ADJACENT_DISTRICT',        'DISTRICT_GOVERNMENT', 'YIELD_FAITH',      1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfBonus',          'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_MODIFIER_FOOD_FROM_ADJACENT_DISTRICT',      'DISTRICT_GOVERNMENT', 'YIELD_FOOD',       10,  'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfMultiplier',     'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_MODIFIER_PRODUCTION_FROM_ADJACENT_DISTRICT','DISTRICT_GOVERNMENT', 'YIELD_PRODUCTION', 10,  'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfMultiplier',     'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_MODIFIER_GOLD_FROM_ADJACENT_DISTRICT',      'DISTRICT_GOVERNMENT', 'YIELD_GOLD',       10,  'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfMultiplier',     'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_MODIFIER_SCIENCE_FROM_ADJACENT_DISTRICT',   'DISTRICT_GOVERNMENT', 'YIELD_SCIENCE',    10,  'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfMultiplier',     'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_MODIFIER_CULTURE_FROM_ADJACENT_DISTRICT',   'DISTRICT_GOVERNMENT', 'YIELD_CULTURE',    10,  'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfMultiplier',     'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_MODIFIER_FAITH_FROM_ADJACENT_DISTRICT',     'DISTRICT_GOVERNMENT', 'YIELD_FAITH',      10,  'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfMultiplier',     'DistrictModifiers', NULL,      0);
--伟人点部分
    INSERT INTO Ruivo_New_Adjacency (ID, DistrictType, YieldType, YieldChange, AdjacencyType, DistrictModifiers, TraitType, ProvideType, ModifierOwner, WhoIsTheOwner, FreeCompose) 
    SELECT       'RUIVO_DISTRICT_GOVERNMENT_' || GreatPersonClassType || '_FROM_ADJACENT_DISTRICT',           'DISTRICT_GOVERNMENT', GreatPersonClassType, 1,  'FROM_ADJACENT_DISTRICT', 1, NULL, 'GreatPersonPoints',     'DistrictModifiers', NULL, 0 FROM GreatPersonClasses WHERE GreatPersonClassType != 'GREAT_PERSON_CLASS_COMANDANTE_GENERAL'
    UNION SELECT 'RUIVO_DISTRICT_GOVERNMENT_MODIFIER_' || GreatPersonClassType || '_FROM_ADJACENT_DISTRICT',  'DISTRICT_GOVERNMENT', GreatPersonClassType, 10, 'FROM_ADJACENT_DISTRICT', 1, NULL, 'GreatPersonMultiplier', 'DistrictModifiers', NULL, 0 FROM GreatPersonClasses WHERE GreatPersonClassType != 'GREAT_PERSON_CLASS_COMANDANTE_GENERAL';
--============================================================================================================================

--============================================================================================================================
--保护区获得相邻单元格的产出
    INSERT INTO Ruivo_New_Adjacency 
    (ID,                                                                             DistrictType,     ProvideType,  YieldType, YieldChange, AdjacencyType,                     DistrictModifiers) VALUES 
    ('TEST_DISTRICT_PRESERVE_YIELD_FOOD_FROM_UI_ADJACENT_YIELD_FOOD',               'DISTRICT_PRESERVE','SelfBonus','YIELD_FOOD',       1.0,'FROM_UI_ADJACENT_YIELD_FOOD',      1),
    ('TEST_DISTRICT_PRESERVE_YIELD_PRODUCTION_FROM_UI_ADJACENT_YIELD_PRODUCTION',   'DISTRICT_PRESERVE','SelfBonus','YIELD_PRODUCTION', 1.0,'FROM_UI_ADJACENT_YIELD_PRODUCTION',1),
    ('TEST_DISTRICT_PRESERVE_YIELD_GOLD_FROM_UI_ADJACENT_YIELD_GOLD',               'DISTRICT_PRESERVE','SelfBonus','YIELD_GOLD',       1.0,'FROM_UI_ADJACENT_YIELD_GOLD',      1),
    ('TEST_DISTRICT_PRESERVE_YIELD_SCIENCE_FROM_UI_ADJACENT_YIELD_SCIENCE',         'DISTRICT_PRESERVE','SelfBonus','YIELD_SCIENCE',    1.0,'FROM_UI_ADJACENT_YIELD_SCIENCE',   1),
    ('TEST_DISTRICT_PRESERVE_YIELD_CULTURE_FROM_UI_ADJACENT_YIELD_CULTURE',         'DISTRICT_PRESERVE','SelfBonus','YIELD_CULTURE',    1.0,'FROM_UI_ADJACENT_YIELD_CULTURE',   1),
    ('TEST_DISTRICT_PRESERVE_YIELD_FAITH_FROM_UI_ADJACENT_YIELD_FAITH',             'DISTRICT_PRESERVE','SelfBonus','YIELD_FAITH',      1.0,'FROM_UI_ADJACENT_YIELD_FAITH',     1);
--============================================================================================================================






--============================================================================================================================
--圣地测试区
--全部加一遍相邻加成
    INSERT INTO Ruivo_New_Adjacency 
    (ID, DistrictType, YieldType, AdjacencyType, YieldChange, DistrictModifiers, TraitType)
    SELECT 
        'TEST_' || AdjacencyType    AS ID,
        'DISTRICT_HOLY_SITE'        AS DistrictType,
        'YIELD_FAITH'               AS YieldType,
        AdjacencyType,
        1                           AS YieldChange,
        1                           AS DistrictModifiers,
        NULL                        AS TraitType
    FROM Ruivo_AdjacencyType
    WHERE HasCustomAdjacentObject = 0
    AND CanDisplay = 1
    ;
--============================================================================================================================

--============================================================================================================================
--市政广场测试区
    INSERT INTO Ruivo_New_Adjacency 
    (ID,                                                                     DistrictType,          YieldType,  YieldChange, AdjacencyType,   DistrictModifiers, TraitType,  ProvideType,          ModifierOwner, WhoIsTheOwner,  FreeCompose)
    VALUES 
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_NONE_FROM_LATITUDE',                  'DISTRICT_GOVERNMENT', 'YIELD_NONE',       1.0, 'FROM_LATITUDE',          1,              NULL, 'SelfBonus',          'DistrictModifiers', NULL,      1),

    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_DISTRICT_SLOT_FROM_ADJACENT_DISTRICT','DISTRICT_GOVERNMENT', 'YIELD_DISTRICT_SLOT',1.0,'FROM_ADJACENT_DISTRICT',1,              NULL, 'SelfExtraDistrictSlot','DistrictModifiers', NULL,    0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_TRADE_ROUTE_FROM_ADJACENT_DISTRICT',  'DISTRICT_GOVERNMENT', 'YIELD_TRADE_ROUTE',1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfTradeRoute',     'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_HOUSING_FROM_ADJACENT_DISTRICT',      'DISTRICT_GOVERNMENT', 'YIELD_HOUSING',    1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfHousing',        'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_AMENITY_FROM_ADJACENT_DISTRICT',      'DISTRICT_GOVERNMENT', 'YIELD_AMENITY',    1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfAmenity',        'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_LOYALTY_FROM_ADJACENT_DISTRICT',      'DISTRICT_GOVERNMENT', 'YIELD_LOYALTY',    1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfLoyalty',        'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_INFLUENCE_FROM_ADJACENT_DISTRICT',    'DISTRICT_GOVERNMENT', 'YIELD_INFLUENCE',  1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfInfluence',      'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_FAVOR_FROM_ADJACENT_DISTRICT',        'DISTRICT_GOVERNMENT', 'YIELD_FAVOR',      1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfFavor',          'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_TOURISM_FROM_ADJACENT_DISTRICT',      'DISTRICT_GOVERNMENT', 'YIELD_TOURISM',    1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfTourism',        'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_POWER_FROM_ADJACENT_DISTRICT',        'DISTRICT_GOVERNMENT', 'YIELD_POWER',      1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfPower',          'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_MODIFIER_POWER_FROM_ADJACENT_DISTRICT',     'DISTRICT_GOVERNMENT', 'YIELD_POWER',      10,  'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfPowerModifier',  'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_FOOD_FROM_ADJACENT_DISTRICT',         'DISTRICT_GOVERNMENT', 'YIELD_FOOD',       1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfBonus',          'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_PRODUCTION_FROM_ADJACENT_DISTRICT',   'DISTRICT_GOVERNMENT', 'YIELD_PRODUCTION', 1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfBonus',          'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_GOLD_FROM_ADJACENT_DISTRICT',         'DISTRICT_GOVERNMENT', 'YIELD_GOLD',       1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfBonus',          'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_SCIENCE_FROM_ADJACENT_DISTRICT',      'DISTRICT_GOVERNMENT', 'YIELD_SCIENCE',    1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfBonus',          'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_CULTURE_FROM_ADJACENT_DISTRICT',      'DISTRICT_GOVERNMENT', 'YIELD_CULTURE',    1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfBonus',          'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_FAITH_FROM_ADJACENT_DISTRICT',        'DISTRICT_GOVERNMENT', 'YIELD_FAITH',      1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfBonus',          'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_MODIFIER_FOOD_FROM_ADJACENT_DISTRICT',      'DISTRICT_GOVERNMENT', 'YIELD_FOOD',       10,  'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfMultiplier',     'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_MODIFIER_PRODUCTION_FROM_ADJACENT_DISTRICT','DISTRICT_GOVERNMENT', 'YIELD_PRODUCTION', 10,  'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfMultiplier',     'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_MODIFIER_GOLD_FROM_ADJACENT_DISTRICT',      'DISTRICT_GOVERNMENT', 'YIELD_GOLD',       10,  'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfMultiplier',     'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_MODIFIER_SCIENCE_FROM_ADJACENT_DISTRICT',   'DISTRICT_GOVERNMENT', 'YIELD_SCIENCE',    10,  'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfMultiplier',     'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_MODIFIER_CULTURE_FROM_ADJACENT_DISTRICT',   'DISTRICT_GOVERNMENT', 'YIELD_CULTURE',    10,  'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfMultiplier',     'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_MODIFIER_FAITH_FROM_ADJACENT_DISTRICT',     'DISTRICT_GOVERNMENT', 'YIELD_FAITH',      10,  'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfMultiplier',     'DistrictModifiers', NULL,      0);
--伟人点部分
    INSERT INTO Ruivo_New_Adjacency (ID, DistrictType, YieldType, YieldChange, AdjacencyType, DistrictModifiers, TraitType, ProvideType, ModifierOwner, WhoIsTheOwner, FreeCompose) 
    SELECT       'RUIVO_DISTRICT_GOVERNMENT_' || GreatPersonClassType || '_FROM_ADJACENT_DISTRICT',           'DISTRICT_GOVERNMENT', GreatPersonClassType, 1,  'FROM_ADJACENT_DISTRICT', 1, NULL, 'GreatPersonPoints',     'DistrictModifiers', NULL, 0 FROM GreatPersonClasses WHERE GreatPersonClassType != 'GREAT_PERSON_CLASS_COMANDANTE_GENERAL'
    UNION SELECT 'RUIVO_DISTRICT_GOVERNMENT_MODIFIER_' || GreatPersonClassType || '_FROM_ADJACENT_DISTRICT',  'DISTRICT_GOVERNMENT', GreatPersonClassType, 10, 'FROM_ADJACENT_DISTRICT', 1, NULL, 'GreatPersonMultiplier', 'DistrictModifiers', NULL, 0 FROM GreatPersonClasses WHERE GreatPersonClassType != 'GREAT_PERSON_CLASS_COMANDANTE_GENERAL';
--============================================================================================================================










--基础示例：
    INSERT INTO Ruivo_New_Adjacency 
(ID,DistrictType,ProvideType,YieldType,AdjacencyType,YieldChange,DistrictModifiers) VALUES 
('centertest5','DISTRICT_CITY_CENTER','SelfBonus','YIELD_GOLD','FROM_UI_CITY_DISTRICT_SLOT',1,1),
('centertest4','DISTRICT_CITY_CENTER','SelfBonus','YIELD_FAITH','FROM_UI_CITY_SURPLUS_DISTRICT_SLOT',1,1),

('centertest','DISTRICT_CITY_CENTER','SelfHousing','YIELD_HOUSING','FROM_SELF_WATER_LEVEL',1,1),
('centertest1','DISTRICT_CITY_CENTER','SelfBonus','YIELD_FOOD','FROM_ADJACENT_WATER_LEVEL',1,1),
('centertest2','DISTRICT_CITY_CENTER','SelfLoyalty','YIELD_LOYALTY','FROM_UI_SELF_UNIT_LEVELS',1,1),
('centertest3','DISTRICT_CITY_CENTER','SelfMultiplier','YIELD_FOOD','FROM_UI_ADJACENT_UNIT_LEVELS',1,1);

--人口数34%转化为宜居度
INSERT INTO Ruivo_New_Adjacency 
(ID,DistrictType,ProvideType,YieldType,AdjacencyType,YieldChange,DistrictModifiers) VALUES 
('centertest7','DISTRICT_CAMPUS','SelfAmenity','YIELD_AMENITY','FROM_CITY_POPULATION',0.34,1);










-- 插入到游戏全局 GameModifiers 表
INSERT INTO GameModifiers (ModifierId) VALUES 
('RUIVO_CITY_SYSTEM_TEST_CITYEXP_LEVEL');
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES 
('RUIVO_CITY_SYSTEM_TEST_CITYEXP_LEVEL', 'MODIFIER_RUIVO_ADJUST_ALL_CITIES_PROPERTY');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('RUIVO_CITY_SYSTEM_TEST_CITYEXP_LEVEL', 'Key',    'CITYEXP_RATE'),
('RUIVO_CITY_SYSTEM_TEST_CITYEXP_LEVEL', 'Amount', '50');


-- 城市体系相邻加成对象（CITYEXP）
INSERT INTO Ruivo_New_Adjacency 
(ID, DistrictType, ProvideType, YieldType, YieldChange, AdjacencyType, CustomAdjacentObject, DistrictModifiers, TraitType, ModifierOwner, WhoIsTheOwner, CollectionType, Only, FreeCompose)
VALUES 
('RUIVO_TEST_CITYEXP_LEVEL',      'DISTRICT_CITY_CENTER', 'SelfTradeRoute', 'YIELD_TRADE_ROUTE', 1.0, 'FROM_PLOT_PROPERTY_HASHED', 'CITYEXP_LEVEL',      1, NULL, 'DistrictModifiers', NULL, 'COLLECTION_CITY_DISTRICTS', 'Human&AI', 0),
('RUIVO_TEST_CITYEXP_PROGRESS',   'DISTRICT_CITY_CENTER', 'SelfLoyalty', 'YIELD_LOYALTY', 1.0, 'FROM_PLOT_PROPERTY_HASHED', 'CITYEXP_PROGRESS',   1, NULL, 'DistrictModifiers', NULL, 'COLLECTION_CITY_DISTRICTS', 'Human&AI', 0),

('RUIVO_TEST_CITYEXP_THRESHOLD',  'DISTRICT_CITY_CENTER', 'SelfTourism', 'YIELD_TOURISM', 1.0, 'FROM_CITY_PROPERTY_HASHED', 'CITYEXP_THRESHOLD',  1, NULL, 'DistrictModifiers', NULL, 'COLLECTION_CITY_DISTRICTS', 'Human&AI', 0),
('RUIVO_TEST_CITYEXP_RATE',       'DISTRICT_CITY_CENTER', 'SelfBonus', 'YIELD_CULTURE', 1.0, 'FROM_CITY_PROPERTY_HASHED', 'CITYEXP_RATE',       1, NULL, 'DistrictModifiers', NULL, 'COLLECTION_CITY_DISTRICTS', 'Human&AI', 0),
('RUIVO_TEST_CITYEXP_MULTIPLIER', 'DISTRICT_CITY_CENTER', 'SelfMultiplier', 'YIELD_CULTURE', 1.0, 'FROM_CITY_PROPERTY_HASHED', 'CITYEXP_MULTIPLIER', 1, NULL, 'DistrictModifiers', NULL, 'COLLECTION_CITY_DISTRICTS', 'Human&AI', 0);
INSERT INTO Ruivo_New_Adjacency_Text (ID, Tooltip)
VALUES
('RUIVO_TEST_CITYEXP_LEVEL',      'LOC_RUIVO_TEST_CITYEXP_LEVEL'),
('RUIVO_TEST_CITYEXP_PROGRESS',   'LOC_RUIVO_TEST_CITYEXP_PROGRESS'),
('RUIVO_TEST_CITYEXP_THRESHOLD',  'LOC_RUIVO_TEST_CITYEXP_THRESHOLD'),
('RUIVO_TEST_CITYEXP_RATE',       'LOC_RUIVO_TEST_CITYEXP_RATE'),
('RUIVO_TEST_CITYEXP_MULTIPLIER', 'LOC_RUIVO_TEST_CITYEXP_MULTIPLIER');













--============================================================================================================================
--圣地测试区
--全部加一遍相邻加成
    INSERT INTO Ruivo_New_Adjacency 
    (ID, DistrictType, YieldType, AdjacencyType, YieldChange, DistrictModifiers, TraitType)
    SELECT 
        'TEST_' || AdjacencyType    AS ID,
        'DISTRICT_HOLY_SITE'        AS DistrictType,
        'YIELD_FAITH'               AS YieldType,
        AdjacencyType,
        1                           AS YieldChange,
        1                           AS DistrictModifiers,
        NULL                        AS TraitType
    FROM Ruivo_AdjacencyType
    WHERE HasCustomAdjacentObject = 0
    AND CanDisplay = 1
    ;
--============================================================================================================================

--============================================================================================================================
--市政广场测试区
    INSERT INTO Ruivo_New_Adjacency 
    (ID,                                                                     DistrictType,          YieldType,  YieldChange, AdjacencyType,   DistrictModifiers, TraitType,  ProvideType,          ModifierOwner, WhoIsTheOwner,  FreeCompose)
    VALUES 
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_NONE_FROM_LATITUDE',                  'DISTRICT_GOVERNMENT', 'YIELD_NONE',       1.0, 'FROM_LATITUDE',          1,              NULL, 'SelfBonus',          'DistrictModifiers', NULL,      1),

    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_TRADE_ROUTE_FROM_ADJACENT_DISTRICT',  'DISTRICT_GOVERNMENT', 'YIELD_TRADE_ROUTE',1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfTradeRoute',     'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_HOUSING_FROM_ADJACENT_DISTRICT',      'DISTRICT_GOVERNMENT', 'YIELD_HOUSING',    1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfHousing',        'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_AMENITY_FROM_ADJACENT_DISTRICT',      'DISTRICT_GOVERNMENT', 'YIELD_AMENITY',    1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfAmenity',        'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_LOYALTY_FROM_ADJACENT_DISTRICT',      'DISTRICT_GOVERNMENT', 'YIELD_LOYALTY',    1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfLoyalty',        'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_INFLUENCE_FROM_ADJACENT_DISTRICT',    'DISTRICT_GOVERNMENT', 'YIELD_INFLUENCE',  1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfInfluence',      'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_FAVOR_FROM_ADJACENT_DISTRICT',        'DISTRICT_GOVERNMENT', 'YIELD_FAVOR',      1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfFavor',          'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_TOURISM_FROM_ADJACENT_DISTRICT',      'DISTRICT_GOVERNMENT', 'YIELD_TOURISM',    1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfTourism',        'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_POWER_FROM_ADJACENT_DISTRICT',        'DISTRICT_GOVERNMENT', 'YIELD_POWER',      1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfPower',          'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_MODIFIER_POWER_FROM_ADJACENT_DISTRICT',     'DISTRICT_GOVERNMENT', 'YIELD_POWER',      10,  'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfPowerModifier',  'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_FOOD_FROM_ADJACENT_DISTRICT',         'DISTRICT_GOVERNMENT', 'YIELD_FOOD',       1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfBonus',          'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_PRODUCTION_FROM_ADJACENT_DISTRICT',   'DISTRICT_GOVERNMENT', 'YIELD_PRODUCTION', 1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfBonus',          'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_GOLD_FROM_ADJACENT_DISTRICT',         'DISTRICT_GOVERNMENT', 'YIELD_GOLD',       1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfBonus',          'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_SCIENCE_FROM_ADJACENT_DISTRICT',      'DISTRICT_GOVERNMENT', 'YIELD_SCIENCE',    1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfBonus',          'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_CULTURE_FROM_ADJACENT_DISTRICT',      'DISTRICT_GOVERNMENT', 'YIELD_CULTURE',    1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfBonus',          'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_FAITH_FROM_ADJACENT_DISTRICT',        'DISTRICT_GOVERNMENT', 'YIELD_FAITH',      1.0, 'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfBonus',          'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_MODIFIER_FOOD_FROM_ADJACENT_DISTRICT',      'DISTRICT_GOVERNMENT', 'YIELD_FOOD',       10,  'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfMultiplier',     'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_MODIFIER_PRODUCTION_FROM_ADJACENT_DISTRICT','DISTRICT_GOVERNMENT', 'YIELD_PRODUCTION', 10,  'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfMultiplier',     'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_MODIFIER_GOLD_FROM_ADJACENT_DISTRICT',      'DISTRICT_GOVERNMENT', 'YIELD_GOLD',       10,  'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfMultiplier',     'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_MODIFIER_SCIENCE_FROM_ADJACENT_DISTRICT',   'DISTRICT_GOVERNMENT', 'YIELD_SCIENCE',    10,  'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfMultiplier',     'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_MODIFIER_CULTURE_FROM_ADJACENT_DISTRICT',   'DISTRICT_GOVERNMENT', 'YIELD_CULTURE',    10,  'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfMultiplier',     'DistrictModifiers', NULL,      0),
    ('RUIVO_DISTRICT_GOVERNMENT_MODIFIER_FAITH_FROM_ADJACENT_DISTRICT',     'DISTRICT_GOVERNMENT', 'YIELD_FAITH',      10,  'FROM_ADJACENT_DISTRICT', 1,              NULL, 'SelfMultiplier',     'DistrictModifiers', NULL,      0);
--伟人点部分
    INSERT INTO Ruivo_New_Adjacency (ID, DistrictType, YieldType, YieldChange, AdjacencyType, DistrictModifiers, TraitType, ProvideType, ModifierOwner, WhoIsTheOwner, FreeCompose) 
    SELECT       'RUIVO_DISTRICT_GOVERNMENT_' || GreatPersonClassType || '_FROM_ADJACENT_DISTRICT',           'DISTRICT_GOVERNMENT', GreatPersonClassType, 1,  'FROM_ADJACENT_DISTRICT', 1, NULL, 'GreatPersonPoints',     'DistrictModifiers', NULL, 0 FROM GreatPersonClasses WHERE GreatPersonClassType != 'GREAT_PERSON_CLASS_COMANDANTE_GENERAL'
    UNION SELECT 'RUIVO_DISTRICT_GOVERNMENT_MODIFIER_' || GreatPersonClassType || '_FROM_ADJACENT_DISTRICT',  'DISTRICT_GOVERNMENT', GreatPersonClassType, 10, 'FROM_ADJACENT_DISTRICT', 1, NULL, 'GreatPersonMultiplier', 'DistrictModifiers', NULL, 0 FROM GreatPersonClasses WHERE GreatPersonClassType != 'GREAT_PERSON_CLASS_COMANDANTE_GENERAL';
--============================================================================================================================

INSERT INTO Ruivo_New_Adjacency 
(ID,DistrictType,ProvideType,YieldType,AdjacencyType,YieldChange,DistrictModifiers) VALUES 
('centertest7','DISTRICT_CAMPUS','SelfTradeRoute','YIELD_TRADE_ROUTE','FROM_PLAYER_TOTAL_UNITS', 1,1),
('centertest8','DISTRICT_CAMPUS','SelfFavor','YIELD_FAVOR','FROM_PLAYER_RESOURCES_TYPES', 1,1);









    INSERT INTO Ruivo_New_Adjacency 
    (ID, DistrictType,                              -->ID和区域（注意，一定要以区域为主体，ID是主键，不要重复）
    ProvideType, YieldType, YieldChange,            -->提供的产出分类、产出类型、产出量（产出类型一定要严格对应产出分类，比如商路对应商路大类）
    AdjacencyType, CustomAdjacentObject, Rings,     -->相邻类型、自定义指定相邻目标（指定相邻目标依赖于相邻类型）
    DistrictModifiers, TraitType,                   -->是否为区域通用（0/1） 是否来自于特质（填了这个可以不填前面那个）      
    ModifierOwner, WhoIsTheOwner, CollectionType,   -->实际来源类型、来源目标、作用目标
    Only,                                           -->是否为人类/AI独享
    FreeCompose)                                    -->自由组装模式

    VALUES 
    ('RUIVO_TEST_RINGS', 'DISTRICT_HOLY_SITE', 
    'SelfLoyalty', 'YIELD_LOYALTY', 1.0, 
    'FROM_RINGS_CAO_RESOURCE', 'RESOURCE_WHEAT', 3,
    1, NULL, 
    'DistrictModifiers', NULL, 'COLLECTION_CITY_DISTRICTS', 
    'Human&AI', 
    0);




    INSERT INTO Ruivo_New_Adjacency_Text (ID, Tooltip)
    VALUES
    ('RUIVO_TEST_RINGS',      'LOC_RUIVO_TEST_RINGS');








































--============================================================================================================================
--基础示例：
    INSERT INTO Ruivo_New_Adjacency 
    (ID,                                                                         DistrictType,                   YieldType,               AdjacencyType,             YieldChange,        DistrictModifiers,  TraitType,  FreeCompose) VALUES 
--堤坝：相邻河流每个面+1粮+1锤
    ('RUIVO_DISTRICT_DAM_YIELD_FOOD_FROM_RIVER_CROSSING',                       'DISTRICT_DAM',                 'YIELD_FOOD',            'FROM_RIVER_CROSSING',      1,                  1,                  NULL,       0),
    ('RUIVO_DISTRICT_DAM_YIELD_PRODUCTION_FROM_RIVER_CROSSING',                 'DISTRICT_DAM',                 'YIELD_PRODUCTION',      'FROM_RIVER_CROSSING',      1,                  1,                  NULL,       0),
--运河：相邻每个在岗公民+2金，至少相邻6个在岗公民时+100%
    ('RUIVO_DISTRICT_CANAL_YIELD_GOLD_FROM_ADJACENT_WORKER',                    'DISTRICT_CANAL',               'YIELD_GOLD',            'FROM_ADJACENT_WORKER',     2,                  1,                  NULL,       0),
--水渠：相邻每个淡水湖+1粮
    ('RUIVO_DISTRICT_AQUEDUCT_YIELD_FOOD_FROM_ADJACENT_LAKE',                   'DISTRICT_AQUEDUCT',            'YIELD_FOOD',            'FROM_ADJACENT_LAKE',       1,                  1,                  NULL,       0),
--工业区：相邻每个等级的道路提供对应相邻加成
    ('RUIVO_DISTRICT_INDUSTRIAL_ZONE_YIELD_PRODUCTION_FROM_ADJACENT_ROUTE',     'DISTRICT_INDUSTRIAL_ZONE',     'YIELD_PRODUCTION',      'FROM_ADJACENT_ROUTE',   0.34,                  1,                  NULL,       0),
--军营：相邻每个单位+1生产力（不包括无法移动的单位：商人、间谍），悬崖上的军营+2生产力
    ('RUIVO_DISTRICT_ENCAMPMENT_YIELD_PRODUCTION_FROM_ADJACENT_UNIT',           'DISTRICT_ENCAMPMENT',          'YIELD_PRODUCTION',      'FROM_ADJACENT_UNIT',       1,                  1,                  NULL,       0),
    ('RUIVO_DISTRICT_ENCAMPMENT_YIELD_PRODUCTION_FROM_CLIFF',                   'DISTRICT_ENCAMPMENT',          'YIELD_PRODUCTION',      'FROM_CLIFF',               2,                  1,                  NULL,       0);
--军营：相邻每个单位+1城市忠诚度
    INSERT INTO Ruivo_New_Adjacency   (ID, DistrictType, YieldType, YieldChange, AdjacencyType, DistrictModifiers, TraitType,  ProvideType) VALUES 
    ('RUIVO_DISTRICT_ENCAMPMENT_YIELD_LOYALTY_FROM_ADJACENT_UNIT', 'DISTRICT_ENCAMPMENT', 'YIELD_LOYALTY', 1.0, 'FROM_ADJACENT_UNIT', 1,NULL, 'SelfLoyalty');

--社区：
    INSERT INTO Ruivo_New_Adjacency 
    (ID,                                                                         DistrictType,                   YieldType,               AdjacencyType,                YieldChange,        DistrictModifiers,  TraitType,  FreeCompose) VALUES 
--本城每个人口为社区+0.5生产力
    ('RUIVO_DISTRICT_NEIGHBORHOOD_YIELD_PRODUCTION_FROM_CITY_POPULATION',       'DISTRICT_NEIGHBORHOOD',        'YIELD_PRODUCTION',      'FROM_CITY_POPULATION',        0.5,                1,                  NULL,       0),
--本城每个住房为社区+0.25粮食
    ('RUIVO_DISTRICT_NEIGHBORHOOD_YIELD_FOOD_FROM_CITY_TOTAL_HOUSING',          'DISTRICT_NEIGHBORHOOD',        'YIELD_FOOD',            'FROM_CITY_TOTAL_HOUSING',     0.25,               1,                  NULL,       0),
--本城剩余住房为社区+1金币
    ('RUIVO_DISTRICT_NEIGHBORHOOD_YIELD_GOLD_FROM_CITY_SURPLUS_HOUSING',        'DISTRICT_NEIGHBORHOOD',        'YIELD_GOLD',            'FROM_CITY_SURPLUS_HOUSING',   1,                  1,                  NULL,       0);

--为相邻区域提供加成，而不是本身获得加成
    INSERT INTO Ruivo_New_Adjacency
    (ID,                                                                                   DistrictType,                           YieldType,   YieldChange, AdjacencyType,                DistrictModifiers, ProvideType)  VALUES 
--商业中心：每经营一条贸易路线，为相邻区域+2金币相邻加成
    ('RUIVO_DISTRICT_COMMERCIAL_HUB_YIELD_GOLD_FROM_OUTGOING_ROUTES',                     'DISTRICT_COMMERCIAL_HUB',              'YIELD_GOLD', 2,          'FROM_OUTGOING_ROUTES',        1,                 'ProvideToADJ'),
--娱乐中心：本城每点溢出宜居度，为相邻区域+2金币相邻加成
    ('RUIVO_DISTRICT_ENTERTAINMENT_COMPLEX_YIELD_GOLD_FROM_CITY_SURPLUS_AMENITIES',       'DISTRICT_ENTERTAINMENT_COMPLEX',       'YIELD_GOLD', 2,          'FROM_CITY_SURPLUS_AMENITIES', 1,                 'ProvideToADJ'),
--水上乐园：本城每点溢出宜居度，为相邻区域+4金币相邻加成
    ('RUIVO_DISTRICT_WATER_ENTERTAINMENT_COMPLEX_YIELD_GOLD_FROM_CITY_SURPLUS_AMENITIES', 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX', 'YIELD_GOLD', 4,          'FROM_CITY_SURPLUS_AMENITIES', 1,                 'ProvideToADJ');

--剧院广场/学院：本区域内每有一个在岗公民，相邻加成提高50%
    INSERT INTO Ruivo_New_Adjacency
    (ID,                                                          DistrictType,       YieldType,      YieldChange,  AdjacencyType,     DistrictModifiers, ProvideType) 
    VALUES 
    ('RUIVO_DISTRICT_THEATER_YIELD_CULTURE_FROM_SELF_WORKER',    'DISTRICT_THEATER', 'YIELD_CULTURE', 50,          'FROM_SELF_WORKER', 1,                'SelfMultiplier'),
    ('RUIVO_DISTRICT_CAMPUS_YIELD_SCIENCE_FROM_SELF_WORKER',     'DISTRICT_CAMPUS',  'YIELD_SCIENCE', 50,          'FROM_SELF_WORKER', 1,                'SelfMultiplier');

--水渠获得相邻单元格淡水等级总和15%的住房（无水0，咸水1，淡水3）
--外交区每相邻一个区域+1影响力+1外交支持
--航空港每相邻一个区域+1旅游业绩+1贸易路线
    INSERT INTO Ruivo_New_Adjacency   (ID, DistrictType, YieldType, YieldChange, AdjacencyType, DistrictModifiers, TraitType,  ProvideType) VALUES 
    ('RUIVO_DISTRICT_AQUEDUCT_YIELD_HOUSING_FROM_ADJACENT_WATER_LEVEL', 'DISTRICT_AQUEDUCT', 'YIELD_HOUSING', 0.15, 'FROM_ADJACENT_WATER_LEVEL', 1,NULL, 'SelfHousing'),
    ('RUIVO_DISTRICT_DIPLOMATIC_QUARTER_YIELD_INFLUENCE_FROM_ADJACENT_DISTRICT', 'DISTRICT_DIPLOMATIC_QUARTER', 'YIELD_INFLUENCE', 1.0, 'FROM_ADJACENT_DISTRICT', 1,NULL, 'SelfInfluence'),
    ('RUIVO_DISTRICT_DIPLOMATIC_QUARTER_YIELD_FAVOR_FROM_ADJACENT_DISTRICT', 'DISTRICT_DIPLOMATIC_QUARTER', 'YIELD_FAVOR', 1.0, 'FROM_ADJACENT_DISTRICT', 1,NULL, 'SelfFavor'),
    ('RUIVO_DISTRICT_AERODROME_YIELD_TOURISM_FROM_ADJACENT_DISTRICT', 'DISTRICT_AERODROME', 'YIELD_TOURISM', 1.0, 'FROM_ADJACENT_DISTRICT', 1,NULL, 'SelfTourism'),
    ('RUIVO_DISTRICT_AERODROME_YIELD_TRADE_ROUTE_FROM_ADJACENT_DISTRICT', 'DISTRICT_AERODROME', 'YIELD_TRADE_ROUTE', 1.0, 'FROM_ADJACENT_DISTRICT', 1,NULL, 'SelfTradeRoute');
--============================================================================================================================

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
--圣地巡礼：每个信仰此宗教的国外信徒为圣地+1旅游业绩
    INSERT INTO Ruivo_New_Adjacency (ID,                                            DistrictType,           YieldType,           YieldChange,       AdjacencyType,                             DistrictModifiers,  ProvideType) VALUES
    ('RUIVO_DISTRICT_HOLY_SITE_YIELD_TOURISM_FROM_RELIGION_FOREIGN_FOLLOWERS',     'DISTRICT_HOLY_SITE',   'YIELD_TOURISM',      1.0,              'FROM_RELIGION_FOREIGN_FOLLOWERS',          1,                 'SelfTourism');
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
    ('RUIVO_DISTRICT_GOVERNMENT_YIELD_LOYALTY_FROM_SLOT_MILITARY',          'DISTRICT_GOVERNMENT', 'YIELD_LOYALTY',    8.0, 'FROM_SLOT_MILITARY', 1,                  NULL, 'SelfLoyalty',        'DistrictModifiers', NULL,      0),

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










--以下为兼容部分
--============================================================================================================================
--示例：为某种区域的取代特色区域补充
--给特色工业区也补上全新相邻加成（应该会select到高卢和德国的特色工业区）
    INSERT INTO Ruivo_New_Adjacency
    (ID,                                                                                                          DistrictType,       YieldType,       YieldChange,       AdjacencyType,     TraitType,       FreeCompose,       ProvideType) SELECT 
    'RUIVO_' || DR.CivUniqueDistrictType || '_' || Ruivo.YieldType || '_' || Ruivo.AdjacencyType,     DR.CivUniqueDistrictType, Ruivo.YieldType, Ruivo.YieldChange, Ruivo.AdjacencyType, Dis.TraitType, Ruivo.FreeCompose, Ruivo.ProvideType
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
    (ID,                                                                                                          DistrictType,       YieldType,       YieldChange,       AdjacencyType,     TraitType,       FreeCompose,       ProvideType) SELECT 
    'RUIVO_' || DR.CivUniqueDistrictType || '_' || Ruivo.YieldType || '_' || Ruivo.AdjacencyType,     DR.CivUniqueDistrictType, Ruivo.YieldType, Ruivo.YieldChange, Ruivo.AdjacencyType, Dis.TraitType, Ruivo.FreeCompose, Ruivo.ProvideType
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