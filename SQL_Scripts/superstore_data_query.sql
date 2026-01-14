SELECT * FROM `mybigquerypractice-446408.superstore_data.superstore_userdata` order by(uni_id) desc;

SELECT 
Category,
sum(sales) as Total_sales,
sum(profit) as Total_profit,
ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin_Percentage
FROM `mybigquerypractice-446408.superstore_data.superstore_userdata`
GROUP BY Category
ORDER BY Total_Profit DESC;

--repeted customers from the region
SELECT
Region,
COUNT(uni_id) as Total_Order,
SUM(sales) as Total_sales,
SUM(profit) as Total_profit,
ROUND(AVG(Profit), 2) AS Avg_Profit_Per_Order
FROM `mybigquerypractice-446408.superstore_data.superstore_userdata`
GROUP BY Region
ORDER BY Total_Order DESC;
