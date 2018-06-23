CREATE TABLE Customers
(
  Customer_ID      		char(10)  NOT NULL,
  CustFirst_name    	char(50)  NOT NULL,
  CustLast_name    		char(50)  NOT NULL,
  CustStreet_address 	char(50)  NULL,
  CustCity    			char(50)  NULL,
  CustState   			char(5)   NULL,
  CustZipcode     		char(10)  NULL,
  CustHome_Phone 		char(50)  NULL,
  Cust_Status			char(50)  NULL
);

CREATE TABLE Employees
(
  Employee_Number      		char(10)  NOT NULL,
  Social_Security_Number	char(10)  NOT NULL,
  EmpFirst_name    			char(50)  NOT NULL,
  EmpLast_name    			char(50)  NOT NULL,
  EmpStreet_address 		char(50)  NOT NULL,
  EmpCity    				char(50)  NOT NULL,
  EmpState   				char(5)   NOT NULL,
  EmpZipcode     			char(10)  NOT NULL,
  EmpHome_Phone 			char(50)  NULL
);

CREATE TABLE Invoices
(
  Invoice_Number    char(10)  NOT NULL,
  Customer_Number   char(10)  NOT NULL,
  Invoice_Date		datetime  NOT NULL,
  Ship_Date			datetime  NOT NULL,
  Employee_Number   char(10)  NOT NULL
);

CREATE TABLE Invoice_Products
(
  Invoice_Number    char(10)  NOT NULL,
  Product_Number    char(10)  NOT NULL,
  Quantity_Ordered	int		  NOT NULL,
  Quote_Price 		decimal(8,2)  NOT NULL
);

CREATE TABLE Products
(
  Product_Number    char(10)      	NOT NULL,
  ProdName		  	char(255)     	NOT NULL,
  ProdDescription  	char(180)       NOT NULL,
  Category_ID		char(10)  		NOT NULL,
  Vendor_ID      	char(10)  		NOT NULL,
  Wholesale_Price 	decimal(8,2)  	NOT NULL,
  Retail_Price 		decimal(8,2)  	NOT NULL,
  Quantity_On_Hand	int				NOT NULL
);

CREATE TABLE Categories
(
  Category_ID	    	char(10)  NOT NULL,
  CategoryDescription	char(50)  NOT NULL
);

CREATE TABLE Vendors
(
  Vendor_ID      		char(10)  NOT NULL,
  Vend_name    			char(50)  NOT NULL,
  VendStreet_address 	char(50)  NULL,
  VendCity    			char(50)  NULL,
  VendState   			char(5)   NULL,
  VendZipcode     		char(10)  NULL,
  Vend_Phone 			char(50)  NULL
);


-- -------------------
-- Define primary keys
-- -------------------
ALTER TABLE Customers ADD PRIMARY KEY (Customer_ID);
ALTER TABLE Employees ADD PRIMARY KEY (Employee_Number);
ALTER TABLE Invoices ADD PRIMARY KEY (Invoice_Number);
ALTER TABLE Invoice_Products ADD PRIMARY KEY (Invoice_Number, Product_Number);
ALTER TABLE Products ADD PRIMARY KEY (Product_Number);
ALTER TABLE Categories ADD PRIMARY KEY (Category_ID);
ALTER TABLE Vendors ADD PRIMARY KEY (Vendor_ID);

-- -------------------
-- Define foreign keys
-- -------------------
ALTER TABLE Invoices ADD CONSTRAINT FK_Invoices_Employees FOREIGN KEY (Employee_Number) REFERENCES Employees (Employee_Number);
ALTER TABLE Invoices ADD CONSTRAINT FK_Invoices_Customers FOREIGN KEY (Customer_Number) REFERENCES Customers (Customer_ID);
ALTER TABLE Invoice_Products ADD CONSTRAINT FK_Invoice_Products_Invoices FOREIGN KEY (Invoice_Number) REFERENCES Invoices (Invoice_Number);
ALTER TABLE Invoice_Products ADD CONSTRAINT FK_Invoice_Products_Products FOREIGN KEY (Product_Number) REFERENCES Products (Product_Number);
ALTER TABLE Products ADD CONSTRAINT FK_Products_Categories FOREIGN KEY (Category_ID) REFERENCES Categories (Category_ID);
ALTER TABLE Products ADD CONSTRAINT FK_Products_Vendors FOREIGN KEY (Vendor_ID) REFERENCES Vendors (Vendor_ID);

