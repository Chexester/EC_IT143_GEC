DROP INDEX IF EXISTS IX_my_index_IT143 ON Person.Person;

SELECT p.*
	FROM Person.Person AS p
WHERE p.FirstName = 'John';

/*
Missing Index Details from SQLQuery7.sql - EZELAPTOP.AdventureWorks2022 (EZELAPTOP\ezech (67))
The Query Processor estimates that implementing the following index could improve the query cost by 91.6702%.
*/


USE [AdventureWorks2022]
GO
CREATE NONCLUSTERED INDEX [IX_my_index_IT143]
ON [Person].[Person] ([FirstName])

GO
