USE [TechLib];

-- EX #5 --
--	  Stored Procedure - Add New Borrowers:
--    - Procedure Name: `sp_AddNewBorrower`
--    - Purpose: Streamline the process of adding a new borrower.
--    - Parameters: `FirstName`, `LastName`, `Email`, `DateOfBirth`, `MembershipDate`.
--    - Implementation: Check if an email exists; if not, add to `Borrowers`. If existing, return an error message.
--    - Return: The new `BorrowerID` or an error message.

CREATE OR ALTER PROCEDURE sp_AddNewBorrower
	@FirstName VARCHAR(50),
	@LastName VARCHAR(50),
	@Email VARCHAR(50),
	@DateOfBirth DATE,
    @MembershipDate DATE = NULL,
	@Result VARCHAR(50) OUTPUT
AS
BEGIN
	IF EXISTS (
		SELECT [Borrower ID]
		FROM Borrowers
		WHERE [Email] = @Email
		)
	BEGIN
		SET @Result = 'ERROR: User already exists!'
	END
	ELSE
	BEGIN
		IF @MembershipDate IS NULL
			SET @MembershipDate = GETDATE();
		INSERT INTO Borrowers
		VALUES (@FirstName, @LastName, @Email, @DateOfBirth, @MembershipDate);
		SET @Result = 'User ' + CAST(SCOPE_IDENTITY() AS VARCHAR(10)) + ' added successfully';
	END
END;

DECLARE @Result VARCHAR(50);
EXEC sp_AddNewBorrower 'Tasbeeh', 'Takrori', 'tasbeeh2.takrori@gmail.com','2001-02-19', @Result = @Result OUTPUT;
SELECT @Result AS Result;