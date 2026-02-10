------------------------------------------------------------------------------
-- Name: Yi Zhen Tan
-- Student ID: 20105083
-- Project: Super Asia Food
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Script 1: Create and Populate Database
------------------------------------------------------------------------------

drop database if exists Super_Asia_Food;
create database Super_Asia_Food;
use Super_Asia_Food;

create table Customer (
CustomerID CHAR (4) Not Null,
fName VARCHAR (50) Not Null,
lName VARCHAR (50) Not Null,
Email VARCHAR (50) Not Null,
Phone VARCHAR (50),
CreateAt DATE,
Primary Key (CustomerID)
);

create table Supplier (
SupplierID CHAR (4) Not Null,
SupplierName VARCHAR (100) Not Null,
fName VARCHAR (50) Not Null,
lName VARCHAR (50) Not Null,
Phone VARCHAR (50) Not Null,
Email VARCHAR (50) Not Null,
Country VARCHAR (50) Not Null,
Primary Key (SupplierID)
);

create table Product_Category (
CategoryID CHAR (4) Not Null,
CategoryName VARCHAR (50) Not Null,
CategoryDescription VARCHAR (200) Not Null,
Primary Key (CategoryID)
);

create table Employee (
EmployeeID CHAR (4) Not Null,
fName VARCHAR (50) Not Null,
lName VARCHAR (50) Not Null,
Position VARCHAR (50) Not Null,
HiredDate DATE Not Null,
Phone VARCHAR (20) Not Null,
Primary Key (EmployeeID)
);

create table Manager (
EmployeeID CHAR (4) Not Null,
Primary Key (EmployeeID),
Foreign Key (EmployeeID) References Employee (EmployeeID)
);

create table Cashier (
EmployeeID CHAR (4) Not Null,
Primary Key (EmployeeID),
Foreign Key (EmployeeID) References Employee (EmployeeID)
);

create table Sales_Assistant (
EmployeeID CHAR (4) Not Null,
Primary Key (EmployeeID),
Foreign Key (EmployeeID) References Employee (EmployeeID)
);

create table Delivery_Staff (
EmployeeID CHAR (4) Not Null,
Primary Key (EmployeeID),
Foreign Key (EmployeeID) References Employee (EmployeeID)
);

create table Product (
ProductID CHAR (4) Not Null,
ProductName VARCHAR (100) Not Null,
UnitPrice DECIMAL (8,2) Not Null,
UnitofMeasure VARCHAR (10) Not Null,
CategoryID CHAR (4) Not Null,
SupplierID CHAR (4) Not Null,
Primary Key (ProductID),
Foreign Key (CategoryID) References Product_Category (CategoryID),
Foreign Key (SupplierID) References Supplier (SupplierID)
);

create table Inventory (
InventoryID CHAR (4) Not Null,
QuantityLeft INT Not Null,
LastUpdate DATE Not Null,
ProductID CHAR (4) Not Null,
Primary Key (InventoryID),
Foreign Key (ProductID) References Product (ProductID)
);

create table Sales_Order (
OrderID CHAR (5) Not Null,
OrderDate DATE Not Null,
OrderType VARCHAR (20) Not Null,
TotalAmount DECIMAL (8,2) Not Null,
Status VARCHAR (20) Not Null,
CustomerID CHAR (4) Not Null,
Primary Key (OrderID),
Foreign Key (CustomerID) References Customer (CustomerID)
);

create table In_Store_Order (
OrderID CHAR (5) Not Null,
CounterNumber INT Not Null,
EmployeeID CHAR (4) Not Null,
Primary Key (OrderID),
Foreign Key (OrderID) References Sales_Order (OrderID),
Foreign Key (EmployeeID) References Employee (EmployeeID)
);

