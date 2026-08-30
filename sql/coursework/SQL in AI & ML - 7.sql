--Suppose we want products from the lowest selling price to highest
select *
from `e1.products`
limit 5


select
  ProductID,
  SellingPrice  
from `e1.products`
order by SellingPrice asc


--Show most expensive products first
select
  ProductID,
  SellingPrice  
from `e1.products`
order by SellingPrice desc


---Display all products allphabetically
select
  ProductID,
  ProductName
from `e1.products`
order by ProductName asc


--Oldest customers to newest cutomer
select *
from `e1.customers`
limit 5

select
  CustomerID,
  Name,
  SignupDate
from `e1.customers`
order by SignupDate asc


--Show the top 10 most expensive products

select
  ProductID,
  SellingPrice  
from `e1.products`
order by SellingPrice desc
limit 10


--Which inventory has the lowest stock
select *
from `e1.inventory`
order by stock asc

--Show top 5 most valuable payments
select *
from `e1.payments`
limit 5


select *
from `e1.payments`
order by Amount desc
limit 5

--sorting order items by sales value
select*
from `e1.order_items`
limit 5

select
   OrderID,
   ProductID,
   Total
from `e1.order_items`
order by Total desc


--Show the highest rated review records first
select*
from `e1.reviews`
limit 5

--show products with MRP above 10,000, starting with most expensive
select *
from `e1.products`
limit 5


select
  ProductID,
  MRP
from `e1.products`
where MRP > 10000
order by MRP desc


--Find 5 cheapest product with mRP above 700

select
  ProductID,
  MRP
from `e1.products`
where MRP > 700
order by MRP asc
limit 5


--Suppliers with largest product catalog first
select *
from `e1.products`
limit 5

select
  SupplierID,
  count(*) as catalog_size
from `e1.products`
group by SupplierID
order by catalog_size desc



--Top 5 products by their total sales

select*
from `e1.order_items`


select
  ProductID,
  sum(Total) as sum_total
from `e1.order_items`
group by ProductID
order by sum_total desc
limit 5


--Sort products by category first, and within each category sort by selling price from highest to lowest

select *
from `e1.products`
limit 5

select
  CategoryID,
  SellingPrice
from `e1.products`
order by CategoryID asc, SellingPrice desc


