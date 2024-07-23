Create database  walmartsales;

create table wsales(
invoice_id varchar(30) primary key,
branch varchar(5) not null,
city  varchar(30) not null,
customer_type varchar(30) not null,
gender varchar(10) not null,
product_line varchar(100) not null,
unit_price decimal(10,2) not null,
quantity int not null,
VAT float(6,4) not null,
total decimal(12,4) not null,
date datetime not null,
time time not null,
payment_method varchar(15) not null,
cogs decimal(10,2) not null,
gross_margin_pct float(11,9),
gross_income decimal(12,4) not null,
rating float(2,1)
);

select time,
	  (CASE
           WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
	       WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
           ELSE "Evening"
      END
      ) as time_of_date
from wsales;
      
 ALTER TABLE wsales ADD COLUMN time_of_day VARCHAR(20);    
 
 UPDATE wsales
 SET time_of_day=(CASE
           WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
	       WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
           ELSE "Evening"
      END);
 
 select date,
      DAYNAME(date) AS day_name
 from wsales;
 
 alter table wsales ADD COLUMN day_name VARCHAR(10);
 
 update wsales 
 set day_name=DAYNAME(date);
 
 select date,
      MONTHNAME(date) AS month_name
 from wsales;
 
 alter table wsales ADD COLUMN month_name VARCHAR(10);
 
 update wsales 
 set month_name=MONTHNAME(date);