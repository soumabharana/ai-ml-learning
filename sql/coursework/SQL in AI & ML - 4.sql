-- How many different cities do customers belong to
select count(distinct City)
from `e1.customers`

--How many different products do we have
select *
from `e1.products`

select count(*)
from `e1.products`

--How many customers are from Mumbai
select*
from `e1.customers`

select count(*)
from `e1.customers`
where City ="Mumbai"

--count the number of different customers we have
select count(distinct Name)
from `e1.customers`

--How many different supplier states exist
select *
from `e1.suppliers`

select distinct State
from `e1.suppliers`

-- Total Sales Value
-- What is Total Value represented by all order-item records?
select *
from `e1.order_items`

select sum(Total)
from `e1.order_items`

--How many individual products were sold across all order_item records
select *
from `e1.order_items`
limit 5

select sum(Quantity)
from `e1.order_items`

--Total Quantity sold where order items have quantity greater than 1
select sum(Quantity)
from `e1.order_items`
where Quantity > 1