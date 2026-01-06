# Toman-Bike-Dashboard
Sales KPI Analysis
## Project Overview

**Project Title**: Toman Bikes Sales KPI Analysis. <br>
**Database**:`Toman_Data` <br>

**Tech Stack**: ![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?style=flat&logo=microsoftsqlserver&logoColor=white)  ![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=flat&logo=powerbi&logoColor=black)


This project showcases the use of SQL and Power BI to design and develop an interactive dashboard for Toman Bike Share. It involves creating or accessing a bike‑share database, analyzing hourly revenue, seasonal profit trends, and rider demographics, and presenting these insights through a user‑friendly, brand‑aligned dashboard. The work supports data‑driven decision‑making and includes recommendations on pricing strategy for the upcoming year.

## Outline
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
### Power BI Dashboard
<img src="images/Toman Dashboard.png" alt="Toman Bikes dashboard overview">

The Toman Bike KPI Analysis Dashboard was built using SQL and Power BI to provide a clear, data‑driven view of the company’s financial performance, rider behaviour, and operational trends. The dashboard brings together key metrics such as revenue, profit, rider volume, seasonal patterns, and hourly sales to support strategic decision‑making and pricing recommendations. It highlights year‑on‑year growth, customer demographics, and demand sensitivity, enabling leadership to plan effectively for future pricing and service improvements.

#### 1. Key Performance Indicators (KPIs)
Metrics Displayed: Profit Margin (0.69), Revenue (£15M), Profit (£10.45M), Riders (3M)
These cards provide an instant snapshot of business performance. They highlight strong profitability and high rider engagement, giving stakeholders a quick understanding of overall financial health.

#### 2. KPI Trends Over Time
Metrics: Sum of Riders, Average Profit, Average Revenue
This visual tracks monthly performance across 2021–2022. It reveals growth patterns, seasonal dips, and periods of accelerated demand. The combination of bars and lines makes it easy to compare rider volume against financial performance.

#### 3. Seasonal Revenue Chart
This chart highlights clear seasonal demand cycles, showing when revenue peaks and when it slows. Season 3 emerges as the strongest period with £4.9M, followed by Season 2 at £4.2M. Season 4 and Season 1 follow with £3.9M and £2.2M rspectively.

#### 4. Rider Demographics
Breakdown:
- Registered Riders: 81.17%
- Casual Riders: 18.83%
This visual shows that the majority of users are registered members, indicating strong customer loyalty and the effectiveness of membership programs.

#### 5. Hourly Sales Matrix Table
Sales are highest between 10:00AM and 6:00PM, with Wednesdays and Fridays showing the strongest performance.
The conditioanl formatting highlights profitable hours and days, helping optimize bike availability, staffing, and targeted promotions



### Calculated Measures
<img src="images/Toman Tables.png" alt="Calculated Measures">

More exploratory analysis was done in Power BI using DAX to generate calculated measures.

Yearly Comparison Table (2021 vs 2022)
The yearly comparison table provides a clear view of how Toman Bike Share’s performance evolved between 2021 and 2022, highlighting substantial growth across all major metrics.
1. Rider Growth
- 2021: 1,243,103 riders
- 2022: 2,049,576 riders
- Increase: +65%
This sharp rise in riders indicates a significant surge in demand, suggesting improved service adoption, stronger customer engagement, and potentially successful marketing or operational improvements.

2. Revenue Growth
- 2021: £4.96M
- 2022: £10.23M
- Increase: +106%
Revenue more than doubled year‑on‑year. This growth outpaced the increase in riders, showing that higher pricing and increased usage both contributed meaningfully to revenue expansion.

3. Profit Growth
- 2021: £3.42M
- 2022: £7.03M
- Increase: +105%
Profit growth closely mirrors revenue growth, indicating that cost structures remained stable and the business scaled efficiently. This reinforces the strong operational performance of the bike share system.

4. Average Price Increase
- 2021: £3.99
- 2022: £4.99
- Increase: +25%
The company raised prices by £1.00, representing a 25% increase. Despite this, demand still rose significantly, which is unusual in typical price‑demand relationships and signals possible strong customer willingness to pay.

5. Price Elasticity of Demand
- Price Increase: 25%
- Demand Increase: 65%
- Elasticity: 2.59
A price elasticity of 2.59 indicates highly elastic demand—meaning customers responded strongly to price changes.


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

This project demonstrates how SQL and Power BI can be applied to data modeling, performance analysis, and strategic decision‑making for a bike‑share business. By working with yearly rider, revenue, and pricing data, we were able to:
- Build a clean analytical dataset for comparing performance across 2021 and 2022.
- Analyze key financial metrics including revenue, profit, profit margin, and rider volume.
- Identify seasonal and hourly demand patterns to understand when the service performs best.
- Explore rider demographics, highlighting the dominance of registered users over casual riders.
- Evaluate the impact of pricing changes through demand growth, price increase percentages, and elasticity calculations.
- Develop data‑driven pricing recommendations based on customer responsiveness and business growth trends.

Overall, the analysis highlights how SQL and Power BI can uncover meaningful operational insights, support pricing strategy, and provide a strong foundation for data‑driven decision‑making within the Toman Bike Share service.

#### Author - Tega Abada
