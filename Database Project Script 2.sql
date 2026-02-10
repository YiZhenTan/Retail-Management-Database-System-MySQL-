------------------------------------------------------------------------------
-- Name: Yi Zhen Tan
-- Student ID: 20105083
-- Project: Super Asia Food
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Script 2: Frequently Used Queries
------------------------------------------------------------------------------

use Super_Asia_Food;
show tables;

------------------------------------------------------------------------------
-- 1. Select and Where Statement
------------------------------------------------------------------------------
select * from Customer;
select * from Customer where CreateAt = '2025-11-16';

select * from Payment;
select * from Payment where Status = 'Complete';

------------------------------------------------------------------------------
-- 2. Concat Statement
------------------------------------------------------------------------------
select * from Customer;
select CustomerID, concat (fName,' ',lName) as 'Customer Name' from Customer;

select * from Delivery_Order;
select OrderID, concat (StreetAddress,' ',Town,' ',County,' ',EirCode) as 'Customer Address' from Delivery_Order;

------------------------------------------------------------------------------
-- 3. Like, Between, And, Or and In Statement
------------------------------------------------------------------------------
select * from Supplier;
select SupplierID, SupplierName, Phone from Supplier where Phone like '+353%';

select * from Product;
select ProductID, ProductName, UnitPrice from Product where UnitPrice between 3 and 7;

select * from Order_Detail;
select OrderDetailID, OrderID, ProductID from Order_Detail where OrderID = 'SO007' or ProductID = 'P003';

select * from Delivery_Order;
select OrderID, County from Delivery_Order where County in ('County Dublin');

------------------------------------------------------------------------------
-- 4. Join Statement
------------------------------------------------------------------------------
select * from Customer;
select * from Sales_Order;
select Customer.CustomerID, Customer.fName, Customer.lName, Sales_Order.OrderID, Sales_Order.OrderType, Sales_Order.Status from Customer join Sales_Order on Customer.CustomerID = Sales_Order.CustomerID;

select * from Sales_Order;
select * from Payment;
select Sales_Order.OrderID, Sales_Order.OrderDate, Sales_Order.OrderType, Sales_Order.Status, Payment.PaymentID, Payment.PaymentDate, Payment.Status from Sales_Order join Payment on Sales_Order.OrderID = Payment.OrderID;

------------------------------------------------------------------------------
-- 5. Left Join or Right Join Statement
------------------------------------------------------------------------------
select * from Sales_Order;
select * from Payment;
select Sales_Order.OrderID, Sales_Order.OrderDate, Sales_Order.Status as 'OrderStatus', Payment.PaymentID, Payment.PaymentDate, Payment.Status as 'PaymentStatus' from Sales_Order left join Payment on Sales_Order.OrderID = Payment.OrderID;

select * from Sales_Order;
select * from Payment;
select Sales_Order.OrderID, Sales_Order.Status as 'OrderStatus', Payment.PaymentID, Payment.PaymentDate from Sales_Order right join Payment on Sales_Order.OrderID = Payment.OrderID;

------------------------------------------------------------------------------
-- 6. Aggregate and Group By Statement
------------------------------------------------------------------------------
select * from Delivery_Order;
select County as 'County', count(*) as 'Number of Order' from Delivery_Order group by County;

select * from Order_Detail;
select ProductID, count(*) as 'Number of Product Sold' from Order_Detail group by ProductID;

select * from Sales_Order;
select sum(TotalAmount) from Sales_Order;
select max(TotalAmount) from Sales_Order;
select min(TotalAmount) from Sales_Order;
select avg(TotalAmount) from Sales_Order;

------------------------------------------------------------------------------
-- 7. Aggregate and Having Statement
------------------------------------------------------------------------------
select * from Order_Detail;
select ProductID, count(*) as 'Time of Sold' from Order_Detail group by ProductID having count(*) >= 2;

select * from Sales_Order;
select CustomerID, count(*) as 'Completed Orders' from Sales_Order where Status = 'Complete' group by CustomerID having count(*) >= 2;

------------------------------------------------------------------------------
-- 8. Subquery Statement
------------------------------------------------------------------------------
select * from Sales_Order;
select OrderID, OrderType, TotalAmount from Sales_Order where TotalAmount = (select max(TotalAmount) from Sales_Order);

select * from Purchase_Order;
select PurchaseID, TotalCost from Purchase_Order where TotalCost = (select max(TotalCost) from Purchase_Order);

------------------------------------------------------------------------------
-- 9. Update Statement
------------------------------------------------------------------------------
select * from Payment;
update Payment set Status = 'Complete', PaymentDate = '2025-12-17' where PaymentID = 'P005';
select * from Payment;

select * from Sales_Order;
update Sales_Order set status = 'Complete' where OrderID = 'SO005';
select * from Sales_Order;

select * from Delivery_Order;
update Delivery_Order set DeliveryTime = '2025-12-24' where OrderID = 'SO005';
select * from Delivery_Order;

------------------------------------------------------------------------------
-- 10. Delete Statement
------------------------------------------------------------------------------
select * from Product_Category;
delete from Product_Category where CategoryID = 'A006';
select * from Product_Category;

select * from Inventory;
delete from Inventory where InventoryID = 'I006';
select * from Inventory;

select * from Product_Category;
delete from Product_Category where CategoryID = 'A008';
select * from Product_Category;

select * from Inventory;
delete from Inventory where InventoryID = 'I008';
select * from Inventory;
