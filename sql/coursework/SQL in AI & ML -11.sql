-- Task: Calculate the number of orders and percentage of total orders represented by each order status.

select 
  Status,
  count(*) as no_of_orders,
  round(count(*)*100.0/(select count(*) from `e1.orders`),2) as percentage_of_orders
from `e1.orders`
group by Status
order by no_of_orders desc

-- Task: Using order_items, find the top 5 products based on total quantity sold.

-- Display:
-- 1. ProductID
-- 2. Total quantity sold
-- 3. Number of order-item records
-- 4. Total sales value

select
ProductID,
sum(Quantity) as total_quantity_sold,
count(*) as NoOfOrderItems,
sum(Total) as total_sale_Value

from `e1.order_items`
group by ProductID
order by total_quantity_sold desc
limit 5


-- Consider only order-item records where the total value of that item is greater than ₹25,000.

-- For each product, calculate:

-- Number of such records
-- Total quantity
-- Total sales value

-- Display products having at least 3 qualifying records.

select
  ProductID,
  count(*) as NoOfOrderItems,
  sum(Quantity) as total_quantity_sold,
  sum(Total) as total_sale_Value
from `e1.order_items`
where Total > 25000
group by ProductID
having count(*) >= 3;


-- Task: For each product, calculate:

-- 1. Minimum selling price
-- 2. Maximum selling price
-- 3. Average selling price
-- 4. Number of order-item records

-- Display only products where the minimum selling price is greater than ₹1,000.

-- Sort by average selling price descending.

select
  ProductID,
  max(SellingPrice) as max_sp,
  min(SellingPrice) as min_sp,
  avg(SellingPrice) as avg_sp,
  count(*) as no_of_oredritem
from `e1.products`
group by ProductID
having min_sp > 1000
order by avg_sp desc

-- Task: For every warehouse, calculate:

-- 1. Number of different products stored
-- 2. Total stock
-- 3. Average stock per product

-- Display only warehouses storing at least 5 different products.

-- Sort by total stock descending.

select*
from `e1.inventory`
limit 5 

select
  WarehouseID,
  count(distinct ProductID) as no_of_products,
  sum(Stock) as total_stock,
  round(avg(Stock),2) as avg_stock
from `e1.inventory`
group by WarehouseID
having no_of_products >= 5
order by total_stock desc

-- Find products whose MRP is greater than the average MRP of all products.
select *
from `e1.products`
where MRP >= (
              select avg(MRP)
              from `e1.products`
              )

--Find the MRP of prouscts whose MRP is below average MRP
select *
from `e1.products`
where MRP < (
              select avg(MRP)
              from `e1.products`
              )

--Find the product or products having the highest MRP
select *
from `e1.products`
where MRP = (
              select max(MRP)
              from `e1.products`
)

-- Task: Find those products which have the top 5 mrp prices

select distinct(MRP)
from `e1.products`
order by MRP desc
limit 5
