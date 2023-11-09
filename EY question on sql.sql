--You work for an e-commerce company and you need to analyze customer purchasing behavior. 
--You are tasked with creating a table to store customer orders and generating a report that shows the top 5 customers 
CREATE TABLE CustomerOrders (
  OrderID INT PRIMARY KEY,
  CustomerName VARCHAR(100),
  OrderAmount DECIMAL(10, 2)
);
INSERT INTO CustomerOrders (OrderID, CustomerName, OrderAmount)
VALUES
  (1, 'John Doe', 500.00),
  (2, 'Jane Smith', 800.00),
  (3, 'Michael Johnson', 1200.00),
  (4, 'Emily Davis', 1500.00),
  (5, 'David Wilson', 950.00),
  (6, 'Sarah Brown', 2000.00),
  (7, 'James Miller', 1800.00),
  (8, 'Olivia Taylor', 600.00),
  (9, 'Ethan Clark', 1400.00),
  (10, 'Ava Lee', 1700.00);
 select * from CustomerOrders
 --as per the query using the subquery method 
 --using the subquery at from part 
select CustomerName,Toatalamount
from(select CustomerName,sum(OrderAmount)as Toatalamount,
	 row_number()over (order by sum(OrderAmount) desc)as rnk
	 from CustomerOrders
	 group by CustomerName)as subquery
where rnk<=5

--another way to solve the same query,,
select customername,sum(orderamount)as totalamount
from customerorders
group by customername
order by totalamount desc
limit 5
	 