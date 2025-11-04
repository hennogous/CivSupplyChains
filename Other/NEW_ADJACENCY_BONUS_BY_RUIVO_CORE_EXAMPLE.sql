--Modular Adjacency Bonus Example
    INSERT INTO Ruivo_New_Adjacency 
    (ID, DistrictType,                              -->ID and District (Note: Always use the district as the main subject, ID is the primary key, do not duplicate)
    ProvideType, YieldType, YieldChange,            -->Type of yield provided, yield type, yield amount (Yield type must strictly correspond to the yield category, e.g., trade route corresponds to trade route category)
    AdjacencyType, CustomAdjacentObject, Rings,     -->Adjacency type, custom specified adjacent object (specified adjacent object depends on adjacency type)
    DistrictModifiers)                                    
    VALUES 

--Dam: +1 Food +1 Production for each adjacent river segment
    ('RUIVO_DISTRICT_DAM_YIELD_FOOD_FROM_RIVER_CROSSING', 'DISTRICT_DAM', 
    'SelfBonus', 'YIELD_FOOD', 1.0, 
    'FROM_RIVER_CROSSING', 'NONE', 1,
    1),
    ('RUIVO_DISTRICT_DAM_YIELD_PRODUCTION_FROM_RIVER_CROSSING', 'DISTRICT_DAM', 
    'SelfBonus', 'YIELD_PRODUCTION', 1.0, 
    'FROM_RIVER_CROSSING', 'NONE', 1,
    1),
    

--Canal: +2 Gold for each adjacent working citizen
    ('RUIVO_DISTRICT_CANAL_YIELD_GOLD_FROM_ADJACENT_WORKER', 'DISTRICT_CANAL', 
    'SelfBonus', 'YIELD_GOLD', 2, 
    'FROM_ADJACENT_WORKER', 'NONE', 1,
    1),


--Aqueduct: +1 Food for each adjacent lake, gain production based on the freshwater level of the tile, gain 10% of the total adjacent tiles' freshwater level as housing (no water 0, saltwater 1, freshwater 3)
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


--Industrial Zone: Gain 34% of the sum of adjacent road levels as production (6 railroads +10 production), each road level on the tile +10% production modifier (with railroad +50% production modifier)
    ('RUIVO_DISTRICT_INDUSTRIAL_ZONE_YIELD_PRODUCTION_FROM_ADJACENT_ROUTE', 'DISTRICT_INDUSTRIAL_ZONE', 
    'SelfBonus', 'YIELD_PRODUCTION', 0.34, 
    'FROM_ADJACENT_ROUTE', 'NONE', 1,
    1),
    ('RUIVO_DISTRICT_INDUSTRIAL_ZONE_MODIFIER_PRODUCTION_FROM_SELF_ROUTE', 'DISTRICT_INDUSTRIAL_ZONE', 
    'SelfMultiplier', 'YIELD_PRODUCTION', 10, 
    'FROM_SELF_ROUTE', 'NONE', 1,
    1),

    
--Encampment: Gain 10% of city defense as production, +1 loyalty for each adjacent unit
    ('RUIVO_DISTRICT_ENCAMPMENT_YIELD_PRODUCTION_FROM_CITY_DEFENSE_STRENGTH', 'DISTRICT_ENCAMPMENT', 
    'SelfBonus', 'YIELD_PRODUCTION', 0.1, 
    'FROM_CITY_DEFENSE_STRENGTH', 'NONE', 1,
    1),
    ('RUIVO_DISTRICT_ENCAMPMENT_YIELD_LOYALTY_FROM_ADJACENT_UNIT', 'DISTRICT_ENCAMPMENT', 
    'SelfLoyalty', 'YIELD_LOYALTY', 1, 
    'FROM_ADJACENT_UNIT', 'NONE', 1,
    1);


--Neighborhood:
    INSERT INTO Ruivo_New_Adjacency 
    (ID,                                                                         DistrictType,                   YieldType,               AdjacencyType,                YieldChange,        DistrictModifiers,  TraitType,  FreeCompose) VALUES 
