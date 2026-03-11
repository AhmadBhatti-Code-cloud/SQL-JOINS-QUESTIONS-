Create Table Customer_2026
(
CustomerID int primary key ,
FirstName varchar(20),
LastName Varchar (20),
City varchar (20)
)
INSERT INTO Customer_2026 (CustomerID, FirstName, LastName, City) VALUES
(101, 'Alice', 'Smith', 'New York'),
(102, 'Bob', 'Johnson', 'Los Angeles'),
(103, 'Charlie', 'Williams', 'Chicago'),
(104, 'Diana', 'Brown', 'Houston'),
(105, 'Ethan', 'Jones', 'Miami');


------------------------------------------------------------------
Create table Orders_2026
(
OrderID int primary key ,
ItemName varchar (20),
OrderPrice varchar (20),
DilveryMode varchar (20)
)
INSERT INTO Orders_2026 (OrderID, ItemName, OrderPrice, DilveryMode) VALUES
(1, 'Laptop', '1200.00', 'Express'),
(2, 'Headphones', '150.00', 'Standard'),
(3, 'Keyboard', '75.50', 'Standard'),
(4, 'Mouse', '40.00', 'Express'),
(5, 'Monitor', '300.00', 'Standard');

--------------------------------------------------------------------
Create Table Shopping_2026
(
ShopingID int primary key ,
CustomerID int ,
OrderID int ,
Foreign key (CustomerID) References Customer_2026(CustomerID),
Foreign key (OrderID) References Orders_2026 (OrderID)
)
INSERT INTO Shopping_2026 (ShopingID, CustomerID, OrderID) VALUES
(1, 101, 1),
(2, 102, 2),
(3, 103, 2),
(4, 103, 4),
(5, 105, 5);

 

------------------Important  Question

select * from Customer_2026
Select * from Orders_2026
select * from Shopping_2026


-- Q1 : Write a SQL query to retrieve the CustomerID first name, last name,Orderid, item name
--and order price for all customers who have made a purchase and who not Purchased in 2026.
select C.CustomerID ,C.FirstName ,C.LastName,O.OrderID, O.ItemName,O.OrderPrice from Shopping_2026 as S

right  join Customer_2026 AS C
on S.CustomerID = C.CustomerID

left join Orders_2026 AS O 
on O.OrderID =S.OrderID

--Q2 : Write a SQL query to find the total number of orders placed by each customer in 2026,
--along with their first name and last name.

select   C.CustomerID,C.FirstName,C.LastName ,Count(C.CustomerID)as No_of_Orders   from Shopping_2026 as S

 left join Customer_2026 AS C 
on C.CustomerID = S.CustomerID
 

group by   C.CustomerID,C.FirstName,C.LastName
 

 -- Q3 : Write a SQL query to calculate the total revenue generated from orders placed in 2026
 select sum(cast(OrderPrice as  float)) as Total_Revenue from Orders_2026
  -- we change the data types of Column "Order price" from Varchar to float


 -- Q4: Write a SQL query to find the top 3 most expensive items ordered in 2026, along with their order ID and delivery mode.

 select top 3 OrderID,ItemName,OrderPrice,DilveryMode from Orders_2026
 order by OrderPrice desc

 --5: Write a SQL query to retrieve the first name, last name, and city of customers
 --who have not made any purchases in 2026.
 select CustomerID, FirstName,LastName,City from Customer_2026
 where CustomerID not in (Select CustomerID from Shopping_2026)


 -- Q6: Write a SQL query to find the average order price for each delivery mode in 2026.
 select DilveryMode, Avg(OrderPrice) as Average_price from Orders_2026  
 group by DilveryMode


 --Q7: Write a SQL query to retrieve the first name, last name, and total amount spent by each customer in 2026, 
 --sorted by total amount spent in descending order.
 select C.CustomerID, C.FirstName,C.LastName,sum(O.OrderPrice)as Total_spending from Customer_2026 as C

  left join Shopping_2026 as S
  on S.CustomerID = C.CustomerID

  left join Orders_2026 as O
  on O.OrderID = S.OrderID
  
  group by C.CustomerID, C.FirstName,C.LastName
  Order by Total_spending desc










