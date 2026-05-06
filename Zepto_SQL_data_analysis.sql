create table zepto3 (
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,	
quantity INTEGER
);

INSERT INTO zepto3(
    category,
    name,
    mrp,
    discountPercent,
    availableQuantity,
    discountedSellingPrice,
    weightInGms,
    outOfStock,
    quantity
)
VALUES 
('Fruits & Vegetables', 'Onion', 2500, 16, 3, 2100, 1000, FALSE, 1),
('Fruits & Vegetables', 'Tomato Hybrid', 4200, 16, 3, 3500, 1000, FALSE, 1),
('Fruits & Vegetables', 'Tender Coconut', 5100, 15, 3, 4300, 58, FALSE, 1);

select * from zepto3;

--count of rows
select count(*) from zepto3;
--sample data
SELECT * FROM zepto3
LIMIT 2;
--null values
SELECT * FROM zepto3
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
discountedSellingPrice IS NULL
OR
weightInGms IS NULL
OR
availableQuantity IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;
--different product categories
SELECT DISTINCT category
FROM zepto3
ORDER BY category;
--products in stock vs out of stock
SELECT outOfStock, COUNT(sku_id)
FROM zepto3
GROUP BY outOfStock;
--product names present multiple times
SELECT name, COUNT(sku_id) AS "Number of SKUs"
FROM zepto3
GROUP BY name
HAVING count(sku_id) > 1
ORDER BY count(sku_id) DESC;
--data cleaning

--products with price = 0
SELECT * FROM zepto3
WHERE mrp = 0 OR discountedSellingPrice = 0;

DELETE FROM zepto3
WHERE mrp = 0;
--convert paise to rupees
UPDATE zepto3
SET mrp = mrp / 100.0,
discountedSellingPrice = discountedSellingPrice / 100.0;

SELECT mrp, discountedSellingPrice FROM zepto3;
--data analysis

-- Q1. Find the top 2 best-value products based on the discount percentage.
SELECT DISTINCT name, mrp, discountPercent
FROM zepto3
ORDER BY discountPercent DESC
LIMIT 2;
--Q2.What are the Products with High MRP but Out of Stock

SELECT DISTINCT name,mrp
FROM zepto3
WHERE outOfStock = TRUE and mrp > 300
ORDER BY mrp DESC;
--Q3.Calculate Estimated Revenue for each category
SELECT category,
SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto3
GROUP BY category
ORDER BY total_revenue;
-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
SELECT DISTINCT name, mrp, discountPercent
FROM zepto3
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;
-- Q5. Identify the top 5 categories offering the highest average discount percentage.
SELECT category,
ROUND(AVG(discountPercent),2) AS avg_discount
FROM zepto3
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 2;
-- Q6. Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) AS price_per_gram
FROM zepto3
WHERE weightInGms >= 100
ORDER BY price_per_gram;
--Q7.Group the products into categories like Low, Medium, Bulk.
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM zepto3;
--Q8.What is the Total Inventory Weight Per Category 
SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto3
GROUP BY category
ORDER BY total_weight;




