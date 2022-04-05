CREATE TABLE [dbo].[NewTable-1] (
    [col1] INT           IDENTITY (1, 1) NOT NULL,
    [col2] NVARCHAR (10) NOT NULL,
    [col3] MONEY         NOT NULL,
    [col4] VARCHAR (MAX) NOT NULL,
    CONSTRAINT [CK_1] CHECK ((1)=(1))
);


GO