--Each population in this city gives Neighborhood +0.5 production
    ('RUIVO_DISTRICT_NEIGHBORHOOD_YIELD_PRODUCTION_FROM_CITY_POPULATION',       'DISTRICT_NEIGHBORHOOD',        'YIELD_PRODUCTION',      'FROM_CITY_POPULATION',        0.5,                1,                  NULL,       0),
--Each housing in this city gives Neighborhood +0.25 food
    ('RUIVO_DISTRICT_NEIGHBORHOOD_YIELD_FOOD_FROM_CITY_TOTAL_HOUSING',          'DISTRICT_NEIGHBORHOOD',        'YIELD_FOOD',            'FROM_CITY_TOTAL_HOUSING',     0.25,               1,                  NULL,       0),
--Each surplus housing in this city gives Neighborhood +1 gold
    ('RUIVO_DISTRICT_NEIGHBORHOOD_YIELD_GOLD_FROM_CITY_SURPLUS_HOUSING',        'DISTRICT_NEIGHBORHOOD',        'YIELD_GOLD',            'FROM_CITY_SURPLUS_HOUSING',   1,                  1,                  NULL,       0);


--Commercial Hub, Entertainment Complex, Water Park
    INSERT INTO Ruivo_New_Adjacency
    (ID,                                                                                   DistrictType,                           YieldType,   YieldChange, AdjacencyType,                DistrictModifiers, ProvideType)  VALUES 
--Commercial Hub: +2 gold for each outgoing trade route
    ('RUIVO_DISTRICT_COMMERCIAL_HUB_YIELD_GOLD_FROM_OUTGOING_ROUTES',                     'DISTRICT_COMMERCIAL_HUB',              'YIELD_GOLD', 2,          'FROM_OUTGOING_ROUTES',        1,                 'SelfBonus'),
--Entertainment Complex: +2 gold for each surplus amenity in this city
    ('RUIVO_DISTRICT_ENTERTAINMENT_COMPLEX_YIELD_GOLD_FROM_CITY_SURPLUS_AMENITIES',       'DISTRICT_ENTERTAINMENT_COMPLEX',       'YIELD_GOLD', 2,          'FROM_CITY_SURPLUS_AMENITIES', 1,                 'SelfBonus'),
