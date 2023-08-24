select * from pizza_sales

-- 1. Total Revenue:

select sum(total_price) as Total_revenue from pizza_sales

--Average Order Value

select sum(total_price) / count(distinct(order_id)) as Avg_order_value from pizza_sales

-- Total pizza sold

Select sum(quantity) as Total_pizzza_sold from pizza_sales


-- Total orders

Select Count(distinct(Order_id)) as Total_Order from pizza_sales

--Average pizza per order

select CAST(sum(quantity) as Decimal(10,2))/ Cast(Count(distinct(Order_id)) AS Decimal(10,2)) as average_pizza_order
from pizza_sales

--- Daily Trend for Total Orders

Select DATEName(DW ,order_date) as Order_day,count(distinct order_id) from pizza_sales
group by DATEName(DW ,order_date) 

--- Monthly Trend for Orders

select DATENAME(MM, order_date) as Order_month, count(distinct order_id) from pizza_sales
group by Datename(MM, order_date);

-- % of Sales by Pizza Category

select pizza_category, sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as PCT
from pizza_sales
group by pizza_category;


---  % of Sales by Pizza Size

select pizza_size , CAST(sum(total_price) * 100/ (select sum(total_price) from pizza_sales) as decimal(10,2)) AS Percent_of_size
from pizza_sales
group by pizza_size
order by pizza_size; 


---Total Pizzas Sold by Pizza Category

Select pizza_category, sum(quantity) as Total_pizza_sold
from pizza_sales
where MONTH(order_date) = 5
Group by pizza_category
Order by pizza_category DESC;

--- Top 5 Pizzas by Revenue

Select top 5 pizza_name,sum(total_price) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue desc;

---- Bottom 5 pizza by revenue

Select top 5 pizza_name,sum(total_price) as Total_revenue
from pizza_sales
group by pizza_name
order by total_revenue ASC;


---Top 5 Pizzas by Quantity

Select top 5 pizza_name,SUM(quantity) as sales_qty from pizza_sales
group by pizza_name
order by sales_qty DESC;


---  Bottom 5 Pizzas by Quantity


Select top 5 pizza_name, sum(quantity) as sales_qty from pizza_sales
group by pizza_name
order by sales_qty ASC


---- Top 5 total pizza by total orders

Select top 5 pizza_name , count(distinct order_id) as Total_orders from pizza_sales
group by pizza_name
order by Total_orders DESC;


--- Bottom 5 total pizza by total orders

select top 5 pizza_name, count(distinct order_id) as total_orders from pizza_sales
group by pizza_name
order by total_orders ASC;

--- Bottom 5 total pizza by total orders with pizza catergoty "classic"

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
WHERE pizza_category = 'Classic'
GROUP BY pizza_name
ORDER BY Total_Orders ASC














