
--Sort products by category first, and within each category sort by selling price from highest to lowest

select *
from `e1.products`
limit 5

select
  CategoryID,
  SellingPrice
from `e1.products`
order by CategoryID asc, SellingPrice desc



-- 1. Take products
--    ↓
-- 2. Keep MRP > 1,000
--    ↓
-- 3. Create supplier groups
--    ↓
-- 4. Count products
--    ↓
-- 5. Keep suppliers with > 2
--    ↓
-- 6. Sort highest count first
--    ↓
-- 7. Show top 5


select *
from `e1.products`
limit 5

select
  SupplierID,
  count(*) as no_of_pdt
from `e1.products`
where MRP>1000 
group by SupplierID
Having no_of_pdt > 2
order by no_of_pdt desc
limit 5



--Which suppliers have more than 3 products?
select
  SupplierID,
  count(*) as product_cnt
from `e1.products`
group by SupplierID
having product_cnt > 3

--Which customers have placed more than 5 orders
select*
from `e1.orders`
limit 5


select
  CustomerID,
  count(*) as count_cust
from `e1.orders`
group by CustomerID
having count_cust >5

--Suppliers with 5 or fewer products
select *
from `e1.products`
limit 5


select
  SupplierID,
  count(*) as no_pdt
from `e1.products`
group by SupplierID
having no_pdt <=5

-- products with sales above rs 50,000

select *
from `e1.order_items`
limit 5


select
  ProductID,
  sum(Total) as total_sales
from `e1.order_items`
group by ProductID
having total_sales > 50000

