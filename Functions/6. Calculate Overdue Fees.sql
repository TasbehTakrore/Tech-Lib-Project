USE [TechLib];

-- EX #6 --
-- 6. Database Function - Calculate Overdue Fees:
--    - Function Name: `fn_CalculateOverdueFees`
--    - Purpose: Compute overdue fees for a given loan.
--    - Parameter: `LoanID`
--    - Implementation: Charge fees based on overdue days: $1/day for up to 30 days, $2/day after.
--    - Return: Overdue fee for the `LoanID`.

CREATE OR ALTER FUNCTION fn_CalculateOverdueFees(
	@LoanID INT
)
RETURNS INT
BEGIN
	DECLARE @DueDATE Date, @DateReturned DATE, @Today DATE;
	SET @Today = GETDATE();

	SELECT @DueDATE = [Due DATE], @DateReturned = [Date Returned]
	FROM Loans
	WHERE [Loan ID] = @LoanID;

	IF @DateReturned IS NOT NULL
		RETURN 0;

	DECLARE @DaysUntilDue INT;
	SET @DaysUntilDue = DATEDIFF(day, @DueDATE, @Today); 

	IF @DaysUntilDue <=  0
		RETURN 0;
	IF  @DaysUntilDue <= 30
		RETURN  @DaysUntilDue;

	RETURN  (@DaysUntilDue - 30) * 2 + 30;
END;


DECLARE @LoanID INT = 10;
SELECT * FROM Loans WHERE [Loan ID] = @LoanID;

DECLARE @OverdueFees INT;
SET @OverdueFees = dbo.fn_CalculateOverdueFees(@LoanID);

SELECT @OverdueFees AS OverdueFees;
