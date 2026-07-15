
-- SALES ANALYSIS PROJECT --
-- TOOL: MySQL Workbench --


-- STEP 1 : DATA CLEANING --

SELECT * FROM salesproject.sales;

-- change to date format

set sql_safe_updates = 0;

update salesproject.sales
	set purchase_date = str_to_date(purchase_date, "%d/%m/%Y");
    
    alter table salesproject.sales
    modify purchase_date DATE;
    
   -- DATA CLEANING -- 
    -- change time format --
    
    update salesproject.sales
		set time_of_purchase = str_to_date(time_of_purchase, '%H:%i:%s');
        
	alter table salesproject.sales
    modify time_of_purchase TIME;
    
    
    -- STEP 2: ANALYSIS QUERIES --
    
    -- QUESTION 1  What are the 5 most selling products by quantity --
    
    select product_name, sum(quantity) as total_quantity_sold
    FROM salesproject.sales
    where status = 'delivered'
    group by product_name
    order by total_quantity_sold desc
    limit 5;
    
    
    -- QUESTION 2 Which products are most frequently cancelled? --
    
    select product_name, count(*) as total_cancelled
	FROM salesproject.sales
    where status = 'cancelled'
    group by product_name
    order by total_cancelled desc
    limit 5;
    
    
    -- QUESTION 3 what times of the day has the highest number of purchase?--
    
    select 
		case
			when	hour(time_of_purchase) between 6 and 11 then  'morning'
			when	hour(time_of_purchase) between 12 and 17 then  'afternoon'
			when	hour(time_of_purchase) between 18 and 23 then 'evening'
			else 'night'
			end as time_of_day,
            count(*) as total_order
            FROM salesproject.sales
            group by time_of_day
            order by total_order desc;
            
            
	-- QUESTION 4 who are the top 5 highest spending customers?--
    
		select customer_id, customer_name, sum(quantity*price) as total_spending_customer
		from salesproject.sales
            where status = 'delivered'
            group by customer_id, customer_name
            order by total_spending_customer desc
            limit 5;
            
            
	-- QUESTION 5 which product categories generate the highest revenue?--
          
    select product_category, sum(quantity*price) as revenue
    from salesproject.sales
    where status = 'delivered'
    group by product_category
    order by revenue desc;
            
            
-- QUESTION 6 what is the return/cancellation rate per product category --

select product_category,
count(*) as total_orders,
sum(status = 'returned') as returned_orders,
sum(status = 'cancelled') as cancelled_orders,
round(sum(status = 'returned')/count(*), 2) as returned_rate,
round(sum(status = 'cancelled')/count(*), 2) as cancelled_rate
from salesproject.sales
group by product_category;


  -- QUESTION 7 what is the preffered payment mode --
  
	select 
		payment_mode,
		count(*) as total_count
	from salesproject.sales
    group by payment_mode
	order by total_count desc
	limit 1;



 -- QUESTION 8 How does age group afect purcahsing behaviour? --

select 
	case
		when customer_age  between 18 and 25 then '18-25'
		when customer_age  between 26 and 35 then '26-35'
        when customer_age  between 36 and 50 then '36-50'
        else '51+'
        end as age_group,
        sum(quantity*price) as total_purchase_by_age_group
        from salesproject.sales
        group by age_group
        order by total_purchase_by_age_group desc;

  -- QUESTION 9  what is the monthly sales trend? --

select
	date_format(purchase_date, '%Y-%m') as monthly_purchase,
    sum(quantity*price) as total_sales,
    sum(quantity)
    from salesproject.sales
    group by monthly_purchase
    order by monthly_purchase asc;
    
    
-- QUESTION 10  Are certain genders buying more specific caterogies? --

select gender, product_category,
	count(product_category) as total_purchase
from salesproject.sales
	group by gender,product_category
	order by total_purchase desc;

