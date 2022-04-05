CREATE TABLE [Sales].[Orders] (
    [OrderID]                     INT            CONSTRAINT [DF_Sales_Orders_OrderID] DEFAULT (NEXT VALUE FOR [Sequences].[OrderID]) NOT NULL,
    [CustomerID]                  INT            NOT NULL,
    [SalespersonPersonID]         INT            NOT NULL,
    [PickedByPersonID]            INT            NULL,
    [ContactPersonID]             INT            NOT NULL,
    [BackorderOrderID]            INT            NULL,
    [OrderDate]                   DATE           NOT NULL,
    [ExpectedDeliveryDate]        DATE           NOT NULL,
    [CustomerPurchaseOrderNumber] NVARCHAR (20)  NULL,
    [IsUndersupplyBackordered]    BIT            NOT NULL,
    [Comments]                    NVARCHAR (MAX) NULL,
    [DeliveryInstructions]        NVARCHAR (MAX) NULL,
    [InternalComments]            NVARCHAR (MAX) NULL,
    [PickingCompletedWhen]        DATETIME2 (7)  NULL,
    [LastEditedBy]                INT            NOT NULL,
    [LastEditedWhen]              DATETIME2 (7)  CONSTRAINT [DF_Sales_Orders_LastEditedWhen] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_Sales_Orders] PRIMARY KEY CLUSTERED ([OrderID] ASC),
    CONSTRAINT [FK_Sales_Orders_Application_People] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [FK_Sales_Orders_BackorderOrderID_Sales_Orders] FOREIGN KEY ([BackorderOrderID]) REFERENCES [Sales].[Orders] ([OrderID]),
    CONSTRAINT [FK_Sales_Orders_ContactPersonID_Application_People] FOREIGN KEY ([ContactPersonID]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [FK_Sales_Orders_PickedByPersonID_Application_People] FOREIGN KEY ([PickedByPersonID]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [FK_Sales_Orders_SalespersonPersonID_Application_People] FOREIGN KEY ([SalespersonPersonID]) REFERENCES [Application].[People] ([PersonID])
);


GO

CREATE NONCLUSTERED INDEX [FK_Sales_Orders_PickedByPersonID]
    ON [Sales].[Orders]([PickedByPersonID] ASC);


GO

CREATE NONCLUSTERED INDEX [NCI_CustomerID_1]
    ON [Sales].[Orders]([CustomerID] ASC)
    INCLUDE([OrderDate], [ExpectedDeliveryDate]);


GO

CREATE NONCLUSTERED INDEX [FK_Sales_Orders_ContactPersonID]
    ON [Sales].[Orders]([ContactPersonID] ASC);


GO

CREATE NONCLUSTERED INDEX [FK_Sales_Orders_SalespersonPersonID]
    ON [Sales].[Orders]([SalespersonPersonID] ASC);


GO

CREATE NONCLUSTERED INDEX [FK_Sales_Orders_CustomerID]
    ON [Sales].[Orders]([CustomerID] ASC);


GO

