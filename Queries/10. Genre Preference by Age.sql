USE [TechLib];

--Ex #10 --
-- Genre Preference by Age using Group By and Having: Determine the preferred genre of different age groups of borrowers. (Groups are (0,10), (11,20), (21,30)…) --

WITH LoansWithAgeCategory AS
(
	SELECT bk.[Genre],
		CASE
			WHEN DATEDIFF(YEAR, b.[Date of Birth], GETDATE()) BETWEEN 0 AND 10 THEN '0-10'
			WHEN DATEDIFF(YEAR, b.[Date of Birth], GETDATE()) BETWEEN 11 AND 20 THEN '11-20'
			WHEN DATEDIFF(YEAR, b.[Date of Birth], GETDATE()) BETWEEN 21 AND 30 THEN '21-30'
			WHEN DATEDIFF(YEAR, b.[Date of Birth], GETDATE()) BETWEEN 31 AND 40 THEN '31-40'
			WHEN DATEDIFF(YEAR, b.[Date of Birth], GETDATE()) BETWEEN 41 AND 50 THEN '41-50'
			WHEN DATEDIFF(YEAR, b.[Date of Birth], GETDATE()) BETWEEN 51 AND 60 THEN '51-60'
			ELSE 'more than 60'
		END AS [Age Category],
		COUNT(*) [Number of Loans]
	FROM Loans l
	JOIN Borrowers b ON l.[Borrower ID] = b.[Borrower ID]
	JOIN Books bk ON l.[Book ID] = bk.[Book ID]
	GROUP BY bk.[Genre],
		CASE
			WHEN DATEDIFF(YEAR, b.[Date of Birth], GETDATE()) BETWEEN 0 AND 10 THEN '0-10'
			WHEN DATEDIFF(YEAR, b.[Date of Birth], GETDATE()) BETWEEN 11 AND 20 THEN '11-20'
			WHEN DATEDIFF(YEAR, b.[Date of Birth], GETDATE()) BETWEEN 21 AND 30 THEN '21-30'
			WHEN DATEDIFF(YEAR, b.[Date of Birth], GETDATE()) BETWEEN 31 AND 40 THEN '31-40'
			WHEN DATEDIFF(YEAR, b.[Date of Birth], GETDATE()) BETWEEN 41 AND 50 THEN '41-50'
			WHEN DATEDIFF(YEAR, b.[Date of Birth], GETDATE()) BETWEEN 51 AND 60 THEN '51-60'
			ELSE 'more than 60'
		END
), PartitioningAgeCategory AS 
(
	SELECT [Genre], [Age Category], [Number of Loans],  ROW_NUMBER() OVER (PARTITION BY [Age Category] ORDER BY [Number of Loans] DESC) AS [Row Num]
	FROM LoansWithAgeCategory
) SELECT [Genre], [Age Category]
  FROM PartitioningAgeCategory
  WHERE [Row Num] = 1;