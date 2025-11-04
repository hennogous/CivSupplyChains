--============================================================================================================================
--Global parameter, check if Ruivo modular adjacency is enabled
    INSERT INTO GlobalParameters (Name, Value) VALUES 
    ('RUIVO_MODULAR_ADJACENCY_BONUS_ABLED', '1');
--============================================================================================================================



--============================================================================================================================
--Adjacency type table
    CREATE TABLE Ruivo_AdjacencyType (
        --Adjacency type
        AdjacencyType TEXT PRIMARY KEY NOT NULL,

        --Attribute source type
        AttributeType TEXT NOT NULL,

        --Whether there is a specified adjacent object
        HasCustomAdjacentObject BOOLEAN NOT NULL CHECK (HasCustomAdjacentObject IN (0, 1)),

        --Game environment
        Environment TEXT NOT NULL CHECK (Environment IN ("GamePlay", "UserInterface")),

        --Can display (i.e., whether it is GamePlay Only exclusive)
        CanDisplay BOOLEAN NOT NULL CHECK (CanDisplay IN (0, 1)),

        --Adjacency display text
        Tooltip TEXT NOT NULL
    );
--Adjacency type table (content)
    INSERT INTO Ruivo_AdjacencyType 
(AdjacencyType, AttributeType, HasCustomAdjacentObject, Environment, CanDisplay, Tooltip) VALUES
    --Unconditional bonus
    ('FROM_UNCONDITIONAL_BONUS',         'General', 0, 'GamePlay', 1, 'Unconditional bonus'),
    ('FROM_STORM_HAPPEND',               'General', 0, 'GamePlay', 1, 'Number of storms occurred in this game'),
    ('FROM_STANDARDIZE_TURNS',           'General', 0, 'GamePlay', 1, 'Standardized turns (current turn/speed factor)'),


    --Custom adjacent object
    ('FROM_HIGHEST_HUMAN_YIELD',             'CAO', 1, 'GamePlay', 1, 'Highest human player yield of specified type, can be any of the 6 basic yields'),
    

    --Property system!!!
    ('FROM_GAME_PROPERTY',                  'Game', 1, 'GamePlay', 1, 'Game property (usually from lua)'),
    ('FROM_GAME_PROPERTY_HASHED',           'Game', 1, 'GamePlay', 1, 'Hashed game property (usually from modifier)'),

    ('FROM_PLOT_PROPERTY',                  'Plot', 1, 'GamePlay', 1, 'Plot property (usually from lua)'),
    ('FROM_PLOT_PROPERTY_HASHED',           'Plot', 1, 'GamePlay', 1, 'Hashed plot property (usually from modifier)'),

    ('FROM_CITY_PROPERTY',                  'City', 1, 'GamePlay', 1, 'City property (usually from lua)'),
    ('FROM_CITY_PROPERTY_HASHED',           'City', 1, 'GamePlay', 1, 'Hashed city property (usually from modifier)'),

    ('FROM_PLAYER_PROPERTY',              'Player', 1, 'GamePlay', 1, 'Player property (usually from lua)'),
    ('FROM_PLAYER_PROPERTY_HASHED',       'Player', 1, 'GamePlay', 1, 'Hashed player property (usually from modifier)'),


    --Plot attributes
    --Original basic adjacency, with rings
    ('FROM_RINGS_CAO_RESOURCE',             'plot', 1, 'GamePlay', 1, 'Specified resource within rings'),
    ('FROM_RINGS_CAO_IMPROVEMENT',          'plot', 1, 'GamePlay', 1, 'Specified improvement within rings'),
    ('FROM_RINGS_CAO_DISTRICT',             'plot', 1, 'GamePlay', 1, 'Specified district within rings'),
    ('FROM_RINGS_CAO_FEATURE',              'plot', 1, 'GamePlay', 1, 'Specified feature within rings'),
    ('FROM_RINGS_CAO_TERRAIN_SETS',         'plot', 1, 'GamePlay', 1, 'Specified function terrain within rings (Note: CAO here is a terrain judgment function)'),

    --Other adjacency, no rings
    ('FROM_RIVER_CROSSING',                 'plot', 0, 'GamePlay', 1, 'Each adjacent river side'),
    ('FROM_ADJACENT_ROUTE',                 'plot', 0, 'GamePlay', 1, 'Each level of adjacent road'),
    ('FROM_SELF_ROUTE',                     'plot', 0, 'GamePlay', 1, 'Road level on this tile'),
    ('FROM_ADJACENT_WORKER',                'plot', 0, 'GamePlay', 1, 'Adjacent working citizen'),
    ('FROM_SELF_WORKER',                    'plot', 0, 'GamePlay', 1, 'Working citizen in this district'),
    ('FROM_ADJACENT_UNIT',                  'plot', 0, 'GamePlay', 1, 'Adjacent unit'),
    ('FROM_ADJACENT_DISTRICT',              'plot', 0, 'GamePlay', 1, 'Adjacent district'),
    ('FROM_ADJACENT_DISTRICT_AND_WONDER',   'plot', 0, 'GamePlay', 1, 'Adjacent district and wonder (even if not completed)'),
    ('FROM_CLIFF',                          'plot', 0, 'GamePlay', 1, 'Whether the tile has a cliff'),
    ('FROM_LATITUDE',                       'plot', 0, 'GamePlay', 1, 'Percentage distance from spaceport standard line to equator'),
    ('FROM_POLE',                           'plot', 0, 'GamePlay', 1, 'Percentage distance from spaceport standard line to pole'),
    ('FROM_ADJACENT_LAKE',                  'plot', 0, 'GamePlay', 1, 'Number of adjacent freshwater lakes'),
    ('FROM_ADJACENT_WATER_LEVEL',           'plot', 0, 'GamePlay', 1, 'Adjacent freshwater level (no water 0, saltwater 1, freshwater 3)'),
    ('FROM_SELF_WATER_LEVEL',               'plot', 0, 'GamePlay', 1, 'Freshwater level on this tile (no water 0, saltwater 1, freshwater 3)'),
    ('FROM_ADJACENT_RESOURCE',              'plot', 0, 'GamePlay', 1, 'Number of adjacent resources (even if not visible)'),
    ('FROM_ADJACENT_WONDERS',               'plot', 0, 'GamePlay', 1, 'Number of adjacent completed wonders'),
    --UI plot attributes
    ('FROM_UI_SELF_UNIT_LEVELS',            'plot', 0, 'UserInterface', 1, 'Total unit levels on this tile'),
    ('FROM_UI_ADJACENT_UNIT_LEVELS',        'plot', 0, 'UserInterface', 1, 'Total unit levels on adjacent tiles'),
    ('FROM_UI_SELF_APPEAL',                 'plot', 0, 'UserInterface', 1, 'Appeal of this tile'),
    ('FROM_UI_ADJACENT_APPEAL',             'plot', 0, 'UserInterface', 1, 'Appeal of adjacent tiles'),
    ('FROM_UI_ADJACENT_YIELD_FOOD',         'plot', 0, 'UserInterface', 1, 'Food of adjacent tiles'),
    ('FROM_UI_ADJACENT_YIELD_PRODUCTION',   'plot', 0, 'UserInterface', 1, 'Production of adjacent tiles'),
    ('FROM_UI_ADJACENT_YIELD_GOLD',         'plot', 0, 'UserInterface', 1, 'Gold of adjacent tiles'),
    ('FROM_UI_ADJACENT_YIELD_SCIENCE',      'plot', 0, 'UserInterface', 1, 'Science of adjacent tiles'),
    ('FROM_UI_ADJACENT_YIELD_CULTURE',      'plot', 0, 'UserInterface', 1, 'Culture of adjacent tiles'),
    ('FROM_UI_ADJACENT_YIELD_FAITH',        'plot', 0, 'UserInterface', 1, 'Faith of adjacent tiles'),


    --City attributes
    ('FROM_CITY_POPULATION',                'City', 0, 'GamePlay', 1, 'Total city population'),
    ('FROM_CITY_TOTAL_HOUSING',             'City', 0, 'GamePlay', 1, 'Total city housing'),
    ('FROM_CITY_SURPLUS_HOUSING',           'City', 0, 'GamePlay', 1, 'Surplus city housing'),
    ('FROM_CITY_DISTRICTS_NUM',             'City', 0, 'GamePlay', 1, 'Total city districts (excluding city center and wonders)'),
    ('FROM_CITY_SURPLUS_FOOD',              'City', 0, 'GamePlay', 1, 'Surplus city food'),
    ('FROM_CITY_SURPLUS_AMENITIES',         'City', 0, 'GamePlay', 1, 'Surplus city amenities'),
    ('FROM_CITY_SURPLUS_AMENITIES_OVER_HIGHEST_LEVEL_HAPPINESS','City', 0, 'GamePlay', 1, 'Amenities exceeding maximum happiness'),
    ('FROM_CITY_DEFENSE_STRENGTH',          'City', 0, 'GamePlay', 1, 'City defense strength'),
    --City attributes: custom adjacent object
    ('FROM_CITY_CAO_YIELD',                 'City', 1, 'GamePlay', 1, 'City corresponding yield, can be any of the 6 basic yields'),
    --City UI attributes
    ('FROM_UI_CITY_DISTRICT_SLOT',          'City', 0, 'UserInterface', 1, 'City district slots'),
    ('FROM_UI_CITY_SURPLUS_DISTRICT_SLOT',  'City', 0, 'UserInterface', 1, 'Surplus city district slots'),

    ('FROM_UI_CITY_FREE_POWER',             'City', 0, 'UserInterface', 1, 'City clean power'),
    ('FROM_UI_CITY_TEMPORARY_POWER',        'City', 0, 'UserInterface', 1, 'City temporary power'),
    ('FROM_UI_CITY_REQUIRED_POWER',         'City', 0, 'UserInterface', 1, 'City required power'),
    ('FROM_UI_CITY_CURRENT_POWER',          'City', 0, 'UserInterface', 1, 'Total city power'),
    ('FROM_UI_CITY_SURPLUS_POWER',          'City', 0, 'UserInterface', 1, 'Surplus city power'),
    ('FROM_UI_CITY_POWER_RATIO',            'City', 0, 'UserInterface', 1, 'City power ratio'),
    ('FROM_UI_CITY_LOYALTY_PERTURN',        'City', 0, 'UserInterface', 1, 'City loyalty per turn'),
    ('FROM_UI_CITY_LOYALTY_PERCENT',        'City', 0, 'UserInterface', 1, 'City loyalty percent'),


    --Player attributes
    ('FROM_OUTGOING_ROUTES',              'Player', 0, 'GamePlay', 1, 'Number of outgoing trade routes'),
    ('FROM_SLOT_MILITARY',                'Player', 0, 'GamePlay', 1, 'Number of military policy slots'),
    ('FROM_SLOT_ECONOMIC',                'Player', 0, 'GamePlay', 1, 'Number of economic policy slots'),
    ('FROM_SLOT_DIPLOMATIC',              'Player', 0, 'GamePlay', 1, 'Number of diplomatic policy slots'),
    ('FROM_SLOT_GREAT_PERSON',            'Player', 0, 'GamePlay', 1, 'Number of great person policy slots'),
    ('FROM_SLOT_WILDCARD',                'Player', 0, 'GamePlay', 1, 'Number of wildcard policy slots'),
    ('FROM_PLAYER_TOTAL_UNITS',           'Player', 0, 'GamePlay', 1, 'Total number of player units'),
    ('FROM_PLAYER_RESOURCES_TYPES',       'Player', 0, 'GamePlay', 1, 'Total types of resources held by player'),

    --Player UI attributes
    ('FROM_UI_MILITARY_STRENGTH',         'Player', 0, 'UserInterface', 1, 'Total player military strength'),



    --Non-displayable attributes
    --Religion attributes
    ('FROM_RELIGION_FAITH_YIELD',           'Religion', 0, 'GamePlay', 0, 'Total faith yield'),
    ('FROM_RELIGION_BELIEFS_COUNT',         'Religion', 0, 'GamePlay', 0, 'Number of beliefs'),
    ('FROM_RELIGION_TOTAL_FOLLOWERS',       'Religion', 0, 'GamePlay', 0, 'Total number of followers'),
    ('FROM_RELIGION_FOREIGN_FOLLOWERS',     'Religion', 0, 'GamePlay', 0, 'Number of foreign followers'),
    ('FROM_RELIGION_DOMESTIC_FOLLOWERS',    'Religion', 0, 'GamePlay', 0, 'Number of domestic followers'),
    ('FROM_RELIGION_TOTAL_CITIES_FOLLOWING','Religion', 0, 'GamePlay', 0, 'Total number of cities following'),
    ('FROM_RELIGION_CITIES_WITH_WONDER',    'Religion', 0, 'GamePlay', 0, 'Total number of cities with wonders'),
    ('FROM_RELIGION_FOREIGN_CITIES',        'Religion', 0, 'GamePlay', 0, 'Number of foreign cities with religion'),
    ('FROM_RELIGION_DOMESTIC_CITIES',       'Religion', 0, 'GamePlay', 0, 'Number of domestic cities with religion'),
    ('FROM_RELIGION_CITY_PLAYER_FOLLOWERS', 'Religion', 0, 'GamePlay', 0, 'Number of religious followers of the player's religion in this city (even if not the city's majority religion)'),
    
    
    --District's own yield
    ('FROM_SELF_YIELD_FOOD',                    'plot', 0, 'GamePlay', 0, 'District's own food'),
    ('FROM_SELF_YIELD_PRODUCTION',              'plot', 0, 'GamePlay', 0, 'District's own production'),
    ('FROM_SELF_YIELD_GOLD',                    'plot', 0, 'GamePlay', 0, 'District's own gold'),
    ('FROM_SELF_YIELD_SCIENCE',                 'plot', 0, 'GamePlay', 0, 'District's own science'),
    ('FROM_SELF_YIELD_CULTURE',                 'plot', 0, 'GamePlay', 0, 'District's own culture'),
    ('FROM_SELF_YIELD_FAITH',                   'plot', 0, 'GamePlay', 0, 'District's own faith');
--============================================================================================================================


--============================================================================================================================
--Terrain function
    CREATE TABLE Ruivo_Terrain_Function (
        FunctionType TEXT PRIMARY KEY NOT NULL, 
        Name TEXT NOT NULL
    );

    INSERT INTO Ruivo_Terrain_Function (FunctionType, Name) VALUES
    ("IsMountain",       "LOC_RUIVO_ISMOUNTAIN"),
    ("IsHills",          "LOC_RUIVO_ISHILLS"),
    ("IsFlatlands",      "LOC_RUIVO_ISFLATLANDS"),
    ("IsWater",          "LOC_RUIVO_ISWATER"),
    ("IsShallowWater",   "LOC_RUIVO_ISSHALLOWWATER"),
    ("IsLake",           "LOC_RUIVO_ISLAKE"),
    ("IsCanyon",         "LOC_RUIVO_ISCANYON"),
    ("IsCoastalLand",    "LOC_RUIVO_ISCOASTALLAND"),
    ("IsRiverCrossing",  "LOC_RUIVO_ISRIVERCROSSING"),
    ("IsOpenGround",     "LOC_RUIVO_ISOPENGROUND"),
    ("IsRoughGround",    "LOC_RUIVO_ISROUGHGROUND");
--============================================================================================================================


--============================================================================================================================
--Core table
    CREATE TABLE Ruivo_New_Adjacency (
        -- ID of the bonus modifier, used for property, modifier, and req naming
        ID TEXT PRIMARY KEY NOT NULL, 

        -- District type
        DistrictType TEXT NOT NULL,

        -- Type of bonus provided
        ProvideType TEXT NOT NULL DEFAULT 'SelfBonus',

        -- Yield type
        YieldType TEXT NOT NULL,

        -- Amount of bonus provided by each adjacent object
        YieldChange FLOAT NOT NULL DEFAULT 0,

        -- Adjacency type
        AdjacencyType TEXT NOT NULL,

        -- Custom adjacent target
        CustomAdjacentObject TEXT NOT NULL DEFAULT 'NONE',

        --Number of rings
        Rings INTEGER NOT NULL DEFAULT 1,

        -- Whether to bind the bonus to DistrictModifiers? Mutually exclusive with TraitType, checked and excluded in lua for robustness
        DistrictModifiers BOOLEAN NOT NULL CHECK (DistrictModifiers IN (0, 1)) DEFAULT 0,

        -- Whether to bind the bonus to TraitModifiers? Default NULL/nil, if there is text, it is considered true
        TraitType TEXT DEFAULT NULL,

        -- Modifier initiator
        ModifierOwner TEXT NOT NULL DEFAULT 'DistrictModifiers',

        -- Actual initiator: e.g., a belief or building
        WhoIsTheOwner TEXT DEFAULT NULL,

        -- Target collection
        CollectionType TEXT NOT NULL DEFAULT 'COLLECTION_CITY_DISTRICTS',

        --Human only or AI only
        Only TEXT NOT NULL CHECK (Only IN ('Human&AI', 'OnlyHuman', 'OnlyAI')) DEFAULT 'Human&AI',

        -- Free assembly mode, only keeps REQ when enabled
        FreeCompose BOOLEAN NOT NULL CHECK (FreeCompose IN (0, 1)) DEFAULT 0
    );
--============================================================================================================================


--============================================================================================================================
--Binary folding matrix table
    CREATE TABLE Ruivo_BinaryList (
        Num INTEGER PRIMARY KEY
    );
    INSERT INTO Ruivo_BinaryList (Num)
    VALUES (1), (2), (4), (8), (16), (32), (64), (128), (256), (512); --Upper limit 1023
--============================================================================================================================


--============================================================================================================================
--Custom tooltip
    CREATE TABLE Ruivo_New_Adjacency_Text(
        ID TEXT PRIMARY KEY NOT NULL, 
        Tooltip TEXT NOT NULL
    );
--============================================================================================================================


