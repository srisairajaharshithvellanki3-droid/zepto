📊 Zepto SQL Data Analysis Project
📌 Overview

This project focuses on analyzing product data from a Zepto-like grocery inventory system using SQL. It includes database creation, data cleaning, and business-focused analysis to extract meaningful insights.

🗂️ Database Schema

The table zepto3 stores product-level information such as category, pricing, discounts, inventory, and availability.

Columns:

category – Product category
name – Product name
mrp – Maximum Retail Price
discountPercent – Discount offered (%)
availableQuantity – Units available
discountedSellingPrice – Final selling price
weightInGms – Product weight
outOfStock – Availability status
quantity – Pack quantity
⚙️ Key Features
🔹 Data Exploration
Count total records
Identify null values
View distinct product categories
Analyze stock availability
🔹 Data Cleaning
Removed invalid records (price = 0)
Converted price from paise to rupees
🔹 Business Analysis Queries
📈 Top products based on highest discounts
🚫 High-value products that are out of stock
💰 Estimated revenue by category
🏷️ Products with high MRP and low discount
📊 Categories with highest average discounts
⚖️ Price per gram analysis for value comparison
📦 Product segmentation (Low, Medium, Bulk)
⚖️ Total inventory weight per category
📊 Sample Insights
Identified best-value products based on discount percentage
Evaluated inventory gaps for high-priced items
Estimated category-wise revenue potential
Compared product efficiency using price-per-gram metrics
🛠️ Technologies Used
SQL (PostgreSQL / MySQL compatible)
Data Cleaning & Transformation
Analytical Querying
