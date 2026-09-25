# DataCo Supply Chain: Late Delivery & Profitability Analysis

## Business Question
Is DataCo's premium (faster) shipping actually delivering the reliability customers are paying for — and is unreliable shipping quietly costing the company money?

## Data Source
[DataCo Smart Supply Chain for Big Data Analysis](https://data.mendeley.com/datasets/8gx2fvg2k6/5) — a public dataset of 180,519 real order records, originally published on Mendeley Data, covering sales, shipping, delivery status, and profitability across regions and product categories.

## Tools Used
- **SQL (SQLite / DB Browser for SQLite)** — data cleaning, validation, and aggregation across 180K+ rows
- **Excel** — visualization and dashboard summary

## Process

1. **Data cleaning & validation** — Imported the raw CSV (Latin-1 encoded, 53 columns) into SQLite. Caught and fixed an import error where the header row was incorrectly loaded as data, and verified the final row count (180,519) matched the source file exactly.
2. **Exploratory analysis** — Used `GROUP BY`, `CASE WHEN`, and aggregate functions to break down delivery performance and profitability by shipping mode, product category, and region.
3. **Visualization** — Exported key summary tables into Excel and built charts to communicate findings clearly, including correcting a misleading truncated y-axis on one chart to avoid overstating regional differences.

## Key Findings

1. **54.8% of all orders (98,977 of 180,519) arrived late.** This is not an edge case — it's the majority outcome.
2. **Late delivery is driven by shipping mode, not geography.** First Class shipping has a **95.3% late rate**, dramatically worse than Standard Class (38.1%). Late delivery rates are nearly flat across all regions (~54–56%), ruling out geography as the cause.
3. **This problem is invisible in profit data.** Average profit ratio stays roughly flat (~12%) regardless of shipping mode — meaning the reliability gap doesn't show up in standard financial reporting at all.
4. **Discounting is not the main driver of low-margin categories.** Discount rates are similar (~10%) across nearly all product categories, so categories like Men's Clothing and Strength Training have low margins for reasons other than discounting — likely cost structure, not pricing strategy.

## Recommendation
Review First Class fulfillment operations, or adjust delivery-time promises for that tier. Customers paying a premium for speed are currently getting the least reliable delivery of any shipping option — a customer-experience risk that won't appear on a profit-and-loss statement, but will show up in complaints, returns, and repeat-purchase rates.

## Files in This Repo
- `analysis_queries.sql` — all SQL queries used in this analysis
- `dataco_dashboard.xlsx` — Excel workbook with summary tables and charts
- `screenshots/` — key chart outputs

## Notes
The raw dataset (~91MB) is not included in this repo. Download it directly from the [original source](https://data.mendeley.com/datasets/8gx2fvg2k6/5) to reproduce this analysis.
