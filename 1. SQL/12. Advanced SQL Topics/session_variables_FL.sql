-- following the lecture --

-- Session Variables --

-- this variables exists only in this established connection and is visible only for this user --
-- it will work in other tab, but not in other connection -- 
SET @s_var1 = 3;

SELECT @s_var1;