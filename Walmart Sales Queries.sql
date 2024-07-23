select * from walmartsales.wsales;

/*Q1 How many unique cities does the data have?*/

select distinct city 
from wsales;
-------------------------------------------------------------------
/* Q2 What is the most selling product line?*/

select product_line,
       count(product_line) as product_count
from wsales
group by product_line
order by product_count desc;
--------------------------------------------------------------------
/*Q3 What is the total revenue by month?*/

select  month_name as month,
        round(sum(total),2)as total_revenue
from wsales
group by month;
---------------------------------------------------------------------
 /*Q4 Fetch each product line and add a column to those product line showing "Good", "Bad".
 Good if its greater than average sales */
 
select product_line,
	case
	  when total > (select avg(total) from wsales) then 'Good'
	  else 'Bad'
	end as performance
from wsales;
--------------------------------------------------------------------
 /*Q5 Which of the customer types brings the most revenue?*/
 
select customer_type,
           sum(total) as revenue
from wsales
group by customer_type
order by revenue desc ;
    ---------------------------------------------------------------------
  /*Q6 Which city has the largest tax percent/ VAT (Value Added Tax)?*/ 
  
select city,
avg(VAT) as avg_VAT
from wsales
group by city
order by avg_VAT desc;
   ---------------------------------------------------------------------
  /* Q7 What is the most common customer type?*/
  
select customer_type, count(*) as frequency
from wsales
group by customer_type
order by frequency desc
limit 1;
  ----------------------------------------------------------------------
 /*Q8 What is the gender distribution per branch?*/
 
select branch,
       gender,
       count(*) as count
 from wsales
 group by branch,gender;
  ------------------------------------------------------------------------
/*Q9  Which time of the day do customers give most ratings?*/

select time_of_day,
       count(rating) as rating_count
from wsales
group by time_of_day
order by rating_count desc
limit 1;
  -------------------------------------------------------------------------
 /*Q10 write a query to show the gross income for the month of january */
 
select month_name,
      sum(gross_income) as total_income
from wsales
where month_name="January";
--------------------------------------------------------------------------
/*Q11 select all the data from database for the product_line  Food and beverages & Home and lifestyle */

select * from wsales
where product_line in('Food and beverages','Home and lifestyle');
--------------------------------------------------------------------------
/*Q12 Write a query to show total gross income ?*/

select round(sum(gross_income),2)as total_gross_income
from wsales;
--------------------------------------------------------------------------
/*Q13 Find product_line with total profit greater than 1000*/

select product_line ,sum(total)as total 
from wsales group by product_line having total> 50000;






