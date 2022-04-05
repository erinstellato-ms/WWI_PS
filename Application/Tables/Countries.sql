CREATE TABLE [Application].[Countries] (
    [CountryID]                INT               CONSTRAINT [DF_Application_Countries_CountryID] DEFAULT (NEXT VALUE FOR [Sequences].[CountryID]) NOT NULL,
    [CountryName]              NVARCHAR (60)     NOT NULL,
    [FormalName]               NVARCHAR (60)     NOT NULL,
    [IsoAlpha3Code]            NVARCHAR (3)      NULL,
    [IsoNumericCode]           INT               NULL,
    [CountryType]              NVARCHAR (20)     NULL,
    [LatestRecordedPopulation] BIGINT            NULL,
    [Continent]                NVARCHAR (30)     NOT NULL,
    [Region]                   NVARCHAR (30)     NOT NULL,
    [Subregion]                NVARCHAR (30)     NOT NULL,
    [Border]                   [sys].[geography] NULL,
    [LastEditedBy]             INT               NOT NULL,
    CONSTRAINT [PK_Application_Countries] PRIMARY KEY CLUSTERED ([CountryID] ASC),
    CONSTRAINT [FK_Application_Countries_Application_People] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [UQ_Application_Countries_CountryName] UNIQUE NONCLUSTERED ([CountryName] ASC),
    CONSTRAINT [UQ_Application_Countries_FormalName] UNIQUE NONCLUSTERED ([FormalName] ASC)
);


GO

