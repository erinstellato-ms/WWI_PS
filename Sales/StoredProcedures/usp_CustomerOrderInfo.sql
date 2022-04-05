
CREATE PROCEDURE [Sales].[usp_CustomerOrderInfo]
	@CustomerID INT
AS	

	SELECT TOP 1 [CustomerID], [OrderDate], [ExpectedDeliveryDate]
	FROM [Sales].[Orders]
	WHERE [CustomerID] = @CustomerID;

GO

