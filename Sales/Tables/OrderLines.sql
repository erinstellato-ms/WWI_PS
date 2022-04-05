CREATE TABLE [Sales].[OrderLines] (
    [OrderLineID]          INT             CONSTRAINT [DF_Sales_OrderLines_OrderLineID] DEFAULT (NEXT VALUE FOR [Sequences].[OrderLineID]) NOT NULL,
    [OrderID]              INT             NOT NULL,
    [StockItemID]          INT             NOT NULL,
    [Description]          NVARCHAR (100)  NOT NULL,
    [PackageTypeID]        INT             NOT NULL,
    [Quantity]             INT             NOT NULL,
    [UnitPrice]            DECIMAL (18, 2) NULL,
    [TaxRate]              DECIMAL (18, 3) NOT NULL,
    [PickedQuantity]       INT             NOT NULL,
    [PickingCompletedWhen] DATETIME2 (7)   NULL,
    [LastEditedBy]         INT             NOT NULL,
    [LastEditedWhen]       DATETIME2 (7)   CONSTRAINT [DF_Sales_OrderLines_LastEditedWhen] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_Sales_OrderLines] PRIMARY KEY CLUSTERED ([OrderLineID] ASC),
    CONSTRAINT [FK_Sales_OrderLines_Application_People] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [FK_Sales_OrderLines_OrderID_Sales_Orders] FOREIGN KEY ([OrderID]) REFERENCES [Sales].[Orders] ([OrderID])
);


GO

CREATE NONCLUSTERED INDEX [IX_Sales_OrderLines_Perf_20160301_02]
    ON [Sales].[OrderLines]([StockItemID] ASC, [PickingCompletedWhen] ASC)
    INCLUDE([OrderID], [PickedQuantity]);


GO

CREATE NONCLUSTERED INDEX [IX_Sales_OrderLines_AllocatedStockItems]
    ON [Sales].[OrderLines]([StockItemID] ASC)
    INCLUDE([PickedQuantity]);


GO

CREATE NONCLUSTERED INDEX [FK_Sales_OrderLines_OrderID]
    ON [Sales].[OrderLines]([OrderID] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_Sales_OrderLines_Perf_20160301_01]
    ON [Sales].[OrderLines]([PickingCompletedWhen] ASC, [OrderID] ASC, [OrderLineID] ASC)
    INCLUDE([Quantity], [StockItemID]);


GO

CREATE NONCLUSTERED INDEX [FK_Sales_OrderLines_PackageTypeID]
    ON [Sales].[OrderLines]([PackageTypeID] ASC);


GO

