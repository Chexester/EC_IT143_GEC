/*****************************************************************************************************************
NAME:    3.4 Adventure Works—Create Answers
PURPOSE: Solve an increased complexity question using SQL

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/23/2022   EChehda       1. Built this script for IT143 assigment 3.4


RUNTIME: 
5s to 10s

NOTES: 
This script contains the answer for the eight questions of assigment 3.4 Adventure Works-Create Answers
 
******************************************************************************************************************/

-- Question Category: Marginal Complexity
-- Question Number: 1
-- Original Author: Bismark Ahadzie
-- Runtime Estimate: ~1s
-- Question: What are the top five most expensive products based on list price?
-- This query retrieves the top five most expensive products.

SELECT TOP 5 ProductID
	, Name AS ProductName
	, ProductNumber
	, ListPrice AS Price
FROM  Production.Product
ORDER BY ListPrice DESC;

-- Question Category: Marginal Complexity
-- Question Number: 2
-- Original Author: Robert Young
-- Runtime Estimate: ~1s
-- Question: How many employees have the job title Design Engineer?
-- This query retrieves all employees with the job title 'Design Engineer'.

SELECT BusinessEntityID
	, LoginID
	, JobTitle
	, BirthDate
	, HireDate
FROM HumanResources.Employee
WHERE JobTitle = 'Design Engineer';


-- Question Category: Moderate Complexity
-- Question Number: 1 
-- Original Author: Jayden Allen
-- Runtime Estimate: 1s
-- Question: I need to analyze sales by region. 
-- Please list the top three regions with their total sales and average order value for the last six months.
-- This query will bring the top three regions with their sales.

SELECT TOP 3 
    t.Name AS Region,
    SUM(soh.TotalDue) AS TotalSales,
    AVG(soh.TotalDue) AS AvgOrderValue
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesTerritory t ON soh.TerritoryID = t.TerritoryID
WHERE soh.OrderDate >= '2014-01-01' AND soh.OrderDate <= '2014-06-30'
GROUP BY t.Name
ORDER BY TotalSales DESC;

-- Question Category: Moderate complexity
-- Question Number: 2
-- Original Author: Travis Ryan Graham
-- Runtime Estimate: 1s
-- Question: How do we get a report that shows all the products that have been scrapped and what that scrap reason was?
-- Need full reason, not just Reason ID.
-- Query will show products scapped and their reason.

SELECT wo.ProductID
	, wo.OrderQty
	, wo.StockedQty
	, wo.ScrappedQty
	, wo.ScrapReasonID
	, sr.Name
FROM Production.WorkOrder wo
INNER JOIN Production.ScrapReason sr ON wo.ScrapReasonID = sr.ScrapReasonID
ORDER BY ScrappedQty DESC
;

-- Above query shows the reasonID along with the full reason but if I wanted to know how many times each code was used

SELECT
	wo.ScrapReasonID
	,sr.Name AS ScrapReasonName
	,COUNT(*) AS TimesUsed 
	,SUM(wo.ScrappedQty) AS TotalScrapped
FROM Production.WorkOrder wo
INNER JOIN Production.ScrapReason sr 
	ON wo.ScrapReasonID = sr.ScrapReasonID
GROUP BY wo.ScrapReasonID, sr.Name
ORDER BY TotalScrapped DESC;

-- Question Category: Increased Complexity
-- Question Number: 1
-- Original Author: Alex Ohuru
-- Runtime Estimate: 1s
-- Question: We want to assess the performance of our salespeople in Q4 of 2013.
-- Can you provide a ranked list of salespeople based on total sales amount during that quarter, 
-- including their names, regions, and order counts?
-- This will help us determine who should be eligible for bonuses.
-- Answer: This shows strictly Q4 performance no comparing with Q3. 

SELECT TOP 10 soh.SalesPersonID
	, p.FirstName
	, p.LastName
	, SUM(soh.TotalDue) AS 'Total Sales for Q4'
	, COUNT(soh.SalesOrderID) AS OrderCount
	, MIN(st.Name) AS Regions -- I could use STRING_AGG to ensure all regions are shown but is too long.
FROM Sales.SalesOrderHeader soh
INNER JOIN Sales.SalesTerritory st
	ON st.TerritoryID = soh.TerritoryID
JOIN Person.Person p
	ON p.BusinessEntityID = soh.SalesPersonID
WHERE OrderDate BETWEEN '2013-10-01' AND '2013-12-31'AND SalesPersonID IS NOT NULL
GROUP BY SalesPersonID, p.FirstName, p.LastName
ORDER BY [Total Sales for Q4] DESC
;

-- Question Category: Increased complexity
-- Question Number: 2
-- Original Author: Andrew Peacock
-- Runtime Estimate: 1s
-- Question: We've noticed a decline in repeat purchases. 
-- For customers who first ordered in 2011, how many placed a second order within the following year?
-- Please provide customer names and dates.
-- Answer: This query will show how many customers bought in the following year. Represents how many customers returned to place a second order.

SELECT 
    p.FirstName,
    p.LastName,
    MIN(soh.OrderDate) AS SecondOrderDate
FROM Sales.SalesOrderHeader soh
JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
WHERE soh.CustomerID IN (
    SELECT CustomerID
    FROM Sales.SalesOrderHeader
    GROUP BY CustomerID
    HAVING MIN(YEAR(OrderDate)) = 2011
)
AND YEAR(soh.OrderDate) = 2012
GROUP BY p.FirstName, p.LastName
ORDER BY p.LastName, p.FirstName;

-- Question Category: Metadata Question
-- Question Number: 1
-- Original Author: Ezequiel Chehda
-- Runtime Estimate: 1s
-- Question: Which tables in the database have a column named HireDate? Use INFORMATION_SCHEMA.COLUMNS.
-- Answer: This shows where is present "HireDate"

SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'HireDate';

-- Question Category: Metadata Question
-- Question Number: 2
-- Original Author: Ezequiel Chehda
-- Runtime Estimate: 1s
-- Question: List all views that reference the SalesOrderDetail table by inspecting their definitions in INFORMATION_SCHEMA.VIEWS.
-- Answer: This lists all the columns and their datatypes in Person.Person

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Person'
  AND TABLE_SCHEMA = 'Person';