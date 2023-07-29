------Cau1

select Lower(LastName+' '+FirstName) as 'Full Name',TitleOfCourtesy 
from Employees
------Cau2
select Upper(LastName+' '+FirstName )as 'Full Name' from Employees
-------Cau3
select EmployeeID,LastName,FirstName,Title,City,Country from Employees where Country='USA'
-------Cau4
select CustomerID,CompanyName,ContactName,ContactTitle,
Country from Customers where Country ='UK'
--------Cau5
select CustomerID,CompanyName,Address,City,Country
from Customers where Country ='Mexico'
--------Cau6
select CustomerID,CompanyName,Phone,Address,City,Country 
from Customers where Country='Sweden'
---------Cau7
select ProductID,ProductName,UnitPrice,UnitsInStock 
from Products where UnitsInStock between 5 and 10
---------Cau8
select ProductID,ProductName,UnitPrice,ReorderLevel,UnitsOnOrder
from Products where UnitsOnOrder between 60 and 100
---------Cau9
select Employees.EmployeeID,LastName,FirstName,Title,year(Orders.OrderDate) year,count(Orders.EmployeeID ) as 'total orders' from Employees
inner join Orders on Employees.EmployeeID=Orders.EmployeeID
where year(Orders.OrderDate) = 1996 
group by Employees.EmployeeID,LastName,FirstName,Title,
year(Orders.OrderDate)
----------Cau10
select Employees.EmployeeID,LastName,FirstName,City,Country,b1.total as 'total orders' from Employees inner join
(select EmployeeID, count(OrderDate) as total from Orders where year(OrderDate)=1998 
group by EmployeeID) as b1 on b1.EmployeeID=Employees.EmployeeID
----------Cau11
with r as(select EmployeeID, count(EmployeeID) as 'total orders' from Orders
where OrderDate between '1998/1/1' and '1998/7/31'
group by EmployeeID)
select r.EmployeeID, Employees.LastName, Employees.FirstName, Employees.HireDate, r.[total orders] from r join Employees
on r.EmployeeID = Employees.EmployeeID
---------Cau12
with r as(select EmployeeID, count(EmployeeID) as 'total orders' from Orders
where OrderDate between '1997/1/1' and '1997/6/30'
group by EmployeeID)
select r.EmployeeID, Employees.LastName, Employees.FirstName, Employees.HireDate, Employees.HomePhone, r.[total orders] from r join Employees
on r.EmployeeID = Employees.EmployeeID
--------Cau13
select OrderID, DAY(OrderDate) as OrderDay, MONTH(OrderDate) as OrderMonth, YEAR(OrderDate) as OrderYear, Freight, 
case
	when Freight >= 100 then '10%'
	else '5%'
end as Tax,
case
	when Freight >= 100 then convert(float, 0.1*Freight + Freight)
	else convert(float,0.05*Freight + Freight)
end as FreightWithTax
from Orders
where OrderDate between '1996/8/1' and '1996/8/5'
--------Cau14
select concat(LastName, ' ', FirstName) as FullName, TitleOfCourtesy,
case
	when TitleOfCourtesy = 'Mr.' then 'Male'
	else 'Female'
end as Sex
from Employees order by Sex desc
--------Cau15
select concat(LastName, ' ', FirstName) as FullName, TitleOfCourtesy,
case
	when TitleOfCourtesy = 'Mr.' or TitleOfCourtesy = 'Dr.' then 'M'
	else 'F'
end as Sex
from Employees order by Sex desc, TitleOfCourtesy 
---------Cau16
select concat(LastName, ' ', FirstName) as FullName, TitleOfCourtesy,
case
	when TitleOfCourtesy = 'Mr.' then 'Male'
	when TitleOfCourtesy = 'Mrs.' or TitleOfCourtesy = 'Ms.' then 'Female'
	else 'Unknown'
end as Sex
from Employees order by Sex 
---------Cau17
select * from 
(select concat(LastName, ' ', FirstName) as FullName, TitleOfCourtesy,
case
	when TitleOfCourtesy = 'Mr.' then 1
	else  0
end as Sex
from Employees 
where TitleOfCourtesy ='Mr.'
) as b3
union all
select * from 
(select concat(LastName, ' ', FirstName) as FullName, TitleOfCourtesy,
case
	when TitleOfCourtesy = 'Mr.' then 1
	else  0
end as Sex
from Employees 
where TitleOfCourtesy !='Dr.' and  TitleOfCourtesy !='Mr.'
) as b1
union all
select * from 
(select concat(LastName, ' ', FirstName) as FullName, TitleOfCourtesy,
case
	when TitleOfCourtesy = 'Dr.' then 2
	else  0
end as Sex
from Employees 
where TitleOfCourtesy ='Dr.') as b2

