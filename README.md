# SQL Project - Coffee Expansion

## Objective
The goal of this project is to analyze the sales data of Monday Coffee, a company that has been selling its products online since January 2023, and to recommend the top three major cities in India for opening new coffee shop locations based on consumer demand and sales performance.

## Key Questions
1. **Coffee Consumers Count**  
   How many people in each city are estimated to consume coffee, given that 25% of the population does?
* The 3 cities that are estimated to have the most coffee consumers are Delhi (7.75M), Mumbai (5.10M) & Kolkata (3.73M)
* The 3 cities that are estimated to have the least coffee consumers are Nagpur (0.73M), Kanpur (0.78M) & Indore (0.83M)

2. **Total Revenue from Coffee Sales**  
   What is the total revenue generated from coffee sales across all cities in the last quarter of 2023?
* The total revenue generated from October 1st 2023 - December 31st 2023 is 1,963,300

3. **Sales Count for Each Product**  
   How many units of each coffee product have been sold?
* The top 3 total coffee products sold are Cold Brew Coffee Pack (6 Bottles) with 1326 orders, Ground Espresso Coffee (250g) with 1271 orders & Instant Coffee Powder (100g) with 1226 orders
* The bottom 3 total coffee products sold are Coffee Mug (Ceramic) with	73 orders, Stainless Steel Tumbler (75 orders) & Coffee-Themed Notebook (76 orders)

4. **Average Sales Amount per City**  
   What is the average sales amount per customer in each city?
* The top 3 cities with the highest average sales amount per customer are Pune(24,197), Chennai (22,479) & Bangalore (22,054)
* The bottom 3 cities with the lowest average sales amount per customer are Lucknow (5209), Nagpur (5835) & Ahmedabad (5986)

5. **Top Selling Products by City**  
   What are the top 3 selling products in each city based on sales volume?
* For Ahmedabad, Jaipur and Lucknow, the top 3 selling products are Cold Brew Coffee Pack (6 Bottles), Coffee Beans (500g) & Instant Coffee Powder (100g)
* For Bangalore, Mumbai and Pune, the top 3 selling products are Cold Brew Coffee Pack (6 Bottles), Ground Espresso Coffee (250g) & Instant Coffee Powder (100g)
* For Chennai, the top 3 selling products are Cold Brew Coffee Pack (6 Bottles), Coffee Beans (500g) & Instant Coffee Powder (100g)
* For Delhi and Hyderabad, the top 3 selling products are Ground Espresso Coffee (250g), Instant Coffee Powder (100g) & Coffee Beans (500g)
* For Indore, the top 3 selling products are Instant Coffee Powder (100g), Cold Brew Coffee Pack (6 Bottles), Ground Espresso Coffee (250g) & Coffee Beans (500g) where Cold Brew Coffee Pack (6 Bottles) and Ground Espresso Coffee (250g) tied for the second highest product sold with 26 total orders each
* For Kanpur and Kolkata, the top 3 selling products are Cold Brew Coffee Pack (6 Bottles), Ground Espresso Coffee (250g) & Coffee Beans (500g)
* For Nagpur, the top 3 selling products are Ground Espresso Coffee (250g),Instant Coffee Powder (100g), Cold Brew Coffee Pack (6 Bottles) & Coffee Beans (500g) where Cold Brew Coffee Pack (6 Bottles) and Coffee Beans (500g) tied for the third highest product sold with 28 total orders each
* For Surat, the top 3 selling products are Coffee Beans (500g), Cold Brew Coffee Pack (6 Bottles) & Ground Espresso Coffee (250g)

6. **Customer Segmentation by City**  
   How many unique customers are there in each city who have purchased coffee products?
* The top 3 cities with unique customers are Jaipur (69), Delhi (68) & Pune (52)
* The bottom 3 cities are Hyderabad (21), Indore (21) & Lucknow (21)

7. **Average Sale vs Rent**  
   Find each city and their average sale per customer and avg rent per customer
* Pune has the highest average sale per customer (24197) followed by Chennai (22479) & Bangalore (22054)
* Lucknow has the lowest average sale per customer (5209) followed by Nagpur (5835) & Ahmedabad (5986) 
* Mumbai has the higest average rent per customer (1166) followed by Hyderabad (1071) & Bangalore (761.54)
* Jaipur has the lowest average rent cusomter (156) followed by Kanpur (231) & Pune (294)

8. **Monthly Sales Growth**  
   Sales growth rate: Calculate the percentage growth (or decline) in sales over different time periods (monthly).
* Check the SQL script for percentage growth or decline from January 2023 - September 2024

9. **Market Potential Anaysis**  
    Identify top 3 city based on highest sales, return city name, total sale, total rent, total customers, estimated  coffee consumer
* The top 3 cities based on highest sales are Pune (1.26M), Chennai (0.94M) & Bangalore (0.86M)
* The bottom 3 cities based on highest sales are Lucknow (0.11M), Hyderabad (0.13M) & Ahmedabad (0.14M)


## Recommendations
The recommended top three cities for new store openings are:

**City 1: Jaipur**
1. Average rent per customer is low in comparison with the other cities
2. Highest total customers (69)
3. More cost effective city compared to others leading to more profitability

**City 2: Pune**
1. Highest total revenue and low rent per customer leads to more profitability
2. Average sale per customer is the highest among all cities
3. Expected to have good potential with high profitability due to lower costs

**City 3: Delhi**
1. Highest estimated cofee consumers (7.7 M)
2. Second highest total customers (68)
3. Average rent per customer is reasonable (330)
**Also, with Chennai having the second highest toal revenue and average sale per customer along with affordable rent (under 500) offers a good opportunity as well.**
---
