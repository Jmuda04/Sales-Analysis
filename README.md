# SQL Sales Analysis Project

## Project Overview
This project analyzes a retail sales dataset using MySQL Workbench. 
The objective was to clean the dataset, answer key business questions using SQL, and generate actionable insights that support business decision-making.

## Dataset Description
The dataset contains retail sales transaction records, including:

- Customer ID
- Customer Name
- Product Name
- Product Category
- Quantity
- Price
- Purchase Date
- Purchase Time
- Payment Mode
- Gender
- Customer Age
- Order Status (Delivered, Cancelled, Returned)
Before analysis, the dataset was cleaned by converting the purchase date and purchase time into the correct SQL data types.

## Business Questions

This project answers the following business questions:

- 1 What are the top 5 best-selling products by quantity?
- 2 Which products are cancelled most frequently?
- 3 What time of day records the highest number of purchases?
- 4 Who are the top 5 highest-spending customers?
- 5 Which product categories generate the highest revenue?
- 6 What is the return and cancellation rate for each product category?
- 7 Which payment method is preferred by customers?
- 8 How does customer age influence purchasing behaviour?
- 9 What are the monthly sales trends?
- 10 Are certain genders purchasing specific product categories more frequently?
  
## Data Cleaning

The following data preparation steps were completed before analysis:

- Converted purchase dates to SQL DATE format.
- Converted purchase times to SQL TIME format.
- Updated table data types for accurate analysis.

## Tools Used
- MySQL Workbench
- SQL
  
## Featured Query Results

### Query 4 – Highest Spending Customers

![Query 4](Query%204-highest-spending%20Customers.png)

### Query 10 – Purchased by Gender, by Category

![Query 10](Query%2010-Purchased%20by%20Gender,%20by%20Category.png)

## Key Business Insights

* Identified the top 5 highest-spending customers based on total purchase value.
* Determined the best-selling products by total quantity sold.
* Identified the product categories that generated the highest revenue.
* Analyzed customer purchasing behaviour across different age groups.
* Determined the most preferred payment method used by customers.
* Identified the periods of the day with the highest purchase activity.
* Evaluated monthly sales trends to understand changes in sales performance over time.
* Measured return and cancellation rates across product categories to identify areas for operational improvement.
* Examined purchasing patterns across genders and product categories.

## Business Recommendations

- Develop loyalty programmes for high-value customers.
- Increase inventory for high-performing product categories.
- Monitor products with high cancellation rates to identify operational issues.
- Schedule promotions during peak purchasing periods.
- Use age-group purchasing behaviour to create targeted marketing campaigns.

## Skills Demonstrated
- SQL
- Data Cleaning
- Data Transformation
- Aggregate Functions
- CASE Statements
- GROUP BY
- ORDER BY
- Date Functions
- Business Analysis
- Data Interpretation
