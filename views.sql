-- data view
CREATE VIEW PreferredCustomers AS
SELECT Customer_ID,
	   Concat(CustFirst_name, ' ', CustLast_name)
		   AS Customer_Name,
	   CustHome_Phone,
	   Cust_Status
FROM Customers
WHERE Cust_Status = 'Preferred';

-- aggregate view
CREATE VIEW VendorProductCount AS
SELECT Vend_name AS Vendor_Name,
	   Count(ProdName) AS Product_Count
FROM Vendors, Products
WHERE Vendors.Vendor_ID = Products.Vendor_ID;

