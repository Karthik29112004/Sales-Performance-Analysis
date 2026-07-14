USE sales_dashboard;

-- =====================================================
-- SALES PERFORMANCE DASHBOARD & BUSINESS INSIGHTS
-- MySQL Business Queries
-- =====================================================

-- -----------------------------------------------------
-- BASIC QUERIES
-- -----------------------------------------------------

-- Q1. Total number of records
SELECT COUNT(*) AS total_records
FROM superstore;

-- Q2. Total Sales
SELECT ROUND(SUM(Sales),2) AS total_sales
FROM superstore;

-- Q3. Total Profit
SELECT ROUND(SUM(Profit),2) AS total_profit
FROM superstore;

-- Q4. Total Quantity Sold
SELECT SUM(Quantity) AS total_quantity
FROM superstore;

-- Q5. Total Unique Orders
SELECT COUNT(DISTINCT `Order ID`) AS total_orders
FROM superstore;

-- Q6. Total Customers
SELECT COUNT(DISTINCT `Customer ID`) AS total_customers
FROM superstore;

-- -----------------------------------------------------
-- CATEGORY ANALYSIS
-- -----------------------------------------------------

-- Q7. Sales by Category

SELECT Category,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Q8. Profit by Category

SELECT Category,
       ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore
GROUP BY Category
ORDER BY Total_Profit DESC;

-- Q9. Sales by Sub-Category

SELECT `Sub-Category`,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore
GROUP BY `Sub-Category`
ORDER BY Total_Sales DESC;

-- -----------------------------------------------------
-- REGION ANALYSIS
-- -----------------------------------------------------

-- Q10. Sales by Region

SELECT Region,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Q11. Profit by Region

SELECT Region,
       ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore
GROUP BY Region
ORDER BY Total_Profit DESC;

-- Q12. Sales by State

SELECT State,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore
GROUP BY State
ORDER BY Total_Sales DESC;

-- -----------------------------------------------------
-- CUSTOMER ANALYSIS
-- -----------------------------------------------------

-- Q13. Sales by Customer Segment

SELECT Segment,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore
GROUP BY Segment
ORDER BY Total_Sales DESC;

-- Q14. Top 10 Customers by Sales

SELECT `Customer Name`,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore
GROUP BY `Customer Name`
ORDER BY Total_Sales DESC
LIMIT 10;

-- -----------------------------------------------------
-- PRODUCT ANALYSIS
-- -----------------------------------------------------

-- Q15. Top 10 Products by Sales

SELECT `Product Name`,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;

-- Q16. Top 10 Products by Profit

SELECT `Product Name`,
       ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore
GROUP BY `Product Name`
ORDER BY Total_Profit DESC
LIMIT 10;

-- Q17. Bottom 10 Products by Profit

SELECT `Product Name`,
       ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore
GROUP BY `Product Name`
ORDER BY Total_Profit ASC
LIMIT 10;

-- -----------------------------------------------------
-- DISCOUNT ANALYSIS
-- -----------------------------------------------------

-- Q18. Average Discount

SELECT ROUND(AVG(Discount),2) AS Average_Discount
FROM superstore;

-- Q19. Profit by Discount

SELECT Discount,
       ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore
GROUP BY Discount
ORDER BY Discount;

-- -----------------------------------------------------
-- FILTERING
-- -----------------------------------------------------

-- Q20. Orders with Profit greater than 1000

SELECT *
FROM superstore
WHERE Profit > 1000;

-- Q21. Orders with Discount greater than 20%

SELECT *
FROM superstore
WHERE Discount > 0.20;

-- -----------------------------------------------------
-- HAVING
-- -----------------------------------------------------

-- Q22. Categories having Sales greater than 500000

SELECT Category,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore
GROUP BY Category
HAVING SUM(Sales) > 500000;

-- -----------------------------------------------------
-- CASE STATEMENT
-- -----------------------------------------------------

-- Q23. Classify Profit Status

SELECT
    `Order ID`,
    Profit,
    CASE
        WHEN Profit > 0 THEN 'Profit'
        ELSE 'Loss'
    END AS Profit_Status
FROM superstore;

-- -----------------------------------------------------
-- DATE ANALYSIS
-- -----------------------------------------------------

-- Q24. Monthly Sales

SELECT
    MONTH(`Order Date`) AS Month,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore
GROUP BY MONTH(`Order Date`)
ORDER BY Month;

-- Q25. Yearly Sales

SELECT
    YEAR(`Order Date`) AS Year,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore
GROUP BY YEAR(`Order Date`)
ORDER BY Year;

-- -----------------------------------------------------
-- WINDOW FUNCTIONS
-- -----------------------------------------------------

-- Q26. Rank Products by Sales

SELECT
    `Product Name`,
    ROUND(SUM(Sales),2) AS Total_Sales,
    RANK() OVER(ORDER BY SUM(Sales) DESC) AS Sales_Rank
FROM superstore
GROUP BY `Product Name`;

-- Q27. Dense Rank Products by Profit

SELECT
    `Product Name`,
    ROUND(SUM(Profit),2) AS Total_Profit,
    DENSE_RANK() OVER(ORDER BY SUM(Profit) DESC) AS Profit_Rank
FROM superstore
GROUP BY `Product Name`;

-- Q28. Row Number by Sales

SELECT
    `Product Name`,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROW_NUMBER() OVER(ORDER BY SUM(Sales) DESC) AS Row_Num
FROM superstore
GROUP BY `Product Name`;

-- -----------------------------------------------------
-- BUSINESS INSIGHTS
-- -----------------------------------------------------

-- Q29. Average Sales per Order

SELECT
ROUND(AVG(Sales),2) AS Average_Order_Value
FROM superstore;

-- Q30. Average Profit per Order

SELECT
ROUND(AVG(Profit),2) AS Average_Profit
FROM superstore;