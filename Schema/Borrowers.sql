USE [TechLib]
GO

/****** Object:  Table [dbo].[Borrowers]    Script Date: 11/21/2023 7:01:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Borrowers](
	[Borrower ID] [int] IDENTITY(1,1) NOT NULL,
	[First Name] [varchar](255) NOT NULL,
	[Last Name] [varchar](255) NOT NULL,
	[Email] [varchar](255) UNIQUE NOT NULL CHECK (Email LIKE '%_@_%._%'),
	[Date of Birth] [date] NOT NULL,
	[Membership Date] [date] NOT NULL,
 CONSTRAINT [PK_Borrowers] PRIMARY KEY CLUSTERED 
(
	[Borrower ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