-------Cau18
select * from
(select concat(LastName, ' ', FirstName) as FullName, TitleOfCourtesy,
case
	when TitleOfCourtesy = 'Mr.' then 'M'
	else 'N/A'
end as Sex
from Employees where TitleOfCourtesy ='Mr.'
) as b3
union all 
select * from
(select concat(LastName, ' ', FirstName) as FullName, TitleOfCourtesy,
case
	when TitleOfCourtesy = 'Mrs.' or TitleOfCourtesy = 'Ms.' then 'F'
	else 'N/A'
end as Sex
from Employees where TitleOfCourtesy !='Dr.' and  TitleOfCourtesy !='Mr.'
) as b1
union all
select * from
(
select concat(LastName, ' ', FirstName) as FullName, TitleOfCourtesy,
case
	when TitleOfCourtesy = 'Mr.' then 'M'
	when TitleOfCourtesy = 'Mrs.' or TitleOfCourtesy = 'Ms.' then 'F'
	else 'N/A'
end as Sex
from Employees where TitleOfCourtesy='Dr.') as b2
-----------Cau21
select b3.CategoryID,b4.CategoryName,b3.ProductID,b3.ProductName,b1.day,b1.month,b1.year,b2.Revenue from
(select OrderID,Day(OrderDate) day,MONTH(OrderDate) month,Year(OrderDate) year from Orders
where OrderDate between '1996/07/01' and '1996/07/05') as b1
inner join
(select OrderID,ProductID,UnitPrice* Quantity as Revenue from [Order Details]) as b2 on b1.OrderID=b2.OrderID
inner join 
(select ProductID,ProductName,CategoryID from Products) as b3 on b2.ProductID= b3.ProductID
inner join 
(select * from Categories) as b4 on b3.CategoryID=b4.CategoryID
----------Cau22
select b1.EmployeeID,LastName,FirstName,OrderID,b2.OrderDate,RequiredDate,ShippedDate from
(select * from Employees) as b1
inner join
(select EmployeeID,OrderID,OrderDate,RequiredDate,ShippedDate from Orders 
where datediff(Day,RequiredDate,ShippedDate) >7
) as b2 on b1.EmployeeID=b2.EmployeeID
order by b1.EmployeeID
----------Cau23
select CompanyName,Phone from Customers
where CompanyName like 'W%' 
union all
select concat(LastName ,' ', FirstName),HomePhone from Employees
----------Cau24
select b1.* from
(select CustomerID,CompanyName,ContactName,[ContactTitle] from Customers) as b1
inner join 
(select OrderID,CustomerID from orders where OrderID=10643) as b2 on b1.CustomerID=b2.CustomerID
----------Cau25
select b1.*,b2.[Total Ordered] from
(select ProductID,ProductName from Products) as b1 inner join
(select ProductID,sum(Quantity) as 'Total Ordered' from [Order Details]
group by ProductID) as b2 on b1.ProductID=b2.ProductID
where b2.[Total Ordered] >= 1200
order by b2.[Total Ordered] asc
----------Cau26

