USE [TechLib];

-- EX #9 --
-- Author Popularity using Aggregation: Rank authors by the borrowing frequency of their books. --

SELECT [Author], DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) Rank
FROM Loans l
JOIN Books b ON l.[Book ID] = b.[Book ID]
GROUP BY [Author];
