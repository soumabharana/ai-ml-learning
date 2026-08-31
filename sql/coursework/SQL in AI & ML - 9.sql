-- Task: Display SupplierID and the number of products supplied by each supplier.
-- Show suppliers with the highest number of products first.

select*
from `e1.products`
limit 5


select
  SupplierID,
  count(*) as pdt_no
from `e1.products`
group by SupplierID
order by pdt_no desc


-- Task: Calculate the total sales value for each ProductID using the Total column from order_items.
-- Display the products from highest to lowest sales value and show only the top 10.

select*
from `e1.order_items`
limit 5

select
  ProductID,
  sum(Total) as total_sales
from `e1.order_items`
group by ProductID
order by total_sales desc
limit 10

--Display only products whose total sales value is greater than ₹50,000, sorted by total sales value from highest to lowest.
select
  ProductID,
  sum(Total) as total_sales
from `e1.order_items`
group by ProductID
having total_sales > 50000
order by total_sales

-- Task: Consider only order-item records where SellingPrice > 10000. For each ProductID, calculate:

-- 1. Number of order-item records
-- 2. Total quantity sold
-- 3. Total sales value
-- 4. Average selling price
select*
from `e1.order_items`
limit 5


select
  ProductID,
  count(*) as total_cnt
  sum(Quantity) as total_qt
  sum(Total) as total_sales
  Avg(SellingPrice) as avg_price
from `e1.order_items`
where SellingPrice >10000
group by ProductID

-- Task: For only payments where Status = 'Success', 
-- calculate the number of transactions and total payment amount for each Method. 
-- Display methods with the highest total payment amount first.
select*
from `e1.payments`
limit 5

select
  OrderID,
  count(*) as no_pay,
  sum(Amount) as total_pay
from `e1.payments`
where Status = "Success"
group by OrderID
order by total_pay


-- Task: Calculate the number of orders placed by every CustomerID. 
-- Display only customers who have placed more than 3 orders.

select *
from `e1.orders`
limit 5


select
  CustomerID,
  count(*) as no_of_orders
from `e1.orders`
group by CustomerID
having no_of_orders > 3
order by no_of_orders desc

-- Task: Consider only products having an MRP greater than ₹900. 
-- For each CategoryID, count the number of such products. 
-- Display only categories having more than 2 qualifying products.

select *
from `e1.products`
limit 5

select
  CategoryID,
  count(*) as no_of_pdt
from `e1.products`
where MRP>900
group by CategoryID
having no_of_pdt > 2
order by 




-- Task: For every WarehouseID, calculate:

-- Total stock
-- Average stock per inventory record
-- Maximum stock
-- Minimum stock

-- Sort warehouses by total stock from highest to lowest.

select *
from `e1.inventory`
limit 5

select
  WarehouseID,
  sum(Stock) as total_stocks,
  avg(Stock) as avg_stocks,
  max(Stock) as max_stock,
  min(Stock) as min_stocks
from `e1.inventory`
group by WarehouseID

-- Task: For every Status in the orders table, calculate the number of orders.
-- Display the most common order status first.

select *
from `e1.orders`
limit 5


select  
  Status,
  count(*) as no_of_orders
from `e1.orders`
group by Status
order by no_of_orders desc


-- Task: Consider only order_items records where SellingPrice > 10000. For each ProductID, calculate:

-- Number of order-item records
-- Total quantity sold
-- Total sales value
-- Average selling price

-- Display only products whose total sales value is greater than ₹50,000, sorted by total sales value from highest to lowest.


select *
from `e1.order_items`
limit 5

select
  ProductID,
  count(*) as no_of_items,
  sum(Quantity) as total_qnt,
  sum(Total) as total_sales,
  avg(SellingPrice) as avg_price
from `e1.order_items`
where SellingPrice > 10000
group by ProductID
having total_sales > 50000
order by total_sales

