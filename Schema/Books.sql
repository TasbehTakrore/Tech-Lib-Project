USE [TechLib]
GO

/****** Object:  Table [dbo].[Books]    Script Date: 11/21/2023 6:55:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Books](
	[Book ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[Author] [varchar](50) NOT NULL,
	[ISBN] [varchar](17) NOT NULL,
	[Published] [date] NOT NULL,
	[Genre] [varchar](50) NOT NULL,
	[Shelf Location] [varchar](50) NOT NULL,
	[Current Status] [varchar](9) NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Book ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [CK_Books_CurrentStatus] CHECK  (([Current Status]='Borrowed' OR [Current Status]='Available'))
GO

ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [CK_Books_CurrentStatus]
GO


