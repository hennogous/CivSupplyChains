--==========================================================================================================================
-- Zegangani: 
--==========================================================================================================================
-- Step 1: Fill AttachedModifierId from ModifierArguments.Value
UPDATE Henno_ValidCityModifiers
SET AttachedModifierId = (
    SELECT b.Value
    FROM ModifierArguments b
    WHERE b.ModifierId = Henno_ValidCityModifiers.ModifierId
);

-- Step 2: Fill ArgumentAmount based on linked relationship in ModifierArguments
UPDATE Henno_ValidCityModifiers
SET ArgumentAmount = (
    SELECT b2.Value
    FROM ModifierArguments b1
    JOIN ModifierArguments b2 ON b1.Value = b2.ModifierId
    WHERE b1.ModifierId = Henno_ValidCityModifiers.ModifierId
		AND b2.Name = 'Amount'
);

-- Step 3: Fill ModifierDesc from ModifierStrings.Text
UPDATE Henno_ValidCityModifiers
SET ModifierDesc = (
    SELECT b.Text
    FROM ModifierStrings b
    WHERE b.ModifierId = Henno_ValidCityModifiers.AttachedModifierId
		AND b.Context = 'Preview'
);


