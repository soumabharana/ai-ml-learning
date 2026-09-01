-- Task: For each supplier, calculate:

-- Number of products supplied
-- Average MRP of those products
-- Maximum MRP of those products

-- Display only suppliers who supply at least 3 products.
-- Sort them by the number of products supplied from highest to lowest.

select *
from `e1.products`

select
  SupplierID,
  count(*) as no_of_pdt,
  avg(MRP) as avg_mrp,
  max(MRP) as max_mrp
from `e1.products`
group by SupplierID
having no_of_pdt >= 3
order by no_of_pdt desc

-- Task: Find each CategoryID where the average MRP of products is greater than ₹150.

-- Display:
-- 1. CategoryID
-- 2. Number of products
-- 3. Average MRP
-- 4. Maximum MRP

-- Sort categories by average MRP from highest to lowest.

select
  CategoryID,
  count(*) as no_of_pdt,
  avg(MRP) as avg_mrp,
  max(MRP) as max_mrp
from `e1.products`
group by CategoryID
having avg_mrp > 150
order by avg_mrp desc

-- Task: Using order_items, calculate the total quantity sold and total sales value for every ProductID.

-- Display only products where:
-- 1. Total quantity sold is at least 10
-- 2. Total sales value is greater than ₹1,00,000

-- Sort by total sales value descending.

select *
from `e1.order_items`
limit 5

select
  ProductID,
  sum(Quantity) as total_qnt,
  sum(Total) as total_sales
from `e1.order_items`
group by ProductID
having total_qnt >=10 and total_sales > 100000
order by total_sales desc

-- Task: Find products where the selling price is lower than the MRP.

-- Display:
-- 1. ProductID
-- 2. ProductName
-- 3. MRP
-- 4. SellingPrice
-- 5. Discount amount

-- Sort products by the highest discount amount first.

select *
from `e1.products`
limit 5

select
  ProductID,
  ProductName,
  MRP,
  SellingPrice,
  (MRP - SellingPrice) as discount_amt
from `e1.products`
where SellingPrice < MRP
order by discount_amt desc

-- Task: Find products where the discount is at least 10% of MRP.

-- Display:
-- 1. ProductID
-- 2. ProductName
-- 3. MRP
-- 4. SellingPrice
-- 5. Discount percentage

-- Sort by discount percentage from highest to lowest.
select *
from `e1.products`
limit 5

select
  ProductID,
  ProductName,
  MRP,
  SellingPrice,
  round((MRP - SellingPrice)/MRP,2)*100 as discount_pct
from `e1.products`
where round((MRP - SellingPrice)/MRP,2)*100 >=10
order by discount_pct desc


Task: Consider only successful payments.

-- For each payment method, calculate:
-- 1. Number of successful transactions
-- 2. Total payment amount
-- 3. Average payment amount
-- 4. Maximum payment amount

-- Display only methods where the total successful payment amount exceeds ₹1,00,000.


select *
from `e1.payments`
limit 5

SELECT
  Method,
  COUNT(*) AS no_of_sucessful_transaction,
  SUM(Amount) AS total_amount,
  ROUND(AVG(Amount), 2) AS avg_amount,
  MAX(Amount) AS mx_amount
FROM `e1.payments`
WHERE Status = "Success"
GROUP BY Method
HAVING total_amount > 100000


-- Task: Find customers who have placed between 4 and 8 orders, inclusive.

-- Display:
-- 1. CustomerID
-- 2. Number of orders

-- Sort customers by order count descending and display only the top 10.

select *
from `e1.orders`
limit 5

select
  CustomerID,
  count(*) as no_of_orders
from `e1.orders`
group by CustomerID
having no_of_orders>=4 and no_of_orders<=8
order by no_of_orders desc
limit 10

-- Task: For each warehouse, calculate:

-- 1. Total stock
-- 2. Average stock
-- 3. Highest stock for a product
-- 4. Lowest stock for a product

-- Display only warehouses where total stock is greater than 500.

-- Sort by total stock descending.

select*
from `e1.inventory`
limit 5

select
  WarehouseID,
  sum(Stock) as total_stock,
  round(avg(Stock),2) as avg_stock,
  max(stock) as max_stock,
  min(stock) as min_stock
from `e1.inventory`
group by WarehouseID
having total_stock > 500
order by total_stock desc

-- Task: Find products that have at least one inventory record where stock is below 20 units.

-- Display:
-- 1. ProductID
-- 2. Number of inventory records
-- 3. Minimum stock
-- 4. Maximum stock

-- Show only products whose minimum stock is below 20.
select
  ProductID,
  count(*) as no_of_records,
  min(Stock) as min_stock,
  max(stock) as max_stock
from `e1.inventory`
group by ProductID
having min_stock < 20
order by no_of_records desc




