# Online Store Sales & Delivery Analysis — Tableau Dashboard

A Tableau dashboard that analyzes the sales and deliveries of an Egyptian online store to track sales, find the best categories and cities, and see where deliveries are late.

![Sales Overview](img1.png)

## Business Questions
1. How much are we selling, and how are sales changing month by month?
2. Which categories, products and cities bring the most sales?
3. How many orders arrive late, and in which cities?
4. Do late deliveries affect customer ratings?
5. How do customers prefer to pay?

## Dataset
- **Source:** Synthetic sample dataset (AI-generated) created for practice. It contains no real customer or company data.
- **Size:** 5,000 orders from Jan 2024 to Dec 2025. Money is in Egyptian Pounds (EGP).
- **Fields:** Order_ID, Order_Date, City, Category, Product, Quantity, Unit_Price, Total_Amount, Payment_Method, Delivery_Days, Delivery_Status (On Time / Late), Rating (1-5)

## Tools & Skills
- **SQL:** basic queries in `analysis.sql` (SUM, COUNT, AVG, GROUP BY, ORDER BY, CASE)
- **Tableau:** calculated fields, KPI cards, charts, two dashboards
- **KPI reporting:** total sales, average order value, late rate, average rating

## Key Calculated Fields
| Field | Formula |
|---|---|
| Total Sales | `SUM([Total_Amount])` |
| Orders | `COUNTD([Order_ID])` |
| Avg Order Value | `SUM([Total_Amount]) / COUNTD([Order_ID])` |
| Late Rate | `SUM(IF [Delivery_Status] = "Late" THEN 1 ELSE 0 END) / COUNTD([Order_ID])` |
| Avg Rating | `AVG([Rating])` |
| Avg Delivery Days | `AVG([Delivery_Days])` |

## Dashboard Pages
1. **Sales Overview:** KPI cards (Total Sales, Orders, Avg Order Value), monthly sales trend, sales by category, sales by city
2. **Delivery & Customers:** KPI cards (Late Rate, Avg Delivery Days, Avg Rating), late rate by city, average rating by delivery status, orders by payment method

## Key Insights
- **5,000 orders** with total sales of **EGP 7.21M** and an average order value of **EGP 1,443**.
- Sales grew from **EGP 3.35M in 2024** to **EGP 3.86M in 2025** (+15%).
- **November** (White Friday) was the peak month in both years (Nov 2025: EGP 406K). There is also a bump in **March** (Ramadan).
- **Home & Kitchen** had the highest sales (EGP 2.04M), then Electronics (EGP 1.87M). The top product was **Smart Watch** (EGP 1.02M).
- **Cairo** is the biggest city (1,657 orders, EGP 2.36M), then Giza and Alexandria.
- **17.2%** of orders arrived late. Average delivery time is **2.6 days**.
- Upper Egypt has the highest late rates: **Luxor 31.3%**, **Sohag 29.4%**, **Assiut 28.8%** (Cairo 14.5%, Giza 13.7%).
- Late orders get much lower ratings: **4.32 for On Time vs 2.56 for Late** (overall average 4.02).
- **Cash on Delivery** is the most used payment method (45% of orders), then Card (24.5%), Mobile Wallet (17%) and InstaPay (13%).

## Recommendations
- Improve delivery partners in **Upper Egypt**, or show customers more realistic delivery times there.
- Prepare stock and delivery capacity before **November** and **Ramadan**.
- Encourage digital payments (Card, Mobile Wallet, InstaPay), since **Cash on Delivery** is 45% of orders.
- Focus marketing on **Home & Kitchen** and **Electronics**, the top categories.

## Screenshots

### Sales Overview
![Sales Overview](img1.png)

### Delivery & Customers
![Delivery & Customers](img2.png)

## How to Open
Download [`Online_Store_Dashboard.twb`](Online_Store_Dashboard.twb?raw=true) and [`online_store_orders.csv`](online_store_orders.csv?raw=true) into the same folder. Open the `.twb` file in [Tableau Public](https://www.tableau.com/products/public) or Tableau Desktop (free). If Tableau asks for the data file, point it to `online_store_orders.csv`.

## Other Projects
- [Payment Transaction Analysis — Power BI](https://github.com/seifkhaledd/payment-transaction-analysis)

---
**Author:** Seif Abdelsalam, Data Analyst
