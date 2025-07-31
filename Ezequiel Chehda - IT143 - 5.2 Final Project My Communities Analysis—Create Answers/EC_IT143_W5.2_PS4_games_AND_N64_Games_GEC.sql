/*****************************************************************************************************************
NAME:    5.2 Create Answer to questions
PURPOSE: Providing SQL queries to answer the questions for my ps4_games and n64_games community

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     07/30/2025   GEChehda       1. Built this script for EC IT143 5.2


RUNTIME: 
1s

NOTES: 
This script is to complete assigment 5.2 - I'll be using both communities here.
 
******************************************************************************************************************/

USE EC_IT143_DA
GO

--Q1: Which genres brought in the most success for the platform? Group games by genre and show total and average sales per genre
--A:

SELECT Genre_s AS Genre
	,	SUM(Copies_sold_int) AS Total_Sales
	,	AVG(Copies_sold_int) AS Average 
	,	COUNT(*) AS NumberOfGames
FROM dbo.ps4_games
GROUP BY Genre_s
ORDER BY Total_Sales DESC;

--Q2: Did games developed by the same studio tend to increase or decrease in sales over time? 
--For each developer, show their release timeline and the trend in their game sales.
--A:

SELECT Developer_s AS Studio
	,	MIN(Release_date_a) AS FirstRelease
	,	MAX(Release_date_a) AS LastRelease
	,	MIN(Copies_sold_int) AS FirstSales
	,	MAX(Copies_sold_int) AS LastSales
	,	COUNT(*) AS Total_Games
	,	CASE
			WHEN MAX(Copies_sold_int) > MIN(Copies_sold_int) THEN 'Increased'
			WHEN MAX(Copies_sold_int) < MIN(Copies_sold_int) THEN 'Decreased'
			ELSE 'No data to compare'
		END AS Sales_Trend
FROM dbo.ps4_games
GROUP BY Developer_s
ORDER BY Sales_Trend;

--Q3: How have top-performing developers evolved across console generations?
--Compare the average and total sales of developers who appear in both the N64 and PS4 datasets. 
--Have their games become more or less successful over time? This could help us understand the long-term trajectory of key partners.
--A:

SELECT n.Publisher_s AS Publisher
	, Release_date
	, Sales
	, n.Game
	, p.Game
	, p.Release_date_a
	, p.Copies_sold_int
	, CASE
		WHEN p.Copies_sold_int > n.Sales THEN 'Improved'
		WHEN p.Copies_sold_int < n.Sales THEN 'Not Improved'
		ELSE 'Stable'
	END AS TrendSales
FROM dbo.n64_games AS n
INNER JOIN dbo.ps4_games AS p ON n.Publisher_s = p.Publisher_s
ORDER BY Publisher;

--Q4: How did PlayStation-exclusive games perform compared to multiplatform titles?
-- We want to understand the value of exclusivity. For each game, compare sales based on whether the publisher is Sony Interactive Entertainment or not, and show average and total sales in each category.
--A:

SELECT
	CASE
		WHEN Publisher_s IN ('Sony Interactive Entertainment', 'Sony Computer Entertainment') THEN 'Exclusive'
		ELSE 'Multiplatform'
	END AS Game_Type
	,	COUNT(*) AS NumberOfGames
	,	SUM(Copies_sold_int) AS Total_Sales
	,	AVG(Copies_sold_int) AS Average_Sales
FROM dbo.ps4_games
GROUP BY 
	 CASE 
        WHEN Publisher_s IN ('Sony Interactive Entertainment', 'Sony Computer Entertainment') 
            THEN 'Exclusive'
        ELSE 'Multiplatform'
    END;