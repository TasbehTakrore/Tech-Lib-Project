USE [TechLib];

-- EX #12 --
-- 12. Trigger Implementation
--		Design a trigger to log an entry into a separate `AuditLog` table whenever a book's status changes from 'Available' to 'Borrowed' or vice versa.
--		The `AuditLog` should capture `BookID`, `StatusChange`, and `ChangeDate`.

CREATE TABLE AuditLog(
    [Audit ID] INT PRIMARY KEY IDENTITY(1, 1),
    [Book ID] INT NOT NULL,
    [Status Change] VARCHAR(9) NOT NULL CHECK([Status Change] IN ('Available', 'Borrowed')),
    [Change Date] DATE NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_BookID FOREIGN KEY ([Book ID]) REFERENCES Books([Book ID])
);


CREATE OR ALTER TRIGGER Audit_BookStatus ON Books
AFTER UPDATE 
AS
BEGIN
	DECLARE @BookID INT, @OldStatus VARCHAR(9), @NewStatus VARCHAR(9);
	SELECT @BookID = d.[Book ID], @NewStatus = i.[Current Status], @OldStatus = d.[Current Status]
	FROM DELETED d
    JOIN INSERTED i ON d.[Book ID] = i.[Book ID];

	IF @OldStatus = @NewStatus
		RETURN;

	INSERT INTO AuditLog([Book ID], [Status Change])
	VALUES(@BookID, @NewStatus);
END;

UPDATE Books
SET [Current Status] = 'Borrowed'
WHERE [Book ID] = 2;

SELECT * FROM AuditLog;