create table Delivery_Order (
OrderID CHAR (5) Not Null,
StreetAddress VARCHAR (100) Not Null,
Town VARCHAR (20) Not Null,
County VARCHAR (20) Not Null,
EirCode VARCHAR (20) Not Null,
DeliveryTime DATE,
EmployeeID CHAR (4) Not Null,
Primary Key (OrderID),
Foreign Key (OrderID) References Sales_Order (OrderID),
Foreign Key (EmployeeID) References Employee (EmployeeID)
);

create table Payment (
PaymentID CHAR (4) Not Null,
PaymentDate DATE,
PaymentMethod VARCHAR (20) Not Null,
TotalAmount VARCHAR (20) Not Null,
Status VARCHAR (20) Not Null,
OrderID CHAR (5) Not Null,
Primary Key (PaymentID),
Foreign Key (OrderID) References Sales_Order (OrderID) 
);

create table Order_Detail (
OrderDetailID CHAR (5) Not Null,
Quantity INT Not Null,
SalePrice DECIMAL (8,2) Not Null,
OrderID CHAR (5) Not Null,
ProductID CHAR (4) Not Null,
Primary Key (OrderDetailID),
Foreign Key (OrderID) References Sales_Order (OrderID),
Foreign Key (ProductID) References Product (ProductID) 
);

create table Purchase_Order (
PurchaseID CHAR (5) Not Null,
PurchaseDate DATE Not Null,
ExpectedArrivalDate DATE Not Null,
TotalCost DECIMAL (8,2) Not Null,
Status VARCHAR (20) Not Null,
ProductID CHAR (4) Not Null,
EmployeeID CHAR (4) Not Null,
SupplierID CHAR (4) Not Null,
Primary Key (PurchaseID),
Foreign Key (ProductID) References Product (ProductID),
Foreign Key (EmployeeID) References Employee (EmployeeID),
Foreign Key (SupplierID) References Supplier (SupplierID)
);

insert into Customer (CustomerID, fName, lName, Email, Phone, CreateAt) values
('C001', 'Harry', 'Tan', 'harrytan@gmail.com', '+353 832457812', '2025-12-12'),
('C002', 'Liam', 'OConnor', 'liamoconnor@gmail.com', '+353 879123345', '2025-11-16'),
('C003', 'Emma', 'Gallagher', 'emmagallagher@gmail.com', '+353 856679044', '2025-11-06'),
('C004', 'Noah', 'Byrne', 'noahbyrne@gmail.com', '+353 895012238', NULL),
('C005', 'Olivia', 'Murphy', 'oliviamurphy@gmail.com', '+353 867759032', '2025-11-27'),
('C006', 'Ethan', 'Doyle', 'ethandoyle@gmail.com', '+353 8736421789', '2025-12-04'),
('C007', 'Ava', 'McCarthy', 'avamccarthy@gmail.com', '+353 873115590', NULL),
('C008', 'William', 'Smith', 'williamsmith@gmail.com', '+353 854498023', NULL),
('C009', 'Sophia', 'Brown', 'sophiabrown@gmail.com', '+353 869981142', '2025-11-24'),
('C010', 'James', 'Wilson', 'jameswilson@gmail.com', '+353 897342219', '2025-11-16');

