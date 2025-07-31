/*****************************************************************************************************************
NAME:    5.2 Create Answer to questions
PURPOSE: Providing SQL queries to answer the questions for my n64_games community

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     07/30/2025   GEChehda       1. Built this script for EC IT143 5.2


RUNTIME: 
1s

NOTES: 
This script is to complete assigment 5.2
 
******************************************************************************************************************/

USE EC_IT143_DA
GO

--Q1: How many developers have released more than one game on our platform, and what are the total and average sales for those games? 
--This will help identify which partnerships have been the most commercially successful.

--A:

SELECT Developer_s AS Developer
	,	COUNT(*) AS Games
	,	SUM(Sales) AS TotalSales
	,	AVG(Sales) AS AverageSales
FROM dbo.n64_games
GROUP BY Developer_s
HAVING COUNT(*) > 1
ORDER BY TotalSales DESC;

--Q2: For each year, which three games achieved the highest sales? This will help identify sales trends and landmark releases per year.
--A:

SELECT 
    g1.release_date,
    g1.Game,
    g1.Developer_s,
    g1.sales
FROM dbo.N64_games g1
WHERE (
    SELECT COUNT(*) 
    FROM dbo.N64_games g2
    WHERE YEAR(g2.release_date) = YEAR(g1.release_date)
      AND g2.sales > g1.sales
) < 3
ORDER BY YEAR(g1.release_date), g1.sales DESC;

--Q3: Which publishers released the most games on the platform, and what were their total combined sales?
--A:

SELECT 
    Publisher_s,
    COUNT(*) AS Games,
    SUM(sales) AS TotalSales
FROM dbo.N64_games
GROUP BY Publisher_s
ORDER BY Games DESC;


--Q4: How did Nintendo-developed games perform in terms of average sales compared to games developed by third-party studios?
--A:

SELECT 
    CASE 
        WHEN Developer_s LIKE '%Nintendo%' THEN 'Nintendo'
        ELSE 'Third-Party'
    END AS developer_type,
    COUNT(*) AS number_of_games,
    SUM(sales) AS total_sales,
    AVG(sales) AS average_sales
FROM dbo.N64_games
GROUP BY 
    CASE 
        WHEN Developer_s LIKE '%Nintendo%' THEN 'Nintendo'
        ELSE 'Third-Party'
    END;