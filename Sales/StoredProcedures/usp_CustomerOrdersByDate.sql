
CREATE PROCEDURE [Sales].[usp_CustomerOrdersByDate]
	@StartDate DATE, @EndDate DATE
AS	

	SELECT [o].[CustomerID], [ol].[StockItemID], SUM([ol].[Quantity])
	FROM Sales.Orders [o]
	JOIN Sales.OrderLines [ol]
		ON [o].[OrderID] = [ol].[OrderID]
	WHERE [o].[OrderDate] BETWEEN @StartDate AND @EndDate
	GROUP BY [o].[CustomerID], [ol].[StockItemID]
	ORDER BY [o].[CustomerID], [ol].[StockItemID]

GO

