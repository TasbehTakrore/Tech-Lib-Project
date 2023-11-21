USE [TechLib];

-- EX #14 --
-- print out each borrower name  who has an overdue book, the number of overdue books , the total overdue fee--

CREATE PROCEDURE sp_OverdueReport
AS
BEGIN
	CREATE TABLE #OverdueReport(
	[Overdue Report ID] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
	[Borrower Name] VARCHAR(100) NOT NULL,
	[Count of Overdue books] INT NOT NULL,
	[Totle Fee] INT NOT NULL
	);

	INSERT INTO #OverdueReport ([Borrower Name], [Count of Overdue books], [Totle Fee])
	SELECT CONCAT(b.[First Name], ' ', b.[Last Name]), COUNT(*), SUM(dbo.fn_CalculateOverdueFees(l.[Loan ID]))
	FROM Loans l
	JOIN Borrowers b ON l.[Borrower ID] = b.[Borrower ID]
	WHERE [Date Returned] IS NULL
	GROUP BY CONCAT(b.[First Name], ' ', b.[Last Name])

	SELECT * FROM #OverdueReport;
END;

EXEC sp_overdueReport;