--Water Park: +4 gold for each surplus amenity in this city
    ('RUIVO_DISTRICT_WATER_ENTERTAINMENT_COMPLEX_YIELD_GOLD_FROM_CITY_SURPLUS_AMENITIES', 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX', 'YIELD_GOLD', 4,          'FROM_CITY_SURPLUS_AMENITIES', 1,                 'SelfBonus');


--Theater Square/Campus: For each working citizen in this district, adjacency bonus increases by 25%
    INSERT INTO Ruivo_New_Adjacency
    (ID,                                                          DistrictType,       YieldType,      YieldChange,  AdjacencyType,     DistrictModifiers, ProvideType) 
    VALUES 
    ('RUIVO_DISTRICT_THEATER_YIELD_CULTURE_FROM_SELF_WORKER',    'DISTRICT_THEATER', 'YIELD_CULTURE', 25,          'FROM_SELF_WORKER', 1,                'SelfMultiplier'),
    ('RUIVO_DISTRICT_CAMPUS_YIELD_SCIENCE_FROM_SELF_WORKER',     'DISTRICT_CAMPUS',  'YIELD_SCIENCE', 25,          'FROM_SELF_WORKER', 1,                'SelfMultiplier');


--Diplomatic Quarter: +1 influence and +1 diplomatic favor for each adjacent district
--Aerodrome: +1 tourism and +1 trade route for each adjacent district
    INSERT INTO Ruivo_New_Adjacency   (ID, DistrictType, YieldType, YieldChange, AdjacencyType, DistrictModifiers, TraitType,  ProvideType) VALUES 
    ('RUIVO_DISTRICT_DIPLOMATIC_QUARTER_YIELD_INFLUENCE_FROM_ADJACENT_DISTRICT', 'DISTRICT_DIPLOMATIC_QUARTER', 'YIELD_INFLUENCE', 1.0, 'FROM_ADJACENT_DISTRICT', 1,NULL, 'SelfInfluence'),
    ('RUIVO_DISTRICT_DIPLOMATIC_QUARTER_YIELD_FAVOR_FROM_ADJACENT_DISTRICT', 'DISTRICT_DIPLOMATIC_QUARTER', 'YIELD_FAVOR', 1.0, 'FROM_ADJACENT_DISTRICT', 1,NULL, 'SelfFavor'),
    ('RUIVO_DISTRICT_AERODROME_YIELD_TOURISM_FROM_ADJACENT_DISTRICT', 'DISTRICT_AERODROME', 'YIELD_TOURISM', 1.0, 'FROM_ADJACENT_DISTRICT', 1,NULL, 'SelfTourism'),
    ('RUIVO_DISTRICT_AERODROME_YIELD_TRADE_ROUTE_FROM_ADJACENT_DISTRICT', 'DISTRICT_AERODROME', 'YIELD_TRADE_ROUTE', 1.0, 'FROM_ADJACENT_DISTRICT', 1,NULL, 'SelfTradeRoute');


--============================================================================================================================
--When the number of working citizens in the canal is 6, the gold adjacency bonus is doubled
--I also provide properties for counting the total and the total after applying the multiplier
--Number of adjacent objects: ID || '_TOTAL'
--Total adjacency bonus obtained: ID || '_ACTUAL_AMOUNT'
        --Insert part
        INSERT INTO DistrictModifiers (DistrictType, ModifierId)
        SELECT "DISTRICT_CANAL", "DISTRICT_CANAL_ADJUST_YIELD_MODIFIER_FROM_ADJACENT_WORKER_6"
        WHERE EXISTS (SELECT 1 FROM Districts WHERE DistrictType = "DISTRICT_CANAL");

        --Modifier assembly part
        INSERT INTO Modifiers (ModifierId, ModifierType, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
        ("DISTRICT_CANAL_ADJUST_YIELD_MODIFIER_FROM_ADJACENT_WORKER_6", "RUIVO_MODIFIER_PLAYER_DISTRICT_ADJUST_YIELD_MODIFIER", 'REQUIREMENT_RUIVO_DISTRICT_CANAL_YIELD_GOLD_FROM_ADJACENT_WORKER', NULL);
        INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
        ("DISTRICT_CANAL_ADJUST_YIELD_MODIFIER_FROM_ADJACENT_WORKER_6", "Amount", 100), 
        ("DISTRICT_CANAL_ADJUST_YIELD_MODIFIER_FROM_ADJACENT_WORKER_6", "YieldType", "YIELD_GOLD");

        --Req assembly part: 6 adjacent working citizens
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
--Harbor: For each district in this city, fishing range +1 ring, each coastal and ocean tile within the range +1 gold, increases with the number of rings (e.g., 1 ring +1 gold, 3 rings +3 gold)
    -- Maximum 10 rings
    CREATE TABLE Ruivo_RingList (Num INTEGER PRIMARY KEY);
    INSERT INTO Ruivo_RingList (Num) VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

    --Free assembly mode
    INSERT INTO Ruivo_New_Adjacency
    (ID,                                                          DistrictType,      YieldType,   YieldChange, AdjacencyType,            DistrictModifiers, FreeCompose)  VALUES 
    ('RUIVO_DISTRICT_HARBOR_YIELD_GOLD_FROM_CITY_DISTRICTS_NUM', 'DISTRICT_HARBOR', 'YIELD_GOLD', 1,          'FROM_CITY_DISTRICTS_NUM', 1,                 1);

    -- District applies to player tiles
    INSERT INTO DistrictModifiers (DistrictType, ModifierId) 
    SELECT "DISTRICT_HARBOR", 'LONG_RANGE_FISHING_DISTRICT_HARBOR' || '_' || ListB.Num FROM Ruivo_RingList ListB;

        -- District meets total number of city districts, tile meets adjacent district
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

        --REQ part: total number of city districts -- can only use decimal
            INSERT INTO RequirementSets (RequirementSetId,                      RequirementSetType)
            SELECT          'REQUIREMENT_' || 'LONG_RANGE_FISHING_DISTRICT_HARBOR' || '_' || ListB.Num,    'REQUIREMENTSET_TEST_ALL'                          FROM Ruivo_RingList ListB;

            INSERT INTO RequirementSetRequirements (RequirementSetId,           RequirementId)
            SELECT          'REQUIREMENT_' || 'LONG_RANGE_FISHING_DISTRICT_HARBOR' || '_' || ListB.Num,    'REQUIRES_' || 'LONG_RANGE_FISHING_DISTRICT_HARBOR' || '_' || ListB.Num           FROM Ruivo_RingList ListB;

            INSERT INTO Requirements (RequirementId,                            RequirementType)
            SELECT          'REQUIRES_' || 'LONG_RANGE_FISHING_DISTRICT_HARBOR' || '_' || ListB.Num,       'REQUIREMENT_PLOT_PROPERTY_MATCHES'                  FROM Ruivo_RingList ListB;

            INSERT INTO RequirementArguments (RequirementId,                    Name,                 Value)
            SELECT          'REQUIRES_' || 'LONG_RANGE_FISHING_DISTRICT_HARBOR' || '_' || ListB.Num,       'PropertyName',       'RUIVO_DISTRICT_HARBOR_YIELD_GOLD_FROM_CITY_DISTRICTS_NUM'||'_TOTAL'   FROM Ruivo_RingList ListB
            UNION SELECT    'REQUIRES_' || 'LONG_RANGE_FISHING_DISTRICT_HARBOR' || '_' || ListB.Num,       'PropertyMinimum',    ListB.Num                           FROM Ruivo_RingList ListB;

        --General req:
        --REQ part: corresponding ring number
            INSERT INTO RequirementSets (RequirementSetId,                      RequirementSetType)
            SELECT          'REQUIREMENT_' || 'RUIVO_ADJACENT_TO_OWNER' || '_' || ListB.Num,    'REQUIREMENTSET_TEST_ALL'                          FROM Ruivo_RingList ListB;

            INSERT INTO RequirementSetRequirements (RequirementSetId,           RequirementId)
            SELECT          'REQUIREMENT_' || 'RUIVO_ADJACENT_TO_OWNER' || '_' || ListB.Num,    'REQUIRES_' || 'RUIVO_ADJACENT_TO_OWNER' || '_' || ListB.Num           FROM Ruivo_RingList ListB
            UNION SELECT    'REQUIREMENT_' || 'RUIVO_ADJACENT_TO_OWNER' || '_' || ListB.Num,    'REQUIRES_PLOT_IS_COAST_OR_OCEAN_RUIVO'                               FROM Ruivo_RingList ListB;

            INSERT INTO Requirements (RequirementId,                            RequirementType)
            SELECT          'REQUIRES_' || 'RUIVO_ADJACENT_TO_OWNER' || '_' || ListB.Num,       'REQUIREMENT_PLOT_ADJACENT_TO_OWNER'                  FROM Ruivo_RingList ListB;

            INSERT INTO RequirementArguments (RequirementId,                    Name,                 Value)
            SELECT          'REQUIRES_' || 'RUIVO_ADJACENT_TO_OWNER' || '_' || ListB.Num,       'MaxDistance',      ListB.Num   FROM Ruivo_RingList ListB
            UNION SELECT    'REQUIRES_' || 'RUIVO_ADJACENT_TO_OWNER' || '_' || ListB.Num,       'MinDistance',      ListB.Num   FROM Ruivo_RingList ListB;
        --REQ part: lake, coast, or ocean tile
            insert or ignore into RequirementSets (RequirementSetId,        RequirementSetType) values
                ('REQUIREMENTS_PLOT_IS_COAST_OR_OCEAN_RUIVO',                'REQUIREMENTSET_TEST_ANY');

            insert or ignore into RequirementSetRequirements
                (RequirementSetId,                                            RequirementId)
            values
                ('REQUIREMENTS_PLOT_IS_COAST_OR_OCEAN_RUIVO',                'REQUIRES_TERRAIN_COAST'),
                ('REQUIREMENTS_PLOT_IS_COAST_OR_OCEAN_RUIVO',                'REQUIRES_TERRAIN_OCEAN');

            insert or ignore into Requirements (RequirementId,                RequirementType) values
                ('REQUIRES_PLOT_IS_COAST_OR_OCEAN_RUIVO',                    'REQUIREMENT_REQUIREMENTSET_IS_MET');

            insert or ignore into RequirementArguments (RequirementId,        Name,      Value) values
                ('REQUIRES_PLOT_IS_COAST_OR_OCEAN_RUIVO',                    'RequirementSetId',    'REQUIREMENTS_PLOT_IS_COAST_OR_OCEAN_RUIVO');
--============================================================================================================================


--============================================================================================================================
--Spaceport: Use latitude -50° and +50° as the standard lines for space projects, gain science bonus based on proximity to the equator
--Gain equivalent space project production bonus based on proximity to the equator, gain equivalent space project production penalty based on proximity to the poles, spaceports on the standard lines get 0 bonus and 0 penalty
    INSERT INTO Ruivo_New_Adjacency 
    (ID,                                                         DistrictType,             YieldType,           YieldChange,    AdjacencyType,      DistrictModifiers,  TraitType,  FreeCompose) VALUES 
    ('RUIVO_DISTRICT_SPACEPORT_YIELD_SCIENCE_FROM_LATITUDE',    'DISTRICT_SPACEPORT',     'YIELD_SCIENCE',      1,             'FROM_LATITUDE',     1,                  NULL,       0),
    ('RUIVO_DISTRICT_SPACEPORT_YIELD_PRODUCTION_FROM_POLE',     'DISTRICT_SPACEPORT',     'YIELD_PRODUCTION',   1,             'FROM_POLE',         1,                  NULL,       1);
--============================================================================================================================
--Modifier binding to district part
    INSERT INTO DistrictModifiers (DistrictType,                        ModifierId)
    SELECT 'DISTRICT_SPACEPORT', 'RUIVO_DISTRICT_SPACEPORT_SPACE_RACE_FROM_LATITUDE' || '_' || ListB.Num    FROM Ruivo_BinaryList ListB;
    INSERT INTO DistrictModifiers (DistrictType,                        ModifierId)
    SELECT 'DISTRICT_SPACEPORT', 'RUIVO_DISTRICT_SPACEPORT_SPACE_RACE_FROM_POLE' || '_' || ListB.Num    FROM Ruivo_BinaryList ListB;
--============================================================================================================================
--Custom ModifierType
    INSERT INTO Types (Type, Kind)
    VALUES
    ('RUIVO_MODIFIER_OWNER_CITY_ADJUST_SPACE_RACE_PROJECTS_PRODUCTION', 'KIND_MODIFIER');
    INSERT INTO DynamicModifiers (ModifierType, EffectType, CollectionType)
    VALUES
    ('RUIVO_MODIFIER_OWNER_CITY_ADJUST_SPACE_RACE_PROJECTS_PRODUCTION', 'EFFECT_ADJUST_SPACE_RACE_PROJECTS_PRODUCTION', 'COLLECTION_OWNER_CITY');
--============================================================================================================================
--Modifier assembly part
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
--Government Plaza
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
--Great Person Points part
    INSERT INTO Ruivo_New_Adjacency (ID, DistrictType, YieldType, YieldChange, AdjacencyType, DistrictModifiers, TraitType, ProvideType, ModifierOwner, WhoIsTheOwner, FreeCompose) 
    SELECT 'RUIVO_DISTRICT_GOVERNMENT_' || GreatPersonClassType || '_FROM_SLOT_GREAT_PERSON', 'DISTRICT_GOVERNMENT', GreatPersonClassType, 1, 'FROM_SLOT_GREAT_PERSON', 1, NULL, 'GreatPersonPoints', 'DistrictModifiers', NULL, 0 FROM GreatPersonClasses WHERE GreatPersonClassType != 'GREAT_PERSON_CLASS_COMANDANTE_GENERAL';
--============================================================================================================================




--New part: Ring count statistics
    INSERT INTO Ruivo_New_Adjacency 
    (ID, DistrictType,                              -->ID and District (Note: Always use the district as the main subject, ID is the primary key, do not duplicate)
    ProvideType, YieldType, YieldChange,            -->Type of yield provided, yield type, yield amount (Yield type must strictly correspond to the yield category, e.g., trade route corresponds to trade route category)
    AdjacencyType, CustomAdjacentObject, Rings,     -->Adjacency type, custom specified adjacent object (specified adjacent object depends on adjacency type)
    DistrictModifiers)                                    
    VALUES 

--Campus: For each mountain within 2 rings, +0.5 Great Scientist points to itself
    ('RUIVO_DISTRICT_CAMPUS_GREAT_PERSON_CLASS_SCIENTIST_FROM_IsMountain', 'DISTRICT_CAMPUS', 
    'GreatPersonPoints', 'GREAT_PERSON_CLASS_SCIENTIST', 0.5, 
    'FROM_RINGS_CAO_TERRAIN_SETS', 'IsMountain', 2,
    1),
--Theater: For each city center within 4 rings, +1 Great Writer point to itself
    ('RUIVO_DISTRICT_THEATER_GREAT_PERSON_CLASS_WRITER_FROM_DISTRICT_CITY_CENTER', 'DISTRICT_THEATER', 
    'GreatPersonPoints', 'GREAT_PERSON_CLASS_WRITER', 1, 
    'FROM_RINGS_CAO_DISTRICT', 'DISTRICT_CITY_CENTER', 4,
    1),
--Preserve: For each forest within 3 rings, +0.3 food to itself
    ('RUIVO_DISTRICT_PRESERVE_YIELD_FOOD_FROM_FEATURE_FOREST', 'DISTRICT_PRESERVE', 
    'SelfBonus', 'YIELD_FOOD', 0.3, 
    'FROM_RINGS_CAO_FEATURE', 'FEATURE_FOREST', 3,
    1);



--The following is the compatibility part
--============================================================================================================================
--Example: Supplement for unique replacement districts
--Also add the new adjacency bonus to unique industrial zones (should select Gaul and Germany's unique industrial zones)
    INSERT INTO Ruivo_New_Adjacency
    (ID,                                                                                                          DistrictType,       YieldType,       YieldChange,       AdjacencyType,     TraitType,       FreeCompose,       ProvideType,       CustomAdjacentObject,       Rings) SELECT 
    'RUIVO_' || DR.CivUniqueDistrictType || '_' || Ruivo.YieldType || '_' || Ruivo.AdjacencyType,     DR.CivUniqueDistrictType, Ruivo.YieldType, Ruivo.YieldChange, Ruivo.AdjacencyType, Dis.TraitType, Ruivo.FreeCompose, Ruivo.ProvideType, Ruivo.CustomAdjacentObject, Ruivo.Rings
    FROM DistrictReplaces DR                                    -- District replacement table
    JOIN Ruivo_New_Adjacency Ruivo                              -- New series bonus table, contains normal district inserts
    JOIN Districts Dis                                          -- District definition table
    WHERE 'DISTRICT_INDUSTRIAL_ZONE' = DR.ReplacesDistrictType  -- Replacement district is the corresponding district
    AND 'DISTRICT_INDUSTRIAL_ZONE' = Ruivo.DistrictType         -- Map the new series bonus table to the replaced unique district
    AND DR.CivUniqueDistrictType = Dis.DistrictType             -- Unique district must be bound to a trait, get it from the district definition table
    AND Ruivo.TraitType IS NULL                                 -- Exclude rows that need to be triggered by trait
    ;
--Full supplement part:
    INSERT OR IGNORE INTO Ruivo_New_Adjacency
    (ID,                                                                                                          DistrictType,       YieldType,       YieldChange,       AdjacencyType,     TraitType,       FreeCompose,       ProvideType,       CustomAdjacentObject,       Rings) SELECT 
    'RUIVO_' || DR.CivUniqueDistrictType || '_' || Ruivo.YieldType || '_' || Ruivo.AdjacencyType,     DR.CivUniqueDistrictType, Ruivo.YieldType, Ruivo.YieldChange, Ruivo.AdjacencyType, Dis.TraitType, Ruivo.FreeCompose, Ruivo.ProvideType, Ruivo.CustomAdjacentObject, Ruivo.Rings
    FROM Districts AS d                                                     --Traverse district table   
    JOIN DistrictReplaces DR ON d.DistrictType = DR.ReplacesDistrictType    --Replacement district is the corresponding district
    JOIN Ruivo_New_Adjacency Ruivo ON d.DistrictType = Ruivo.DistrictType   --Map the new series bonus table to the replaced unique district
    JOIN Districts Dis ON DR.CivUniqueDistrictType = Dis.DistrictType       --Return to the district table again to get the value
    WHERE Ruivo.TraitType IS NULL                                           --Exclude rows that need to be triggered by trait
    ;
--============================================================================================================================

--============================================================================================================================
--Harbor: Long-range fishing, unique district compatibility
    -- District applies to player tiles
    INSERT INTO DistrictModifiers (DistrictType, ModifierId) 
    SELECT DR.CivUniqueDistrictType, 'LONG_RANGE_FISHING_' || DR.CivUniqueDistrictType || '_' || ListB.Num FROM Ruivo_RingList ListB JOIN DistrictReplaces DR ON DR.ReplacesDistrictType = 'DISTRICT_HARBOR';

        -- District meets total number of city districts, tile meets adjacent district
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

        --REQ part: total number of city districts -- can only use decimal
            INSERT INTO RequirementSets (RequirementSetId,                      RequirementSetType)
            SELECT          'REQUIREMENT_' || 'LONG_RANGE_FISHING_' || DR.CivUniqueDistrictType || '_' || ListB.Num,    'REQUIREMENTSET_TEST_ALL'                          FROM Ruivo_RingList ListB JOIN DistrictReplaces DR ON DR.ReplacesDistrictType = 'DISTRICT_HARBOR';

            INSERT INTO RequirementSetRequirements (RequirementSetId,           RequirementId)
            SELECT          'REQUIREMENT_' || 'LONG_RANGE_FISHING_' || DR.CivUniqueDistrictType || '_' || ListB.Num,    'REQUIRES_' || 'LONG_RANGE_FISHING_' || DR.CivUniqueDistrictType || '_' || ListB.Num           FROM Ruivo_RingList ListB JOIN DistrictReplaces DR ON DR.ReplacesDistrictType = 'DISTRICT_HARBOR';

            INSERT INTO Requirements (RequirementId,                            RequirementType)
            SELECT          'REQUIRES_' || 'LONG_RANGE_FISHING_' || DR.CivUniqueDistrictType || '_' || ListB.Num,       'REQUIREMENT_PLOT_PROPERTY_MATCHES'                  FROM Ruivo_RingList ListB JOIN DistrictReplaces DR ON DR.ReplacesDistrictType = 'DISTRICT_HARBOR';

            INSERT INTO RequirementArguments (RequirementId,                    Name,                 Value)
            SELECT          'REQUIRES_' || 'LONG_RANGE_FISHING_' || DR.CivUniqueDistrictType || '_' || ListB.Num,       'PropertyName',       'RUIVO_'||DR.CivUniqueDistrictType||'_YIELD_GOLD_FROM_CITY_DISTRICTS_NUM'||'_TOTAL'   FROM Ruivo_RingList ListB JOIN DistrictReplaces DR ON DR.ReplacesDistrictType = 'DISTRICT_HARBOR'
            UNION SELECT    'REQUIRES_' || 'LONG_RANGE_FISHING_' || DR.CivUniqueDistrictType || '_' || ListB.Num,       'PropertyMinimum',    ListB.Num                           FROM Ruivo_RingList ListB JOIN DistrictReplaces DR ON DR.ReplacesDistrictType = 'DISTRICT_HARBOR';
--============================================================================================================================