insert into Supplier (SupplierID, SupplierName, fName, lName, Phone, Email, Country) values
('S001', 'Asia Grain Imports Ltd.', 'Wei', 'Zhang', '+86 21155667821', 'wei.zhang@gmail.com', 'China'),
('S002', 'Golden Dragon Sauces Co', 'Ming', 'Liu', '+852 23559100', 'mingliu@gmail.com', 'Hong Kong'),
('S003', 'Hokkaido Frozen Foods Co.', 'Haruto', 'Sato', '+81 113205567', 'harutosato@gmail.com', 'Japan'),
('S004', 'Emerald Dry Goods Trading', 'Aileen', 'Murphy', '+353 16679044', 'aileenmurphy@gmail.com', 'Ireland'),
('S005', 'Seoul Snack Distribution', 'Jiwoo', 'Park', '+82 28803344', 'jiwoopark@gmail.com', 'South Korea'),
('S006', 'Fresh Fields Produce Supply', 'Patrick', 'OReilly', '+353 874521990', 'patrickoreilly@gmail.com', 'Ireland'),
('S007', 'Pacific Beverages Export Co.', 'Daniel', 'Wong', '+65 62259011', 'danielwong@gmail.com', 'Singapore'),
('S008', 'Euro Meat Seafood Partners', 'Erik', 'Johansen', '+47 22889771', 'erikjohansen@gmail.com', 'Norway'),
('S009', 'Home Asia Kitchen Supplies Ltd', 'Karen', 'Lee', '+852 27894420', 'karenlee@gmail.com', 'Hong Kong'),
('S010', 'Sweet Harmony Bakery Imports', 'Ayumi', 'Tnaka', '+81 453349100', 'ayumitnaka@gmail.com', 'Japan');

insert into Product_Category (CategoryID, CategoryName, CategoryDescription) values
('A001', 'Rice & Grains', 'Various Asian rice types, noodles, and grains'),
('A002', 'Sauces & Condiments', 'Soy sauce, fish sauce, oyster sauce, chili paste, vinegar, and other essential seasonings'),
('A003', 'Frozen Foods', 'Frozen dumplings, buns, seafood, vegetables, and ready-to-cook Asian specialties'),
('A004', 'Spices & Dry Goods', 'Asian spices, herbs, dried mushrooms and other pantry staples'),
('A005', 'Snack & Confectionery', 'Asian chips, biscuits, and traditional snack items'),
('A006', 'Fresh Product', 'Asian vegetables, herbs, fruit, and other fresh ingredients'),
('A007', 'Beverages', 'Asian bubble tea, herbal drinks and specialty drinks'),
('A008', 'Meat & Seafood', 'Fresh and frozen meat, fish, and other seafood'),
('A009', 'Household & Kitchware', 'Asian cooking utensils and household supplies'),
('A010', 'Bakery & Desserts', 'Asian breads, buns, cakes and sweet pantries');

insert into Employee (EmployeeID, fName, lName, Position, HiredDate, Phone) values
('E001', 'Patrick', 'OConnor', 'Manager', '2024-12-20', '+353 874527901'),
('E002', 'Fiona', 'Byrne', 'Manager', '2024-10-21', '+353 856672134'),
('E003', 'Daniel', 'Walsh', 'Sales Assistant', '2025-06-12', '+353 895218840'),
('E004', 'Emily', 'Kelly', 'Sales Assistant', '2025-07-24', '+353 876043389'),
('E005', 'Michelle', 'Tan', 'Cashier', '2025-12-12', '+353 837722190'),
('E006', 'Wei', 'Zhang', 'Delivery Staff', '2025-05-23', '+353 837004432'),
('E007', 'Ming', 'Jong', 'Delivery Staff', '2025-09-15', '+353 869981140'),
('E008', 'Aidan', 'Smith', 'Cashier', '2025-11-22', '+353 854459921'),
('E009', 'Grace', 'Nolan', 'Cashier', '2025-09-30', '+353 896442208'),
('E010', 'Jun', 'Low', 'Delivery Staff', '2025-11-02', '+353 891752435');

insert into Manager (EmployeeID) values
('E001'),
('E002');

insert into Cashier (EmployeeID) values
('E005'),
('E008'),
('E009');

insert into Sales_Assistant (EmployeeID) values
('E003'),
('E004');

insert into Delivery_Staff (EmployeeID) values
('E006'),
('E007'),
('E010');

