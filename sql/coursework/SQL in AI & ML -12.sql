--Task: Filter out those products which have the top 5 mrp prices

select distinct(MRP)
from `e1.products`
order by MRP desc
limit 5

select *
from `e1.products`
where (MRP = 4937) or (MRP = 4927) or (MRP = 4880) or (MRP = 4698) or (MRP=4662)

select *
from `e1.products`
where MRP in (4937, 4927, 4880,4698,4662)

--super crazy mentos zindagi
select *
from `e1.products`
where MRP in (
              select distinct(MRP)
              from `e1.products`
              order by MRP desc
              limit 5
              )



--Find the product or products having highest MRp
select *
from `e1.products`
where MRP in (
              select max(MRP)
              from `e1.products`
              )

--Find products supplied by suppliers who supply at least 5 products.
select *
from `e1.products`

select *
from `e1.products`
where SupplierID in (select 
                      SupplierID
                    from `e1.products`
                    group by SupplierID
                    having count(*) >=5
                    )
--Find customer IDs who have placed atleast 3 orders
select*
from `e1.orders`
limit 5



select *
from `e1.orders`
where CustomerID in (
                    select
                      CustomerID
                    from `e1.orders`
                    group by CustomerID
                    having count(*) >=3
                    )

select
   CustomerID,
   count(*) as no_of_orders
from `e1.orders`
group by CustomerID
having count(*) >=3


--Display details of those customers who have placed atleast 3 orders
select *
from `e1.customers`
where CustomerID in (
                    select
                      CustomerID
                    from `e1.orders`
                    group by CustomerID
                    having count(*) >=3
                    )


--Find suppliers whose number of products is greater than 
--the average number of products supplied per supplier.

select*
from `e1.suppliers`
limit 5

select*
from `e1.products`
limit 5

select
  SupplierID,
  count(*) as no_of_products
from `e1.products`
group by SupplierID

select 
  no_of_products
from(
    select
      SupplierID,
      count(*) as no_of_products
    from `e1.products`
    group by SupplierID
    )


select 
  avg(no_of_products) as avg_no
from(
    select
      SupplierID,
      count(*) as no_of_products
    from `e1.products`
    group by SupplierID
    )


select
  SupplierID,
  count(*) as no_of_prds
from `e1.products`
group by SupplierID
having count(*) >=(
                      select 
                      avg(no_of_products) as avg_no
                    from(
                        select
                          SupplierID,
                          count(*) as no_of_products
                        from `e1.products`
                        group by SupplierID
                        )
                    )
