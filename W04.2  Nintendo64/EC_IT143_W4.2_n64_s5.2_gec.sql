-- Q: Which Nintendo 64 Games released in 1998 had the highest sales?

-- A: Let's review our SQL data to do so
-- Step 1 Filter the games released in 1998
-- Step 2 Sort results by descending to find the highest-Selling games
-- I'll use the columns Game, Release date, Sales.

DROP TABLE IF EXISTS tbl_n64_bestsales_1998;
GO

CREATE TABLE tbl_n64_bestsales_1998 (
	Game NVARCHAR(100) NOT NULL PRIMARY KEY
	,Release_date DATE NOT NULL
	,Sales INT NOT NULL
);