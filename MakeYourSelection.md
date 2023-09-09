# Make Your Selection

### Challenge
**The flag is the names of all the tables in database, in alphabetical order. For instance, table1-table2-table3...**

When you "goto clue" you are presented with a screen where you can search for fruit:

![Fruit Finder](/images/MakeYourSelection1.png)

Now you need to figure out how you are going to get the table names from the database when all you have a search screen.

Any respectable hacker will check to see if this operation is vulnerable to SQL Injection. The easiest thing to try is to enter some search text that will cause the back end query to error out. For instance, ***berry' foo --***, will create an invalid sql statement if you assume the query is doing something like:

    SELECT FruitName FROM dbo.Fruit WHERE FruitName LIKE '%" + searchValue + "%';

...you will get

![You broke it](/images/brokeit.png)

... because the query ended up being:

    SELECT FruitName FROM dbo.Fruit WHERE FruitName LIKE '%berry' foo --%';

which is invalid SQL. Now that you know there is a sql injection vulnerability, you can craft an attack to obtain the table names.

A UNION attack can be very effective for gleaning database internals. UNION allows you to concatenate query results from disparate tables and views as long as the number of fields and data types match. Knowing this you craft a Search like this:

    xyz' UNION SELECT [name] FROM sys.tables; --

This input will append the table names to the result of the fruit search and comment out anything that might be after the original LIKE clause.

![Tables](/images/tables.png)
