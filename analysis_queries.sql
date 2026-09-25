-- DataCo Supply Chain Analysis
-- All queries run against the DataCoSupplyChainDataset table (180,519 rows)

-- 1. Row count validation (confirms import matches source file)
SELECT COUNT(*) FROM DataCoSupplyChainDataset;

-- 2. Overall delivery status breakdown
SELECT "Delivery Status", COUNT(*) AS num_orders
FROM DataCoSupplyChainDataset
GROUP BY "Delivery Status"
ORDER BY num_orders DESC;

-- 3. Total sales by product category
SELECT "Category Name",
       COUNT(*) AS total_orders,
       ROUND(SUM(Sales), 2) AS total_sales
FROM DataCoSupplyChainDataset
GROUP BY "Category Name"
ORDER BY total_sales DESC;

-- 4. Late delivery rate and average profit ratio by shipping mode
SELECT "Shipping Mode",
       COUNT(*) AS total_orders,
       ROUND(100.0 * SUM(CASE WHEN "Delivery Status" = 'Late delivery' THEN 1 ELSE 0 END) / COUNT(*), 1) AS late_pct,
       ROUND(AVG("Order Item Profit Ratio"), 3) AS avg_profit_ratio
FROM DataCoSupplyChainDataset
GROUP BY "Shipping Mode"
ORDER BY late_pct DESC;

-- 5. Late delivery rate and total sales by region
SELECT "Order Region",
       COUNT(*) AS total_orders,
       ROUND(100.0 * SUM(CASE WHEN "Delivery Status" = 'Late delivery' THEN 1 ELSE 0 END) / COUNT(*), 1) AS late_pct,
       ROUND(SUM(Sales), 0) AS total_sales
FROM DataCoSupplyChainDataset
GROUP BY "Order Region"
ORDER BY total_sales DESC;

-- 6. Average discount rate vs average profit ratio by category (lowest margin categories)
SELECT "Category Name",
       ROUND(AVG("Order Item Discount Rate") * 100, 1) AS avg_discount_pct,
       ROUND(AVG("Order Item Profit Ratio"), 3) AS avg_profit_ratio,
       COUNT(*) AS num_orders
FROM DataCoSupplyChainDataset
GROUP BY "Category Name"
ORDER BY avg_profit_ratio ASC
LIMIT 10;

-- 7. Profit tier classification
SELECT
    CASE
        WHEN "Order Item Profit Ratio" < 0 THEN 'Loss'
        WHEN "Order Item Profit Ratio" < 0.10 THEN 'Low margin'
        ELSE 'Healthy margin'
    END AS profit_tier,
    COUNT(*) AS num_orders
FROM DataCoSupplyChainDataset
GROUP BY profit_tier
ORDER BY num_orders DESC;
