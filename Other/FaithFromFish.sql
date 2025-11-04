-- FaithFromFish
-- Author: Henno
-- DateCreated: 2025-08-25 08:27:59
--------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Types
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Types
(   Type,                                           Kind                )   VALUES

--  The game doesn't have this combination of Collection and EffectType out of the box, so we need to define it.
(   'MODIFIER_ALL_PLOTS_ATTACH_MODIFIER',           'KIND_MODIFIER'     ),
(   'MODIFIER_PLAYER_PLOTS_ATTACH_MODIFIER',        'KIND_MODIFIER'     );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	GameModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO GameModifiers
(   ModifierId                          )   VALUES 

--  In this case, I just added this to Sejong, without bothering to update any text for it.
(   'MOD_ATTACH_FISH_TILES'             );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	DynamicModifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO DynamicModifiers
(   ModifierType,                                   CollectionType,                         EffectType                  )     VALUES 

--  The game doesn't have this combination of Collection and EffectType out of the box, so we need to define it and add it to Types above.
(   'MODIFIER_ALL_PLOTS_ATTACH_MODIFIER',           'COLLECTION_ALL_PLOT_YIELDS',           'EFFECT_ATTACH_MODIFIER'    ),
(   'MODIFIER_PLAYER_PLOTS_ATTACH_MODIFIER',        'COLLECTION_PLAYER_PLOT_YIELDS',        'EFFECT_ATTACH_MODIFIER'    );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Modifiers
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Modifiers
(   ModifierId,                             ModifierType,                                       OwnerRequirementSetId,  SubjectRequirementSetId             )   VALUES

--  This first modifier is the one attached to the trait (the owner), and will attach a new modifier (that's what the effect does) to all non-Lake Fish tiles owned by Sejong (the subjects).
(   'MOD_ATTACH_FISH_TILES',                'MODIFIER_ALL_PLOTS_ATTACH_MODIFIER',               NULL,                   'REQSET_FISH_TILES_NOT_LAKE'        ),

--  This second modifier has Sejong's Fish tiles as the owners (the subjects from the first modifier), and will now attach a new modifier on to all closeby tiles (distance 2) that are in turn also adjacent to a River (the new subjects).
(   'MOD_ATTACH_CLOSEBY_TILES',             'MODIFIER_PLAYER_PLOTS_ATTACH_MODIFIER',            NULL,                   'REQSET_CREE_CLOSEBY_TILES_WITH_RIVER'   ),

--  This third modifier is the one that actually grants the Faith yield now that we're arrived at the intended set of plots.
--  It has a different type than the modifiers above, and actually does something other than passing a new modifier along.
(   'MOD_GRANT_FAITH_TO_PLOT',              'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',          NULL,                   NULL                                );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	ModifierArguments
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO ModifierArguments
(   ModifierId,                             Name,               Value                               )   VALUES

--  This argument says which modifier should be attached to the subjects, i.e. what the next step in the chain should be.
(   'MOD_ATTACH_FISH_TILES',                'ModifierId',       'MOD_ATTACH_CLOSEBY_TILES'          ),

--  Same thing as above, just specifying which modifier comes next. The hard work of filtering out where it goes happens in the RequirementSets above.
(   'MOD_ATTACH_CLOSEBY_TILES',             'ModifierId',       'MOD_GRANT_FAITH_TO_PLOT'           ),

--  And then this one just grants the Faith.
(   'MOD_GRANT_FAITH_TO_PLOT',              'YieldType',        'YIELD_FAITH'                       ),
(   'MOD_GRANT_FAITH_TO_PLOT',              'Amount',           1                                   );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	RequirementSets
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO RequirementSets
(   RequirementSetId,                       RequirementSetType              )       VALUES

--  This RequirementSet reduces the potential Sejong plots in scope to only those with Fish resources, but not in Lakes.
(   'REQSET_FISH_TILES_NOT_LAKE',           'REQUIREMENTSET_TEST_ALL'       ),

--  This RequirementSet reduces the potential Sejong plots in scope to only those that are close (distance 2) to Fish, and also adjacent to Rivers.
(   'REQSET_CREE_CLOSEBY_TILES_WITH_RIVER', 'REQUIREMENTSET_TEST_ALL'       );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	RequirementSetRequirements
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO RequirementSetRequirements
(   RequirementSetId,                       RequirementId           )    VALUES

--  The first RequirementSet where we filter down to only plots with Fish, but not in Lakes.
(   'REQSET_FISH_TILES_NOT_LAKE',           'REQ_PLOT_HAS_FISH'     ),
(   'REQSET_FISH_TILES_NOT_LAKE',           'REQ_PLOT_IS_NOT_LAKE'  ),

--  The second RequirementSet looks for all tiles adjacent to Sejong's Fish (the owner of the modifier where this RequirementSet is used), and that are also adjacent to a River.
(   'REQSET_CREE_CLOSEBY_TILES_WITH_RIVER', 'REQ_PLOT_IS_NEAR'      ),
(   'REQSET_CREE_CLOSEBY_TILES_WITH_RIVER', 'REQ_PLOT_IS_NEAR'      ),
(   'REQSET_CREE_CLOSEBY_TILES_WITH_RIVER', 'REQ_PLOT_IS_NEAR'      ),
(   'REQSET_CREE_CLOSEBY_TILES_WITH_RIVER', 'REQ_PLOT_HAS_RIVER'    ); 

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Requirements
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
INSERT OR IGNORE INTO Requirements
(   RequirementId,                  RequirementType,                            Inverse     ) VALUES

--  Since we're coming at this the other way around by already "standing on" the Fish, we don't check for adjacent Fish, but just Fish on this particular plot.
(   'REQ_PLOT_HAS_FISH',            'REQUIREMENT_PLOT_RESOURCE_TYPE_MATCHES',   0           ),
(   'REQ_PLOT_IS_NOT_LAKE',         'REQUIREMENT_PLOT_IS_LAKE',                 1           ),

--  Now we check for all tiles within 2 tiles of a Fish tile, that are also adjacent to a River.
(   'REQ_PLOT_IS_NEAR',             'REQUIREMENT_PLOT_ADJACENT_TO_OWNER',       0           ),
(   'REQ_PLOT_IS_NEAR',             'REQUIREMENT_PLOT_ADJACENT_TO_OWNER',       0           ),
(   'REQ_PLOT_IS_NEAR',             'REQUIREMENT_PLOT_ADJACENT_TO_OWNER',       0           ),
(   'REQ_PLOT_HAS_RIVER',           'REQUIREMENT_PLOT_ADJACENT_TO_RIVER',       0           );

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	RequirementArguments
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO RequirementArguments
(   RequirementId,              Name,               Value               ) VALUES
(   'REQ_PLOT_HAS_FISH',        'ResourceType',     'RESOURCE_FISH'     ),
(   'REQ_PLOT_IS_NEAR',         'MaxDistance',      2                   );
 