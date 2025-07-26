-- Q: Which Nintendo 64 Games released in 1998 had the highest sales?

-- A: Let's review our SQL data to do so
-- Step 1 Use the columns Game, Release date, Sales
-- Step 2 Filter the games released in 1998

SELECT Game
	, Release_date
	, Sales
FROM dbo.n64_games
WHERE YEAR (Release_date) = 1998;