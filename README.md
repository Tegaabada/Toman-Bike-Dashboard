# Toman-Bike-Dashboard
Sales KPI Analysis
## Project Overview

**Project Title**: Toman Bikes Sales KPI Analysis. <br>
**Database**:`Toman_Data` <br>

**Tech Stack**: ![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?style=flat&logo=microsoftsqlserver&logoColor=white)  ![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=flat&logo=powerbi&logoColor=black)


This project showcases the use of SQL and Power BI to design and develop an interactive dashboard for Toman Bike Share. It involves creating or accessing a bike‑share database, analyzing hourly revenue, seasonal profit trends, and rider demographics, and presenting these insights through a user‑friendly, brand‑aligned dashboard. The work supports data‑driven decision‑making and includes recommendations on pricing strategy for the upcoming year.

##Outline
-	Objectives
-	Analysis
-	Key Insights
-	Recommendations
-	Conclusion

## Objectives

1. **Set up a database**: Populate a database with the provided Toman Bike Sales data.
2. **Data Cleaning**: Perform necessary data cleaning practises such as: Identifying and removing any records with null values and using the proper datatypes.
3. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
4. **Business Analysis**: Use SQL and DAX to answer specific business questions and derive insights from the dataset.

## Analysis

### 1. SQL Database Setup

- **Database Set up**: The project starts by setting up on a database.
- **Table Creation**: The tables, were imported into the SQL server.


### 2. Data Cleaning

- **Null Value Check**: View tables and check for any null values in the dataset and delete records with missing data.
- **Datatype Check**: View tables and check datatype and alter columns with wrong datatypes.

### 3. Exploratory Data Analysis

SQL queries were developed to answer specific business questions. 

-- Query written using a Common Table Expression (CTE) to join table and get the revenue and profit:

```sql
WITH cte_table as (
SELECT *
  FROM bike_share_yr_0
UNION
SELECT *
  FROM bike_share_yr_1)

  SELECT 
  dteday,
  season,
  a.yr,
  weekday,
  hr,
  rider_type,
  riders,
  price,
  COGS,
  riders*price as revenue,
  riders*(price - COGS) as profit

FROM
  cte_table a
  LEFT JOIN cost_table b
  ON a.yr = b.yr;
```
### Power BI
<img src="Toman Dashboard.png" alt="Toamn Bikes dashboard overview">

### Calculated Measures
<img src="Toman Tables.png" alt="Toamn Bikes dashboard overview">

More exploratory analysis was done in Power BI using DAX to generate calculated measures such as:
- Price Increase:
- Demand Increase:
- Price Elasticity:


## Key Insights

- **Business Performance Overview**: The Toman Bike Share dashboard reveals strong profitability with a revenue of £15M, profit of £10.45M, and a profit margin of 0.69. A total of 3 million riders were recorded, indicating high service utilization and operational efficiency.
- **Seasonal Revenue Trends**: Revenue distribution across seasons shows Season 3 as the most profitable (£4.9M), followed by Season 2 (£4.2M), Season 4 (£3.9M), and Season 1 (£2.2M). This highlights seasonal demand fluctuations, useful for resource planning and promotional targeting.
- **Rider Demographics**: The rider base is predominantly registered users (81.17%) compared to casual riders (18.83%), suggesting strong customer retention and membership engagement.
- **Hourly Sales Insights**: Sales are highest between 10:00AM and 6:00PM, with Wednesday and Friday showing peak profitability. This pattern supports targeted scheduling, staffing, and marketing during high-demand periods
- **Year-on-Year Growth & Pricing Impact**: From 2021 to 2022, rider demand increased by 65% while average price rose by 25%, resulting in a price elasticity of 2.59. This indicates that demand is highly responsive to pricing changes, supporting potential price adjustments in future strategy.

## Recommendation

Conservative Increase: Considering the substantial increase last year, a more conservative increase might be prudent to avoid hitting a price ceiling where demand starts to drop. An increase in the range of 10-15% could test the market's response without risking a significant loss of customers.

Price Setting:
* If the price in 2022 was £4.99, a 10% increase would make the new price about £5.49.
* A 15% increase would set the price at approximately £5.74.

Recommended Strategy:
Market Analysis: Conduct further market research to understand customer satisfaction, potential competitive changes, and the overall economic environment. This can guide whether leaning towards the lower or higher end of the suggested increase.
Segmented Pricing Strategy: Consider different pricing for casual versus registered users, as they may have different price sensitivities.
Monitor and Adjust: Implement the new prices but be ready to adjust based on immediate customer feedback and sales data. Monitoring closely will allow you to fine-tune your pricing strategy without committing fully to a price that might turn out to be too high.


## Conclusion

This project demonstrates how SQL can be applied to database setup, data cleaning, and exploratory analysis using employee information. By working with the EmployeeInfo and EmployeePosition2 tables, we were able to:
- Standardize and clean data (removing nulls, formatting DOB, parsing addresses).
- Generate demographic insights such as gender distribution, age ranges, and departmental counts.
- Explore organizational structure by identifying managerial roles and department staffing levels.
- Analyze salary trends, including ranges, top earners, and employees within specific pay bands.
- Retrieve targeted employee details using conditions on names, addresses, and joining dates.

Overall, the exercise highlights how SQL queries can uncover meaningful workforce insights, support HR reporting, and provide a foundation for business-driven decision making.


#### Author - Tega Abada
