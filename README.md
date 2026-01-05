# Toman-Bike-Dashboard
Sales KPI Analysis
## Project Overview

**Project Title**: Toman Bikes Sales KPI Analysis. <br>
**Database**:`Toman_Data` <br>

**Tech Stack**: ![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?style=flat&logo=microsoftsqlserver&logoColor=white), ![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=flat&logo=powerbi&logoColor=black)


This project showcases the use of SQL and Power BI to design and develop an interactive dashboard for Toman Bike Share. It involves creating or accessing a bike‑share database, analyzing hourly revenue, seasonal profit trends, and rider demographics, and presenting these insights through a user‑friendly, brand‑aligned dashboard. The work supports data‑driven decision‑making and includes recommendations on pricing strategy for the upcoming year.

## Objectives

1. **Set up a database**: Populate a database with the provided Toman Bike Sales data.
2. **Data Cleaning**: Perform necessary data cleaning practises such as: Identifying and removing any records with null values and using the proper datatypes.
3. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
4. **Business Analysis**: Use SQL and DAX to answer specific business questions and derive insights from the dataset.

## Project Structure

### 1. Database Setup

- **Database Set up**: The project starts by setting up on an existing database created with this code
  ``` CREATE DATABASE [Toman_Data]; ```
- **Table Creation**: The tables, ```[Employee Info]``` and ```[Employee position2]``` were imported into the SQL server.


### 2. Data Cleaning

- **Null Value Check**: View tables and check for any null values in the dataset and delete records with missing data.
- **Datatype Check**: View tables and check datatype and alter columns with wrong datatypes.

```sql
USE [SQL DB]
GO

SELECT [EmpID]
      ,[EmpFname]
      ,[EmpLname]
      ,[Department]
      ,[Project]
      ,[Address]
      ,[DOB]
      ,[Gender]
  FROM [dbo].['Employee Info$']

GO


DELETE FROM [dbo].['Employee Info$']
WHERE GENDER IS NULL;

ALTER TABLE [dbo].['Employee Info$']
alter column DOB DATE;
```

### 3. Exploratory Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:

-- Q1: Write a query to fetch the EmpFname from the EmployeeInfo table in the upper case and use the ALIAS name as EmpName.
```sql
SELECT UPPER(EmpFname) AS [EmpName]
FROM [Employee Info];
```
-- Q2: Write a query to fetch the number of employees working in the department ‘HR’.
```sql
SELECT COUNT (*) AS [Employee Count]
from [dbo].[Employee Info]
WHERE [Department] = 'HR';
```

-- Q20: Write a query to retrieve two minimum and maximum salaries from the EmployeePosition table
```sql
SELECT Salary
FROM (SELECT TOP 2 Salary
    FROM [dbo].[Employee position2]
    ORDER BY Salary ASC) AS MinSalaries

UNION

SELECT Salary
FROM (SELECT TOP 2 Salary
    FROM [dbo].[Employee position2]
    ORDER BY Salary DESC) AS MaxSalaries;
```

## Findings

- **Employee Demographics**: The dataset captures employees with details such as names, DOB, gender, department, and address. Gender distribution can be analyzed and DOB ranges show employees born between 1970–1995, allowing age-group segmentation.
- **Departmental Insights**: The analysis shows department-wise counts, highlighting HR and other departments’ workforce sizes. Sorting by department count reveals which departments are most/least staffed.
- **Position & Salary Analysis**: Managerial roles are identifiable, enabling leadership headcount reporting. Salary ranges highlight employees earning between 50,000–100,000 as the min/max salary bands. Top earners can be extracted, useful for compensation benchmarking.
- **Employee Trends**: Employees with DateOfJoining not null show active workforce.



## Conclusion

This project demonstrates how SQL can be applied to database setup, data cleaning, and exploratory analysis using employee information. By working with the EmployeeInfo and EmployeePosition2 tables, we were able to:
- Standardize and clean data (removing nulls, formatting DOB, parsing addresses).
- Generate demographic insights such as gender distribution, age ranges, and departmental counts.
- Explore organizational structure by identifying managerial roles and department staffing levels.
- Analyze salary trends, including ranges, top earners, and employees within specific pay bands.
- Retrieve targeted employee details using conditions on names, addresses, and joining dates.

Overall, the exercise highlights how SQL queries can uncover meaningful workforce insights, support HR reporting, and provide a foundation for business-driven decision making.


#### Author - Tega Abada
