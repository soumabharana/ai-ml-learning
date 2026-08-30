select *
from `e1.customers`
where CustomerID="C014"

--FInd customers who have spent more than Rs1,00,000
select *
from `e1.payments`
where Amount>100000

--Show all product categories aivailable
select distinct CategoryID
from `e1.products`

--Display customers from Nagpur
select Name
from `e1.customers`
where City = "Nagpur"

--Display Female Customers
select *
from `e1.customers`
where Gender = "F"

--Display Customers older than 30
select *
from `e1.customers`
where age>30

--Display Delivered Orders
select *
from `e1.orders`
where Status = "Delivered"

--Display orders that are not delivered
select *
from `e1.orders`
where Status != "Delivered"

--Count TotalCUstomers
selct customerID
from `e1.customers`

select count(*)
from `e1.customers`

--Count Customers From Mumbai
select count(*)
from `e1.customers`
where City = "Mumbai"

--The HR Manager wants to see the name of employees working in the Operations Department
select distinct Department
from `e1.employees`

select *
from `e1.customers`
where department = "Operations"

--Display all products supplied by Supplier ID 3.
select *
from `e1.products`

select ProductName
from `e1.products`
where SupplierID = "SUP003"

--The Inventory Team wants to see the products having stocks less than 30
select *
from `e1.warehouses`

Alter table `e1.warehouses`
rename column string_field_0 to WarehouseID

Alter table `e1.warehouses`
rename column string_field_1 to Warehouse

select *
from `e1.inventory`

select ProductID
from `e1.inventory`
where Stock < 30

--Find all customers who signed up after 2023-01-01
select *
from `e1.customers`
where SignUpDate > "2023-10-01"

--Count how many product categories exist in this Products table.
select distinct CategoryID
from `e1.products`

select count(distinct CategoryID)
from `e1.products`