create database project;
use project;
select * from sales_january_2019;
select * from sales_february_2019; 
select * from sales_march_2019;
select * from sales_april_2019 ;
select * from sales_may_2019 ;
select * from sales_june_2019 ;
select * from sales_july_2019 ;
select * from sales_august_2019; 
select * from sales_september_2019; 
select * from sales_october_2019;
select * from sales_november_2019;
select * from sales_december_2019;

-- change the names of the table

alter table sales_january_2019 rename to jan;
alter table sales_february_2019 rename to feb;
alter table sales_march_2019 rename to mar;
alter table sales_april_2019 rename to apr;
alter table sales_may_2019 rename to may;
alter table sales_june_2019 rename to jun;
alter table sales_july_2019 rename to jul;
alter table sales_august_2019 rename to aug;
alter table sales_september_2019 rename to sep;
alter table sales_october_2019 rename to oct;
alter table sales_november_2019 rename to nov;
alter table sales_december_2019 rename to decem;

select *from jan union 
select * from feb union
select * from mar union
select * from apr
union select * from may
union
select * from jun 
union
select * from jul
union select * from aug
union select * from sep union
select * from oct union
select * from nov union
select * from decem;


create table sales as select *from jan union 
select * from feb union
select * from mar union
select * from apr
union select * from may
union
select * from jun 
union
select * from jul
union select * from aug
union select * from sep union
select * from oct union
select * from nov union
select * from decem;


select *from sales;


select*,"jan" as month from jan union all
select*,"feb" as month from feb 
union all
select*,"mar" as month from mar union all
select*,"apr" as month from apr union all 
select*,"may" as month from may union all
select*,"jun" as month from jun union all
select*,"jul" as month from jul union all
select*,"aug" as month from aug union all
select*,"sep" as month from sep union all
select*,"oct" as month from oct union all
select*,"nov" as month from nov union all
select*,"dec" as month from decem;


create table sales_2019 as
select*,"jan" as month from jan union all
select*,"feb" as month from feb 
union all
select*,"mar" as month from mar union all
select*,"apr" as month from apr union all 
select*,"may" as month from may union all
select*,"jun" as month from jun union all
select*,"jul" as month from jul union all
select*,"aug" as month from aug union all
select*,"sep" as month from sep union all
select*,"oct" as month from oct union all
select*,"nov" as month from nov union all
select*,"dec" as month from decem;

select * from sales_2019;



-- 1.What is the total sales?
select sum(`price each`) from sales_2019;

-- 2.What is the average sales per month?
select * from sales_2019;
select month, avg(`price each`) from sales_2019 group by month;

-- 3.What is the monthly revenue?
select month,sum(`price each`) from sales_2019 group by 1;


-- 4.What are the key demographics of the customers?
select substring_index(substring_index(`purchase address`,",",-2),",",1) from sales_2019;
select substring_index(substring_index(`Purchase Address`,",",-2),",",1)from sales_2019;


-- 5.Which market (city) generated the most sales on average?
select substring_index(substring_index(`purchase address`,",",-2),",",1)as city, avg(`price each`) from sales_2019 group by city;

-- 6.What were the profits by segment?
select* from sales_2019;
select product, sum(`price each`) from sales_2019 group by product;


-- 7.When were the best- and worst-selling periods?

select month, total from
(select month, sum(`price each`) as total from sales_2019 group by 1 order by total limit 1)as a
union all
select month,total from
(select month, sum(`price each`) as total from sales_2019 group by 1 order by total desc limit 1) as b;

select month, total from
(select month, sum(`quantity ordered`) as total from sales_2019 group by 1 order by total limit 1)as a
union all
select month,total from
(select month, sum(`quantity ordered`) as total from sales_2019 group by 1 order by total desc limit 1) as b;

-- 8.Which products sell best?
select product, count(`Quantity ordered`) from sales_2019 group by product order by 2 desc;


-- 9.Which products should the company order more or less of?
select product,count(`quantity ordered`) from sales_2019 group by 1 order by 2 desc;
select product,sum(`quantity ordered`) from sales_2019 group by 1 order by 2 desc;


select product, total from
(select product, sum(`quantity ordered`) as total from sales_2019 group by 1 order by total limit 1)as a
union all
select product,total from
(select product, sum(`quantity ordered`) as total from sales_2019 group by 1 order by total desc limit 1) as b;

delete from sales_2019 where `quantity ordered`=0;

-- 10.How should the company adjust its marketing strategies to VIP customers and less-engaged ones?
-- Less_engaged persons----- will give the offers like 1. Discount on the products 2. Offer on expensive product(eg buying a monitor speaker are free or 40% 0ff)
-- VIP Customers------- Offers:1.Will give the points on there purchase and then the can redeem on there next purchase 2. Will give the special discount on the card holders
