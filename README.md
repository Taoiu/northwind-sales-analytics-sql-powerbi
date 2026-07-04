📊 Northwind Sales Analytics | SQL Server & Power BI
Introduction
This project presents a complete sales analysis of the Northwind database using Microsoft SQL Server and Power BI. The goal was to transform raw business data into meaningful insights through SQL analysis and interactive dashboards that support data-driven decision-making.

Database Overview
The Northwind database is a sample business database containing information about customers, products, orders, suppliers, employees, categories, shippers, and sales transactions. It provides a realistic business environment for practicing SQL querying, data analysis, and business intelligence reporting.

Business Questions
This project answers several business questions, including:
1-How many customers does the company have?
2-How many products are available?
3-How many orders have been placed?
4-How many suppliers work with the company?
5-How many categories are available?
6-What is the total revenue generated?
7-What is the average order value?
8-Which order generated the highest revenue?
9-Which month generated the highest sales?
10-Which year generated the highest sales?
11-What are the Top 10 best-selling products?
12-Which products generated the highest revenue?
13-Which products have never been ordered?
14-Which products are running out of stock?
15-Which category generates the highest revenue?
16-Who are the Top 10 customers by revenue?
17-Which customers placed the most orders?
18-Which countries generate the highest revenue?
19-Which customers have never placed an order?
20-Which employee handled the most orders?
21-Which employee generated the highest revenue?
22-Which shipper delivered the most orders?
23-What is the average shipping time by shipper?
24-What is the average freight cost by shipper?
25-Product revenue classification

SQL Analysis
SQL Server was used to extract, clean, and analyze the data. The analysis included:
Joins
Aggregate Functions
GROUP BY & HAVING
CASE Statements
Common Table Expressions (CTEs)
Window Functions
ROW_NUMBER(), RANK(), DENSE_RANK()
PARTITION BY
Views
Date Functions

Power BI Dashboard
An interactive Power BI dashboard was developed with three pages:
Business Overview
Employees & Shipping
Geographic & Supplier Insights
The dashboard includes KPIs, slicers, maps, line charts, bar charts, donut charts, and interactive filters to enable dynamic business analysis.

Key Insights
-The company generated approximately $1.35M in total revenue during the analyzed period.
-A small group of customers contributes a significant portion of total revenue, indicating customer concentration.
-Revenue fluctuates throughout the year, with noticeable peaks and slower periods.
-The average shipping time is around 8 days, providing a benchmark for delivery performance.
-Certain product categories consistently outperform others and contribute the largest share of revenue
-Alice Mutton, Thüringer Rostbratwurst, Gorgonzola Telino and Perth Pasties products are currently out of stock, indicating an urgent need for inventory replenishment to prevent potential sales losses.

Conclusion
This project demonstrates how SQL Server and Power BI can be combined to transform raw business data into actionable insights. It highlights the complete data analysis workflow—from querying and preparing data to designing interactive dashboards that support informed business decisions.
