-- Question: Which PlayStation 4 games released in 2018 had the highest sales?

-- A: Let's review our SQL data to do so
-- Step 1 Use the columns Game, Release date, Sales
-- Step 2 Filter the games released in 2018

SELECT Game
	, Release_date_a
	, Copies_sold
FROM dbo.ps4_games
WHERE YEAR (Release_date_a) = 2018
;