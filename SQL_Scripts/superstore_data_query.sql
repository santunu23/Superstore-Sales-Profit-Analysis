-- Fetch all rows
SELECT * FROM `database.table_name` order by(uni_id) ASC;

-- check NULL Value
SELECT *
FROM `database.table_name`
WHERE `Ship Mode` IS NULL 
   OR Sales IS NULL 
   OR City IS NULL;

-- check blank row
SELECT COUNT(*) AS total_blank_rows
FROM `database.table_name`
WHERE uni_id IS NULL;

-- check duplicate value
SELECT `uni_id`, COUNT(*)
FROM `database.table_name`
GROUP BY `uni_id`
HAVING COUNT(*) > 1;

--Profitability by Category 
SELECT 
Category,
sum(sales) as Total_sales,
sum(profit) as Total_profit,
ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin_Percentage
FROM `database.table_name`
GROUP BY Category
ORDER BY Total_Profit DESC;

-- Regional Performance & Customer Loyalty
SELECT
Region,
COUNT(uni_id) as Total_Order,
SUM(sales) as Total_sales,
SUM(profit) as Total_profit,
ROUND(AVG(Profit), 2) AS Avg_Profit_Per_Order
FROM `database.table_name`
GROUP BY Region
ORDER BY Total_Order DESC;

-- The Correlation Between Discount and Profit
SELECT 
    Category, 
    ROUND(AVG(Discount), 4) AS Avg_Discount, 
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM `database.table_name`
GROUP BY Category
ORDER BY Avg_Discount DESC;

-- Shipping Mode Efficiency
SELECT 
    `Ship Mode`, 
    COUNT(uni_id) AS Total_Orders,
    SUM(Profit) AS Total_Profit,
    ROUND(AVG(Profit), 2) AS Avg_Profit_Per_Order
FROM `database.table_name`
GROUP BY `Ship Mode`
ORDER BY Avg_Profit_Per_Order DESC;
