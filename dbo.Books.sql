CREATE TABLE [dbo].[Books] (
	[BookID]  INT             IDENTITY (1, 1) NOT NULL,
	[Title]   NVARCHAR (255)  NOT NULL,
	[Author]  NVARCHAR (255)  NOT NULL,
	[Price]   DECIMAL (18, 2) NOT NULL,
	[GenreID] INT             NULL,
	PRIMARY KEY CLUSTERED ([BookID] ASC)
);

