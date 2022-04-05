CREATE TABLE [Sales].[CustomerTransactions] (
    [CustomerTransactionID] INT             CONSTRAINT [DF_Sales_CustomerTransactions_CustomerTransactionID] DEFAULT (NEXT VALUE FOR [Sequences].[TransactionID]) NOT NULL,
    [CustomerID]            INT             NOT NULL,
    [TransactionTypeID]     INT             NOT NULL,
    [InvoiceID]             INT             NULL,
    [PaymentMethodID]       INT             NULL,
    [TransactionDate]       DATE            NOT NULL,
    [AmountExcludingTax]    DECIMAL (18, 2) NOT NULL,
    [TaxAmount]             DECIMAL (18, 2) NOT NULL,
    [TransactionAmount]     DECIMAL (18, 2) NOT NULL,
    [OutstandingBalance]    DECIMAL (18, 2) NOT NULL,
    [FinalizationDate]      DATE            NULL,
    [IsFinalized]           AS              (case when [FinalizationDate] IS NULL then CONVERT([bit],(0)) else CONVERT([bit],(1)) end) PERSISTED,
    [LastEditedBy]          INT             NOT NULL,
    [LastEditedWhen]        DATETIME2 (7)   CONSTRAINT [DF_Sales_CustomerTransactions_LastEditedWhen] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_Sales_CustomerTransactions] PRIMARY KEY CLUSTERED ([CustomerTransactionID] ASC),
    CONSTRAINT [FK_Sales_CustomerTransactions_Application_People] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID])
);


GO

CREATE NONCLUSTERED INDEX [NCI_CustomerTransactions]
    ON [Sales].[CustomerTransactions]([CustomerID] ASC);


GO

CREATE NONCLUSTERED INDEX [FK_Sales_CustomerTransactions_TransactionTypeID]
    ON [Sales].[CustomerTransactions]([TransactionTypeID] ASC);


GO

CREATE NONCLUSTERED INDEX [FK_Sales_CustomerTransactions_PaymentMethodID]
    ON [Sales].[CustomerTransactions]([PaymentMethodID] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_Sales_CustomerTransactions_IsFinalized]
    ON [Sales].[CustomerTransactions]([IsFinalized] ASC);


GO

CREATE NONCLUSTERED INDEX [FK_Sales_CustomerTransactions_InvoiceID]
    ON [Sales].[CustomerTransactions]([InvoiceID] ASC);


GO

