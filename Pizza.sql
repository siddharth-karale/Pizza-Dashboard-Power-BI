select * from pizza_sales

select round(sum(total_price),2) as total_revenue from pizza_sales
-- Total Revenue is 817860.05

select round(sum(total_price)/count(distinct order_id),2) as average_order_price from pizza_sales
-- Average Order Price is 38.31

select sum(quantity) as total_pizza_sold from pizza_sales
-- Total number of pizza sold is 49574

select count(distinct order_id) as total_orders from pizza_sales
-- Total number of orders are 21350

select cast(sum(quantity) as decimal(10,2))/cast(count(distinct order_id) as decimal(10,2)) as avg_pizza_per_order from pizza_sales
-- Average pizza per order is 2.32

select datename(dw,order_date) as order_day, count(distinct order_id) as total_orders from pizza_sales
group by datename(dw,order_date)
-- Saturday	  3158
-- Wednesday  3024
-- Monday	  2794
-- Sunday	  2624
-- Friday	  3538
-- Thursday	  3239
-- Tuesday    2973

select datename(M,order_date) as order_month, count(distinct order_id) as total_orders from pizza_sales
group by datename(M,order_date)
-- February	1685
-- June	    1773
-- August	1841
-- April	1799
-- May	    1853
-- December	1680
-- January	1845
-- September1661
-- October	1646
-- July	    1935
-- November	1792
-- March	1840

select pizza_category, round(sum(total_price),2) as total_sales,concat(round(sum(total_price)* 100 / (select sum(total_price) from pizza_sales),2),'%') as percentage_revenue from pizza_sales
-- where month(order_date) = 1 # You can use this filter to see values of a specific month.
group by pizza_category

/*
Classic	220053.1	26.91%
Chicken	195919.5	23.96%
Veggie	193690.45	23.68%
Supreme	208197	    25.46% 
*/

select pizza_size, round(sum(total_price),2) as total_sales,concat(round(sum(total_price)* 100 / (select sum(total_price) from pizza_sales),2),'%') as percentage_revenue from pizza_sales
-- where datepart(quarter,order_date) = 1 # You can use this filter to see values of a specific quarters.
group by pizza_size
/*
L	375318.7	45.89%
XXL	1006.6	    0.12%
M	249382.25	30.49%
XL	14076	    1.72%
S	178076.5	21.77%
*/

select top 5 pizza_name, round(sum(total_price),2) as revenue, sum(quantity) as total_quantity, count(order_id) as total_orders from pizza_sales
group by pizza_name
order by sum(total_price) desc 
/* 
The Thai Chicken Pizza	        43434.25	2371	2315
The Barbecue Chicken Pizza	    42768	    2432	2372
The California Chicken Pizza	41409.5	    2370	2302
The Classic Deluxe Pizza	    38180.5	    2453	2416
The Spicy Italian Pizza	        34831.25	1924	1887
*/

select top 5 pizza_name, round(sum(total_price),2) as revenue, sum(quantity) as total_quantity, count(order_id) as total_orders from pizza_sales
group by pizza_name
order by sum(total_price)
/*
The Brie Carre Pizza	   11588.5	490	480
The Green Garden Pizza	   13955.75	997	987
The Spinach Supreme Pizza  15277.75	950	940
The Mediterranean Pizza	   15360.5	934	923
The Spinach Pesto Pizza	   15596	970	957
*/

