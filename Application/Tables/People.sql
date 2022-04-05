CREATE TABLE [Application].[People] (
    [PersonID]                INT             CONSTRAINT [DF_Application_People_PersonID] DEFAULT (NEXT VALUE FOR [Sequences].[PersonID]) NOT NULL,
    [FullName]                NVARCHAR (50)   NOT NULL,
    [PreferredName]           NVARCHAR (50)   NOT NULL,
    [SearchName]              AS              (concat([PreferredName],N' ',[FullName])) PERSISTED NOT NULL,
    [IsPermittedToLogon]      BIT             NOT NULL,
    [LogonName]               NVARCHAR (50)   NULL,
    [IsExternalLogonProvider] BIT             NOT NULL,
    [HashedPassword]          VARBINARY (MAX) NULL,
    [IsSystemUser]            BIT             NOT NULL,
    [IsEmployee]              BIT             NOT NULL,
    [IsSalesperson]           BIT             NOT NULL,
    [UserPreferences]         NVARCHAR (MAX)  NULL,
    [PhoneNumber]             NVARCHAR (20)   NULL,
    [FaxNumber]               NVARCHAR (20)   NULL,
    [EmailAddress]            NVARCHAR (256)  NULL,
    [Photo]                   VARBINARY (MAX) NULL,
    [CustomFields]            NVARCHAR (MAX)  NULL,
    [OtherLanguages]          AS              (json_query([CustomFields],N'$.OtherLanguages')),
    [ServiceBranch]           SMALLINT        NULL,
    [LastEditedBy]            INT             NOT NULL,
    [ValidFrom]               DATETIME2 (7)   NOT NULL,
    [ValidTo]                 DATETIME2 (7)   NOT NULL,
    CONSTRAINT [PK_Application_People] PRIMARY KEY CLUSTERED ([PersonID] ASC),
    CONSTRAINT [FK_Application_People_Application_People] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID])
);


GO

CREATE NONCLUSTERED INDEX [IX_Application_People_IsEmployee]
    ON [Application].[People]([IsEmployee] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_Application_People_IsSalesperson]
    ON [Application].[People]([IsSalesperson] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_Application_People_FullName]
    ON [Application].[People]([FullName] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_Application_People_Perf_20160301_05]
    ON [Application].[People]([IsPermittedToLogon] ASC, [PersonID] ASC)
    INCLUDE([FullName], [EmailAddress]);


GO

