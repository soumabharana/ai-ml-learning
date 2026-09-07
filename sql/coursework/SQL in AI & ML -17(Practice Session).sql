-- For every order, calculate the total order value by adding the Total column from order_items.

-- Then classify each order as:

-- High Value - Total order value > ₹50,000
-- Medium Value - Total order value between ₹20,000 and ₹49,999
-- Low Value Total order value < ₹20,000

-- Display:

-- OrderID
-- OrderDate
-- CustomerName
-- TotalOrderValue
-- OrderCategory

-- Show the highest-value orders first


select
  oi.OrderID,
  o.OrderDate,
  c.Name,
  sum(oi.Total) as total_sales,
  case
    when sum(oi.Total) > 50000 then "High Value"
    when sum(oi.Total) <50000 and sum(oi.Total)>20000 then "Medium Value"
    else "Low Value"
  end as OrderCategory
from `e1.order_items` as oi
inner join `e1.orders` as o 
on oi.OrderID = o.OrderID
inner join `e1.customers` as c
on o.CustomerID = c.CustomerID
group by 
  oi.OrderID,
  o.OrderDate,
  c.Name
order by total_sales desc

-- Create a category-level sales report containing:

-- CategoryID -->categories
-- CategoryName -->categories
-- Number of products in the category -->products
-- Number of different products sold -->order_items
-- Total quantity sold -->order_items
-- Total sales value -->order_items
-- Average selling price -->order_items

-- Only consider order-item records where:

-- SellingPrice > ₹1,000

-- Display only categories where:

-- Total sales value > ₹50,000

-- Sort categories from highest to lowest total sales.

select
  c.CategoryID,
  c.CategoryName,
  count(*) as no_of_pdt,
  count(distinct oi.ProductID) as distinct_pdt,
  sum(oi.Quantity) as total_qnt,
  sum(oi.Total) as total_sales,
  round(avg(oi.SellingPrice),2) as avg_sales
from `e1.categories` as c
inner join `e1.products` as p
on c.CategoryID = p.CategoryID
inner join `e1.order_items` as oi
on oi.ProductID = p.ProductID
where oi.SellingPrice > 1000
group by
  c.CategoryID,
  c.CategoryName
having total_sales > 50000
order by total_sales desc

-- Find products where:

-- MRP is greater than ₹15,000 -->products
-- Discount percentage is greater than 20% -->products
-- Total sales value is greater than ₹75,000 --order_items

-- Display:

-- ProductID -->products
-- ProductName -->products
-- CategoryName -->category
-- MRP -->products
-- SellingPrice --->order_items
-- Discount percentage -->products
-- Total sales -->order_items

-- Sort by discount percentage from highest to lowest.


select
  p.ProductID,
  p.ProductName,
  c.CategoryName,
  p.MRP,
  oi.SellingPrice,
  (p.MRP - oi.SellingPrice)/p.MRP*100 as disc_pct,
  sum(oi.Total) as total_sales
from `e1.order_items` as oi
inner join `e1.products` as p
on oi.ProductID = p.ProductID
inner join `e1.categories` as c
on p.CategoryID = c.CategoryID
where MRP > 15000
group by
  p.ProductID,
  p.ProductName,
  c.CategoryName,
  p.MRP,
  oi.SellingPrice
having disc_pct > 20 and total_sales > 75000
order by disc_pct desc
  







