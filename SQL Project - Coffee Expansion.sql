-- Data Analysis
-- Viewing the various tables
Select * From city;
Select * From customers;
Select * From products;
Select * From sales;

-- Coffee Consumers Count
-- Q1. How many people in each city are estimated to consume coffee, given that 25% of the population does?
Select city_name, ROUND((0.25*population)/1000000,2) as coffee_consumers_in_millions, city_rank
From city
ORDER BY coffee_consumers_in_millions DESC;

-- The top 5 cities are Delhi, Mumbai, Kolkata, Bangalor & Chennai

-- Total Revenue from Coffee Sales
-- Q2. What is the total revenue generated from coffee sales across all cities in the last quarter of 2023?
Select sum(total) as total_revenue
From sales
WHERE sale_date BETWEEN '2023-10-01' AND '2023-12-31';

-- Sales Count for Each Product
-- Q3. How many units of each coffee product have been sold?
Select product_name, Count(*) as total_orders
From sales as s
JOIN products as p
ON s.product_id = p.product_id
Group By s.product_id
Order By total_orders  DESC;

-- Average Sales Amount per City
-- Q4. What is the average sales amount per customer in each city?
Select city_name, sum(total) as total_revenue, 
count(DISTINCT s.customer_id) as total_customers,  ROUND(sum(total)/count(DISTINCT s.customer_id),2) as avg_sale_per_customer
From sales as s
JOIN customers as c
ON s.customer_id = c.customer_id
JOIN city as ci
ON ci.city_id = c.city_id
Group by city_name
Order By avg_sale_per_customer DESC;

-- Top Selling Products by City
-- Q5. What are the top 3 selling products in each city based on sales volume?
Select *
From
(Select ci.city_name, p.product_name, COUNT(s.sale_id) as total_orders, 
DENSE_RANK() OVER(PARTITION BY ci.city_name ORDER BY COUNT(s.sale_id) DESC) as position_no
From sales as s
JOIN products as p
ON s.product_id = p.product_id
JOIN customers as c
ON s.customer_id = c.customer_id
JOIN city as ci
ON ci.city_id = c.city_id
GROUP By ci.city_name, p.product_name ) as t1
WHERE position_no <= 3;

-- Customer Segmentation by City
-- Q6. How many unique customers are there in each city who have purchased coffee products?
Select city_name, COUNT(DISTINCT c.customer_id) as unique_customers
From sales as s
JOIN customers as c
ON s.customer_id = c.customer_id
JOIN city as ci
ON ci.city_id = c.city_id
WHERE s.product_id <= 14
GROUP BY city_name
ORDER BY unique_customers DESC;

-- Average Sale vs Rent
-- Q7. Find each city and their average sale per customer and avg rent per customer
WITH city_table 
AS
(Select city_name, count(DISTINCT s.customer_id) as total_customers,
ROUND(sum(total)/count(DISTINCT s.customer_id),2) as avg_sale_per_customer
From sales as s
JOIN customers as c
ON s.customer_id = c.customer_id
JOIN city as ci
ON ci.city_id = c.city_id
Group by city_name
Order By avg_sale_per_customer DESC),
city_rent
AS 
(Select city_name, estimated_rent
From city)

Select cr.city_name, cr.estimated_rent, ct.total_customers,
ct.avg_sale_per_customer, ROUND(cr.estimated_rent/ct.total_customers,2) as avg_rent_per_customer
From city_rent as cr
JOIN city_table as ct
ON cr.city_name = ct.city_name
ORDER BY avg_sale_per_customer DESC;

-- Monthly Sales Growth
-- Q8. Sales growth rate: Calculate the percentage growth (or decline) in sales over different time periods (monthly).
WITH growth_ratio 
AS
(Select ci.city_name, MONTH(sale_date) as month, YEAR(sale_date) as year, 
sum(total) as current_month_sale, LAG(sum(total),1) OVER(PARTITION BY ci.city_name ORDER BY YEAR(sale_date),MONTH(sale_date)) as last_month_sale
From sales as s
JOIN customers as c
ON s.customer_id = c.customer_id
JOIN city as ci
ON ci.city_id = c.city_id
GROUP BY ci.city_name, MONTH(sale_date), YEAR(sale_date)
ORDER BY ci.city_name, YEAR(sale_date), MONTH(sale_date)
)

Select city_name, month, year, current_month_sale, 
last_month_sale, ROUND((current_month_sale-last_month_sale)/last_month_sale * 100,2) as growth_ratio
From growth_ratio
WHERE last_month_sale IS NOT NULL;

-- Market Potential Analysis
-- Q9. Identify top 3 city based on highest sales, return city name, total sale, total rent, total customers, estimated coffee consumer
WITH city_table 
AS
(Select city_name, count(DISTINCT s.customer_id) as total_customers,  sum(total) as total_revenue,
ROUND(sum(total)/count(DISTINCT s.customer_id),2) as avg_sale_per_customer
From sales as s
JOIN customers as c
ON s.customer_id = c.customer_id
JOIN city as ci
ON ci.city_id = c.city_id
Group by city_name
Order By avg_sale_per_customer DESC),
city_rent
AS 
(Select city_name, estimated_rent, ROUND((population*0.25)/1000000,2) as estimated_coffee_consumer_in_millions
From city)

Select cr.city_name, total_revenue, cr.estimated_rent as total_rent, ct.total_customers, estimated_coffee_consumer_in_millions,
ct.avg_sale_per_customer, ROUND(cr.estimated_rent/ct.total_customers,2) as avg_rent_per_customer
From city_rent as cr
JOIN city_table as ct
ON cr.city_name = ct.city_name
ORDER BY total_revenue DESC;

/*
Recommnedations
City 1: Jaipur
1. Average rent per customer is low in comparison with the other cities
2. Highest total customers (69)
3. More cost effective city compared to others leading to more profitability

City 2: Pune
1. Highest total revenue and low rent per customer leads to more profitability
2. Average sale per customer is the highest among all cities
3. Expected to have good potential with high profitability due to lower costs

City 3: Delhi
1. Highest estimated cofee consumers (7.7 M)
2. Second highest total customers (68)
3. Average rent per customer is reasonable (330)

/*
