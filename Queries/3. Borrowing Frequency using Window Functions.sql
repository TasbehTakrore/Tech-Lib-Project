USE [TechLib];

--- EX #3 --
-- Borrowing Frequency using Window Functions: Rank borrowers based on borrowing frequency. --

SELECT [Borrower ID], COUNT(*) AS [Loans Count], DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) Rank
FROM Loans
GROUP BY [Borrower ID]
ORDER BY COUNT(*) DESC;