-- =====================================================
-- Online Store Sales & Delivery Analysis (Egypt, 2024-2025)
-- Table: orders  (imported from online_store_orders.csv)
-- Money is in Egyptian Pounds (EGP)
-- =====================================================

-- Q1. Overall KPIs
SELECT COUNT(*)                          AS total_orders,
       SUM(Total_Amount)                 AS total_sales,
       ROUND(AVG(Total_Amount), 0)       AS avg_order_value,
       ROUND(AVG(Rating), 2)             AS avg_rating
FROM orders;

-- Q2. Sales per month
SELECT SUBSTR(Order_Date, 1, 7) AS order_month,
       COUNT(*)                 AS orders,
       SUM(Total_Amount)        AS sales
FROM orders
GROUP BY order_month
ORDER BY order_month;

-- Q3. Sales by category
SELECT Category,
       COUNT(*)          AS orders,
       SUM(Total_Amount) AS sales
FROM orders
GROUP BY Category
ORDER BY sales DESC;

-- Q4. Top 5 products by sales
SELECT Product,
       SUM(Quantity)     AS units_sold,
       SUM(Total_Amount) AS sales
FROM orders
GROUP BY Product
ORDER BY sales DESC
LIMIT 5;

-- Q5. Sales and late deliveries by city
SELECT City,
       COUNT(*)                                                  AS orders,
       SUM(Total_Amount)                                         AS sales,
       SUM(CASE WHEN Delivery_Status = 'Late' THEN 1 ELSE 0 END) AS late_orders,
       ROUND(100.0 * SUM(CASE WHEN Delivery_Status = 'Late' THEN 1 ELSE 0 END) / COUNT(*), 1) AS late_rate_pct
FROM orders
GROUP BY City
ORDER BY late_rate_pct DESC;

-- Q6. Do late orders get lower ratings?
SELECT Delivery_Status,
       COUNT(*)              AS orders,
       ROUND(AVG(Rating), 2) AS avg_rating
FROM orders
GROUP BY Delivery_Status;

-- Q7. Payment methods
SELECT Payment_Method,
       COUNT(*)          AS orders,
       SUM(Total_Amount) AS sales
FROM orders
GROUP BY Payment_Method
ORDER BY orders DESC;
