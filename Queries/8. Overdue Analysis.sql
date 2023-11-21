USE [TechLib];

-- EX #8 --
-- Overdue Analysis: List all books overdue by more than 30 days with their associated borrowers.--

SELECT l.[Book ID], [Borrower ID], [Due Date]
FROM Loans l
JOIN Books b ON l.[Book ID] = b.[Book ID]
WHERE [Date Returned] IS NULL AND DATEDIFF(day, [Due Date], GETDATE()) > 30;