insert into Product (ProductID, ProductName, UnitPrice, UnitofMeasure, CategoryID, SupplierID) values
('P001', 'Jasmine Rice', '12.50', 'kg', 'A001', 'S001'),
('P002', 'Korean Sweet Potato Glass Noodle', '3.80', 'g', 'A001', 'S001'),
('P003', 'Japanese Sushi Rice', '6.90', 'kg', 'A001', 'S001'),
('P004', 'Lee Kum Kee Oyster Sauce', '4.20', 'g', 'A002', 'S002'),
('P005', 'Lao Gan Ma Spicy Chili Crisp', '3.90', 'g', 'A002', 'S002'),
('P006', 'Japanese Say Sauce', '4.50', 'ml', 'A002', 'S002'),
('P007', 'Frozen Shrimp Wonton', '6.20', 'g', 'A003', 'S003'),
('P008', 'Frozen Bao Bun', '5.80', 'pcs', 'A003', 'S003'),
('P009', 'Five Spice Powder', '1.60', 'g', 'A004', 'S004'),
('P010', 'Pocky Chocolate Stick', '2.20', 'pack', 'A005', 'S005'),
('P011', 'White Rabbit Milk Candy', '3.30', 'g', 'A005', 'S005'),
('P012', 'Thai Milk Tea', '5.00', 'ml', 'A007', 'S007'),
('P013', 'Red Velvet Cake', '2.50', 'pcs', 'A010', 'S010');

insert into Inventory (InventoryID, QuantityLeft, LastUpdate, ProductID) values
('I001', '25', '2025-12-02', 'P001'),
('I002', '25', '2025-12-02', 'P002'),
('I003', '25', '2025-12-02', 'P003'),
('I004', '20', '2025-12-02', 'P004'),
('I005', '20', '2025-12-02', 'P005'),
('I006', '20', '2025-12-02', 'P006'),
('I007', '30', '2025-12-02', 'P007'),
('I008', '30', '2025-12-02', 'P008'),
('I009', '10', '2025-12-02', 'P009'),
('I010', '15', '2025-12-06', 'P010'),
('I011', '15', '2025-12-06', 'P011'),
('I012', '15', '2025-12-06', 'P012'),
('I013', '5', '2025-12-12', 'P013');

insert into Sales_Order (OrderID, OrderDate, OrderType, TotalAmount, Status, CustomerID) values
('SO001', '2025-12-12', 'Delivery Order', '12.50', 'Complete', 'C001'),
('SO002', '2025-11-16', 'Delivery Order', '34.50', 'Complete', 'C002'),
('SO003', '2025-11-06', 'Delivery Order', '22.20', 'Complete', 'C003'),
('SO004', '2025-11-16', 'In Store Order', '9.00', 'Cancelled', 'C004'),
('SO005', '2025-11-27', 'Delivery Order', '6.20', 'Pending', 'C005'),
('SO006', '2025-12-04', 'Delivery Order', '21.00', 'Complete', 'C006'),
('SO007', '2025-11-16', 'In Store Order', '50.20', 'Complete', 'C007'),
('SO008', '2025-11-19', 'In Store Order', '12.60', 'Complete', 'C008'),
('SO009', '2025-11-24', 'Delivery Order', '16.50', 'Pending', 'C009'),
('SO010', '2025-11-16', 'Delivery Order', '13.20', 'Complete', 'C010');

insert into In_Store_Order (OrderID, CounterNumber, EmployeeID) values
('SO004', '1', 'E005'),
('SO007', '2', 'E008'),
('SO008', '3', 'E009');

insert into Delivery_Order (OrderID, StreetAddress, Town, County, EirCode, DeliveryTime, EmployeeID) values
('SO001', '95 Lismore Park', 'Waterford City', 'County Waterford', 'X91 V263', '2025-12-19', 'E006'),
('SO002', '44 Silverstream Road', 'Swords', 'County Dublin', 'K67 F9A2', '2025-11-23', 'E007'),
('SO003', '8 Brookview Park', 'Tralee', 'County Kerry', 'V92 C6D1', '2025-11-13', 'E010'),
('SO005', '27 Meadowbank Avanue', 'Cork City', 'County Cork', 'T12 R4K9', NULL, 'E006'),
('SO006', '10 Ossory Lismore Lawn', 'Waterford City', 'County Waterford', 'X91 Y24W', '2025-11-12', 'E006'),
('SO009', '18A The Avennue WoodPark', 'Dublin 16', 'County Dublin', 'D16 N5N3', NULL, 'E007'),
('SO010', '6 Marino Mart', 'Dublin 3', 'County Dublin', 'D03 K400', '2025-11-23', 'E007');

