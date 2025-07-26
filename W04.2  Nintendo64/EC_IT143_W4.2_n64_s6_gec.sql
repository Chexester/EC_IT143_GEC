-- Q: Which Nintendo 64 Games released in 1998 had the highest sales?

-- A: Let's review our SQL data to do so
-- Step 1 Use the columns Game, Release date, Sales
-- Step 2 Filter the games released in 1998

-- 1) Reload data

TRUNCATE TABLE dbo.tbl_n64_bestsales_1998

INSERT INTO dbo.tbl_n64_bestsales_1998
	SELECT Game
	,	Release_date
	,	Sales
	FROM vw_n64_bestsales_1998 AS vw;

-- 2) Review Results

SELECT * FROM dbo.tbl_n64_bestsales_1998;
