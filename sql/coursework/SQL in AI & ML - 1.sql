---Show the name of all customers' names
select Name
from `e1.customers`

--Finance team wants only payment methods
select *
from `e1.payments`

--HR wants employees names
select Name
from `e1.employees`

Alter table `e1.employees`
rename column string_field_0 to EmployeeID

Alter table `e1.employees`
rename column string_field_1 to Name

Alter table `e1.employees`
rename column string_field_2 to Department

select
  ProductID,
  ProductName,
  CategoryID
from `e1.products`

select
  customer_name
from `e1.customers`

select distinct City
from `e1.customers`

select distinct Method
from `e1.payments`

select *
from `e1.suppliers`

Alter table `e1.suppliers`
rename column string_field_0 to SupplierID

Alter table `e1.suppliers`
rename column string_field_1 to SupplierName

Alter table `e1.suppliers`
rename column string_field_2 to State

select *
from `e1.payments`

select distinct amount
from `e1.payments`

--on which dates there has been atleast 1 customer who signed up
select distinct SignupDate
from `e1.customers`

select distinct age,city
from `e1.customers`

select distinct method, status
from `e1.payments`