insert into Payment (PaymentID, PaymentDate, PaymentMethod, TotalAmount, Status, OrderID) values
('P001', '2025-12-12', 'Card', '12.50', 'Complete', 'SO001'),
('P002', '2025-11-16', 'Card', '34.50', 'Complete', 'SO002'),
('P003', '2025-11-06', 'Card', '22.20', 'Complete', 'SO003'),
('P004', NULL, 'Card', '9.00', 'Refunded', 'SO004'),
('P005', NULL, 'Card', '6.20', 'Pending', 'SO005'),
('P006', '2025-12-04', 'Card', '21.00', 'Complete', 'SO006'),
('P007', '2025-11-16', 'Cash', '50.20', 'Complete', 'SO007'),
('P008', '2025-11-19', 'Cash', '12.60', 'Complete', 'SO008'),
('P009', NULL, 'Card', '16.50', 'Pending', 'SO009'),
('P010', '2025-11-16', 'Card', '13.20', 'Complete', 'SO010');

insert into Order_Detail (OrderDetailID, Quantity, SalePrice, OrderID, ProductID) values
('OD001', '1', '12.50', 'SO001', 'P001'),
('OD002', '5', '34.50', 'SO002', 'P003'),
('OD003', '4', '15.60', 'SO003', 'P005'),
('OD004', '3', '6.60', 'SO003', 'P010'),
('OD005', '2', '9.00', 'SO004', 'P006'),
('OD006', '1', '6.20', 'SO005', 'P007'),
('OD007', '5', '21.00', 'SO006', 'P004'),
('OD008', '2', '13.80', 'SO007', 'P003'),
('OD009', '6', '13.20', 'SO007', 'P010'),
('OD010', '4', '23.20', 'SO007', 'P008'),
('OD011', '1', '5.00', 'SO008', 'P012'),
('OD012', '2', '7.60', 'SO008', 'P002'),
('OD013', '5', '16.50', 'SO009', 'P011'),
('OD014', '2', '3.20', 'SO010', 'P009'),
('OD015', '4', '10.00', 'SO010', 'P013');

insert into Purchase_Order (PurchaseID, PurchaseDate, ExpectedArrivalDate, TotalCost, Status, ProductID, EmployeeID, SupplierID) values
('PO001', '2025-12-12', '2025-12-22', '100.00', 'Ordered', 'P001', 'E005', 'S001'),
('PO002', '2025-11-16', '2025-11-25', '105.00', 'Received', 'P002', 'E005', 'S001'),
('PO003', '2025-11-22', '2025-12-02', '85.00', 'Received', 'P003', 'E005', 'S001'),
('PO004', '2025-11-03', '2025-11-20', '154.00', 'Received', 'P004', 'E005', 'S002'),
('PO005', '2025-12-01', '2025-12-20', '128.00', 'Ordered', 'P005', 'E008', 'S002'),
('PO006', '2025-11-26', '2025-12-15', '116.00', 'Ordered', 'P006', 'E008', 'S002'),
('PO007', '2025-12-12', '2025-12-22', '128.00', 'Ordered', 'P007', 'E008', 'S003'),
('PO008', '2025-11-06', '2025-11-20', '210.00', 'Ordered', 'P008', 'E009', 'S003'),
('PO009', '2025-11-23', '2025-12-15', '283.00', 'Ordered', 'P009', 'E009', 'S004'),
('PO010', '2025-11-05', '2025-11-20', '95.00', 'Cancelled', 'P010', 'E009', 'S005');