select b1.*,b2.[Total Ordered] from
(select ProductID,ProductName,SupplierID,CategoryID from Products) as b1 inner join
(select ProductID,sum(Quantity) as 'Total Ordered' from [Order Details]
group by ProductID) as b2 on b1.ProductID=b2.ProductID
where b2.[Total Ordered] >= 1400
order by b2.[Total Ordered] asc
------------Cau27
select b1.CategoryID,CategoryName,b5.[Total products] from
(select * from Categories) as b1
inner join 
(select b3.CategoryID,b3.[Total products] from
(select CategoryID,count(CategoryID) as 'Total products' from Products group by CategoryID ) as b3
inner join 
(select max(b4.[Total products]) as 'Total products' from 
(select count(CategoryID) as 'Total products' from Products
group by CategoryID) as b4) as b2 on b3.[Total products]=b2.[Total products]) as b5
on b1.CategoryID=b5.CategoryID
-------------Cau28
select b1.CategoryID,CategoryName,b5.[Total products] from
(select * from Categories) as b1
inner join 
(select b3.CategoryID,b3.[Total products] from
(select Categories.CategoryID,count(Products.CategoryID) as 'Total products' from Products right join Categories on Categories.CategoryID= Products.CategoryID
group by Categories.CategoryID ) as b3
inner join 
(select min(b4.[Total products]) as 'Total products' from 
(select Categories.CategoryID,count(Products.CategoryID) as 'Total products' from Products right join Categories on Categories.CategoryID= Products.CategoryID
group by Categories.CategoryID) as b4) as b2 on b3.[Total products]=b2.[Total products]) as b5
on b1.CategoryID=b5.CategoryID
------------Cau29
select count(b1.[Total records]) as 'Total records' from
(select convert(nvarchar  ,EmployeeID) as 'Total records' from Employees
union all
select CustomerID from Customers) as b1
 -----------Cau30
  select b1.*  from
 (select Employees.EmployeeID,LastName,FirstName,Title,count(OrderID) 'Total_Orders' from Employees
 inner join Orders on Employees.EmployeeID=Orders.EmployeeID
 group by Employees.EmployeeID,LastName,FirstName,Title) as b1
 inner join
 (select min(b2.total) 'total' from (select count(OrderID) as 'total' from Orders group by EmployeeID)as b2) as b3 on b1.Total_Orders=b3.total

 ------------Cau31
 select b1.*  from
 (select Employees.EmployeeID,LastName,FirstName,Title,count(OrderID) 'Total_Orders' from Employees
 inner join Orders on Employees.EmployeeID=Orders.EmployeeID
 group by Employees.EmployeeID,LastName,FirstName,Title) as b1
 inner join
 (select max(b2.total) 'total' from (select count(OrderID) as 'total' from Orders group by EmployeeID)as b2) as b3 on b1.Total_Orders=b3.total
 ------------Cau32
 select ProductID,ProductName,SupplierID,CategoryID,UnitsInStock from Products
 where UnitsInStock>=all(select UnitsInStock from Products)
 -------------Cau33
  select ProductID,ProductName,SupplierID,CategoryID,UnitsInStock from Products
 where UnitsInStock <=all(select UnitsInStock from Products)
 --------------Cau34
  select ProductID,ProductName,SupplierID,CategoryID,UnitsOnOrder from Products
 where UnitsOnOrder>=all(select UnitsOnOrder from Products)
 ---------------Cau35
  select ProductID,ProductName,SupplierID,CategoryID,ReorderLevel from Products
 where ReorderLevel>=all(select ReorderLevel from Products)
 --------------Cau36
 select b1.*,b5.delay 'Delayed Orders' from
(select EmployeeID,LastName,FirstName from Employees) as b1
inner join
(select b3.* from
(select EmployeeID,count(EmployeeID) 'delay' from Orders
where datediff(DD,RequiredDate,ShippedDate) >0 group by EmployeeID) as b3
inner join
(select max(b2.delay)'delay' from
(select count(EmployeeID) 'delay' from Orders
where datediff(DD,RequiredDate,ShippedDate) >0 group by EmployeeID) as b2) as b4 on b3.delay=b4.delay) as b5 on b1.EmployeeID=b5.EmployeeID
--------------Cau37
 select b1.*,b5.delay 'Delayed Orders' from
(select EmployeeID,LastName,FirstName from Employees) as b1
inner join
(select b3.* from
(select EmployeeID,count(EmployeeID) 'delay' from Orders
where datediff(DD,RequiredDate,ShippedDate) >0 group by EmployeeID) as b3
inner join
(select min(b2.delay)'delay' from
(select count(EmployeeID) 'delay' from Orders
where datediff(DD,RequiredDate,ShippedDate) >0 group by EmployeeID) as b2) as b4 on b3.delay=b4.delay) as b5 on b1.EmployeeID=b5.EmployeeID
--------------Cau38
select b1.* from
(select ProductID,sum(Quantity) as 'Total Ordered' from [Order Details]
group by ProductID
order by [Total Ordered] desc 
offset 0 row
fetch FIRST 3 row only) as b1 order by b1.[Total Ordered] asc
---------------Cau39
select b1.* from
(select ProductID,sum(Quantity) as 'Total Ordered' from [Order Details]
group by ProductID
order by [Total Ordered] desc 
offset 0 row
fetch FIRST 5 row only) as b1 order by b1.[Total Ordered] asc